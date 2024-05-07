rm(list = ls()) 

library(survival)
library(doBy)

# Set working directory

# Start with IPD data and convert to ANOVA format by choosing time points for aggregating over

data <- read.csv("../Data/breast_data.csv")

# Add treatment as a factor variable
data$treatment[data$arm==1] <- "3 weekly"
data$treatment[data$arm==2] <- "Weekly"
data$treatment <- as.factor(data$treatment)

# Need to create treatment as a factor variable before applying this function
source("Function_anova_data.R")

# Select time points for aggregating data
timepoints=c(6, 12, 18)

# Time points including zero
timepoints2=c(0, 6, 12, 18)


# Apply function
anova <- data.frame(spgrp=NA, treatment=NA, trialid=NA, y=NA, nevents=NA,
                    natrisk=NA, y.max=NA, start=NA, time=NA)

anova <- anova_data(timepoints=timepoints, timepoints2=timepoints2, ref.study=1, 
                      df=data)

anova$treatnumf[anova$treatment=="3 weekly"] <- 1
anova$treatnumf[anova$treatment=="Weekly"] <- 2


# Save as csv file
write.csv(anova, "breast_aggregate_data_fp.csv")
