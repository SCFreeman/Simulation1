# Create function that takes a generated dataset and formats the data ready to apply the anova
# parameterisation

anova_data <- function(timepoints, timepoints2, ref.study=1, df){

  # Split the data based on chosen timepoints
  df2 <- survSplit(Surv(eventtime, died) ~., data=df,
                   cut=timepoints, episode ="timegroup")
  
  # Calculate offset
  df2$y <- df2$eventtime - df2$tstart
  
  # Add a variable that equals one for all patients - this is so the number at risk
  # can be calculated when we collapse the data
  df2$n <- 1
  
  # Collapse data
  df3 <- summaryBy(y + died + n ~ timegroup + treat + trialid, FUN=c(sum, max), data=df2)
  df3 <- subset(df3, select=-c(died.max, n.max))
  names(df3) <- c("spgrp", "treatment", "trialid", "y", "nevents", "natrisk", "y.max")
  
  
  # Add in a start time variable
  df3$start <- numeric(nrow(df3))
  for(i in unique(df3$spgrp)){
    df3$start[df3$spgrp==i] <- timepoints2[i]
  }
  
  # Add in a time variable (i.e. how long since time 0 to max value of y for each row)
  df3$time <- df3$start + df3$y.max
  
  
  # Create a new treatment variable as a string variable
  df3$trt <- numeric(nrow(df3))
  df3$trt[df3$treatment==0] <- "Control"
  df3$trt[df3$treatment==1] <- "Intervention"
  
  
  # Create a time variable
  
  # Give here the reference treatment
  # All the treatment contrasts are calculated against the ref.trt
  ref.trt   <- "Control"
  
  
  # Create factor variables for study and treatment with the given reference categories
  # ref.study is used as baseline hazard for calculating survival
  df3$treatnumf <- relevel(as.factor(df3$trt), ref=ref.trt)
  df3$studynumf <- relevel(as.factor(df3$trialid), ref=ref.study)
  
  # Add i and dgm to dataset
  df3$i <- df2$i[1]
  df3$dgm <- df2$dgm[1]
  
  # Return the formatted dataset
  return(df3)

}


