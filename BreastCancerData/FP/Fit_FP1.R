## FIT FIRST ORDER FRACTIONAL POLYNOMIAL MODELS 

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
df_num <- 1


# Fit FP model

# Load function
source("Function_FP1.R")

# Empty data frames
fp_negtwo <- data.frame(p1=numeric(df_num),
                 rmstD=numeric(df_num), rmstD_lci=numeric(df_num), rmstD_uci=numeric(df_num), rmstD_sd=numeric(df_num), 
                 d21=numeric(df_num), d21_lci=numeric(df_num), d21_uci=numeric(df_num),
                 d22=numeric(df_num), d22_lci=numeric(df_num), d22_uci=numeric(df_num),
                 d21_Rhat=numeric(df_num), d22_Rhat=numeric(df_num))

fp_negone <- data.frame(p1=numeric(df_num),
                        rmstD=numeric(df_num), rmstD_lci=numeric(df_num), rmstD_uci=numeric(df_num), rmstD_sd=numeric(df_num), 
                        d21=numeric(df_num), d21_lci=numeric(df_num), d21_uci=numeric(df_num),
                        d22=numeric(df_num), d22_lci=numeric(df_num), d22_uci=numeric(df_num),
                        d21_Rhat=numeric(df_num), d22_Rhat=numeric(df_num))

fp_neghalf <- data.frame(p1=numeric(df_num),
                        rmstD=numeric(df_num), rmstD_lci=numeric(df_num), rmstD_uci=numeric(df_num), rmstD_sd=numeric(df_num), 
                        d21=numeric(df_num), d21_lci=numeric(df_num), d21_uci=numeric(df_num),
                        d22=numeric(df_num), d22_lci=numeric(df_num), d22_uci=numeric(df_num),
                        d21_Rhat=numeric(df_num), d22_Rhat=numeric(df_num))

fp_zero <- data.frame(p1=numeric(df_num),
                        rmstD=numeric(df_num), rmstD_lci=numeric(df_num), rmstD_uci=numeric(df_num), rmstD_sd=numeric(df_num), 
                        d21=numeric(df_num), d21_lci=numeric(df_num), d21_uci=numeric(df_num),
                        d22=numeric(df_num), d22_lci=numeric(df_num), d22_uci=numeric(df_num),
                        d21_Rhat=numeric(df_num), d22_Rhat=numeric(df_num))

fp_half <- data.frame(p1=numeric(df_num),
                        rmstD=numeric(df_num), rmstD_lci=numeric(df_num), rmstD_uci=numeric(df_num), rmstD_sd=numeric(df_num), 
                        d21=numeric(df_num), d21_lci=numeric(df_num), d21_uci=numeric(df_num),
                        d22=numeric(df_num), d22_lci=numeric(df_num), d22_uci=numeric(df_num),
                        d21_Rhat=numeric(df_num), d22_Rhat=numeric(df_num))

fp_one <- data.frame(p1=numeric(df_num),
                        rmstD=numeric(df_num), rmstD_lci=numeric(df_num), rmstD_uci=numeric(df_num), rmstD_sd=numeric(df_num), 
                        d21=numeric(df_num), d21_lci=numeric(df_num), d21_uci=numeric(df_num),
                        d22=numeric(df_num), d22_lci=numeric(df_num), d22_uci=numeric(df_num),
                        d21_Rhat=numeric(df_num), d22_Rhat=numeric(df_num))

fp_two <- data.frame(p1=numeric(df_num),
                        rmstD=numeric(df_num), rmstD_lci=numeric(df_num), rmstD_uci=numeric(df_num), rmstD_sd=numeric(df_num), 
                        d21=numeric(df_num), d21_lci=numeric(df_num), d21_uci=numeric(df_num),
                        d22=numeric(df_num), d22_lci=numeric(df_num), d22_uci=numeric(df_num),
                        d21_Rhat=numeric(df_num), d22_Rhat=numeric(df_num))

fp_three <- data.frame(p1=numeric(df_num),
                        rmstD=numeric(df_num), rmstD_lci=numeric(df_num), rmstD_uci=numeric(df_num), rmstD_sd=numeric(df_num), 
                        d21=numeric(df_num), d21_lci=numeric(df_num), d21_uci=numeric(df_num),
                        d22=numeric(df_num), d22_lci=numeric(df_num), d22_uci=numeric(df_num),
                       d21_Rhat=numeric(df_num), d22_Rhat=numeric(df_num))


# Run model
foreach(i=1:df_num) %do% {
  print(i)
  fp_neghalf[i,] <- fp_firstorder_fe(data=data, P1=-0.5, num.sims=num.sims, burn.in=burn.in, maxt=600)
  
}

write.csv(fp_neghalf, "Results_FP_neghalf.csv")

foreach(i=1:df_num) %do% {
  print(i)
  fp_zero[i,] <- fp_firstorder_fe(data=data, P1=0, num.sims=num.sims, burn.in=burn.in, maxt=600)
  
}

write.csv(fp_zero, "Results_FP_zero.csv")

foreach(i=1:df_num) %do% {
  print(i)
  fp_half[i,] <- fp_firstorder_fe(data=data, P1=0.5, num.sims=num.sims, burn.in=burn.in, maxt=600)
  
}

write.csv(fp_half, "Results_FP_half.csv")

foreach(i=1:df_num) %do% {
  print(i)
  fp_one[i,] <- fp_firstorder_fe(data=data, P1=1, num.sims=num.sims, burn.in=burn.in, maxt=600)
  
}

write.csv(fp_one, "Results_FP_one.csv")

foreach(i=1:df_num) %do% {
  print(i)
  fp_two[i,] <- fp_firstorder_fe(data=data, P1=2, num.sims=num.sims, burn.in=burn.in, maxt=600)
  
}

write.csv(fp_two, "Results_FP_two.csv")

foreach(i=1:df_num) %do% {
  print(i)
  fp_three[i,] <- fp_firstorder_fe(data=data, P1=3, num.sims=num.sims, burn.in=burn.in, maxt=600)
  
}

write.csv(fp_three, "Results_FP_three.csv")

foreach(i=1:df_num) %do% {
  print(i)
  fp_negone[i,] <- fp_firstorder_fe(data=data, P1=-1, num.sims=num.sims, burn.in=burn.in, maxt=600)
  
}

write.csv(fp_negone, "Results_FP_negone.csv")

foreach(i=1:df_num) %do% {
  print(i)
  fp_negtwo[i,] <- fp_firstorder_fe(data=data, P1=-2, num.sims=num.sims, burn.in=burn.in, maxt=600)
  
}

write.csv(fp_negtwo, "Results_FP_negtwo.csv")
