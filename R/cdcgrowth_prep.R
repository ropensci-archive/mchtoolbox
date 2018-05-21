library(tidyverse)

df <- mchtoolbox::sim_data %>%
  mutate(agecat = if_else(agemons >= 0 & agemons < 0.5,
                          0,
                          as.integer(agemons + 0.5) - 0.5),
         bmi = weight/((height/100)**2)) %>%
  left_join(mchtoolbox::cdc_ref, by = c("sex", "agecat")) %>%
  mutate(ageint = agemos2 - agemos1,
         dage = agemons - agemos1)

# zscore function
# Z = [((value / M)**L) – 1] / (S * L)
# 1. agemos to agecat
# if agemos >= 0 and agemos less than 0.5 then agecat = 0
# else agecat = as.integer(agemos + 0.5) - 0.5
# 2. calculate bmi
# if bmi < 0 & ( weight>0 & height >0 & agemos >=24) then bmi=weight/(height/100)**2
# 3. merge data by agecat variable
# 4. new variables
# l0
l0_vars <- c(
  "llg", "mlg", "slg", "lht", "mht", "sht", "lwt", "mwt", "swt", "lhc", "mhc",
  "shc", "lbmi", "mbmi", "sbmi"
)

# l1
l1_vars <- c("llg1", "mlg1", "slg1", "lht1", "mht1", "sht1", "lwt1", "mwt1",
  "swt1", "lhc1", "mhc1", "shc1", "lbmi1", "mbmi1", "sbmi1")

# l2
l2_vars <- c("llg2", "mlg2", "slg2", "lht2", "mht2", "sht2", "lwt2", "mwt2",
  "swt2", "lhc2", "mhc2", "shc2", "lbmi2", "mbmi2", "sbmi2")

try_this <- function(l1, l2, data = df){
  l0 <- data[, l1] + (data$dage * (data[, l2] - data[, l1])) / data$ageint
  return(l0)
}

testing <- map2_dfc(
  .x = l1_vars,
  .y = l2_vars,
  .f = try_this
) %>%
  set_names(l0_vars) %>%
  bind_cols(df, .)
