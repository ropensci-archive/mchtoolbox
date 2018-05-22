# Prepare data for calculating CDC growth percentile
#
# Categorizes age, calculates BMI. Adds CDC reference data and calculates
# variables needed to calculate actual Z-score. Returns original data with new
# columns appended.
#
# Takes one argument, `data`, which must include (at minimum) expected columns
# `agemons`, `weight`, and `height`.
#
#' @importFrom rlang .data

## Helper function
calc_l0 <- function(l1, l2, df){
  l0 <- df[, l1] + (df$dage * (df[, l2] - df[, l1])) / df$ageint
  return(l0)
}

cdcgrowth_prep <- function(df){

  ## -- Error checks -----------------------------------------------------------
  ## Does `data` contain all necessary column names?
  if(!all(c("agemos", "weight", "height", "sex") %in% names(df))){
    stop(
      "`data` must include columns `agemos`, `weight`, and `height`",
      call. = FALSE
    )
  }

  df <- df %>%
    dplyr::mutate(
      ## If agemons >= 0 and agemons < 0.5, then agecat = 0;
      ## else agecat = as.integer(agemos + 0.5) - 0.5
      agecat = dplyr::if_else(
        .data$agemos >= 0 & .data$agemos < 0.5, 0,
        as.integer(.data$agemos + 0.5) - 0.5
      ),
      ## If BMI < 0 & (weight > 0 & height > 0 & agemos >=24),
      ##  then BMI = weight / (height / 100) ** 2
      bmi = .data$weight / ((.data$height / 100) ** 2)
    ) %>%
    dplyr::left_join(mchtoolbox::cdc_ref, by = c("sex", "agecat")) %>%
    dplyr::mutate(
      ageint = .data$agemos2 - .data$agemos1,
      dage = .data$agemos - .data$agemos1
    )

  ## Z-Score Function, LMS method: Z = [((value / M)**L) – 1] / (S * L)

  ## -- Lists of column names needed to calculate LMS variables ----------------
  ## l0: will be column names of new dataset
  l0_vars <- c(
    "llg", "mlg", "slg", "lht", "mht", "sht", "lwt", "mwt", "swt", "lhc", "mhc",
    "shc", "lbmi", "mbmi", "sbmi"
  )

  ## l1, l2: LMS columns in CDC reference data (included with package)
  l1_vars <- paste0(l0_vars, 1)
  l2_vars <- paste0(l0_vars, 2)

  out_df <- purrr::map2_dfc(
    .x = l1_vars, .y = l2_vars, .f = calc_l0, df = df
  ) %>%
    purrr::set_names(l0_vars) %>%
    dplyr::bind_cols(df, .)

  return(out_df)

}
