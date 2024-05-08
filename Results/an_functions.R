data_format <- function(data, method){
  
  # 1. Remove rows of dataset with missing data (i.e. where OpenBUGS didn't run)
  data <- data %>%
    filter(data$rmstD <1000)
  
  data_long <- data %>%
    add_column(method=method)
  
  return(data_long)
}
