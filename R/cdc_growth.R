
#' Title
#'
#' @param data Input data.frame.
#'
#' @return
#' @export
#'
#' @references Cole TJ, Bellizzi MC, Flegal KM, Dietz WH. Establishing a
#' standard definition for child overweight and obesity worldwide: international
#' survey. BMJ: British Medical Journal. 2000;320(7244):1240.
#' @references https://www.cdc.gov/nccdphp/dnpao/growthcharts/resources/sas.htm
#'
#' @examples
create_cdc_growth <- function(df) {
  # prepare data
  preped_data <- mchtoolbox:::cdcgrowth_prep(df)

  # output old data frame with new columns
  compute_cdc_growth(preped_data)

}


# lg = length
# ht = standing height
# wt = weight
# hc = head cir
# bmi = body mass index


# input variables
# commenting out the ones that don't work
# need to fix length (<24 months) and height (>24 months)
# make headcir optional




# function to create z score
z_fun <- function(df, var, l, m, s){
  # z <- dplyr::if_else(
  #   df[, l] != 0,
  #   (((df[, var]/df[, m])**df[, l])-1)/(df[, s]*df[, l]),
  #   log(df[, var] / df[, m]) / df[, s]
  #   ) To do fix conditional.

  z <- (((df[, var]/df[, m])**df[, l])-1)/(df[, s]*df[, l])

  # return(z)
}


# function to create percentile from z score
p_fun <- function(df, z)  {

  p <- pnorm(df[[z]])*100

  return(p)

}

compute_cdc_growth <- function(df)  {

  # measured variables that are in a column
  my_vars <- c(#"length", "stand_ht",
    "weight",
    #"headcir",
    "bmi")

  # lambda parameters
  l_vars <- c(#"llg", "lht",
    "lwt",
    #"lhc",
    "lbmi")

  # mu parameters
  m_vars <- c(#"mlg", "mht",
    "mwt",
    #"mhc",
    "mbmi")

  # sigma parameters
  s_vars <- c(#"slg", "sht",
    "swt",
    #"shc",
    "sbmi")

  # zscore variables created with LMS method
  z_vars <- c(#"lgz", "stz",
    "waz",
    #"headcz",
    "bmiz")

  # percentile variables created from z scores
  p_vars <- c(#"lgpct", "stpct",
    "wapct",
    #"headcpct",
    "bmipct")

  # modified z score variables -- future development
  f_vars <- c(#"flenz", "fstatz",
    "fwaz",
    #"fheadcz",
    "fbmiz")

  # calculate z score
  data_zscores <- purrr::pmap_dfc(
    .l = list(var = my_vars, l = l_vars, m = m_vars, s = s_vars),
    .f = z_fun,
    df = df
  ) %>%
    purrr::set_names(z_vars) %>%
    dplyr::bind_cols(df, .)

  final_df <- purrr::map_dfc(
    .x = set_names(z_vars, z_vars),
    .f = p_fun,
    df = data_zscores
  ) %>%
    dplyr::bind_cols(data_zscores, .)

  return(final_df)

}


# calculate percentile (doesn't work!)
# p_testing <- purrr::map_dfc(
#   .x = z_vars,
#   .f = p_fun
# ) %>%
#   purrr::set_names(p_vars)





