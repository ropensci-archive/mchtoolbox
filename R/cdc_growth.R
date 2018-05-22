
# lg = length
# ht = standing height
# wt = weight
# hc = head cir
# bmi = body mass index


# input variables
# commenting out the ones that don't work
# need to fix length (<24 months) and height (>24 months)
# make headcir optional

my_vars <- c(#"length", "stand_ht",
              "weight",
              #"headcir",
              "bmi")
l_vars <- c(#"llg", "lht",
            "lwt",
            #"lhc",
            "lbmi")
m_vars <- c(#"mlg", "mht",
            "mwt",
            #"mhc",
            "mbmi")
s_vars <- c(#"slg", "sht",
            "swt",
            #"shc",
            "sbmi")
z_vars <- c(#"lgz", "stz",
            "waz",
            #"headcz",
            "bmiz")
p_vars <- c(#"lgpct", "stpct",
            "wapct",
            #"headcpct",
            "bmipct")
f_vars <- c(#"flenz", "fstatz",
            "fwaz",
            #"fheadcz",
            "fbmiz")



# function to create z score
z_fun <- function(data = testing, var, l, m, s){

  z <- (((data[, var]/data[, m])**data[, l])-1)/(data[, s]*data[, l])

  return(z)
}


# function to create percentile from z score
p_fun <- function(data = z_testing, z)  {

  p <- pnorm(data[, z])*100

  return(p)

}

# calculate z score
z_testing <- pmap_dfc(
  .l = list(var = my_vars, l = l_vars, m = m_vars, s = s_vars),
  .f = z_fun
) %>%
  set_names(z_vars) %>%
  bind_cols(testing, .)

# calculate percentile (doesn't work!)
p_testing <- map_dfc(
  .x = z_vars,
  .f = p_fun
)



