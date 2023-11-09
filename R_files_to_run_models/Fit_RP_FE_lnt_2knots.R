# FIT ROYSTON-PARMAR MODEL

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
library(doParallel)

# Combine csv files into one list
temp = list.files(pattern="^data")
df.list = lapply(temp, read.csv)

df_num <- length(df.list)

# Number of studies in each meta-analysis
num_studies <- 4

# Number of patients in each study
num_patients <- c(108,250,423,495)

######  INPUTS FOR MODEL FITTING IN OPENBUGS #####

# OpenBUGS burn-in & simulation size - the functions for fitting models take these as arguments
# so I can make these model specific but for testing purposes I'm keeping life simple
# and using the same numbers for all models
num.sims <- 90000
burn.in <- 60000


### Royston-Parmar Fixed Effect with treatment-ln(t) interactions

# Load model
source("Function_RP_FE_lnt_2knots.R")

# Empty data frame
rp_fe_2knots <- data.frame(i=numeric(df_num), dgm=numeric(df_num), knots=numeric(df_num),
                           rmstD=numeric(df_num), rmstD_lci=numeric(df_num), rmstD_uci=numeric(df_num), rmstD_sd=numeric(df_num), 
                           beta1=numeric(df_num), beta1_lci=numeric(df_num), beta1_uci=numeric(df_num), 
                           beta2=numeric(df_num), beta2_lci=numeric(df_num), beta2_uci=numeric(df_num), 
                           beta1_Rhat=numeric(df_num), beta2_Rhat=numeric(df_num))

# Fit model
foreach(i=1:df_num) %do% {
  print(i)
  rp_fe_2knots[i,] <- royston_parmar_fe_lnt_2knots(df=df.list[[i]], num.sims=num.sims, burn.in=burn.in)
}

write.csv(rp_fe_2knots, "Results_RP_FE_lnt_2knots.csv")