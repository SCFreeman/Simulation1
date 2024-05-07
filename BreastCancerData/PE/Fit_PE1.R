## FIT PIECEWISE MODELS with one cut point

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


# Fit Piecewise model - MA model with one cut point

# Load function
source("Function_PE_FE_one_6.R")
source("Function_PE_FE_one_12.R")
source("Function_PE_FE_one_18.R")

# Single cut point at 6 months

# Empty data frame
pw1 <- data.frame(rmstD=numeric(df_num), 
                  rmstD_lci=numeric(df_num), rmstD_uci=numeric(df_num), rmstD_sd=numeric(df_num), 
                  alpha=numeric(df_num), alpha_lci=numeric(df_num), alpha_uci=numeric(df_num),
                  phi1=numeric(df_num), phi1_lci=numeric(df_num), phi1_uci=numeric(df_num),
                  alpha_Rhat=numeric(df_num), phi1_Rhat=numeric(df_num))

# Run model with cut point placed at third value of cut_values for all meta-analyses
foreach(i=1:df_num) %do% {
  anova <- data
  names(anova) <- c("abc", "spgrp", "treatment", "trialid", "y", "nevents", "natrisk", "y.max",
                    "start", "time")
  
  pw1[i,] <- piecewise_one_cut_try6(data=anova, num.sims=num.sims, burn.in=burn.in, cutpoint=cut_values[1])
  print(i)
}

write.csv(pw1, "Results_pw6.csv")


# Single cut point at 12 months

# Empty data frame
pw2 <- data.frame(rmstD=numeric(df_num), 
                  rmstD_lci=numeric(df_num), rmstD_uci=numeric(df_num), rmstD_sd=numeric(df_num), 
                  alpha=numeric(df_num), alpha_lci=numeric(df_num), alpha_uci=numeric(df_num),
                  phi1=numeric(df_num), phi1_lci=numeric(df_num), phi1_uci=numeric(df_num),
                  alpha_Rhat=numeric(df_num), phi1_Rhat=numeric(df_num))

# Run model with cut point placed at third value of cut_values for all meta-analyses
foreach(i=1:df_num) %do% {
  anova <- data
  names(anova) <- c("abc", "spgrp", "treatment", "trialid", "y", "nevents", "natrisk", "y.max",
                    "start", "time")
  
  pw2[i,] <- piecewise_one_cut_try12(data=anova, num.sims=num.sims, burn.in=burn.in, cutpoint=cut_values[2])
  print(i)
}

write.csv(pw2, "Results_pw12.csv")

# Single cut point at 18 months

# Empty data frame
pw3 <- data.frame(rmstD=numeric(df_num), 
                  rmstD_lci=numeric(df_num), rmstD_uci=numeric(df_num), rmstD_sd=numeric(df_num), 
                  alpha=numeric(df_num), alpha_lci=numeric(df_num), alpha_uci=numeric(df_num),
                  phi1=numeric(df_num), phi1_lci=numeric(df_num), phi1_uci=numeric(df_num),
                  alpha_Rhat=numeric(df_num), phi1_Rhat=numeric(df_num))

# Run model with cut point placed at third value of cut_values for all meta-analyses
foreach(i=1:df_num) %do% {
  anova <- data
  names(anova) <- c("abc", "spgrp", "treatment", "trialid", "y", "nevents", "natrisk", "y.max",
                    "start", "time")
  
  pw3[i,] <- piecewise_one_cut_try18(data=anova, num.sims=num.sims, burn.in=burn.in, cutpoint=cut_values[3])
  print(i)
}

write.csv(pw3, "Results_pw18.csv")
