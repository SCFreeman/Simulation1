# Aggregate survival data

library(survival)
library(simsurv)
library(foreach)
library(splitstackshape)
library(plyr)
library(dplyr)
library(doBy)
library(bdsmatrix)
library(boot)
library(coda)
library(coxme)
library(BRugs)
library(R2OpenBUGS)
library(survRM2)
library(ggplot2)
library(survminer)
library(metafor)

######  INPUTS FOR AGGREGATING DATA #####

# Select time points (in months)
timepoints=c(6, 12, 18, 60)

# Time points including zero
timepoints2=c(0, 6, 12, 18, 60)

# Number of treatments
num_trt <- 2

# Number of studies in each meta-analysis
num_studies <- 4

########################################

# Load data

# Combine csv files into one list
temp = list.files(pattern="^data")
df.list = lapply(temp, read.csv)

df_num <- length(df.list)


# AGGREGATE DATA

# Load function
source("Function_anova_data.R")

# Empty list
anova.list <- list()

# Empty data frame
# max length should be no. of treatments*no.of trials*no. of time intervals
maxl <- num_trt*num_studies*length(timepoints2)
# Note: this allows for more efficient programming but may result in datasets with empty rows at the end

anova <- data.frame(i=numeric(maxl), dgm=numeric(maxl), spgrp=numeric(maxl), treatment=numeric(maxl), 
                    trialid=numeric(maxl), y=numeric(maxl), nevents=numeric(maxl),
                    natrisk=numeric(maxl), y.max=numeric(maxl), start=numeric(maxl), 
                    time=numeric(maxl), trt=numeric(maxl), treatnumf=numeric(maxl),
                    studynumf=numeric(maxl))

# Run function
foreach(i=1:df_num) %do% {
  anova <- anova_data(timepoints=timepoints, timepoints2=timepoints2, ref.study=1, 
                      df=df.list[[i]])
  name <- paste("anova", i, sep = "")
  assign(name, anova)
  anova.list[[name]] <- anova
  write.csv(anova, paste("anova",i, ".csv", sep="_"))
  print(i)
}
# anova contains the last dataset created
# anova.list contains all datasets created

