data_format <- function(data, method){
  
  # 1. Remove rows of dataset with missing data (i.e. where OpenBUGS didn't run)
  data <- data %>%
    filter(data$rmstD <1000)
  
  data_long <- data %>%
    add_column(method=method)
  
  return(data_long)
}

data_format_se <- function(data, method){
  
  # 1. Remove rows of dataset with missing data (i.e. where OpenBUGS didn't run)
  data <- data %>%
    filter(data$rmstD_1 <10)
  
  # 2. Split dataset into datasets for each time point, rename rows & add column for time point
  data1 <- data %>%
    select(i, rmstD_1, rmstD_1_lci, rmstD_1_uci, rmstD_1_se) %>%
    rename(rmstD = rmstD_1,
           rmstD_lci = rmstD_1_lci,
           rmstD_uci = rmstD_1_uci,
           rmstD_se = rmstD_1_se) %>%
    add_column(time=1)
  
  data2 <- data %>%
    select(i, rmstD_2, rmstD_2_lci, rmstD_2_uci, rmstD_2_se) %>%
    rename(rmstD = rmstD_2,
           rmstD_lci = rmstD_2_lci,
           rmstD_uci = rmstD_2_uci,
           rmstD_se = rmstD_2_se) %>%
    add_column(time=2)
  
  data5 <- data %>%
    select(i, rmstD_5, rmstD_5_lci, rmstD_5_uci, rmstD_5_se) %>%
    rename(rmstD = rmstD_5,
           rmstD_lci = rmstD_5_lci,
           rmstD_uci = rmstD_5_uci,
           rmstD_se = rmstD_5_se) %>%
    add_column(time=5)
  
  data10 <- data %>%
    select(i, rmstD_10, rmstD_10_lci, rmstD_10_uci, rmstD_10_se) %>%
    rename(rmstD = rmstD_10,
           rmstD_lci = rmstD_10_lci,
           rmstD_uci = rmstD_10_uci,
           rmstD_se = rmstD_10_se) %>%
    add_column(time=10)
  
  data15 <- data %>%
    select(i, rmstD_15, rmstD_15_lci, rmstD_15_uci, rmstD_15_se) %>%
    rename(rmstD = rmstD_15,
           rmstD_lci = rmstD_15_lci,
           rmstD_uci = rmstD_15_uci,
           rmstD_se = rmstD_15_se) %>%
    add_column(time=15)
  
  data20 <- data %>%
    select(i, rmstD_20, rmstD_20_lci, rmstD_20_uci, rmstD_20_se) %>%
    rename(rmstD = rmstD_20,
           rmstD_lci = rmstD_20_lci,
           rmstD_uci = rmstD_20_uci,
           rmstD_se = rmstD_20_se) %>%
    add_column(time=20)
  
  data_long <- bind_rows(data1, data2, data5, data10, data15, data20)
  
  data_long <- data_long %>%
    add_column(method=method)
  
  return(data_long)
}

data_format_rmst2 <- function(data, method){
  
  # 1. Remove rows of dataset with missing data (i.e. where OpenBUGS didn't run)
  data <- data %>%
    filter(data$rmstD <10)
  
  # 2. Rename row, add variable for method, add time column in years
  data <- data %>%
    select(i, rmstD, rmstD_lci, rmstD_uci, rmstD_sd, tstar) %>%
    rename(rmstD_se = rmstD_sd) %>%
    add_column(method=method) %>%
    mutate(time = tstar/12)
  
  return(data)
  
}

hist <- function(data, t) {
  
  data %>%
    filter(time==t) %>%
      ggplot(aes(x=rmstD)) +
      geom_histogram()
}

scatter <- function(data, t) {
  
  data %>%
    filter(time==t) %>%
      ggplot(aes(x=rmstD, y=rmstD_se)) +
      geom_point() 
}

fp_function <- function(data){
  # Read in fp results
  a <- read.csv(data)
  
  # Drop datasets were convergence was not achieved
  a <- a[a$d21_Rhat <1.1 & a$d22_Rhat <1.1,]
  
  # Format datasets
  a <- data_format(a, "fp")
  
  return(a)
  
}
