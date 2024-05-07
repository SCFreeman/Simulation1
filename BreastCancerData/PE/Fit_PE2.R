# 1st February 2024
## FIT PIECEWISE MODELS


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
library(pracma)


# Number of treatments
num_trt <- 2

# Number of studies in each meta-analysis
num_studies <- 4

# Identify 3 values for placing a single cutpoint
# We then calculate AIC for each model using Sandro's approach
# and fit the best model in WinBUGS
# Note that if the values fall within the same time interval then AIC will be the same
# (in months)
cut_values <- c(6, 12, 18)

# Select time points 
timepoints=c(6, 12, 18, 60)

# Time points including zero
timepoints2=c(0, 6, 12, 18, 60)

######  INPUTS FOR MODEL FITTING IN OPENBUGS #####

num.sims <- 15000
burn.in <- 15000


# Read in csv file
data <- read.csv("breast_aggregate_data_pe.csv")
df_num <- 1


# Fit Piecewise model - MA model with two cut points

# Load function
source("Function_PE_FE_two_612.R")
source("Function_PE_FE_two_618.R")
source("Function_PE_FE_two_1218.R")

### Two cut points at 6 & 12 months

# Empty data frame
pwa <- data.frame(rmstD=numeric(df_num), 
                 rmstD_lci=numeric(df_num), rmstD_uci=numeric(df_num), rmstD_sd=numeric(df_num), 
                  alpha=numeric(df_num), alpha_lci=numeric(df_num), alpha_uci=numeric(df_num),
                  phi1=numeric(df_num), phi1_lci=numeric(df_num), phi1_uci=numeric(df_num),
                  phi2=numeric(df_num), phi2_lci=numeric(df_num), phi2_uci=numeric(df_num),
                  alpha_Rhat=numeric(df_num), phi1_Rhat=numeric(df_num), phi2_Rhat=numeric(df_num))

# Run model with two cut points
foreach(i=1:df_num) %do% {
  anova <- data
  names(anova) <- c("abc", "spgrp", "treatment", "trialid", "y", "nevents", "natrisk", "y.max",
                    "start", "time")
  
  pwa[i,] <- piecewise_two_cut_try_612(data=anova, num.sims=num.sims, burn.in=burn.in, 
                                  cutpoint1=cut_values[1], cutpoint2=cut_values[2])
  print(i)
}

write.csv(pwa, "Results_pw2_6_12.csv")


### Two cut points at 6 & 18 months

# Empty data frame
pwb <- data.frame(rmstD=numeric(df_num), 
                 rmstD_lci=numeric(df_num), rmstD_uci=numeric(df_num), rmstD_sd=numeric(df_num), 
                 alpha=numeric(df_num), alpha_lci=numeric(df_num), alpha_uci=numeric(df_num),
                 phi1=numeric(df_num), phi1_lci=numeric(df_num), phi1_uci=numeric(df_num),
                 phi2=numeric(df_num), phi2_lci=numeric(df_num), phi2_uci=numeric(df_num),
                 alpha_Rhat=numeric(df_num), phi1_Rhat=numeric(df_num), phi2_Rhat=numeric(df_num))

# Run model with two cut points
foreach(i=1:df_num) %do% {
  anova <- data
  names(anova) <- c("abc", "spgrp", "treatment", "trialid", "y", "nevents", "natrisk", "y.max",
                    "start", "time")
  
  pwb[i,] <- piecewise_two_cut_try_618(data=anova, num.sims=num.sims, burn.in=burn.in, 
                                  cutpoint1=cut_values[1], cutpoint2=cut_values[3])
  print(i)
}

write.csv(pwb, "Results_pw2_6_18.csv")



### Two cut points at 12 & 18 months

# Empty data frame
pwc <- data.frame(rmstD=numeric(df_num), 
                 rmstD_lci=numeric(df_num), rmstD_uci=numeric(df_num), rmstD_sd=numeric(df_num), 
                 alpha=numeric(df_num), alpha_lci=numeric(df_num), alpha_uci=numeric(df_num),
                 phi1=numeric(df_num), phi1_lci=numeric(df_num), phi1_uci=numeric(df_num),
                 phi2=numeric(df_num), phi2_lci=numeric(df_num), phi2_uci=numeric(df_num),
                 alpha_Rhat=numeric(df_num), phi1_Rhat=numeric(df_num), phi2_Rhat=numeric(df_num))

# Run model with two cut points
foreach(i=1:df_num) %do% {
  anova <- data
  names(anova) <- c("abc", "spgrp", "treatment", "trialid", "y", "nevents", "natrisk", "y.max",
                    "start", "time")
  
  pwc[i,] <- piecewise_two_cut_try_1218(data=anova, num.sims=num.sims, burn.in=burn.in, 
                                  cutpoint1=cut_values[2], cutpoint2=cut_values[3])
  print(i)
}

write.csv(pwc, "Results_pw2_12_18.csv")



