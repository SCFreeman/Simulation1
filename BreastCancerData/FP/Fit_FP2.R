## FIT SECOND ORDER FRACTIONAL POLYNOMIAL MODELS

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


######  INPUTS FOR MODEL FITTING IN OPENBUGS #####

num.sims <- 60000
burn.in <- 30000


# Read in csv file
data <- read.csv("breast_aggregate_data_fp.csv")
df_num <- 2


# Fit FP model

# Load function
source("Function_FP2.R")

# Empty data frame
fp2 <- data.frame(p1=numeric(df_num), p2=numeric(df_num),
                         rmstD=numeric(df_num), rmstD_lci=numeric(df_num), rmstD_uci=numeric(df_num), rmstD_sd=numeric(df_num), 
                         d21=numeric(df_num), d21_lci=numeric(df_num), d21_uci=numeric(df_num),
                         d22=numeric(df_num), d22_lci=numeric(df_num), d22_uci=numeric(df_num),
                         d23=numeric(df_num), d23_lci=numeric(df_num), d23_uci=numeric(df_num),
                         d21_Rhat=numeric(df_num), d22_Rhat=numeric(df_num), d23_Rhat=numeric(df_num))




# Run model
  fp2[1,] <- fp_secondorder_fe(data=data, P1=-0.5, P2=0, num.sims=num.sims, burn.in=burn.in, maxt=600)
  fp2[2,] <- fp_secondorder_fe(data=data, P1=0.5, P2=1, num.sims=num.sims, burn.in=burn.in, maxt=600)
 
write.csv(fp2, "Results_FP2.csv")

