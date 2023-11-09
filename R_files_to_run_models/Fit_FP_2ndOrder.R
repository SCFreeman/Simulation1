## FIT FRACTIONAL POLYNOMIAL MODELS

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


# Combine csv files into one list
temp = list.files(pattern="^anova")
anova.list = lapply(temp, read.csv)

df_num <- length(anova.list)


# Fit FP model

# Load function
source("Function_FP_2ndOrder_FE.R")

# Empty data frame
fp_df1 <- data.frame(i=numeric(df_num), dgm=numeric(df_num), p1=numeric(df_num), p2=numeric(df_num),
                         rmstD=numeric(df_num), rmstD_lci=numeric(df_num), rmstD_uci=numeric(df_num), rmstD_sd=numeric(df_num), 
                         d21=numeric(df_num), d21_lci=numeric(df_num), d21_uci=numeric(df_num),
                         d22=numeric(df_num), d22_lci=numeric(df_num), d22_uci=numeric(df_num),
                         d23=numeric(df_num), d23_lci=numeric(df_num), d23_uci=numeric(df_num),
                         d21_Rhat=numeric(df_num), d22_Rhat=numeric(df_num), d23_Rhat=numeric(df_num))




# Run model
foreach(i=1:df_num) %do% {
  print(i)
  anova <- data.frame(anova.list[[i]])
  names(anova) <- c("abc", "spgrp", "treatment", "trialid", "y", "nevents", "natrisk", "y.max",
                    "start", "time", "trt", "treatnumf", "studynumf", "i", "dgm")
  fp_df1[i,] <- fp_secondorder_fe(data=anova, P1=-0.5, P2=0, num.sims=num.sims, burn.in=burn.in, maxt=600)
  
}

write.csv(fp_df1, "Results_2FP_df1.csv")

