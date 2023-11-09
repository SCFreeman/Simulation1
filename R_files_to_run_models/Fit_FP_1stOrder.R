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
source("Function_FP_1stOrder_FE.R")

# Empty data frames
fp_negtwo <- data.frame(i=numeric(df_num), dgm=numeric(df_num), p1=numeric(df_num),
                 rmstD=numeric(df_num), rmstD_lci=numeric(df_num), rmstD_uci=numeric(df_num), rmstD_sd=numeric(df_num), 
                 d21=numeric(df_num), d21_lci=numeric(df_num), d21_uci=numeric(df_num),
                 d22=numeric(df_num), d22_lci=numeric(df_num), d22_uci=numeric(df_num),
                 d21_Rhat=numeric(df_num), d22_Rhat=numeric(df_num))

fp_negone <- data.frame(i=numeric(df_num), dgm=numeric(df_num), p1=numeric(df_num),
                        rmstD=numeric(df_num), rmstD_lci=numeric(df_num), rmstD_uci=numeric(df_num), rmstD_sd=numeric(df_num), 
                        d21=numeric(df_num), d21_lci=numeric(df_num), d21_uci=numeric(df_num),
                        d22=numeric(df_num), d22_lci=numeric(df_num), d22_uci=numeric(df_num),
                        d21_Rhat=numeric(df_num), d22_Rhat=numeric(df_num))

fp_neghalf <- data.frame(i=numeric(df_num), dgm=numeric(df_num), p1=numeric(df_num),
                        rmstD=numeric(df_num), rmstD_lci=numeric(df_num), rmstD_uci=numeric(df_num), rmstD_sd=numeric(df_num), 
                        d21=numeric(df_num), d21_lci=numeric(df_num), d21_uci=numeric(df_num),
                        d22=numeric(df_num), d22_lci=numeric(df_num), d22_uci=numeric(df_num),
                        d21_Rhat=numeric(df_num), d22_Rhat=numeric(df_num))

fp_zero <- data.frame(i=numeric(df_num), dgm=numeric(df_num), p1=numeric(df_num),
                        rmstD=numeric(df_num), rmstD_lci=numeric(df_num), rmstD_uci=numeric(df_num), rmstD_sd=numeric(df_num), 
                        d21=numeric(df_num), d21_lci=numeric(df_num), d21_uci=numeric(df_num),
                        d22=numeric(df_num), d22_lci=numeric(df_num), d22_uci=numeric(df_num),
                        d21_Rhat=numeric(df_num), d22_Rhat=numeric(df_num))

fp_half <- data.frame(i=numeric(df_num), dgm=numeric(df_num), p1=numeric(df_num),
                        rmstD=numeric(df_num), rmstD_lci=numeric(df_num), rmstD_uci=numeric(df_num), rmstD_sd=numeric(df_num), 
                        d21=numeric(df_num), d21_lci=numeric(df_num), d21_uci=numeric(df_num),
                        d22=numeric(df_num), d22_lci=numeric(df_num), d22_uci=numeric(df_num),
                        d21_Rhat=numeric(df_num), d22_Rhat=numeric(df_num))

fp_one <- data.frame(i=numeric(df_num), dgm=numeric(df_num), p1=numeric(df_num),
                        rmstD=numeric(df_num), rmstD_lci=numeric(df_num), rmstD_uci=numeric(df_num), rmstD_sd=numeric(df_num), 
                        d21=numeric(df_num), d21_lci=numeric(df_num), d21_uci=numeric(df_num),
                        d22=numeric(df_num), d22_lci=numeric(df_num), d22_uci=numeric(df_num),
                        d21_Rhat=numeric(df_num), d22_Rhat=numeric(df_num))

fp_two <- data.frame(i=numeric(df_num), dgm=numeric(df_num), p1=numeric(df_num),
                        rmstD=numeric(df_num), rmstD_lci=numeric(df_num), rmstD_uci=numeric(df_num), rmstD_sd=numeric(df_num), 
                        d21=numeric(df_num), d21_lci=numeric(df_num), d21_uci=numeric(df_num),
                        d22=numeric(df_num), d22_lci=numeric(df_num), d22_uci=numeric(df_num),
                        d21_Rhat=numeric(df_num), d22_Rhat=numeric(df_num))

fp_three <- data.frame(i=numeric(df_num), dgm=numeric(df_num), p1=numeric(df_num),
                        rmstD=numeric(df_num), rmstD_lci=numeric(df_num), rmstD_uci=numeric(df_num), rmstD_sd=numeric(df_num), 
                        d21=numeric(df_num), d21_lci=numeric(df_num), d21_uci=numeric(df_num),
                        d22=numeric(df_num), d22_lci=numeric(df_num), d22_uci=numeric(df_num),
                       d21_Rhat=numeric(df_num), d22_Rhat=numeric(df_num))


# Run model
foreach(i=1:df_num) %do% {
  print(i)
  anova <- data.frame(anova.list[[i]])
  names(anova) <- c("abc", "spgrp", "treatment", "trialid", "y", "nevents", "natrisk", "y.max",
                    "start", "time", "trt", "treatnumf", "studynumf", "i", "dgm")
  fp_neghalf[i,] <- fp_firstorder_fe(data=anova, P1=-0.5, num.sims=num.sims, burn.in=burn.in, maxt=600)
  
}

write.csv(fp_neghalf, "Results_FP_neghalf_1.csv")

foreach(i=1:df_num) %do% {
  print(i)
  anova <- data.frame(anova.list[[i]])
  names(anova) <- c("abc", "spgrp", "treatment", "trialid", "y", "nevents", "natrisk", "y.max",
                    "start", "time", "trt", "treatnumf", "studynumf", "i", "dgm")
  fp_zero[i,] <- fp_firstorder_fe(data=anova, P1=0, num.sims=num.sims, burn.in=burn.in, maxt=600)
  
}

write.csv(fp_zero, "Results_FP_zero_1.csv")

foreach(i=1:df_num) %do% {
  print(i)
  anova <- data.frame(anova.list[[i]])
  names(anova) <- c("abc", "spgrp", "treatment", "trialid", "y", "nevents", "natrisk", "y.max",
                    "start", "time", "trt", "treatnumf", "studynumf", "i", "dgm")
  fp_half[i,] <- fp_firstorder_fe(data=anova, P1=0.5, num.sims=num.sims, burn.in=burn.in, maxt=600)
  
}

write.csv(fp_half, "Results_FP_half_1.csv")

foreach(i=1:df_num) %do% {
  print(i)
  anova <- data.frame(anova.list[[i]])
  names(anova) <- c("abc", "spgrp", "treatment", "trialid", "y", "nevents", "natrisk", "y.max",
                    "start", "time", "trt", "treatnumf", "studynumf", "i", "dgm")
  fp_one[i,] <- fp_firstorder_fe(data=anova, P1=1, num.sims=num.sims, burn.in=burn.in, maxt=600)
  
}

write.csv(fp_one, "Results_FP_one_1.csv")

foreach(i=1:df_num) %do% {
  print(i)
  anova <- data.frame(anova.list[[i]])
  names(anova) <- c("abc", "spgrp", "treatment", "trialid", "y", "nevents", "natrisk", "y.max",
                    "start", "time", "trt", "treatnumf", "studynumf", "i", "dgm")
  fp_two[i,] <- fp_firstorder_fe(data=anova, P1=2, num.sims=num.sims, burn.in=burn.in, maxt=600)
  
}

write.csv(fp_two, "Results_FP_two_1.csv")

foreach(i=1:df_num) %do% {
  print(i)
  anova <- data.frame(anova.list[[i]])
  names(anova) <- c("abc", "spgrp", "treatment", "trialid", "y", "nevents", "natrisk", "y.max",
                    "start", "time", "trt", "treatnumf", "studynumf", "i", "dgm")
  fp_three[i,] <- fp_firstorder_fe(data=anova, P1=3, num.sims=num.sims, burn.in=burn.in, maxt=600)
  
}

write.csv(fp_three, "Results_FP_three_1.csv")

foreach(i=1:df_num) %do% {
  print(i)
  anova <- data.frame(anova.list[[i]])
  names(anova) <- c("abc", "spgrp", "treatment", "trialid", "y", "nevents", "natrisk", "y.max",
                    "start", "time", "trt", "treatnumf", "studynumf", "i", "dgm")
  fp_negone[i,] <- fp_firstorder_fe(data=anova, P1=-1, num.sims=num.sims, burn.in=burn.in, maxt=600)
  
}

write.csv(fp_negone, "Results_FP_negone_1.csv")

foreach(i=1:df_num) %do% {
  print(i)
  anova <- data.frame(anova.list[[i]])
  names(anova) <- c("abc", "spgrp", "treatment", "trialid", "y", "nevents", "natrisk", "y.max",
                    "start", "time", "trt", "treatnumf", "studynumf", "i", "dgm")
  fp_negtwo[i,] <- fp_firstorder_fe(data=anova, P1=-2, num.sims=num.sims, burn.in=burn.in, maxt=600)
  
}

write.csv(fp_negtwo, "Results_FP_negtwo_1.csv")

