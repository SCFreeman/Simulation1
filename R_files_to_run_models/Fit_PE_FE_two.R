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

# Identify values for placing a single cutpoint
cut_values <- c(6, 12, 18)

# Select time points 
timepoints=c(6, 12, 18, 60)

# Time points including zero
timepoints2=c(0, 6, 12, 18, 60)

######  INPUTS FOR MODEL FITTING IN OPENBUGS #####

num.sims <- 15000
burn.in <- 15000


# Combine csv files into one list
temp = list.files(pattern="^anova")
anova.list = lapply(temp, read.csv)

df_num <- length(anova.list)




# Fit Piecewise model - MA model with two cut points

# Load function
source("Function_PE_FE_two.R")

# Empty data frame
pw <- data.frame(i=numeric(df_num), dgm=numeric(df_num), 
                  rmstD=numeric(df_num), rmstD_lci=numeric(df_num), rmstD_uci=numeric(df_num), rmstD_sd=numeric(df_num), 
                  alpha=numeric(df_num), alpha_lci=numeric(df_num), alpha_uci=numeric(df_num),
                  phi1=numeric(df_num), phi1_lci=numeric(df_num), phi1_uci=numeric(df_num),
                  phi2=numeric(df_num), phi2_lci=numeric(df_num), phi2_uci=numeric(df_num),
                  alpha_Rhat=numeric(df_num), phi1_Rhat=numeric(df_num), phi2_Rhat=numeric(df_num))

# Run model
foreach(i=1:df_num) %do% {
  anova <- data.frame(anova.list[[i]])
  names(anova) <- c("abc", "spgrp", "treatment", "trialid", "y", "nevents", "natrisk", "y.max",
                    "start", "time", "trt", "treatnumf", "studynumf", "i", "dgm")
  
  pw[i,] <- piecewise_two_cut_try(data=anova, num.sims=num.sims, burn.in=burn.in, 
                                  cutpoint1=cut_values[1], cutpoint2=cut_values[2])
  print(i)
}

write.csv(pw, "Results_pw2.csv")


