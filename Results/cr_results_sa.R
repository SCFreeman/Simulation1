# Build a data frame consisting of estimand data for all methods and all scenarios
# 13th July 2023

rm(list=ls())

library(dplyr)
library(tidyverse)
library(rsimsum)

setwd("R:/SCFreeman/scf20/NIHR Fellowship/Work_Package_2/Simulation")
source("an_functions.R")

# Read in piecewise results
s1_pw1 <- read.csv("Scenario 1/Results_pw1_c1.csv")
s1_pw2 <- read.csv("Scenario 1/Results_pw1_c2.csv")
s1_pw3 <- read.csv("Scenario 1/Results_pw1.csv")
s2_pw1 <- read.csv("Scenario 2/Results_pw1_c1.csv")
s2_pw2 <- read.csv("Scenario 2/Results_pw1_c2.csv")
s2_pw3 <- read.csv("Scenario 2/Results_pw1.csv")
s3_pw1 <- read.csv("Scenario 3/Results_pw1_c1.csv")
s3_pw2 <- read.csv("Scenario 3/Results_pw1_c2.csv")
s3_pw3 <- read.csv("Scenario 3/Results_pw1.csv")
s4_pw1 <- read.csv("Scenario 4/Results_pw1_c1.csv")
s4_pw2 <- read.csv("Scenario 4/Results_pw1_c2.csv")
s4_pw3 <- read.csv("Scenario 4/Results_pw1.csv")

s5_pw1 <- read.csv("Scenario 5/Results_pw1_c1.csv")
s5_pw2 <- read.csv("Scenario 5/Results_pw1_c2.csv")
s5_pw3 <- read.csv("Scenario 5/Results_pw1.csv")
s6_pw1 <- read.csv("Scenario 6/Results_pw1_c1.csv")
s6_pw2 <- read.csv("Scenario 6/Results_pw1_c2.csv")
s6_pw3 <- read.csv("Scenario 6/Results_pw1.csv")
s7_pw1 <- read.csv("Scenario 7/Results_pw1_c1.csv")
s7_pw2 <- read.csv("Scenario 7/Results_pw1_c2.csv")
s7_pw3 <- read.csv("Scenario 7/Results_pw1.csv")
s8_pw1 <- read.csv("Scenario 8/Results_pw1_c1.csv")
s8_pw2 <- read.csv("Scenario 8/Results_pw1_c2.csv")
s8_pw3 <- read.csv("Scenario 8/Results_pw1.csv")

s9_pw1 <- read.csv("Scenario 9/Results_pw1_c1.csv")
s9_pw2 <- read.csv("Scenario 9/Results_pw1_c2.csv")
s9_pw3 <- read.csv("Scenario 9/Results_pw1.csv")
s10_pw1 <- read.csv("Scenario 10/Results_pw1_c1.csv")
s10_pw2 <- read.csv("Scenario 10/Results_pw1_c2.csv")
s10_pw3 <- read.csv("Scenario 10/Results_pw1.csv")
s11_pw1 <- read.csv("Scenario 11/Results_pw1_c1.csv")
s11_pw2 <- read.csv("Scenario 11/Results_pw1_c2.csv")
s11_pw3 <- read.csv("Scenario 11/Results_pw1.csv")
s12_pw1 <- read.csv("Scenario 12/Results_pw1_c1.csv")
s12_pw2 <- read.csv("Scenario 12/Results_pw1_c2.csv")
s12_pw3 <- read.csv("Scenario 12/Results_pw1.csv")


s1_pw4 <- read.csv("Scenario 1/Results_pw2_6_12.csv")
s1_pw5 <- read.csv("Scenario 1/Results_pw2_6_18.csv")
s1_pw6 <- read.csv("Scenario 1/Results_pw2_12_18.csv")
s2_pw4 <- read.csv("Scenario 2/Results_pw2_6_12.csv")
s2_pw5 <- read.csv("Scenario 2/Results_pw2_6_18.csv")
s2_pw6 <- read.csv("Scenario 2/Results_pw2_12_18.csv")
s3_pw4 <- read.csv("Scenario 3/Results_pw2_6_12.csv")
s3_pw5 <- read.csv("Scenario 3/Results_pw2_6_18.csv")
s3_pw6 <- read.csv("Scenario 3/Results_pw2_12_18.csv")
s4_pw4 <- read.csv("Scenario 4/Results_pw2_6_12.csv")
s4_pw5 <- read.csv("Scenario 4/Results_pw2_6_18.csv")
s4_pw6 <- read.csv("Scenario 4/Results_pw2_12_18.csv")

s5_pw4 <- read.csv("Scenario 5/Results_pw2_6_12.csv")
s5_pw5 <- read.csv("Scenario 5/Results_pw2_6_18.csv")
s5_pw6 <- read.csv("Scenario 5/Results_pw2_12_18.csv")
s6_pw4 <- read.csv("Scenario 6/Results_pw2_6_12.csv")
s6_pw5 <- read.csv("Scenario 6/Results_pw2_6_18.csv")
s6_pw6 <- read.csv("Scenario 6/Results_pw2_12_18.csv")
s7_pw4 <- read.csv("Scenario 7/Results_pw2_6_12.csv")
s7_pw5 <- read.csv("Scenario 7/Results_pw2_6_18.csv")
s7_pw6 <- read.csv("Scenario 7/Results_pw2_12_18.csv")
s8_pw4 <- read.csv("Scenario 8/Results_pw2_6_12.csv")
s8_pw5 <- read.csv("Scenario 8/Results_pw2_6_18.csv")
s8_pw6 <- read.csv("Scenario 8/Results_pw2_12_18.csv")

s9_pw4 <- read.csv("Scenario 9/Results_pw2_6_12.csv")
s9_pw5 <- read.csv("Scenario 9/Results_pw2_6_18.csv")
s9_pw6 <- read.csv("Scenario 9/Results_pw2_12_18.csv")
s10_pw4 <- read.csv("Scenario 10/Results_pw2_6_12.csv")
s10_pw5 <- read.csv("Scenario 10/Results_pw2_6_18.csv")
s10_pw6 <- read.csv("Scenario 10/Results_pw2_12_18.csv")
s11_pw4 <- read.csv("Scenario 11/Results_pw2_6_12.csv")
s11_pw5 <- read.csv("Scenario 11/Results_pw2_6_18.csv")
s11_pw6 <- read.csv("Scenario 11/Results_pw2_12_18.csv")
s12_pw4 <- read.csv("Scenario 12/Results_pw2_6_12.csv")
s12_pw5 <- read.csv("Scenario 12/Results_pw2_6_18.csv")
s12_pw6 <- read.csv("Scenario 12/Results_pw2_12_18.csv")

# Drop datasets were convergence was not achieved
s1_pw1 <- s1_pw1[s1_pw1$alpha_Rhat <1.05 & s1_pw1$phi1_Rhat <1.05,]
s1_pw2 <- s1_pw2[s1_pw2$alpha_Rhat <1.05 & s1_pw2$phi1_Rhat <1.05,]
s1_pw3 <- s1_pw3[s1_pw3$alpha_Rhat <1.05 & s1_pw3$phi1_Rhat <1.05,]
s2_pw1 <- s2_pw1[s2_pw1$alpha_Rhat <1.05 & s2_pw1$phi1_Rhat <1.05,]
s2_pw2 <- s2_pw2[s2_pw2$alpha_Rhat <1.05 & s2_pw2$phi1_Rhat <1.05,]
s2_pw3 <- s2_pw3[s2_pw3$alpha_Rhat <1.05 & s2_pw3$phi1_Rhat <1.05,]
s3_pw1 <- s3_pw1[s3_pw1$alpha_Rhat <1.05 & s3_pw1$phi1_Rhat <1.05,]
s3_pw2 <- s3_pw2[s3_pw2$alpha_Rhat <1.05 & s3_pw2$phi1_Rhat <1.05,]
s3_pw3 <- s3_pw3[s3_pw3$alpha_Rhat <1.05 & s3_pw3$phi1_Rhat <1.05,]
s4_pw1 <- s4_pw1[s4_pw1$alpha_Rhat <1.05 & s4_pw1$phi1_Rhat <1.05,]
s4_pw2 <- s4_pw2[s4_pw2$alpha_Rhat <1.05 & s4_pw2$phi1_Rhat <1.05,]
s4_pw3 <- s4_pw3[s4_pw3$alpha_Rhat <1.05 & s4_pw3$phi1_Rhat <1.05,]

s5_pw1 <- s5_pw1[s5_pw1$alpha_Rhat <1.05 & s5_pw1$phi1_Rhat <1.05,]
s5_pw2 <- s5_pw2[s5_pw2$alpha_Rhat <1.05 & s5_pw2$phi1_Rhat <1.05,]
s5_pw3 <- s5_pw3[s5_pw3$alpha_Rhat <1.05 & s5_pw3$phi1_Rhat <1.05,]
s6_pw1 <- s6_pw1[s6_pw1$alpha_Rhat <1.05 & s6_pw1$phi1_Rhat <1.05,]
s6_pw2 <- s6_pw2[s6_pw2$alpha_Rhat <1.05 & s6_pw2$phi1_Rhat <1.05,]
s6_pw3 <- s6_pw3[s6_pw3$alpha_Rhat <1.05 & s6_pw3$phi1_Rhat <1.05,]
s7_pw1 <- s7_pw1[s7_pw1$alpha_Rhat <1.05 & s7_pw1$phi1_Rhat <1.05,]
s7_pw2 <- s7_pw2[s7_pw2$alpha_Rhat <1.05 & s7_pw2$phi1_Rhat <1.05,]
s7_pw3 <- s7_pw3[s7_pw3$alpha_Rhat <1.05 & s7_pw3$phi1_Rhat <1.05,]
s8_pw1 <- s8_pw1[s8_pw1$alpha_Rhat <1.05 & s8_pw1$phi1_Rhat <1.05,]
s8_pw2 <- s8_pw2[s8_pw2$alpha_Rhat <1.05 & s8_pw2$phi1_Rhat <1.05,]
s8_pw3 <- s8_pw3[s8_pw3$alpha_Rhat <1.05 & s8_pw3$phi1_Rhat <1.05,]

s9_pw1 <- s9_pw1[s9_pw1$alpha_Rhat <1.05 & s9_pw1$phi1_Rhat <1.05,]
s9_pw2 <- s9_pw2[s9_pw2$alpha_Rhat <1.05 & s9_pw2$phi1_Rhat <1.05,]
s9_pw3 <- s9_pw3[s9_pw3$alpha_Rhat <1.05 & s9_pw3$phi1_Rhat <1.05,]
s10_pw1 <- s10_pw1[s10_pw1$alpha_Rhat <1.05 & s10_pw1$phi1_Rhat <1.05,]
s10_pw2 <- s10_pw2[s10_pw2$alpha_Rhat <1.05 & s10_pw2$phi1_Rhat <1.05,]
s10_pw3 <- s10_pw3[s10_pw3$alpha_Rhat <1.05 & s10_pw3$phi1_Rhat <1.05,]
s11_pw1 <- s11_pw1[s11_pw1$alpha_Rhat <1.05 & s11_pw1$phi1_Rhat <1.05,]
s11_pw2 <- s11_pw2[s11_pw2$alpha_Rhat <1.05 & s11_pw2$phi1_Rhat <1.05,]
s11_pw3 <- s11_pw3[s11_pw3$alpha_Rhat <1.05 & s11_pw3$phi1_Rhat <1.05,]
s12_pw1 <- s12_pw1[s12_pw1$alpha_Rhat <1.05 & s12_pw1$phi1_Rhat <1.05,]
s12_pw2 <- s12_pw2[s12_pw2$alpha_Rhat <1.05 & s12_pw2$phi1_Rhat <1.05,]
s12_pw3 <- s12_pw3[s12_pw3$alpha_Rhat <1.05 & s12_pw3$phi1_Rhat <1.05,]


s1_pw4 <- s1_pw4[s1_pw4$alpha_Rhat <1.05 & s1_pw4$phi1_Rhat <1.05 & s1_pw4$phi2_Rhat <1.05,]
s1_pw5 <- s1_pw5[s1_pw5$alpha_Rhat <1.05 & s1_pw5$phi1_Rhat <1.05 & s1_pw5$phi2_Rhat <1.05,]
s1_pw6 <- s1_pw6[s1_pw6$alpha_Rhat <1.05 & s1_pw6$phi1_Rhat <1.05 & s1_pw6$phi2_Rhat <1.05,]
s2_pw4 <- s2_pw4[s2_pw4$alpha_Rhat <1.05 & s2_pw4$phi1_Rhat <1.05 & s2_pw4$phi2_Rhat <1.05,]
s2_pw5 <- s2_pw5[s2_pw5$alpha_Rhat <1.05 & s2_pw5$phi1_Rhat <1.05 & s2_pw5$phi2_Rhat <1.05,]
s2_pw6 <- s2_pw6[s2_pw6$alpha_Rhat <1.05 & s2_pw6$phi1_Rhat <1.05 & s2_pw6$phi2_Rhat <1.05,]
s3_pw4 <- s3_pw4[s3_pw4$alpha_Rhat <1.05 & s3_pw4$phi1_Rhat <1.05 & s3_pw4$phi2_Rhat <1.05,]
s3_pw5 <- s3_pw5[s3_pw5$alpha_Rhat <1.05 & s3_pw5$phi1_Rhat <1.05 & s3_pw5$phi2_Rhat <1.05,]
s3_pw6 <- s3_pw6[s3_pw6$alpha_Rhat <1.05 & s3_pw6$phi1_Rhat <1.05 & s3_pw6$phi2_Rhat <1.05,]
s4_pw4 <- s4_pw4[s4_pw4$alpha_Rhat <1.05 & s4_pw4$phi1_Rhat <1.05 & s4_pw4$phi2_Rhat <1.05,]
s4_pw5 <- s4_pw5[s4_pw5$alpha_Rhat <1.05 & s4_pw5$phi1_Rhat <1.05 & s4_pw5$phi2_Rhat <1.05,]
s4_pw6 <- s4_pw6[s4_pw6$alpha_Rhat <1.05 & s4_pw6$phi1_Rhat <1.05 & s4_pw6$phi2_Rhat <1.05,]

s5_pw4 <- s5_pw4[s5_pw4$alpha_Rhat <1.05 & s5_pw4$phi1_Rhat <1.05 & s5_pw4$phi2_Rhat <1.05,]
s5_pw5 <- s5_pw5[s5_pw5$alpha_Rhat <1.05 & s5_pw5$phi1_Rhat <1.05 & s5_pw5$phi2_Rhat <1.05,]
s5_pw6 <- s5_pw6[s5_pw6$alpha_Rhat <1.05 & s5_pw6$phi1_Rhat <1.05 & s5_pw6$phi2_Rhat <1.05,]
s6_pw4 <- s6_pw4[s6_pw4$alpha_Rhat <1.05 & s6_pw4$phi1_Rhat <1.05 & s6_pw4$phi2_Rhat <1.05,]
s6_pw5 <- s6_pw5[s6_pw5$alpha_Rhat <1.05 & s6_pw5$phi1_Rhat <1.05 & s6_pw5$phi2_Rhat <1.05,]
s6_pw6 <- s6_pw6[s6_pw6$alpha_Rhat <1.05 & s6_pw6$phi1_Rhat <1.05 & s6_pw6$phi2_Rhat <1.05,]
s7_pw4 <- s7_pw4[s7_pw4$alpha_Rhat <1.05 & s7_pw4$phi1_Rhat <1.05 & s7_pw4$phi2_Rhat <1.05,]
s7_pw5 <- s7_pw5[s7_pw5$alpha_Rhat <1.05 & s7_pw5$phi1_Rhat <1.05 & s7_pw5$phi2_Rhat <1.05,]
s7_pw6 <- s7_pw6[s7_pw6$alpha_Rhat <1.05 & s7_pw6$phi1_Rhat <1.05 & s7_pw6$phi2_Rhat <1.05,]
s8_pw4 <- s8_pw4[s8_pw4$alpha_Rhat <1.05 & s8_pw4$phi1_Rhat <1.05 & s8_pw4$phi2_Rhat <1.05,]
s8_pw5 <- s8_pw5[s8_pw5$alpha_Rhat <1.05 & s8_pw5$phi1_Rhat <1.05 & s8_pw5$phi2_Rhat <1.05,]
s8_pw6 <- s8_pw6[s8_pw6$alpha_Rhat <1.05 & s8_pw6$phi1_Rhat <1.05 & s8_pw6$phi2_Rhat <1.05,]

s9_pw4 <- s9_pw4[s9_pw4$alpha_Rhat <1.05 & s9_pw4$phi1_Rhat <1.05 & s9_pw4$phi2_Rhat <1.05,]
s9_pw5 <- s9_pw5[s9_pw5$alpha_Rhat <1.05 & s9_pw5$phi1_Rhat <1.05 & s9_pw5$phi2_Rhat <1.05,]
s9_pw6 <- s9_pw6[s9_pw6$alpha_Rhat <1.05 & s9_pw6$phi1_Rhat <1.05 & s9_pw6$phi2_Rhat <1.05,]
s10_pw4 <- s10_pw4[s10_pw4$alpha_Rhat <1.05 & s10_pw4$phi1_Rhat <1.05 & s10_pw4$phi2_Rhat <1.05,]
s10_pw5 <- s10_pw5[s10_pw5$alpha_Rhat <1.05 & s10_pw5$phi1_Rhat <1.05 & s10_pw5$phi2_Rhat <1.05,]
s10_pw6 <- s10_pw6[s10_pw6$alpha_Rhat <1.05 & s10_pw6$phi1_Rhat <1.05 & s10_pw6$phi2_Rhat <1.05,]
s11_pw4 <- s11_pw4[s11_pw4$alpha_Rhat <1.05 & s11_pw4$phi1_Rhat <1.05 & s11_pw4$phi2_Rhat <1.05,]
s11_pw5 <- s11_pw5[s11_pw5$alpha_Rhat <1.05 & s11_pw5$phi1_Rhat <1.05 & s11_pw5$phi2_Rhat <1.05,]
s11_pw6 <- s11_pw6[s11_pw6$alpha_Rhat <1.05 & s11_pw6$phi1_Rhat <1.05 & s11_pw6$phi2_Rhat <1.05,]
s12_pw4 <- s12_pw4[s12_pw4$alpha_Rhat <1.05 & s12_pw4$phi1_Rhat <1.05 & s12_pw4$phi2_Rhat <1.05,]
s12_pw5 <- s12_pw5[s12_pw5$alpha_Rhat <1.05 & s12_pw5$phi1_Rhat <1.05 & s12_pw5$phi2_Rhat <1.05,]
s12_pw6 <- s12_pw6[s12_pw6$alpha_Rhat <1.05 & s12_pw6$phi1_Rhat <1.05 & s12_pw6$phi2_Rhat <1.05,]

# Format datasets
s1_pw1 <- data_format(s1_pw1, "pw_c1")
s1_pw2 <- data_format(s1_pw2, "pw_c2")
s1_pw3 <- data_format(s1_pw3, "pw_c3")
s2_pw1 <- data_format(s2_pw1, "pw_c1")
s2_pw2 <- data_format(s2_pw2, "pw_c2")
s2_pw3 <- data_format(s2_pw3, "pw_c3")
s3_pw1 <- data_format(s3_pw1, "pw_c1")
s3_pw2 <- data_format(s3_pw2, "pw_c2")
s3_pw3 <- data_format(s3_pw3, "pw_c3")
s4_pw1 <- data_format(s4_pw1, "pw_c1")
s4_pw2 <- data_format(s4_pw2, "pw_c2")
s4_pw3 <- data_format(s4_pw3, "pw_c3")

s5_pw1 <- data_format(s5_pw1, "pw_c1")
s5_pw2 <- data_format(s5_pw2, "pw_c2")
s5_pw3 <- data_format(s5_pw3, "pw_c3")
s6_pw1 <- data_format(s6_pw1, "pw_c1")
s6_pw2 <- data_format(s6_pw2, "pw_c2")
s6_pw3 <- data_format(s6_pw3, "pw_c3")
s7_pw1 <- data_format(s7_pw1, "pw_c1")
s7_pw2 <- data_format(s7_pw2, "pw_c2")
s7_pw3 <- data_format(s7_pw3, "pw_c3")
s8_pw1 <- data_format(s8_pw1, "pw_c1")
s8_pw2 <- data_format(s8_pw2, "pw_c2")
s8_pw3 <- data_format(s8_pw3, "pw_c3")

s9_pw1 <- data_format(s9_pw1, "pw_c1")
s9_pw2 <- data_format(s9_pw2, "pw_c2")
s9_pw3 <- data_format(s9_pw3, "pw_c3")
s10_pw1 <- data_format(s10_pw1, "pw_c1")
s10_pw2 <- data_format(s10_pw2, "pw_c2")
s10_pw3 <- data_format(s10_pw3, "pw_c3")
s11_pw1 <- data_format(s11_pw1, "pw_c1")
s11_pw2 <- data_format(s11_pw2, "pw_c2")
s11_pw3 <- data_format(s11_pw3, "pw_c3")
s12_pw1 <- data_format(s12_pw1, "pw_c1")
s12_pw2 <- data_format(s12_pw2, "pw_c2")
s12_pw3 <- data_format(s12_pw3, "pw_c3")

s1_pw4 <- data_format(s1_pw4, "pw2_6_12")
s1_pw5 <- data_format(s1_pw5, "pw2_6_18")
s1_pw6 <- data_format(s1_pw6, "pw2_12_18")
s2_pw4 <- data_format(s2_pw4, "pw2_6_12")
s2_pw5 <- data_format(s2_pw5, "pw2_6_18")
s2_pw6 <- data_format(s2_pw6, "pw2_12_18")
s3_pw4 <- data_format(s3_pw4, "pw2_6_12")
s3_pw5 <- data_format(s3_pw5, "pw2_6_18")
s3_pw6 <- data_format(s3_pw6, "pw2_12_18")
s4_pw4 <- data_format(s4_pw4, "pw2_6_12")
s4_pw5 <- data_format(s4_pw5, "pw2_6_18")
s4_pw6 <- data_format(s4_pw6, "pw2_12_18")

s5_pw4 <- data_format(s5_pw4, "pw2_6_12")
s5_pw5 <- data_format(s5_pw5, "pw2_6_18")
s5_pw6 <- data_format(s5_pw6, "pw2_12_18")
s6_pw4 <- data_format(s6_pw4, "pw2_6_12")
s6_pw5 <- data_format(s6_pw5, "pw2_6_18")
s6_pw6 <- data_format(s6_pw6, "pw2_12_18")
s7_pw4 <- data_format(s7_pw4, "pw2_6_12")
s7_pw5 <- data_format(s7_pw5, "pw2_6_18")
s7_pw6 <- data_format(s7_pw6, "pw2_12_18")
s8_pw4 <- data_format(s8_pw4, "pw2_6_12")
s8_pw5 <- data_format(s8_pw5, "pw2_6_18")
s8_pw6 <- data_format(s8_pw6, "pw2_12_18")

s9_pw4 <- data_format(s9_pw4, "pw2_6_12")
s9_pw5 <- data_format(s9_pw5, "pw2_6_18")
s9_pw6 <- data_format(s9_pw6, "pw2_12_18")
s10_pw4 <- data_format(s10_pw4, "pw2_6_12")
s10_pw5 <- data_format(s10_pw5, "pw2_6_18")
s10_pw6 <- data_format(s10_pw6, "pw2_12_18")
s11_pw4 <- data_format(s11_pw4, "pw2_6_12")
s11_pw5 <- data_format(s11_pw5, "pw2_6_18")
s11_pw6 <- data_format(s11_pw6, "pw2_12_18")
s12_pw4 <- data_format(s12_pw4, "pw2_6_12")
s12_pw5 <- data_format(s12_pw5, "pw2_6_18")
s12_pw6 <- data_format(s12_pw6, "pw2_12_18")

# Calculate performance measures
s1_pw1 <- s1_pw1 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s1_pw2 <- s1_pw2 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s1_pw3 <- s1_pw3 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s2_pw1 <- s2_pw1 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23481)

s2_pw2 <- s2_pw2 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23481)

s2_pw3 <- s2_pw3 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23481)

s3_pw1 <- s3_pw1 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s3_pw2 <- s3_pw2 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s3_pw3 <- s3_pw3 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s4_pw1 <- s4_pw1 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s4_pw2 <- s4_pw2 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s4_pw3 <- s4_pw3 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s5_pw1 <- s5_pw1 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s5_pw2 <- s5_pw2 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s5_pw3 <- s5_pw3 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s6_pw1 <- s6_pw1 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s6_pw2 <- s6_pw2 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s6_pw3 <- s6_pw3 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s7_pw1 <- s7_pw1 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s7_pw2 <- s7_pw2 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s7_pw3 <- s7_pw3 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s8_pw1 <- s8_pw1 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s8_pw2 <- s8_pw2 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s8_pw3 <- s8_pw3 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)


s9_pw1 <- s9_pw1 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s9_pw2 <- s9_pw2 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s9_pw3 <- s9_pw3 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s10_pw1 <- s10_pw1 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s10_pw2 <- s10_pw2 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s10_pw3 <- s10_pw3 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s11_pw1 <- s11_pw1 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s11_pw2 <- s11_pw2 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s11_pw3 <- s11_pw3 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s12_pw1 <- s12_pw1 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s12_pw2 <- s12_pw2 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s12_pw3 <- s12_pw3 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)



s1_pw4 <- s1_pw4 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s1_pw5 <- s1_pw5 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s1_pw6 <- s1_pw6 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s2_pw4 <- s2_pw4 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23481)

s2_pw5 <- s2_pw5 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23481)

s2_pw6 <- s2_pw6 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23481)

s3_pw4 <- s3_pw4 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s3_pw5 <- s3_pw5 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s3_pw6 <- s3_pw6 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s4_pw4 <- s4_pw4 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s4_pw5 <- s4_pw5 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s4_pw6 <- s4_pw6 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s5_pw4 <- s5_pw4 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s5_pw5 <- s5_pw5 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s5_pw6 <- s5_pw6 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s6_pw4 <- s6_pw4 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s6_pw5 <- s6_pw5 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s6_pw6 <- s6_pw6 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s7_pw4 <- s7_pw4 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s7_pw5 <- s7_pw5 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s7_pw6 <- s7_pw6 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s8_pw4 <- s8_pw4 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s8_pw5 <- s8_pw5 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s8_pw6 <- s8_pw6 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)


s9_pw4 <- s9_pw4 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s9_pw5 <- s9_pw5 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s9_pw6 <- s9_pw6 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s10_pw4 <- s10_pw4 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s10_pw5 <- s10_pw5 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s10_pw6 <- s10_pw6 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s11_pw4 <- s11_pw4 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s11_pw5 <- s11_pw5 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s11_pw6 <- s11_pw6 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s12_pw4 <- s12_pw4 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s12_pw5 <- s12_pw5 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s12_pw6 <- s12_pw6 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)




# Read in RP lnt results
s1_rplnt1 <- read.csv("Scenario 1/Results_RP_FE_lnt_1knot.csv")
s1_rplnt2 <- read.csv("Scenario 1/Results_RP_FE_lnt_2knots.csv")
s1_rplnt3 <- read.csv("Scenario 1/Results_RP_FE_lnt_3knots.csv")
s1_rplnt4 <- read.csv("Scenario 1/Results_RP_FE_lnt_4knots.csv")
s2_rplnt1 <- read.csv("Scenario 2/Results_RP_FE_lnt_1knot.csv")
s2_rplnt2 <- read.csv("Scenario 2/Results_RP_FE_lnt_2knots.csv")
s2_rplnt3 <- read.csv("Scenario 2/Results_RP_FE_lnt_3knots.csv")
s2_rplnt4 <- read.csv("Scenario 2/Results_RP_FE_lnt_4knots.csv")
s3_rplnt1 <- read.csv("Scenario 3/Results_RP_FE_lnt_1knot.csv")
s3_rplnt2 <- read.csv("Scenario 3/Results_RP_FE_lnt_2knots.csv")
s3_rplnt3 <- read.csv("Scenario 3/Results_RP_FE_lnt_3knots.csv")
s3_rplnt4 <- read.csv("Scenario 3/Results_RP_FE_lnt_4knots.csv")
s4_rplnt1 <- read.csv("Scenario 4/Results_RP_FE_lnt_1knot.csv")
s4_rplnt2 <- read.csv("Scenario 4/Results_RP_FE_lnt_2knots.csv")
s4_rplnt3 <- read.csv("Scenario 4/Results_RP_FE_lnt_3knots.csv")
s4_rplnt4 <- read.csv("Scenario 4/Results_RP_FE_lnt_4knots.csv")

s5_rplnt1 <- read.csv("Scenario 5/Results_RP_FE_lnt_1knot.csv")
s5_rplnt2 <- read.csv("Scenario 5/Results_RP_FE_lnt_2knots.csv")
s5_rplnt3 <- read.csv("Scenario 5/Results_RP_FE_lnt_3knots.csv")
s5_rplnt4 <- read.csv("Scenario 5/Results_RP_FE_lnt_4knots.csv")
s6_rplnt1 <- read.csv("Scenario 6/Results_RP_FE_lnt_1knot.csv")
s6_rplnt2 <- read.csv("Scenario 6/Results_RP_FE_lnt_2knots.csv")
s6_rplnt3 <- read.csv("Scenario 6/Results_RP_FE_lnt_3knots.csv")
s6_rplnt4 <- read.csv("Scenario 6/Results_RP_FE_lnt_4knots.csv")
s7_rplnt1 <- read.csv("Scenario 7/Results_RP_FE_lnt_1knot.csv")
s7_rplnt2 <- read.csv("Scenario 7/Results_RP_FE_lnt_2knots.csv")
s7_rplnt3 <- read.csv("Scenario 7/Results_RP_FE_lnt_3knots.csv")
s7_rplnt4 <- read.csv("Scenario 7/Results_RP_FE_lnt_4knots.csv")
s8_rplnt1 <- read.csv("Scenario 8/Results_RP_FE_lnt_1knot.csv")
s8_rplnt2 <- read.csv("Scenario 8/Results_RP_FE_lnt_2knots.csv")
s8_rplnt3 <- read.csv("Scenario 8/Results_RP_FE_lnt_3knots.csv")
s8_rplnt4 <- read.csv("Scenario 8/Results_RP_FE_lnt_4knots.csv")

s9_rplnt1 <- read.csv("Scenario 9/Results_RP_FE_lnt_1knot.csv")
s9_rplnt2 <- read.csv("Scenario 9/Results_RP_FE_lnt_2knots.csv")
s9_rplnt3 <- read.csv("Scenario 9/Results_RP_FE_lnt_3knots.csv")
s9_rplnt4 <- read.csv("Scenario 9/Results_RP_FE_lnt_4knots.csv")
s10_rplnt1 <- read.csv("Scenario 10/Results_RP_FE_lnt_1knot.csv")
s10_rplnt2 <- read.csv("Scenario 10/Results_RP_FE_lnt_2knots.csv")
s10_rplnt3 <- read.csv("Scenario 10/Results_RP_FE_lnt_3knots.csv")
s10_rplnt4 <- read.csv("Scenario 10/Results_RP_FE_lnt_4knots.csv")
s11_rplnt1 <- read.csv("Scenario 11/Results_RP_FE_lnt_1knot.csv")
s11_rplnt2 <- read.csv("Scenario 11/Results_RP_FE_lnt_2knots.csv")
s11_rplnt3 <- read.csv("Scenario 11/Results_RP_FE_lnt_3knots.csv")
s11_rplnt4 <- read.csv("Scenario 11/Results_RP_FE_lnt_4knots.csv")
s12_rplnt1 <- read.csv("Scenario 12/Results_RP_FE_lnt_1knot.csv")
s12_rplnt2 <- read.csv("Scenario 12/Results_RP_FE_lnt_2knots.csv")
s12_rplnt3 <- read.csv("Scenario 12/Results_RP_FE_lnt_3knots.csv")
s12_rplnt4 <- read.csv("Scenario 12/Results_RP_FE_lnt_4knots.csv")

# Drop datasets were convergence was not achieved
s1_rplnt1 <- s1_rplnt1[s1_rplnt1$beta1_Rhat <1.05 & s1_rplnt1$beta2_Rhat <1.05,]
s1_rplnt2 <- s1_rplnt2[s1_rplnt2$beta1_Rhat <1.05 & s1_rplnt2$beta2_Rhat <1.05,]
s1_rplnt3 <- s1_rplnt3[s1_rplnt3$beta1_Rhat <1.05 & s1_rplnt3$beta2_Rhat <1.05,]
s1_rplnt4 <- s1_rplnt4[s1_rplnt4$beta1_Rhat <1.05 & s1_rplnt4$beta2_Rhat <1.05,]
s2_rplnt1 <- s2_rplnt1[s2_rplnt1$beta1_Rhat <1.05 & s2_rplnt1$beta2_Rhat <1.05,]
s2_rplnt2 <- s2_rplnt2[s2_rplnt2$beta1_Rhat <1.05 & s2_rplnt2$beta2_Rhat <1.05,]
s2_rplnt3 <- s2_rplnt3[s2_rplnt3$beta1_Rhat <1.05 & s2_rplnt3$beta2_Rhat <1.05,]
s2_rplnt4 <- s2_rplnt4[s2_rplnt4$beta1_Rhat <1.05 & s2_rplnt4$beta2_Rhat <1.05,]
s3_rplnt1 <- s3_rplnt1[s3_rplnt1$beta1_Rhat <1.05 & s3_rplnt1$beta2_Rhat <1.05,]
s3_rplnt2 <- s3_rplnt2[s3_rplnt2$beta1_Rhat <1.05 & s3_rplnt2$beta2_Rhat <1.05,]
s3_rplnt3 <- s3_rplnt3[s3_rplnt3$beta1_Rhat <1.05 & s3_rplnt3$beta2_Rhat <1.05,]
s3_rplnt4 <- s3_rplnt4[s3_rplnt4$beta1_Rhat <1.05 & s3_rplnt4$beta2_Rhat <1.05,]
s4_rplnt1 <- s4_rplnt1[s4_rplnt1$beta1_Rhat <1.05 & s4_rplnt1$beta2_Rhat <1.05,]
s4_rplnt2 <- s4_rplnt2[s4_rplnt2$beta1_Rhat <1.05 & s4_rplnt2$beta2_Rhat <1.05,]
s4_rplnt3 <- s4_rplnt3[s4_rplnt3$beta1_Rhat <1.05 & s4_rplnt3$beta2_Rhat <1.05,]
s4_rplnt4 <- s4_rplnt4[s4_rplnt4$beta1_Rhat <1.05 & s4_rplnt4$beta2_Rhat <1.05,]

s5_rplnt1 <- s5_rplnt1[s5_rplnt1$beta1_Rhat <1.05 & s5_rplnt1$beta2_Rhat <1.05,]
s5_rplnt2 <- s5_rplnt2[s5_rplnt2$beta1_Rhat <1.05 & s5_rplnt2$beta2_Rhat <1.05,]
s5_rplnt3 <- s5_rplnt3[s5_rplnt3$beta1_Rhat <1.05 & s5_rplnt3$beta2_Rhat <1.05,]
s5_rplnt4 <- s5_rplnt4[s5_rplnt4$beta1_Rhat <1.05 & s5_rplnt4$beta2_Rhat <1.05,]
s6_rplnt1 <- s6_rplnt1[s6_rplnt1$beta1_Rhat <1.05 & s6_rplnt1$beta2_Rhat <1.05,]
s6_rplnt2 <- s6_rplnt2[s6_rplnt2$beta1_Rhat <1.05 & s6_rplnt2$beta2_Rhat <1.05,]
s6_rplnt3 <- s6_rplnt3[s6_rplnt3$beta1_Rhat <1.05 & s6_rplnt3$beta2_Rhat <1.05,]
s6_rplnt4 <- s6_rplnt4[s6_rplnt4$beta1_Rhat <1.05 & s6_rplnt4$beta2_Rhat <1.05,]
s7_rplnt1 <- s7_rplnt1[s7_rplnt1$beta1_Rhat <1.05 & s7_rplnt1$beta2_Rhat <1.05,]
s7_rplnt2 <- s7_rplnt2[s7_rplnt2$beta1_Rhat <1.05 & s7_rplnt2$beta2_Rhat <1.05,]
s7_rplnt3 <- s7_rplnt3[s7_rplnt3$beta1_Rhat <1.05 & s7_rplnt3$beta2_Rhat <1.05,]
s7_rplnt4 <- s7_rplnt4[s7_rplnt4$beta1_Rhat <1.05 & s7_rplnt4$beta2_Rhat <1.05,]
s8_rplnt1 <- s8_rplnt1[s8_rplnt1$beta1_Rhat <1.05 & s8_rplnt1$beta2_Rhat <1.05,]
s8_rplnt2 <- s8_rplnt2[s8_rplnt2$beta1_Rhat <1.05 & s8_rplnt2$beta2_Rhat <1.05,]
s8_rplnt3 <- s8_rplnt3[s8_rplnt3$beta1_Rhat <1.05 & s8_rplnt3$beta2_Rhat <1.05,]
s8_rplnt4 <- s8_rplnt4[s8_rplnt4$beta1_Rhat <1.05 & s8_rplnt4$beta2_Rhat <1.05,]

s9_rplnt1 <- s9_rplnt1[s9_rplnt1$beta1_Rhat <1.05 & s9_rplnt1$beta2_Rhat <1.05,]
s9_rplnt2 <- s9_rplnt2[s9_rplnt2$beta1_Rhat <1.05 & s9_rplnt2$beta2_Rhat <1.05,]
s9_rplnt3 <- s9_rplnt3[s9_rplnt3$beta1_Rhat <1.05 & s9_rplnt3$beta2_Rhat <1.05,]
s9_rplnt4 <- s9_rplnt4[s9_rplnt4$beta1_Rhat <1.05 & s9_rplnt4$beta2_Rhat <1.05,]
s10_rplnt1 <- s10_rplnt1[s10_rplnt1$beta1_Rhat <1.05 & s10_rplnt1$beta2_Rhat <1.05,]
s10_rplnt2 <- s10_rplnt2[s10_rplnt2$beta1_Rhat <1.05 & s10_rplnt2$beta2_Rhat <1.05,]
s10_rplnt3 <- s10_rplnt3[s10_rplnt3$beta1_Rhat <1.05 & s10_rplnt3$beta2_Rhat <1.05,]
s10_rplnt4 <- s10_rplnt4[s10_rplnt4$beta1_Rhat <1.05 & s10_rplnt4$beta2_Rhat <1.05,]
s11_rplnt1 <- s11_rplnt1[s11_rplnt1$beta1_Rhat <1.05 & s11_rplnt1$beta2_Rhat <1.05,]
s11_rplnt2 <- s11_rplnt2[s11_rplnt2$beta1_Rhat <1.05 & s11_rplnt2$beta2_Rhat <1.05,]
s11_rplnt3 <- s11_rplnt3[s11_rplnt3$beta1_Rhat <1.05 & s11_rplnt3$beta2_Rhat <1.05,]
s11_rplnt4 <- s11_rplnt4[s11_rplnt4$beta1_Rhat <1.05 & s11_rplnt4$beta2_Rhat <1.05,]
s12_rplnt1 <- s12_rplnt1[s12_rplnt1$beta1_Rhat <1.05 & s12_rplnt1$beta2_Rhat <1.05,]
s12_rplnt2 <- s12_rplnt2[s12_rplnt2$beta1_Rhat <1.05 & s12_rplnt2$beta2_Rhat <1.05,]
s12_rplnt3 <- s12_rplnt3[s12_rplnt3$beta1_Rhat <1.05 & s12_rplnt3$beta2_Rhat <1.05,]
s12_rplnt4 <- s12_rplnt4[s12_rplnt4$beta1_Rhat <1.05 & s12_rplnt4$beta2_Rhat <1.05,]

# Format datasets
s1_rplnt1 <- data_format(s1_rplnt1, "rplnt1")
s1_rplnt2 <- data_format(s1_rplnt2, "rplnt2")
s1_rplnt3 <- data_format(s1_rplnt3, "rplnt3")
s1_rplnt4 <- data_format(s1_rplnt4, "rplnt4")
s2_rplnt1 <- data_format(s2_rplnt1, "rplnt1")
s2_rplnt2 <- data_format(s2_rplnt2, "rplnt2")
s2_rplnt3 <- data_format(s2_rplnt3, "rplnt3")
s2_rplnt4 <- data_format(s2_rplnt4, "rplnt4")
s3_rplnt1 <- data_format(s3_rplnt1, "rplnt1")
s3_rplnt2 <- data_format(s3_rplnt2, "rplnt2")
s3_rplnt3 <- data_format(s3_rplnt3, "rplnt3")
s3_rplnt4 <- data_format(s3_rplnt4, "rplnt4")
s4_rplnt1 <- data_format(s4_rplnt1, "rplnt1")
s4_rplnt2 <- data_format(s4_rplnt2, "rplnt2")
s4_rplnt3 <- data_format(s4_rplnt3, "rplnt3")
s4_rplnt4 <- data_format(s4_rplnt4, "rplnt4")

s5_rplnt1 <- data_format(s5_rplnt1, "rplnt1")
s5_rplnt2 <- data_format(s5_rplnt2, "rplnt2")
s5_rplnt3 <- data_format(s5_rplnt3, "rplnt3")
s5_rplnt4 <- data_format(s5_rplnt4, "rplnt4")
s6_rplnt1 <- data_format(s6_rplnt1, "rplnt1")
s6_rplnt2 <- data_format(s6_rplnt2, "rplnt2")
s6_rplnt3 <- data_format(s6_rplnt3, "rplnt3")
s6_rplnt4 <- data_format(s6_rplnt4, "rplnt4")
s7_rplnt1 <- data_format(s7_rplnt1, "rplnt1")
s7_rplnt2 <- data_format(s7_rplnt2, "rplnt2")
s7_rplnt3 <- data_format(s7_rplnt3, "rplnt3")
s7_rplnt4 <- data_format(s7_rplnt4, "rplnt4")
s8_rplnt1 <- data_format(s8_rplnt1, "rplnt1")
s8_rplnt2 <- data_format(s8_rplnt2, "rplnt2")
s8_rplnt3 <- data_format(s8_rplnt3, "rplnt3")
s8_rplnt4 <- data_format(s8_rplnt4, "rplnt4")

s9_rplnt1 <- data_format(s9_rplnt1, "rplnt1")
s9_rplnt2 <- data_format(s9_rplnt2, "rplnt2")
s9_rplnt3 <- data_format(s9_rplnt3, "rplnt3")
s9_rplnt4 <- data_format(s9_rplnt4, "rplnt4")
s10_rplnt1 <- data_format(s10_rplnt1, "rplnt1")
s10_rplnt2 <- data_format(s10_rplnt2, "rplnt2")
s10_rplnt3 <- data_format(s10_rplnt3, "rplnt3")
s10_rplnt4 <- data_format(s10_rplnt4, "rplnt4")
s11_rplnt1 <- data_format(s11_rplnt1, "rplnt1")
s11_rplnt2 <- data_format(s11_rplnt2, "rplnt2")
s11_rplnt3 <- data_format(s11_rplnt3, "rplnt3")
s11_rplnt4 <- data_format(s11_rplnt4, "rplnt4")
s12_rplnt1 <- data_format(s12_rplnt1, "rplnt1")
s12_rplnt2 <- data_format(s12_rplnt2, "rplnt2")
s12_rplnt3 <- data_format(s12_rplnt3, "rplnt3")
s12_rplnt4 <- data_format(s12_rplnt4, "rplnt4")


# Calculate performance measures
s1_rplnt1 <- s1_rplnt1 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s1_rplnt2 <- s1_rplnt2 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s1_rplnt3 <- s1_rplnt3 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s1_rplnt4 <- s1_rplnt4 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s2_rplnt1 <- s2_rplnt1 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s2_rplnt2 <- s2_rplnt2 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s2_rplnt3 <- s2_rplnt3 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s2_rplnt4 <- s2_rplnt4 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s3_rplnt1 <- s3_rplnt1 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s3_rplnt2 <- s3_rplnt2 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s3_rplnt3 <- s3_rplnt3 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s3_rplnt4 <- s3_rplnt4 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s4_rplnt1 <- s4_rplnt1 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s4_rplnt2 <- s4_rplnt2 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s4_rplnt3 <- s4_rplnt3 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s4_rplnt4 <- s4_rplnt4 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s5_rplnt1 <- s5_rplnt1 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s5_rplnt2 <- s5_rplnt2 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s5_rplnt3 <- s5_rplnt3 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s5_rplnt4 <- s5_rplnt4 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s6_rplnt1 <- s6_rplnt1 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s6_rplnt2 <- s6_rplnt2 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s6_rplnt3 <- s6_rplnt3 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s6_rplnt4 <- s6_rplnt4 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s7_rplnt1 <- s7_rplnt1 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s7_rplnt2 <- s7_rplnt2 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s7_rplnt3 <- s7_rplnt3 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s7_rplnt4 <- s7_rplnt4 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s8_rplnt1 <- s8_rplnt1 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s8_rplnt2 <- s8_rplnt2 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s8_rplnt3 <- s8_rplnt3 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s8_rplnt4 <- s8_rplnt4 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)


s9_rplnt1 <- s9_rplnt1 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s9_rplnt2 <- s9_rplnt2 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s9_rplnt3 <- s9_rplnt3 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s9_rplnt4 <- s9_rplnt4 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s10_rplnt1 <- s10_rplnt1 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s10_rplnt2 <- s10_rplnt2 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s10_rplnt3 <- s10_rplnt3 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s10_rplnt4 <- s10_rplnt4 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s11_rplnt1 <- s11_rplnt1 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s11_rplnt2 <- s11_rplnt2 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s11_rplnt3 <- s11_rplnt3 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s11_rplnt4 <- s11_rplnt4 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s12_rplnt1 <- s12_rplnt1 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s12_rplnt2 <- s12_rplnt2 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s12_rplnt3 <- s12_rplnt3 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s12_rplnt4 <- s12_rplnt4 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)


# Fractional Polynomial - read in & format results
s1_fp_half <- read.csv("Scenario 1/Results_FP_half.csv")
s1_fp_neghalf <- read.csv("Scenario 1/Results_FP_neghalf.csv")
s1_fp_zero <- read.csv("Scenario 1/Results_FP_zero.csv")
s1_fp_one <- read.csv("Scenario 1/Results_FP_one.csv")
s1_fp_two <- read.csv("Scenario 1/Results_FP_two.csv")
s1_fp_three <- read.csv("Scenario 1/Results_FP_three.csv")
s1_fp_negone <- read.csv("Scenario 1/Results_FP_negone.csv")
s1_fp_negtwo <- read.csv("Scenario 1/Results_FP_negtwo.csv")

s2_fp_half <- read.csv("Scenario 2/Results_FP_half.csv")
s2_fp_neghalf <- read.csv("Scenario 2/Results_FP_neghalf.csv")
s2_fp_zero <- read.csv("Scenario 2/Results_FP_zero.csv")
s2_fp_one <- read.csv("Scenario 2/Results_FP_one.csv")
s2_fp_two <- read.csv("Scenario 2/Results_FP_two.csv")
s2_fp_three <- read.csv("Scenario 2/Results_FP_three.csv")
s2_fp_negone <- read.csv("Scenario 2/Results_FP_negone.csv")
s2_fp_negtwo <- read.csv("Scenario 2/Results_FP_negtwo.csv")

s3_fp_half <- read.csv("Scenario 3/Results_FP_half.csv")
s3_fp_neghalf <- read.csv("Scenario 3/Results_FP_neghalf.csv")
s3_fp_zero <- read.csv("Scenario 3/Results_FP_zero.csv")
s3_fp_one <- read.csv("Scenario 3/Results_FP_one.csv")
s3_fp_two <- read.csv("Scenario 3/Results_FP_two.csv")
s3_fp_three <- read.csv("Scenario 3/Results_FP_three.csv")
s3_fp_negone <- read.csv("Scenario 3/Results_FP_negone.csv")
s3_fp_negtwo <- read.csv("Scenario 3/Results_FP_negtwo.csv")

s4_fp_half <- read.csv("Scenario 4/Results_FP_half.csv")
s4_fp_neghalf <- read.csv("Scenario 4/Results_FP_neghalf.csv")
s4_fp_zero <- read.csv("Scenario 4/Results_FP_zero.csv")
s4_fp_one <- read.csv("Scenario 4/Results_FP_one.csv")
s4_fp_two <- read.csv("Scenario 4/Results_FP_two.csv")
s4_fp_three <- read.csv("Scenario 4/Results_FP_three.csv")
s4_fp_negone <- read.csv("Scenario 4/Results_FP_negone.csv")
s4_fp_negtwo <- read.csv("Scenario 4/Results_FP_negtwo.csv")

s5_fp_half <- read.csv("Scenario 5/Results_FP_half.csv")
s5_fp_neghalf <- read.csv("Scenario 5/Results_FP_neghalf.csv")
s5_fp_zero <- read.csv("Scenario 5/Results_FP_zero.csv")
s5_fp_one <- read.csv("Scenario 5/Results_FP_one.csv")
s5_fp_two <- read.csv("Scenario 5/Results_FP_two.csv")
s5_fp_three <- read.csv("Scenario 5/Results_FP_three.csv")
s5_fp_negone <- read.csv("Scenario 5/Results_FP_negone.csv")
s5_fp_negtwo <- read.csv("Scenario 5/Results_FP_negtwo.csv")

s6_fp_half <- read.csv("Scenario 6/Results_FP_half.csv")
s6_fp_neghalf <- read.csv("Scenario 6/Results_FP_neghalf.csv")
s6_fp_zero <- read.csv("Scenario 6/Results_FP_zero.csv")
s6_fp_one <- read.csv("Scenario 6/Results_FP_one.csv")
s6_fp_two <- read.csv("Scenario 6/Results_FP_two.csv")
s6_fp_three <- read.csv("Scenario 6/Results_FP_three.csv")
s6_fp_negone <- read.csv("Scenario 6/Results_FP_negone.csv")
s6_fp_negtwo <- read.csv("Scenario 6/Results_FP_negtwo.csv")

s7_fp_half <- read.csv("Scenario 7/Results_FP_half.csv")
s7_fp_neghalf <- read.csv("Scenario 7/Results_FP_neghalf.csv")
s7_fp_zero <- read.csv("Scenario 7/Results_FP_zero.csv")
s7_fp_one <- read.csv("Scenario 7/Results_FP_one.csv")
s7_fp_two <- read.csv("Scenario 7/Results_FP_two.csv")
s7_fp_three <- read.csv("Scenario 7/Results_FP_three.csv")
s7_fp_negone <- read.csv("Scenario 7/Results_FP_negone.csv")
s7_fp_negtwo <- read.csv("Scenario 7/Results_FP_negtwo.csv")

s8_fp_half <- read.csv("Scenario 8/Results_FP_half.csv")
s8_fp_neghalf <- read.csv("Scenario 8/Results_FP_neghalf.csv")
s8_fp_zero <- read.csv("Scenario 8/Results_FP_zero.csv")
s8_fp_one <- read.csv("Scenario 8/Results_FP_one.csv")
s8_fp_two <- read.csv("Scenario 8/Results_FP_two.csv")
s8_fp_three <- read.csv("Scenario 8/Results_FP_three.csv")
s8_fp_negone <- read.csv("Scenario 8/Results_FP_negone.csv")
s8_fp_negtwo <- read.csv("Scenario 8/Results_FP_negtwo.csv")

s9_fp_half <- read.csv("Scenario 9/Results_FP_half.csv")
s9_fp_neghalf <- read.csv("Scenario 9/Results_FP_neghalf.csv")
s9_fp_zero <- read.csv("Scenario 9/Results_FP_zero.csv")
s9_fp_one <- read.csv("Scenario 9/Results_FP_one.csv")
s9_fp_two <- read.csv("Scenario 9/Results_FP_two.csv")
s9_fp_three <- read.csv("Scenario 9/Results_FP_three.csv")
s9_fp_negone <- read.csv("Scenario 9/Results_FP_negone.csv")
s9_fp_negtwo <- read.csv("Scenario 9/Results_FP_negtwo.csv")

s10_fp_half <- read.csv("Scenario 10/Results_FP_half.csv")
s10_fp_neghalf <- read.csv("Scenario 10/Results_FP_neghalf.csv")
s10_fp_zero <- read.csv("Scenario 10/Results_FP_zero.csv")
s10_fp_one <- read.csv("Scenario 10/Results_FP_one.csv")
s10_fp_two <- read.csv("Scenario 10/Results_FP_two.csv")
s10_fp_three <- read.csv("Scenario 10/Results_FP_three.csv")
s10_fp_negone <- read.csv("Scenario 10/Results_FP_negone.csv")
s10_fp_negtwo <- read.csv("Scenario 10/Results_FP_negtwo.csv")

s11_fp_half <- read.csv("Scenario 11/Results_FP_half.csv")
s11_fp_neghalf <- read.csv("Scenario 11/Results_FP_neghalf.csv")
s11_fp_zero <- read.csv("Scenario 11/Results_FP_zero.csv")
s11_fp_one <- read.csv("Scenario 11/Results_FP_one.csv")
s11_fp_two <- read.csv("Scenario 11/Results_FP_two.csv")
s11_fp_three <- read.csv("Scenario 11/Results_FP_three.csv")
s11_fp_negone <- read.csv("Scenario 11/Results_FP_negone.csv")
s11_fp_negtwo <- read.csv("Scenario 11/Results_FP_negtwo.csv")

s12_fp_half <- read.csv("Scenario 12/Results_FP_half.csv")
s12_fp_neghalf <- read.csv("Scenario 12/Results_FP_neghalf.csv")
s12_fp_zero <- read.csv("Scenario 12/Results_FP_zero.csv")
s12_fp_one <- read.csv("Scenario 12/Results_FP_one.csv")
s12_fp_two <- read.csv("Scenario 12/Results_FP_two.csv")
s12_fp_three <- read.csv("Scenario 12/Results_FP_three.csv")
s12_fp_negone <- read.csv("Scenario 12/Results_FP_negone.csv")
s12_fp_negtwo <- read.csv("Scenario 12/Results_FP_negtwo.csv")

# Drop datasets were convergence was not achieved
s1_fp_half <- s1_fp_half[s1_fp_half$d21_Rhat <1.05 & s1_fp_half$d22_Rhat <1.05,]
s1_fp_neghalf <- s1_fp_neghalf[s1_fp_neghalf$d21_Rhat <1.05 & s1_fp_neghalf$d22_Rhat <1.05,]
s1_fp_zero <- s1_fp_zero[s1_fp_zero$d21_Rhat <1.05 & s1_fp_zero$d22_Rhat <1.05,]
s1_fp_one <- s1_fp_one[s1_fp_one$d21_Rhat <1.05 & s1_fp_one$d22_Rhat <1.05,]
s1_fp_two <- s1_fp_two[s1_fp_two$d21_Rhat <1.05 & s1_fp_two$d22_Rhat <1.05,]
s1_fp_negone <- s1_fp_negone[s1_fp_negone$d21_Rhat <1.05 & s1_fp_negone$d22_Rhat <1.05,]
s1_fp_negtwo <- s1_fp_negtwo[s1_fp_negtwo$d21_Rhat <1.05 & s1_fp_negtwo$d22_Rhat <1.05,]
s1_fp_three <- s1_fp_three[s1_fp_three$d21_Rhat <1.05 & s1_fp_three$d22_Rhat <1.05,]

s2_fp_half <- s2_fp_half[s2_fp_half$d21_Rhat <1.05 & s2_fp_half$d22_Rhat <1.05,]
s2_fp_neghalf <- s2_fp_neghalf[s2_fp_neghalf$d21_Rhat <1.05 & s2_fp_neghalf$d22_Rhat <1.05,]
s2_fp_zero <- s2_fp_zero[s2_fp_zero$d21_Rhat <1.05 & s2_fp_zero$d22_Rhat <1.05,]
s2_fp_one <- s2_fp_one[s2_fp_one$d21_Rhat <1.05 & s2_fp_one$d22_Rhat <1.05,]
s2_fp_two <- s2_fp_two[s2_fp_two$d21_Rhat <1.05 & s2_fp_two$d22_Rhat <1.05,]
s2_fp_negone <- s2_fp_negone[s2_fp_negone$d21_Rhat <1.05 & s2_fp_negone$d22_Rhat <1.05,]
s2_fp_negtwo <- s2_fp_negtwo[s2_fp_negtwo$d21_Rhat <1.05 & s2_fp_negtwo$d22_Rhat <1.05,]
s2_fp_three <- s2_fp_three[s2_fp_three$d21_Rhat <1.05 & s2_fp_three$d22_Rhat <1.05,]

s3_fp_half <- s3_fp_half[s3_fp_half$d21_Rhat <1.05 & s3_fp_half$d22_Rhat <1.05,]
s3_fp_neghalf <- s3_fp_neghalf[s3_fp_neghalf$d21_Rhat <1.05 & s3_fp_neghalf$d22_Rhat <1.05,]
s3_fp_zero <- s3_fp_zero[s3_fp_zero$d21_Rhat <1.05 & s3_fp_zero$d22_Rhat <1.05,]
s3_fp_one <- s3_fp_one[s3_fp_one$d21_Rhat <1.05 & s3_fp_one$d22_Rhat <1.05,]
s3_fp_two <- s3_fp_two[s3_fp_two$d21_Rhat <1.05 & s3_fp_two$d22_Rhat <1.05,]
s3_fp_negone <- s3_fp_negone[s3_fp_negone$d21_Rhat <1.05 & s3_fp_negone$d22_Rhat <1.05,]
s3_fp_negtwo <- s3_fp_negtwo[s3_fp_negtwo$d21_Rhat <1.05 & s3_fp_negtwo$d22_Rhat <1.05,]
s3_fp_three <- s3_fp_three[s3_fp_three$d21_Rhat <1.05 & s3_fp_three$d22_Rhat <1.05,]

s4_fp_half <- s4_fp_half[s4_fp_half$d21_Rhat <1.05 & s4_fp_half$d22_Rhat <1.05,]
s4_fp_neghalf <- s4_fp_neghalf[s4_fp_neghalf$d21_Rhat <1.05 & s4_fp_neghalf$d22_Rhat <1.05,]
s4_fp_zero <- s4_fp_zero[s4_fp_zero$d21_Rhat <1.05 & s4_fp_zero$d22_Rhat <1.05,]
s4_fp_one <- s4_fp_one[s4_fp_one$d21_Rhat <1.05 & s4_fp_one$d22_Rhat <1.05,]
s4_fp_two <- s4_fp_two[s4_fp_two$d21_Rhat <1.05 & s4_fp_two$d22_Rhat <1.05,]
s4_fp_negone <- s4_fp_negone[s4_fp_negone$d21_Rhat <1.05 & s4_fp_negone$d22_Rhat <1.05,]
s4_fp_negtwo <- s4_fp_negtwo[s4_fp_negtwo$d21_Rhat <1.05 & s4_fp_negtwo$d22_Rhat <1.05,]
s4_fp_three <- s4_fp_three[s4_fp_three$d21_Rhat <1.05 & s4_fp_three$d22_Rhat <1.05,]

s5_fp_half <- s5_fp_half[s5_fp_half$d21_Rhat <1.05 & s5_fp_half$d22_Rhat <1.05,]
s5_fp_neghalf <- s5_fp_neghalf[s5_fp_neghalf$d21_Rhat <1.05 & s5_fp_neghalf$d22_Rhat <1.05,]
s5_fp_zero <- s5_fp_zero[s5_fp_zero$d21_Rhat <1.05 & s5_fp_zero$d22_Rhat <1.05,]
s5_fp_one <- s5_fp_one[s5_fp_one$d21_Rhat <1.05 & s5_fp_one$d22_Rhat <1.05,]
s5_fp_two <- s5_fp_two[s5_fp_two$d21_Rhat <1.05 & s5_fp_two$d22_Rhat <1.05,]
s5_fp_negone <- s5_fp_negone[s5_fp_negone$d21_Rhat <1.05 & s5_fp_negone$d22_Rhat <1.05,]
s5_fp_negtwo <- s5_fp_negtwo[s5_fp_negtwo$d21_Rhat <1.05 & s5_fp_negtwo$d22_Rhat <1.05,]
s5_fp_three <- s5_fp_three[s5_fp_three$d21_Rhat <1.05 & s5_fp_three$d22_Rhat <1.05,]

s6_fp_half <- s6_fp_half[s6_fp_half$d21_Rhat <1.05 & s6_fp_half$d22_Rhat <1.05,]
s6_fp_neghalf <- s6_fp_neghalf[s6_fp_neghalf$d21_Rhat <1.05 & s6_fp_neghalf$d22_Rhat <1.05,]
s6_fp_zero <- s6_fp_zero[s6_fp_zero$d21_Rhat <1.05 & s6_fp_zero$d22_Rhat <1.05,]
s6_fp_one <- s6_fp_one[s6_fp_one$d21_Rhat <1.05 & s6_fp_one$d22_Rhat <1.05,]
s6_fp_two <- s6_fp_two[s6_fp_two$d21_Rhat <1.05 & s6_fp_two$d22_Rhat <1.05,]
s6_fp_negone <- s6_fp_negone[s6_fp_negone$d21_Rhat <1.05 & s6_fp_negone$d22_Rhat <1.05,]
s6_fp_negtwo <- s6_fp_negtwo[s6_fp_negtwo$d21_Rhat <1.05 & s6_fp_negtwo$d22_Rhat <1.05,]
s6_fp_three <- s6_fp_three[s6_fp_three$d21_Rhat <1.05 & s6_fp_three$d22_Rhat <1.05,]

s7_fp_half <- s7_fp_half[s7_fp_half$d21_Rhat <1.05 & s7_fp_half$d22_Rhat <1.05,]
s7_fp_neghalf <- s7_fp_neghalf[s7_fp_neghalf$d21_Rhat <1.05 & s7_fp_neghalf$d22_Rhat <1.05,]
s7_fp_zero <- s7_fp_zero[s7_fp_zero$d21_Rhat <1.05 & s7_fp_zero$d22_Rhat <1.05,]
s7_fp_one <- s7_fp_one[s7_fp_one$d21_Rhat <1.05 & s7_fp_one$d22_Rhat <1.05,]
s7_fp_two <- s7_fp_two[s7_fp_two$d21_Rhat <1.05 & s7_fp_two$d22_Rhat <1.05,]
s7_fp_negone <- s7_fp_negone[s7_fp_negone$d21_Rhat <1.05 & s7_fp_negone$d22_Rhat <1.05,]
s7_fp_negtwo <- s7_fp_negtwo[s7_fp_negtwo$d21_Rhat <1.05 & s7_fp_negtwo$d22_Rhat <1.05,]
s7_fp_three <- s7_fp_three[s7_fp_three$d21_Rhat <1.05 & s7_fp_three$d22_Rhat <1.05,]

s8_fp_half <- s8_fp_half[s8_fp_half$d21_Rhat <1.05 & s8_fp_half$d22_Rhat <1.05,]
s8_fp_neghalf <- s8_fp_neghalf[s8_fp_neghalf$d21_Rhat <1.05 & s8_fp_neghalf$d22_Rhat <1.05,]
s8_fp_zero <- s8_fp_zero[s8_fp_zero$d21_Rhat <1.05 & s8_fp_zero$d22_Rhat <1.05,]
s8_fp_one <- s8_fp_one[s8_fp_one$d21_Rhat <1.05 & s8_fp_one$d22_Rhat <1.05,]
s8_fp_two <- s8_fp_two[s8_fp_two$d21_Rhat <1.05 & s8_fp_two$d22_Rhat <1.05,]
s8_fp_negone <- s8_fp_negone[s8_fp_negone$d21_Rhat <1.05 & s8_fp_negone$d22_Rhat <1.05,]
s8_fp_negtwo <- s8_fp_negtwo[s8_fp_negtwo$d21_Rhat <1.05 & s8_fp_negtwo$d22_Rhat <1.05,]
s8_fp_three <- s8_fp_three[s8_fp_three$d21_Rhat <1.05 & s8_fp_three$d22_Rhat <1.05,]

s9_fp_half <- s9_fp_half[s9_fp_half$d21_Rhat <1.05 & s9_fp_half$d22_Rhat <1.05,]
s9_fp_neghalf <- s9_fp_neghalf[s9_fp_neghalf$d21_Rhat <1.05 & s9_fp_neghalf$d22_Rhat <1.05,]
s9_fp_zero <- s9_fp_zero[s9_fp_zero$d21_Rhat <1.05 & s9_fp_zero$d22_Rhat <1.05,]
s9_fp_one <- s9_fp_one[s9_fp_one$d21_Rhat <1.05 & s9_fp_one$d22_Rhat <1.05,]
s9_fp_two <- s9_fp_two[s9_fp_two$d21_Rhat <1.05 & s9_fp_two$d22_Rhat <1.05,]
s9_fp_negone <- s9_fp_negone[s9_fp_negone$d21_Rhat <1.05 & s9_fp_negone$d22_Rhat <1.05,]
s9_fp_negtwo <- s9_fp_negtwo[s9_fp_negtwo$d21_Rhat <1.05 & s9_fp_negtwo$d22_Rhat <1.05,]
s9_fp_three <- s9_fp_three[s9_fp_three$d21_Rhat <1.05 & s9_fp_three$d22_Rhat <1.05,]

s10_fp_half <- s10_fp_half[s10_fp_half$d21_Rhat <1.05 & s10_fp_half$d22_Rhat <1.05,]
s10_fp_neghalf <- s10_fp_neghalf[s10_fp_neghalf$d21_Rhat <1.05 & s10_fp_neghalf$d22_Rhat <1.05,]
s10_fp_zero <- s10_fp_zero[s10_fp_zero$d21_Rhat <1.05 & s10_fp_zero$d22_Rhat <1.05,]
s10_fp_one <- s10_fp_one[s10_fp_one$d21_Rhat <1.05 & s10_fp_one$d22_Rhat <1.05,]
s10_fp_two <- s10_fp_two[s10_fp_two$d21_Rhat <1.05 & s10_fp_two$d22_Rhat <1.05,]
s10_fp_negone <- s10_fp_negone[s10_fp_negone$d21_Rhat <1.05 & s10_fp_negone$d22_Rhat <1.05,]
s10_fp_negtwo <- s10_fp_negtwo[s10_fp_negtwo$d21_Rhat <1.05 & s10_fp_negtwo$d22_Rhat <1.05,]
s10_fp_three <- s10_fp_three[s10_fp_three$d21_Rhat <1.05 & s10_fp_three$d22_Rhat <1.05,]

s11_fp_half <- s11_fp_half[s11_fp_half$d21_Rhat <1.05 & s11_fp_half$d22_Rhat <1.05,]
s11_fp_neghalf <- s11_fp_neghalf[s11_fp_neghalf$d21_Rhat <1.05 & s11_fp_neghalf$d22_Rhat <1.05,]
s11_fp_zero <- s11_fp_zero[s11_fp_zero$d21_Rhat <1.05 & s11_fp_zero$d22_Rhat <1.05,]
s11_fp_one <- s11_fp_one[s11_fp_one$d21_Rhat <1.05 & s11_fp_one$d22_Rhat <1.05,]
s11_fp_two <- s11_fp_two[s11_fp_two$d21_Rhat <1.05 & s11_fp_two$d22_Rhat <1.05,]
s11_fp_negone <- s11_fp_negone[s11_fp_negone$d21_Rhat <1.05 & s11_fp_negone$d22_Rhat <1.05,]
s11_fp_negtwo <- s11_fp_negtwo[s11_fp_negtwo$d21_Rhat <1.05 & s11_fp_negtwo$d22_Rhat <1.05,]
s11_fp_three <- s11_fp_three[s11_fp_three$d21_Rhat <1.05 & s11_fp_three$d22_Rhat <1.05,]

s12_fp_half <- s12_fp_half[s12_fp_half$d21_Rhat <1.05 & s12_fp_half$d22_Rhat <1.05,]
s12_fp_neghalf <- s12_fp_neghalf[s12_fp_neghalf$d21_Rhat <1.05 & s12_fp_neghalf$d22_Rhat <1.05,]
s12_fp_zero <- s12_fp_zero[s12_fp_zero$d21_Rhat <1.05 & s12_fp_zero$d22_Rhat <1.05,]
s12_fp_one <- s12_fp_one[s12_fp_one$d21_Rhat <1.05 & s12_fp_one$d22_Rhat <1.05,]
s12_fp_two <- s12_fp_two[s12_fp_two$d21_Rhat <1.05 & s12_fp_two$d22_Rhat <1.05,]
s12_fp_negone <- s12_fp_negone[s12_fp_negone$d21_Rhat <1.05 & s12_fp_negone$d22_Rhat <1.05,]
s12_fp_negtwo <- s12_fp_negtwo[s12_fp_negtwo$d21_Rhat <1.05 & s12_fp_negtwo$d22_Rhat <1.05,]
s12_fp_three <- s12_fp_three[s12_fp_three$d21_Rhat <1.05 & s12_fp_three$d22_Rhat <1.05,]


# Format datasets
s1_fp_half <- data_format(s1_fp_half, "FP 0.5")
s1_fp_neghalf <- data_format(s1_fp_neghalf, "FP -0.5")
s1_fp_zero <- data_format(s1_fp_zero, "FP 0")
s1_fp_one <- data_format(s1_fp_one, "FP 1")
s1_fp_two <- data_format(s1_fp_two, "FP 2")
s1_fp_negone <- data_format(s1_fp_negone, "FP -1")
s1_fp_negtwo <- data_format(s1_fp_negtwo, "FP -2")
s1_fp_three <- data_format(s1_fp_three, "FP 3")

s2_fp_half <- data_format(s2_fp_half, "FP 0.5")
s2_fp_neghalf <- data_format(s2_fp_neghalf, "FP -0.5")
s2_fp_zero <- data_format(s2_fp_zero, "FP 0")
s2_fp_one <- data_format(s2_fp_one, "FP 1")
s2_fp_two <- data_format(s2_fp_two, "FP 2")
s2_fp_negone <- data_format(s2_fp_negone, "FP -1")
s2_fp_negtwo <- data_format(s2_fp_negtwo, "FP -2")
s2_fp_three <- data_format(s2_fp_three, "FP 3")

s3_fp_half <- data_format(s3_fp_half, "FP 0.5")
s3_fp_neghalf <- data_format(s3_fp_neghalf, "FP -0.5")
s3_fp_zero <- data_format(s3_fp_zero, "FP 0")
s3_fp_one <- data_format(s3_fp_one, "FP 1")
s3_fp_two <- data_format(s3_fp_two, "FP 2")
s3_fp_negone <- data_format(s3_fp_negone, "FP -1")
s3_fp_negtwo <- data_format(s3_fp_negtwo, "FP -2")
s3_fp_three <- data_format(s3_fp_three, "FP 3")

s4_fp_half <- data_format(s4_fp_half, "FP 0.5")
s4_fp_neghalf <- data_format(s4_fp_neghalf, "FP -0.5")
s4_fp_zero <- data_format(s4_fp_zero, "FP 0")
s4_fp_one <- data_format(s4_fp_one, "FP 1")
s4_fp_two <- data_format(s4_fp_two, "FP 2")
s4_fp_negone <- data_format(s4_fp_negone, "FP -1")
s4_fp_negtwo <- data_format(s4_fp_negtwo, "FP -2")
s4_fp_three <- data_format(s4_fp_three, "FP 3")

s5_fp_half <- data_format(s5_fp_half, "FP 0.5")
s5_fp_neghalf <- data_format(s5_fp_neghalf, "FP -0.5")
s5_fp_zero <- data_format(s5_fp_zero, "FP 0")
s5_fp_one <- data_format(s5_fp_one, "FP 1")
s5_fp_two <- data_format(s5_fp_two, "FP 2")
s5_fp_negone <- data_format(s5_fp_negone, "FP -1")
s5_fp_negtwo <- data_format(s5_fp_negtwo, "FP -2")
s5_fp_three <- data_format(s5_fp_three, "FP 3")

s6_fp_half <- data_format(s6_fp_half, "FP 0.5")
s6_fp_neghalf <- data_format(s6_fp_neghalf, "FP -0.5")
s6_fp_zero <- data_format(s6_fp_zero, "FP 0")
s6_fp_one <- data_format(s6_fp_one, "FP 1")
s6_fp_two <- data_format(s6_fp_two, "FP 2")
s6_fp_negone <- data_format(s6_fp_negone, "FP -1")
s6_fp_negtwo <- data_format(s6_fp_negtwo, "FP -2")
s6_fp_three <- data_format(s6_fp_three, "FP 3")

s7_fp_half <- data_format(s7_fp_half, "FP 0.5")
s7_fp_neghalf <- data_format(s7_fp_neghalf, "FP -0.5")
s7_fp_zero <- data_format(s7_fp_zero, "FP 0")
s7_fp_one <- data_format(s7_fp_one, "FP 1")
s7_fp_two <- data_format(s7_fp_two, "FP 2")
s7_fp_negone <- data_format(s7_fp_negone, "FP -1")
s7_fp_negtwo <- data_format(s7_fp_negtwo, "FP -2")
s7_fp_three <- data_format(s7_fp_three, "FP 3")

s8_fp_half <- data_format(s8_fp_half, "FP 0.5")
s8_fp_neghalf <- data_format(s8_fp_neghalf, "FP -0.5")
s8_fp_zero <- data_format(s8_fp_zero, "FP 0")
s8_fp_one <- data_format(s8_fp_one, "FP 1")
s8_fp_two <- data_format(s8_fp_two, "FP 2")
s8_fp_negone <- data_format(s8_fp_negone, "FP -1")
s8_fp_negtwo <- data_format(s8_fp_negtwo, "FP -2")
s8_fp_three <- data_format(s8_fp_three, "FP 3")

s9_fp_half <- data_format(s9_fp_half, "FP 0.5")
s9_fp_neghalf <- data_format(s9_fp_neghalf, "FP -0.5")
s9_fp_zero <- data_format(s9_fp_zero, "FP 0")
s9_fp_one <- data_format(s9_fp_one, "FP 1")
s9_fp_two <- data_format(s9_fp_two, "FP 2")
s9_fp_negone <- data_format(s9_fp_negone, "FP -1")
s9_fp_negtwo <- data_format(s9_fp_negtwo, "FP -2")
s9_fp_three <- data_format(s9_fp_three, "FP 3")

s10_fp_half <- data_format(s10_fp_half, "FP 0.5")
s10_fp_neghalf <- data_format(s10_fp_neghalf, "FP -0.5")
s10_fp_zero <- data_format(s10_fp_zero, "FP 0")
s10_fp_one <- data_format(s10_fp_one, "FP 1")
s10_fp_two <- data_format(s10_fp_two, "FP 2")
s10_fp_negone <- data_format(s10_fp_negone, "FP -1")
s10_fp_negtwo <- data_format(s10_fp_negtwo, "FP -2")
s10_fp_three <- data_format(s10_fp_three, "FP 3")

s11_fp_half <- data_format(s11_fp_half, "FP 0.5")
s11_fp_neghalf <- data_format(s11_fp_neghalf, "FP -0.5")
s11_fp_zero <- data_format(s11_fp_zero, "FP 0")
s11_fp_one <- data_format(s11_fp_one, "FP 1")
s11_fp_two <- data_format(s11_fp_two, "FP 2")
s11_fp_negone <- data_format(s11_fp_negone, "FP -1")
s11_fp_negtwo <- data_format(s11_fp_negtwo, "FP -2")
s11_fp_three <- data_format(s11_fp_three, "FP 3")

s12_fp_half <- data_format(s12_fp_half, "FP 0.5")
s12_fp_neghalf <- data_format(s12_fp_neghalf, "FP -0.5")
s12_fp_zero <- data_format(s12_fp_zero, "FP 0")
s12_fp_one <- data_format(s12_fp_one, "FP 1")
s12_fp_two <- data_format(s12_fp_two, "FP 2")
s12_fp_negone <- data_format(s12_fp_negone, "FP -1")
s12_fp_negtwo <- data_format(s12_fp_negtwo, "FP -2")
s12_fp_three <- data_format(s12_fp_three, "FP 3")


# Calculate performance measures
s1_fp_half <- s1_fp_half %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s1_fp_neghalf <- s1_fp_neghalf %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s1_fp_zero <- s1_fp_zero %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s1_fp_one <- s1_fp_one %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s1_fp_two <- s1_fp_two %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s1_fp_negone <- s1_fp_negone %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s1_fp_negtwo <- s1_fp_negtwo %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s1_fp_three <- s1_fp_three %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)


s2_fp_half <- s2_fp_half %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s2_fp_neghalf <- s2_fp_neghalf %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s2_fp_zero <- s2_fp_zero %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s2_fp_one <- s2_fp_one %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s2_fp_two <- s2_fp_two %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s2_fp_negone <- s2_fp_negone %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s2_fp_negtwo <- s2_fp_negtwo %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s2_fp_three <- s2_fp_three %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)


s3_fp_half <- s3_fp_half %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s3_fp_neghalf <- s3_fp_neghalf %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s3_fp_zero <- s3_fp_zero %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s3_fp_one <- s3_fp_one %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s3_fp_two <- s3_fp_two %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s3_fp_negone <- s3_fp_negone %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s3_fp_negtwo <- s3_fp_negtwo %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s3_fp_three <- s3_fp_three %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)


s4_fp_half <- s4_fp_half %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s4_fp_neghalf <- s4_fp_neghalf %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s4_fp_zero <- s4_fp_zero %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s4_fp_one <- s4_fp_one %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s4_fp_two <- s4_fp_two %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s4_fp_negone <- s4_fp_negone %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s4_fp_negtwo <- s4_fp_negtwo %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s4_fp_three <- s4_fp_three %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)


s5_fp_half <- s5_fp_half %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s5_fp_neghalf <- s5_fp_neghalf %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s5_fp_zero <- s5_fp_zero %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s5_fp_one <- s5_fp_one %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s5_fp_two <- s5_fp_two %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s5_fp_negone <- s5_fp_negone %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s5_fp_negtwo <- s5_fp_negtwo %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s5_fp_three <- s5_fp_three %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)


s6_fp_half <- s6_fp_half %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s6_fp_neghalf <- s6_fp_neghalf %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s6_fp_zero <- s6_fp_zero %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s6_fp_one <- s6_fp_one %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s6_fp_two <- s6_fp_two %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s6_fp_negone <- s6_fp_negone %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s6_fp_negtwo <- s6_fp_negtwo %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s6_fp_three <- s6_fp_three %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)


s7_fp_half <- s7_fp_half %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s7_fp_neghalf <- s7_fp_neghalf %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s7_fp_zero <- s7_fp_zero %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s7_fp_one <- s7_fp_one %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s7_fp_two <- s7_fp_two %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s7_fp_negone <- s7_fp_negone %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s7_fp_negtwo <- s7_fp_negtwo %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s7_fp_three <- s7_fp_three %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)


s8_fp_half <- s8_fp_half %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s8_fp_neghalf <- s8_fp_neghalf %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s8_fp_zero <- s8_fp_zero %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s8_fp_one <- s8_fp_one %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s8_fp_two <- s8_fp_two %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s8_fp_negone <- s8_fp_negone %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s8_fp_negtwo <- s8_fp_negtwo %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s8_fp_three <- s8_fp_three %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)




s9_fp_half <- s9_fp_half %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s9_fp_neghalf <- s9_fp_neghalf %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s9_fp_zero <- s9_fp_zero %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s9_fp_one <- s9_fp_one %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s9_fp_two <- s9_fp_two %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s9_fp_negone <- s9_fp_negone %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s9_fp_negtwo <- s9_fp_negtwo %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s9_fp_three <- s9_fp_three %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)


s10_fp_half <- s10_fp_half %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s10_fp_neghalf <- s10_fp_neghalf %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s10_fp_zero <- s10_fp_zero %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s10_fp_one <- s10_fp_one %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s10_fp_two <- s10_fp_two %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s10_fp_negone <- s10_fp_negone %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s10_fp_negtwo <- s10_fp_negtwo %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s10_fp_three <- s10_fp_three %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)


s11_fp_half <- s11_fp_half %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s11_fp_neghalf <- s11_fp_neghalf %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s11_fp_zero <- s11_fp_zero %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s11_fp_one <- s11_fp_one %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s11_fp_two <- s11_fp_two %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s11_fp_negone <- s11_fp_negone %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s11_fp_negtwo <- s11_fp_negtwo %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s11_fp_three <- s11_fp_three %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)


s12_fp_half <- s12_fp_half %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s12_fp_neghalf <- s12_fp_neghalf %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s12_fp_zero <- s12_fp_zero %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s12_fp_one <- s12_fp_one %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s12_fp_two <- s12_fp_two %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s12_fp_negone <- s12_fp_negone %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s12_fp_negtwo <- s12_fp_negtwo %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s12_fp_three <- s12_fp_three %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)


# Build data frame with performance measures
df.bias <- data.frame(stat="NA", est=numeric(1), mcse=numeric(1), method="NA", dgm=numeric(1))

df.bias[1,] <- c(get_data(s1_pw1, stats="bias"), method="pw_c1", dgm=1)
df.bias[2,] <- c(get_data(s1_pw1, stats="empse"), method="pw_c1", dgm=1)
df.bias[3,] <- c(get_data(s1_pw1, stats="mse"), method="pw_c1", dgm=1)
df.bias[4,] <- c(get_data(s1_pw1, stats="modelse"), method="pw_c1", dgm=1)
df.bias[5,] <- c(get_data(s1_pw1, stats="cover"), method="pw_c1", dgm=1)
df.bias[6,] <- c(get_data(s1_pw2, stats="bias"), method="pw_c2", dgm=1)
df.bias[7,] <- c(get_data(s1_pw2, stats="empse"), method="pw_c2", dgm=1)
df.bias[8,] <- c(get_data(s1_pw2, stats="mse"), method="pw_c2", dgm=1)
df.bias[9,] <- c(get_data(s1_pw2, stats="modelse"), method="pw_c2", dgm=1)
df.bias[10,] <- c(get_data(s1_pw2, stats="cover"), method="pw_c2", dgm=1)
df.bias[11,] <- c(get_data(s1_pw3, stats="bias"), method="pw_c3", dgm=1)
df.bias[12,] <- c(get_data(s1_pw3, stats="empse"), method="pw_c3", dgm=1)
df.bias[13,] <- c(get_data(s1_pw3, stats="mse"), method="pw_c3", dgm=1)
df.bias[14,] <- c(get_data(s1_pw3, stats="modelse"), method="pw_c3", dgm=1)
df.bias[15,] <- c(get_data(s1_pw3, stats="cover"), method="pw_c3", dgm=1)

df.bias[16,] <- c(get_data(s2_pw1, stats="bias"), method="pw_c1", dgm=2)
df.bias[17,] <- c(get_data(s2_pw1, stats="empse"), method="pw_c1", dgm=2)
df.bias[18,] <- c(get_data(s2_pw1, stats="mse"), method="pw_c1", dgm=2)
df.bias[19,] <- c(get_data(s2_pw1, stats="modelse"), method="pw_c1", dgm=2)
df.bias[20,] <- c(get_data(s2_pw1, stats="cover"), method="pw_c1", dgm=2)
df.bias[21,] <- c(get_data(s2_pw2, stats="bias"), method="pw_c2", dgm=2)
df.bias[22,] <- c(get_data(s2_pw2, stats="empse"), method="pw_c2", dgm=2)
df.bias[23,] <- c(get_data(s2_pw2, stats="mse"), method="pw_c2", dgm=2)
df.bias[24,] <- c(get_data(s2_pw2, stats="modelse"), method="pw_c2", dgm=2)
df.bias[25,] <- c(get_data(s2_pw2, stats="cover"), method="pw_c2", dgm=2)
df.bias[26,] <- c(get_data(s2_pw3, stats="bias"), method="pw_c3", dgm=2)
df.bias[27,] <- c(get_data(s2_pw3, stats="empse"), method="pw_c3", dgm=2)
df.bias[28,] <- c(get_data(s2_pw3, stats="mse"), method="pw_c3", dgm=2)
df.bias[29,] <- c(get_data(s2_pw3, stats="modelse"), method="pw_c3", dgm=2)
df.bias[30,] <- c(get_data(s2_pw3, stats="cover"), method="pw_c3", dgm=2)

df.bias[31,] <- c(get_data(s3_pw1, stats="bias"), method="pw_c1", dgm=3)
df.bias[32,] <- c(get_data(s3_pw1, stats="empse"), method="pw_c1", dgm=3)
df.bias[33,] <- c(get_data(s3_pw1, stats="mse"), method="pw_c1", dgm=3)
df.bias[34,] <- c(get_data(s3_pw1, stats="modelse"), method="pw_c1", dgm=3)
df.bias[35,] <- c(get_data(s3_pw1, stats="cover"), method="pw_c1", dgm=3)
df.bias[36,] <- c(get_data(s3_pw2, stats="bias"), method="pw_c2", dgm=3)
df.bias[37,] <- c(get_data(s3_pw2, stats="empse"), method="pw_c2", dgm=3)
df.bias[38,] <- c(get_data(s3_pw2, stats="mse"), method="pw_c2", dgm=3)
df.bias[39,] <- c(get_data(s3_pw2, stats="modelse"), method="pw_c2", dgm=3)
df.bias[40,] <- c(get_data(s3_pw2, stats="cover"), method="pw_c2", dgm=3)
df.bias[41,] <- c(get_data(s3_pw3, stats="bias"), method="pw_c3", dgm=3)
df.bias[42,] <- c(get_data(s3_pw3, stats="empse"), method="pw_c3", dgm=3)
df.bias[43,] <- c(get_data(s3_pw3, stats="mse"), method="pw_c3", dgm=3)
df.bias[44,] <- c(get_data(s3_pw3, stats="modelse"), method="pw_c3", dgm=3)
df.bias[45,] <- c(get_data(s3_pw3, stats="cover"), method="pw_c3", dgm=3)

df.bias[46,] <- c(get_data(s4_pw1, stats="bias"), method="pw_c1", dgm=4)
df.bias[47,] <- c(get_data(s4_pw1, stats="empse"), method="pw_c1", dgm=4)
df.bias[48,] <- c(get_data(s4_pw1, stats="mse"), method="pw_c1", dgm=4)
df.bias[49,] <- c(get_data(s4_pw1, stats="modelse"), method="pw_c1", dgm=4)
df.bias[50,] <- c(get_data(s4_pw1, stats="cover"), method="pw_c1", dgm=4)
df.bias[51,] <- c(get_data(s4_pw2, stats="bias"), method="pw_c2", dgm=4)
df.bias[52,] <- c(get_data(s4_pw2, stats="empse"), method="pw_c2", dgm=4)
df.bias[53,] <- c(get_data(s4_pw2, stats="mse"), method="pw_c2", dgm=4)
df.bias[54,] <- c(get_data(s4_pw2, stats="modelse"), method="pw_c2", dgm=4)
df.bias[55,] <- c(get_data(s4_pw2, stats="cover"), method="pw_c2", dgm=4)
df.bias[56,] <- c(get_data(s4_pw3, stats="bias"), method="pw_c3", dgm=4)
df.bias[57,] <- c(get_data(s4_pw3, stats="empse"), method="pw_c3", dgm=4)
df.bias[58,] <- c(get_data(s4_pw3, stats="mse"), method="pw_c3", dgm=4)
df.bias[59,] <- c(get_data(s4_pw3, stats="modelse"), method="pw_c3", dgm=4)
df.bias[60,] <- c(get_data(s4_pw3, stats="cover"), method="pw_c3", dgm=4)

df.bias[61,] <- c(get_data(s1_rplnt1, stats="bias"), method="rplnt1", dgm=1)
df.bias[62,] <- c(get_data(s1_rplnt1, stats="empse"), method="rplnt1", dgm=1)
df.bias[63,] <- c(get_data(s1_rplnt1, stats="mse"), method="rplnt1", dgm=1)
df.bias[64,] <- c(get_data(s1_rplnt1, stats="modelse"), method="rplnt1", dgm=1)
df.bias[65,] <- c(get_data(s1_rplnt1, stats="cover"), method="rplnt1", dgm=1)
df.bias[66,] <- c(get_data(s1_rplnt2, stats="bias"), method="rplnt2", dgm=1)
df.bias[67,] <- c(get_data(s1_rplnt2, stats="empse"), method="rplnt2", dgm=1)
df.bias[68,] <- c(get_data(s1_rplnt2, stats="mse"), method="rplnt2", dgm=1)
df.bias[69,] <- c(get_data(s1_rplnt2, stats="modelse"), method="rplnt2", dgm=1)
df.bias[70,] <- c(get_data(s1_rplnt2, stats="cover"), method="rplnt2", dgm=1)
df.bias[71,] <- c(get_data(s1_rplnt3, stats="bias"), method="rplnt3", dgm=1)
df.bias[72,] <- c(get_data(s1_rplnt3, stats="empse"), method="rplnt3", dgm=1)
df.bias[73,] <- c(get_data(s1_rplnt3, stats="mse"), method="rplnt3", dgm=1)
df.bias[74,] <- c(get_data(s1_rplnt3, stats="modelse"), method="rplnt3", dgm=1)
df.bias[75,] <- c(get_data(s1_rplnt3, stats="cover"), method="rplnt3", dgm=1)
df.bias[76,] <- c(get_data(s1_rplnt4, stats="bias"), method="rplnt4", dgm=1)
df.bias[77,] <- c(get_data(s1_rplnt4, stats="empse"), method="rplnt4", dgm=1)
df.bias[78,] <- c(get_data(s1_rplnt4, stats="mse"), method="rplnt4", dgm=1)
df.bias[79,] <- c(get_data(s1_rplnt4, stats="modelse"), method="rplnt4", dgm=1)
df.bias[80,] <- c(get_data(s1_rplnt4, stats="cover"), method="rplnt4", dgm=1)

df.bias[81,] <- c(get_data(s2_rplnt1, stats="bias"), method="rplnt1", dgm=2)
df.bias[82,] <- c(get_data(s2_rplnt1, stats="empse"), method="rplnt1", dgm=2)
df.bias[83,] <- c(get_data(s2_rplnt1, stats="mse"), method="rplnt1", dgm=2)
df.bias[84,] <- c(get_data(s2_rplnt1, stats="modelse"), method="rplnt1", dgm=2)
df.bias[85,] <- c(get_data(s2_rplnt1, stats="cover"), method="rplnt1", dgm=2)
df.bias[86,] <- c(get_data(s2_rplnt2, stats="bias"), method="rplnt2", dgm=2)
df.bias[87,] <- c(get_data(s2_rplnt2, stats="empse"), method="rplnt2", dgm=2)
df.bias[88,] <- c(get_data(s2_rplnt2, stats="mse"), method="rplnt2", dgm=2)
df.bias[89,] <- c(get_data(s2_rplnt2, stats="modelse"), method="rplnt2", dgm=2)
df.bias[90,] <- c(get_data(s2_rplnt2, stats="cover"), method="rplnt2", dgm=2)
df.bias[91,] <- c(get_data(s2_rplnt3, stats="bias"), method="rplnt3", dgm=2)
df.bias[92,] <- c(get_data(s2_rplnt3, stats="empse"), method="rplnt3", dgm=2)
df.bias[93,] <- c(get_data(s2_rplnt3, stats="mse"), method="rplnt3", dgm=2)
df.bias[94,] <- c(get_data(s2_rplnt3, stats="modelse"), method="rplnt3", dgm=2)
df.bias[95,] <- c(get_data(s2_rplnt3, stats="cover"), method="rplnt3", dgm=2)
df.bias[96,] <- c(get_data(s2_rplnt4, stats="bias"), method="rplnt4", dgm=2)
df.bias[97,] <- c(get_data(s2_rplnt4, stats="empse"), method="rplnt4", dgm=2)
df.bias[98,] <- c(get_data(s2_rplnt4, stats="mse"), method="rplnt4", dgm=2)
df.bias[99,] <- c(get_data(s2_rplnt4, stats="modelse"), method="rplnt4", dgm=2)
df.bias[100,] <- c(get_data(s2_rplnt4, stats="cover"), method="rplnt4", dgm=2)

df.bias[101,] <- c(get_data(s3_rplnt1, stats="bias"), method="rplnt1", dgm=3)
df.bias[102,] <- c(get_data(s3_rplnt1, stats="empse"), method="rplnt1", dgm=3)
df.bias[103,] <- c(get_data(s3_rplnt1, stats="mse"), method="rplnt1", dgm=3)
df.bias[104,] <- c(get_data(s3_rplnt1, stats="modelse"), method="rplnt1", dgm=3)
df.bias[105,] <- c(get_data(s3_rplnt1, stats="cover"), method="rplnt1", dgm=3)
df.bias[106,] <- c(get_data(s3_rplnt2, stats="bias"), method="rplnt2", dgm=3)
df.bias[107,] <- c(get_data(s3_rplnt2, stats="empse"), method="rplnt2", dgm=3)
df.bias[108,] <- c(get_data(s3_rplnt2, stats="mse"), method="rplnt2", dgm=3)
df.bias[109,] <- c(get_data(s3_rplnt2, stats="modelse"), method="rplnt2", dgm=3)
df.bias[110,] <- c(get_data(s3_rplnt2, stats="cover"), method="rplnt2", dgm=3)
df.bias[111,] <- c(get_data(s3_rplnt3, stats="bias"), method="rplnt3", dgm=3)
df.bias[112,] <- c(get_data(s3_rplnt3, stats="empse"), method="rplnt3", dgm=3)
df.bias[113,] <- c(get_data(s3_rplnt3, stats="mse"), method="rplnt3", dgm=3)
df.bias[114,] <- c(get_data(s3_rplnt3, stats="modelse"), method="rplnt3", dgm=3)
df.bias[115,] <- c(get_data(s3_rplnt3, stats="cover"), method="rplnt3", dgm=3)
df.bias[116,] <- c(get_data(s3_rplnt4, stats="bias"), method="rplnt4", dgm=3)
df.bias[117,] <- c(get_data(s3_rplnt4, stats="empse"), method="rplnt4", dgm=3)
df.bias[118,] <- c(get_data(s3_rplnt4, stats="mse"), method="rplnt4", dgm=3)
df.bias[119,] <- c(get_data(s3_rplnt4, stats="modelse"), method="rplnt4", dgm=3)
df.bias[120,] <- c(get_data(s3_rplnt4, stats="cover"), method="rplnt4", dgm=3)

df.bias[121,] <- c(get_data(s4_rplnt1, stats="bias"), method="rplnt1", dgm=4)
df.bias[122,] <- c(get_data(s4_rplnt1, stats="empse"), method="rplnt1", dgm=4)
df.bias[123,] <- c(get_data(s4_rplnt1, stats="mse"), method="rplnt1", dgm=4)
df.bias[124,] <- c(get_data(s4_rplnt1, stats="modelse"), method="rplnt1", dgm=4)
df.bias[125,] <- c(get_data(s4_rplnt1, stats="cover"), method="rplnt1", dgm=4)
df.bias[126,] <- c(get_data(s4_rplnt2, stats="bias"), method="rplnt2", dgm=4)
df.bias[127,] <- c(get_data(s4_rplnt2, stats="empse"), method="rplnt2", dgm=4)
df.bias[128,] <- c(get_data(s4_rplnt2, stats="mse"), method="rplnt2", dgm=4)
df.bias[129,] <- c(get_data(s4_rplnt2, stats="modelse"), method="rplnt2", dgm=4)
df.bias[130,] <- c(get_data(s4_rplnt2, stats="cover"), method="rplnt2", dgm=4)
df.bias[131,] <- c(get_data(s4_rplnt3, stats="bias"), method="rplnt3", dgm=4)
df.bias[132,] <- c(get_data(s4_rplnt3, stats="empse"), method="rplnt3", dgm=4)
df.bias[133,] <- c(get_data(s4_rplnt3, stats="mse"), method="rplnt3", dgm=4)
df.bias[134,] <- c(get_data(s4_rplnt3, stats="modelse"), method="rplnt3", dgm=4)
df.bias[135,] <- c(get_data(s4_rplnt3, stats="cover"), method="rplnt3", dgm=4)
df.bias[136,] <- c(get_data(s4_rplnt4, stats="bias"), method="rplnt4", dgm=4)
df.bias[137,] <- c(get_data(s4_rplnt4, stats="empse"), method="rplnt4", dgm=4)
df.bias[138,] <- c(get_data(s4_rplnt4, stats="mse"), method="rplnt4", dgm=4)
df.bias[139,] <- c(get_data(s4_rplnt4, stats="modelse"), method="rplnt4", dgm=4)
df.bias[140,] <- c(get_data(s4_rplnt4, stats="cover"), method="rplnt4", dgm=4)

df.bias[141,] <- c(get_data(s1_fp_half, stats="bias"), method="FP 0.5", dgm=1)
df.bias[142,] <- c(get_data(s1_fp_half, stats="empse"), method="FP 0.5", dgm=1)
df.bias[143,] <- c(get_data(s1_fp_half, stats="mse"), method="FP 0.5", dgm=1)
df.bias[144,] <- c(get_data(s1_fp_half, stats="modelse"), method="FP 0.5", dgm=1)
df.bias[145,] <- c(get_data(s1_fp_half, stats="cover"), method="FP 0.5", dgm=1)
df.bias[146,] <- c(get_data(s1_fp_neghalf, stats="bias"), method="FP -0.5", dgm=1)
df.bias[147,] <- c(get_data(s1_fp_neghalf, stats="empse"), method="FP -0.5", dgm=1)
df.bias[148,] <- c(get_data(s1_fp_neghalf, stats="mse"), method="FP -0.5", dgm=1)
df.bias[149,] <- c(get_data(s1_fp_neghalf, stats="modelse"), method="FP -0.5", dgm=1)
df.bias[150,] <- c(get_data(s1_fp_neghalf, stats="cover"), method="FP -0.5", dgm=1)
df.bias[151,] <- c(get_data(s1_fp_zero, stats="bias"), method="FP 0", dgm=1)
df.bias[152,] <- c(get_data(s1_fp_zero, stats="empse"), method="FP 0", dgm=1)
df.bias[153,] <- c(get_data(s1_fp_zero, stats="mse"), method="FP 0", dgm=1)
df.bias[154,] <- c(get_data(s1_fp_zero, stats="modelse"), method="FP 0", dgm=1)
df.bias[155,] <- c(get_data(s1_fp_zero, stats="cover"), method="FP 0", dgm=1)
df.bias[156,] <- c(get_data(s1_fp_one, stats="bias"), method="FP 1", dgm=1)
df.bias[157,] <- c(get_data(s1_fp_one, stats="empse"), method="FP 1", dgm=1)
df.bias[158,] <- c(get_data(s1_fp_one, stats="mse"), method="FP 1", dgm=1)
df.bias[159,] <- c(get_data(s1_fp_one, stats="modelse"), method="FP 1", dgm=1)
df.bias[160,] <- c(get_data(s1_fp_one, stats="cover"), method="FP 1", dgm=1)
df.bias[161,] <- c(get_data(s1_fp_two, stats="bias"), method="FP 2", dgm=1)
df.bias[162,] <- c(get_data(s1_fp_two, stats="empse"), method="FP 2", dgm=1)
df.bias[163,] <- c(get_data(s1_fp_two, stats="mse"), method="FP 2", dgm=1)
df.bias[164,] <- c(get_data(s1_fp_two, stats="modelse"), method="FP 2", dgm=1)
df.bias[165,] <- c(get_data(s1_fp_two, stats="cover"), method="FP 2", dgm=1)

df.bias[166,] <- c(get_data(s2_fp_half, stats="bias"), method="FP 0.5", dgm=2)
df.bias[167,] <- c(get_data(s2_fp_half, stats="empse"), method="FP 0.5", dgm=2)
df.bias[168,] <- c(get_data(s2_fp_half, stats="mse"), method="FP 0.5", dgm=2)
df.bias[169,] <- c(get_data(s2_fp_half, stats="modelse"), method="FP 0.5", dgm=2)
df.bias[170,] <- c(get_data(s2_fp_half, stats="cover"), method="FP 0.5", dgm=2)
df.bias[171,] <- c(get_data(s2_fp_neghalf, stats="bias"), method="FP -0.5", dgm=2)
df.bias[172,] <- c(get_data(s2_fp_neghalf, stats="empse"), method="FP -0.5", dgm=2)
df.bias[173,] <- c(get_data(s2_fp_neghalf, stats="mse"), method="FP -0.5", dgm=2)
df.bias[174,] <- c(get_data(s2_fp_neghalf, stats="modelse"), method="FP -0.5", dgm=2)
df.bias[175,] <- c(get_data(s2_fp_neghalf, stats="cover"), method="FP -0.5", dgm=2)
df.bias[176,] <- c(get_data(s2_fp_zero, stats="bias"), method="FP 0", dgm=2)
df.bias[177,] <- c(get_data(s2_fp_zero, stats="empse"), method="FP 0", dgm=2)
df.bias[178,] <- c(get_data(s2_fp_zero, stats="mse"), method="FP 0", dgm=2)
df.bias[179,] <- c(get_data(s2_fp_zero, stats="modelse"), method="FP 0", dgm=2)
df.bias[180,] <- c(get_data(s2_fp_zero, stats="cover"), method="FP 0", dgm=2)
df.bias[181,] <- c(get_data(s2_fp_one, stats="bias"), method="FP 1", dgm=2)
df.bias[182,] <- c(get_data(s2_fp_one, stats="empse"), method="FP 1", dgm=2)
df.bias[183,] <- c(get_data(s2_fp_one, stats="mse"), method="FP 1", dgm=2)
df.bias[184,] <- c(get_data(s2_fp_one, stats="modelse"), method="FP 1", dgm=2)
df.bias[185,] <- c(get_data(s2_fp_one, stats="cover"), method="FP 1", dgm=2)
df.bias[186,] <- c(get_data(s2_fp_two, stats="bias"), method="FP 2", dgm=2)
df.bias[187,] <- c(get_data(s2_fp_two, stats="empse"), method="FP 2", dgm=2)
df.bias[188,] <- c(get_data(s2_fp_two, stats="mse"), method="FP 2", dgm=2)
df.bias[189,] <- c(get_data(s2_fp_two, stats="modelse"), method="FP 2", dgm=2)
df.bias[190,] <- c(get_data(s2_fp_two, stats="cover"), method="FP 2", dgm=2)

df.bias[191,] <- c(get_data(s3_fp_half, stats="bias"), method="FP 0.5", dgm=3)
df.bias[192,] <- c(get_data(s3_fp_half, stats="empse"), method="FP 0.5", dgm=3)
df.bias[193,] <- c(get_data(s3_fp_half, stats="mse"), method="FP 0.5", dgm=3)
df.bias[194,] <- c(get_data(s3_fp_half, stats="modelse"), method="FP 0.5", dgm=3)
df.bias[195,] <- c(get_data(s3_fp_half, stats="cover"), method="FP 0.5", dgm=3)
df.bias[196,] <- c(get_data(s3_fp_neghalf, stats="bias"), method="FP -0.5", dgm=3)
df.bias[197,] <- c(get_data(s3_fp_neghalf, stats="empse"), method="FP -0.5", dgm=3)
df.bias[198,] <- c(get_data(s3_fp_neghalf, stats="mse"), method="FP -0.5", dgm=3)
df.bias[199,] <- c(get_data(s3_fp_neghalf, stats="modelse"), method="FP -0.5", dgm=3)
df.bias[200,] <- c(get_data(s3_fp_neghalf, stats="cover"), method="FP -0.5", dgm=3)
df.bias[201,] <- c(get_data(s3_fp_zero, stats="bias"), method="FP 0", dgm=3)
df.bias[202,] <- c(get_data(s3_fp_zero, stats="empse"), method="FP 0", dgm=3)
df.bias[203,] <- c(get_data(s3_fp_zero, stats="mse"), method="FP 0", dgm=3)
df.bias[204,] <- c(get_data(s3_fp_zero, stats="modelse"), method="FP 0", dgm=3)
df.bias[205,] <- c(get_data(s3_fp_zero, stats="cover"), method="FP 0", dgm=3)
df.bias[206,] <- c(get_data(s3_fp_one, stats="bias"), method="FP 1", dgm=3)
df.bias[207,] <- c(get_data(s3_fp_one, stats="empse"), method="FP 1", dgm=3)
df.bias[208,] <- c(get_data(s3_fp_one, stats="mse"), method="FP 1", dgm=3)
df.bias[209,] <- c(get_data(s3_fp_one, stats="modelse"), method="FP 1", dgm=3)
df.bias[210,] <- c(get_data(s3_fp_one, stats="cover"), method="FP 1", dgm=3)
df.bias[211,] <- c(get_data(s3_fp_two, stats="bias"), method="FP 2", dgm=3)
df.bias[212,] <- c(get_data(s3_fp_two, stats="empse"), method="FP 2", dgm=3)
df.bias[213,] <- c(get_data(s3_fp_two, stats="mse"), method="FP 2", dgm=3)
df.bias[214,] <- c(get_data(s3_fp_two, stats="modelse"), method="FP 2", dgm=3)
df.bias[215,] <- c(get_data(s3_fp_two, stats="cover"), method="FP 2", dgm=3)

df.bias[216,] <- c(get_data(s4_fp_half, stats="bias"), method="FP 0.5", dgm=4)
df.bias[217,] <- c(get_data(s4_fp_half, stats="empse"), method="FP 0.5", dgm=4)
df.bias[218,] <- c(get_data(s4_fp_half, stats="mse"), method="FP 0.5", dgm=4)
df.bias[219,] <- c(get_data(s4_fp_half, stats="modelse"), method="FP 0.5", dgm=4)
df.bias[220,] <- c(get_data(s4_fp_half, stats="cover"), method="FP 0.5", dgm=4)
df.bias[221,] <- c(get_data(s4_fp_neghalf, stats="bias"), method="FP -0.5", dgm=4)
df.bias[222,] <- c(get_data(s4_fp_neghalf, stats="empse"), method="FP -0.5", dgm=4)
df.bias[223,] <- c(get_data(s4_fp_neghalf, stats="mse"), method="FP -0.5", dgm=4)
df.bias[224,] <- c(get_data(s4_fp_neghalf, stats="modelse"), method="FP -0.5", dgm=4)
df.bias[225,] <- c(get_data(s4_fp_neghalf, stats="cover"), method="FP -0.5", dgm=4)
df.bias[226,] <- c(get_data(s4_fp_zero, stats="bias"), method="FP 0", dgm=4)
df.bias[227,] <- c(get_data(s4_fp_zero, stats="empse"), method="FP 0", dgm=4)
df.bias[228,] <- c(get_data(s4_fp_zero, stats="mse"), method="FP 0", dgm=4)
df.bias[229,] <- c(get_data(s4_fp_zero, stats="modelse"), method="FP 0", dgm=4)
df.bias[230,] <- c(get_data(s4_fp_zero, stats="cover"), method="FP 0", dgm=4)
df.bias[231,] <- c(get_data(s4_fp_one, stats="bias"), method="FP 1", dgm=4)
df.bias[232,] <- c(get_data(s4_fp_one, stats="empse"), method="FP 1", dgm=4)
df.bias[233,] <- c(get_data(s4_fp_one, stats="mse"), method="FP 1", dgm=4)
df.bias[234,] <- c(get_data(s4_fp_one, stats="modelse"), method="FP 1", dgm=4)
df.bias[235,] <- c(get_data(s4_fp_one, stats="cover"), method="FP 1", dgm=4)
df.bias[236,] <- c(get_data(s4_fp_two, stats="bias"), method="FP 2", dgm=4)
df.bias[237,] <- c(get_data(s4_fp_two, stats="empse"), method="FP 2", dgm=4)
df.bias[238,] <- c(get_data(s4_fp_two, stats="mse"), method="FP 2", dgm=4)
df.bias[239,] <- c(get_data(s4_fp_two, stats="modelse"), method="FP 2", dgm=4)
df.bias[240,] <- c(get_data(s4_fp_two, stats="cover"), method="FP 2", dgm=4)

df.bias[241,] <- c(get_data(s5_pw1, stats="bias"), method="pw_c1", dgm=5)
df.bias[242,] <- c(get_data(s5_pw1, stats="empse"), method="pw_c1", dgm=5)
df.bias[243,] <- c(get_data(s5_pw1, stats="mse"), method="pw_c1", dgm=5)
df.bias[244,] <- c(get_data(s5_pw1, stats="modelse"), method="pw_c1", dgm=5)
df.bias[245,] <- c(get_data(s5_pw1, stats="cover"), method="pw_c1", dgm=5)
df.bias[246,] <- c(get_data(s5_pw2, stats="bias"), method="pw_c2", dgm=5)
df.bias[247,] <- c(get_data(s5_pw2, stats="empse"), method="pw_c2", dgm=5)
df.bias[248,] <- c(get_data(s5_pw2, stats="mse"), method="pw_c2", dgm=5)
df.bias[249,] <- c(get_data(s5_pw2, stats="modelse"), method="pw_c2", dgm=5)
df.bias[250,] <- c(get_data(s5_pw2, stats="cover"), method="pw_c2", dgm=5)
df.bias[251,] <- c(get_data(s5_pw3, stats="bias"), method="pw_c3", dgm=5)
df.bias[252,] <- c(get_data(s5_pw3, stats="empse"), method="pw_c3", dgm=5)
df.bias[253,] <- c(get_data(s5_pw3, stats="mse"), method="pw_c3", dgm=5)
df.bias[254,] <- c(get_data(s5_pw3, stats="modelse"), method="pw_c3", dgm=5)
df.bias[255,] <- c(get_data(s5_pw3, stats="cover"), method="pw_c3", dgm=5)

df.bias[256,] <- c(get_data(s6_pw1, stats="bias"), method="pw_c1", dgm=6)
df.bias[257,] <- c(get_data(s6_pw1, stats="empse"), method="pw_c1", dgm=6)
df.bias[258,] <- c(get_data(s6_pw1, stats="mse"), method="pw_c1", dgm=6)
df.bias[259,] <- c(get_data(s6_pw1, stats="modelse"), method="pw_c1", dgm=6)
df.bias[260,] <- c(get_data(s6_pw1, stats="cover"), method="pw_c1", dgm=6)
df.bias[261,] <- c(get_data(s6_pw2, stats="bias"), method="pw_c2", dgm=6)
df.bias[262,] <- c(get_data(s6_pw2, stats="empse"), method="pw_c2", dgm=6)
df.bias[263,] <- c(get_data(s6_pw2, stats="mse"), method="pw_c2", dgm=6)
df.bias[264,] <- c(get_data(s6_pw2, stats="modelse"), method="pw_c2", dgm=6)
df.bias[265,] <- c(get_data(s6_pw2, stats="cover"), method="pw_c2", dgm=6)
df.bias[266,] <- c(get_data(s6_pw3, stats="bias"), method="pw_c3", dgm=6)
df.bias[267,] <- c(get_data(s6_pw3, stats="empse"), method="pw_c3", dgm=6)
df.bias[268,] <- c(get_data(s6_pw3, stats="mse"), method="pw_c3", dgm=6)
df.bias[269,] <- c(get_data(s6_pw3, stats="modelse"), method="pw_c3", dgm=6)
df.bias[270,] <- c(get_data(s6_pw3, stats="cover"), method="pw_c3", dgm=6)

df.bias[271,] <- c(get_data(s7_pw1, stats="bias"), method="pw_c1", dgm=7)
df.bias[272,] <- c(get_data(s7_pw1, stats="empse"), method="pw_c1", dgm=7)
df.bias[273,] <- c(get_data(s7_pw1, stats="mse"), method="pw_c1", dgm=7)
df.bias[274,] <- c(get_data(s7_pw1, stats="modelse"), method="pw_c1", dgm=7)
df.bias[275,] <- c(get_data(s7_pw1, stats="cover"), method="pw_c1", dgm=7)
df.bias[276,] <- c(get_data(s7_pw2, stats="bias"), method="pw_c2", dgm=7)
df.bias[277,] <- c(get_data(s7_pw2, stats="empse"), method="pw_c2", dgm=7)
df.bias[278,] <- c(get_data(s7_pw2, stats="mse"), method="pw_c2", dgm=7)
df.bias[279,] <- c(get_data(s7_pw2, stats="modelse"), method="pw_c2", dgm=7)
df.bias[280,] <- c(get_data(s7_pw2, stats="cover"), method="pw_c2", dgm=7)
df.bias[281,] <- c(get_data(s7_pw3, stats="bias"), method="pw_c3", dgm=7)
df.bias[282,] <- c(get_data(s7_pw3, stats="empse"), method="pw_c3", dgm=7)
df.bias[283,] <- c(get_data(s7_pw3, stats="mse"), method="pw_c3", dgm=7)
df.bias[284,] <- c(get_data(s7_pw3, stats="modelse"), method="pw_c3", dgm=7)
df.bias[285,] <- c(get_data(s7_pw3, stats="cover"), method="pw_c3", dgm=7)

df.bias[286,] <- c(get_data(s8_pw1, stats="bias"), method="pw_c1", dgm=8)
df.bias[287,] <- c(get_data(s8_pw1, stats="empse"), method="pw_c1", dgm=8)
df.bias[288,] <- c(get_data(s8_pw1, stats="mse"), method="pw_c1", dgm=8)
df.bias[289,] <- c(get_data(s8_pw1, stats="modelse"), method="pw_c1", dgm=8)
df.bias[290,] <- c(get_data(s8_pw1, stats="cover"), method="pw_c1", dgm=8)
df.bias[291,] <- c(get_data(s8_pw2, stats="bias"), method="pw_c2", dgm=8)
df.bias[292,] <- c(get_data(s8_pw2, stats="empse"), method="pw_c2", dgm=8)
df.bias[293,] <- c(get_data(s8_pw2, stats="mse"), method="pw_c2", dgm=8)
df.bias[294,] <- c(get_data(s8_pw2, stats="modelse"), method="pw_c2", dgm=8)
df.bias[295,] <- c(get_data(s8_pw2, stats="cover"), method="pw_c2", dgm=8)
df.bias[296,] <- c(get_data(s8_pw3, stats="bias"), method="pw_c3", dgm=8)
df.bias[297,] <- c(get_data(s8_pw3, stats="empse"), method="pw_c3", dgm=8)
df.bias[298,] <- c(get_data(s8_pw3, stats="mse"), method="pw_c3", dgm=8)
df.bias[299,] <- c(get_data(s8_pw3, stats="modelse"), method="pw_c3", dgm=8)
df.bias[300,] <- c(get_data(s8_pw3, stats="cover"), method="pw_c3", dgm=8)

df.bias[301,] <- c(get_data(s5_rplnt1, stats="bias"), method="rplnt1", dgm=5)
df.bias[302,] <- c(get_data(s5_rplnt1, stats="empse"), method="rplnt1", dgm=5)
df.bias[303,] <- c(get_data(s5_rplnt1, stats="mse"), method="rplnt1", dgm=5)
df.bias[304,] <- c(get_data(s5_rplnt1, stats="modelse"), method="rplnt1", dgm=5)
df.bias[305,] <- c(get_data(s5_rplnt1, stats="cover"), method="rplnt1", dgm=5)
df.bias[306,] <- c(get_data(s5_rplnt2, stats="bias"), method="rplnt2", dgm=5)
df.bias[307,] <- c(get_data(s5_rplnt2, stats="empse"), method="rplnt2", dgm=5)
df.bias[308,] <- c(get_data(s5_rplnt2, stats="mse"), method="rplnt2", dgm=5)
df.bias[309,] <- c(get_data(s5_rplnt2, stats="modelse"), method="rplnt2", dgm=5)
df.bias[310,] <- c(get_data(s5_rplnt2, stats="cover"), method="rplnt2", dgm=5)
df.bias[311,] <- c(get_data(s5_rplnt3, stats="bias"), method="rplnt3", dgm=5)
df.bias[312,] <- c(get_data(s5_rplnt3, stats="empse"), method="rplnt3", dgm=5)
df.bias[313,] <- c(get_data(s5_rplnt3, stats="mse"), method="rplnt3", dgm=5)
df.bias[314,] <- c(get_data(s5_rplnt3, stats="modelse"), method="rplnt3", dgm=5)
df.bias[315,] <- c(get_data(s5_rplnt3, stats="cover"), method="rplnt3", dgm=5)
df.bias[316,] <- c(get_data(s5_rplnt4, stats="bias"), method="rplnt4", dgm=5)
df.bias[317,] <- c(get_data(s5_rplnt4, stats="empse"), method="rplnt4", dgm=5)
df.bias[318,] <- c(get_data(s5_rplnt4, stats="mse"), method="rplnt4", dgm=5)
df.bias[319,] <- c(get_data(s5_rplnt4, stats="modelse"), method="rplnt4", dgm=5)
df.bias[320,] <- c(get_data(s5_rplnt4, stats="cover"), method="rplnt4", dgm=5)

df.bias[321,] <- c(get_data(s6_rplnt1, stats="bias"), method="rplnt1", dgm=6)
df.bias[322,] <- c(get_data(s6_rplnt1, stats="empse"), method="rplnt1", dgm=6)
df.bias[323,] <- c(get_data(s6_rplnt1, stats="mse"), method="rplnt1", dgm=6)
df.bias[324,] <- c(get_data(s6_rplnt1, stats="modelse"), method="rplnt1", dgm=6)
df.bias[325,] <- c(get_data(s6_rplnt1, stats="cover"), method="rplnt1", dgm=6)
df.bias[326,] <- c(get_data(s6_rplnt2, stats="bias"), method="rplnt2", dgm=6)
df.bias[327,] <- c(get_data(s6_rplnt2, stats="empse"), method="rplnt2", dgm=6)
df.bias[328,] <- c(get_data(s6_rplnt2, stats="mse"), method="rplnt2", dgm=6)
df.bias[329,] <- c(get_data(s6_rplnt2, stats="modelse"), method="rplnt2", dgm=6)
df.bias[330,] <- c(get_data(s6_rplnt2, stats="cover"), method="rplnt2", dgm=6)
df.bias[331,] <- c(get_data(s6_rplnt3, stats="bias"), method="rplnt3", dgm=6)
df.bias[332,] <- c(get_data(s6_rplnt3, stats="empse"), method="rplnt3", dgm=6)
df.bias[333,] <- c(get_data(s6_rplnt3, stats="mse"), method="rplnt3", dgm=6)
df.bias[334,] <- c(get_data(s6_rplnt3, stats="modelse"), method="rplnt3", dgm=6)
df.bias[335,] <- c(get_data(s6_rplnt3, stats="cover"), method="rplnt3", dgm=6)
df.bias[336,] <- c(get_data(s6_rplnt4, stats="bias"), method="rplnt4", dgm=6)
df.bias[337,] <- c(get_data(s6_rplnt4, stats="empse"), method="rplnt4", dgm=6)
df.bias[338,] <- c(get_data(s6_rplnt4, stats="mse"), method="rplnt4", dgm=6)
df.bias[339,] <- c(get_data(s6_rplnt4, stats="modelse"), method="rplnt4", dgm=6)
df.bias[340,] <- c(get_data(s6_rplnt4, stats="cover"), method="rplnt4", dgm=6)

df.bias[341,] <- c(get_data(s7_rplnt1, stats="bias"), method="rplnt1", dgm=7)
df.bias[342,] <- c(get_data(s7_rplnt1, stats="empse"), method="rplnt1", dgm=7)
df.bias[343,] <- c(get_data(s7_rplnt1, stats="mse"), method="rplnt1", dgm=7)
df.bias[344,] <- c(get_data(s7_rplnt1, stats="modelse"), method="rplnt1", dgm=7)
df.bias[345,] <- c(get_data(s7_rplnt1, stats="cover"), method="rplnt1", dgm=7)
df.bias[346,] <- c(get_data(s7_rplnt2, stats="bias"), method="rplnt2", dgm=7)
df.bias[347,] <- c(get_data(s7_rplnt2, stats="empse"), method="rplnt2", dgm=7)
df.bias[348,] <- c(get_data(s7_rplnt2, stats="mse"), method="rplnt2", dgm=7)
df.bias[349,] <- c(get_data(s7_rplnt2, stats="modelse"), method="rplnt2", dgm=7)
df.bias[350,] <- c(get_data(s7_rplnt2, stats="cover"), method="rplnt2", dgm=7)
df.bias[351,] <- c(get_data(s7_rplnt3, stats="bias"), method="rplnt3", dgm=7)
df.bias[352,] <- c(get_data(s7_rplnt3, stats="empse"), method="rplnt3", dgm=7)
df.bias[353,] <- c(get_data(s7_rplnt3, stats="mse"), method="rplnt3", dgm=7)
df.bias[354,] <- c(get_data(s7_rplnt3, stats="modelse"), method="rplnt3", dgm=7)
df.bias[355,] <- c(get_data(s7_rplnt3, stats="cover"), method="rplnt3", dgm=7)
df.bias[356,] <- c(get_data(s7_rplnt4, stats="bias"), method="rplnt4", dgm=7)
df.bias[357,] <- c(get_data(s7_rplnt4, stats="empse"), method="rplnt4", dgm=7)
df.bias[358,] <- c(get_data(s7_rplnt4, stats="mse"), method="rplnt4", dgm=7)
df.bias[359,] <- c(get_data(s7_rplnt4, stats="modelse"), method="rplnt4", dgm=7)
df.bias[360,] <- c(get_data(s7_rplnt4, stats="cover"), method="rplnt4", dgm=7)

df.bias[361,] <- c(get_data(s8_rplnt1, stats="bias"), method="rplnt1", dgm=8)
df.bias[362,] <- c(get_data(s8_rplnt1, stats="empse"), method="rplnt1", dgm=8)
df.bias[363,] <- c(get_data(s8_rplnt1, stats="mse"), method="rplnt1", dgm=8)
df.bias[364,] <- c(get_data(s8_rplnt1, stats="modelse"), method="rplnt1", dgm=8)
df.bias[365,] <- c(get_data(s8_rplnt1, stats="cover"), method="rplnt1", dgm=8)
df.bias[366,] <- c(get_data(s8_rplnt2, stats="bias"), method="rplnt2", dgm=8)
df.bias[367,] <- c(get_data(s8_rplnt2, stats="empse"), method="rplnt2", dgm=8)
df.bias[368,] <- c(get_data(s8_rplnt2, stats="mse"), method="rplnt2", dgm=8)
df.bias[369,] <- c(get_data(s8_rplnt2, stats="modelse"), method="rplnt2", dgm=8)
df.bias[370,] <- c(get_data(s8_rplnt2, stats="cover"), method="rplnt2", dgm=8)
df.bias[371,] <- c(get_data(s8_rplnt3, stats="bias"), method="rplnt3", dgm=8)
df.bias[372,] <- c(get_data(s8_rplnt3, stats="empse"), method="rplnt3", dgm=8)
df.bias[373,] <- c(get_data(s8_rplnt3, stats="mse"), method="rplnt3", dgm=8)
df.bias[374,] <- c(get_data(s8_rplnt3, stats="modelse"), method="rplnt3", dgm=8)
df.bias[375,] <- c(get_data(s8_rplnt3, stats="cover"), method="rplnt3", dgm=8)
df.bias[376,] <- c(get_data(s8_rplnt4, stats="bias"), method="rplnt4", dgm=8)
df.bias[377,] <- c(get_data(s8_rplnt4, stats="empse"), method="rplnt4", dgm=8)
df.bias[378,] <- c(get_data(s8_rplnt4, stats="mse"), method="rplnt4", dgm=8)
df.bias[379,] <- c(get_data(s8_rplnt4, stats="modelse"), method="rplnt4", dgm=8)
df.bias[380,] <- c(get_data(s8_rplnt4, stats="cover"), method="rplnt4", dgm=8)

df.bias[381,] <- c(get_data(s5_fp_half, stats="bias"), method="FP 0.5", dgm=5)
df.bias[382,] <- c(get_data(s5_fp_half, stats="empse"), method="FP 0.5", dgm=5)
df.bias[383,] <- c(get_data(s5_fp_half, stats="mse"), method="FP 0.5", dgm=5)
df.bias[384,] <- c(get_data(s5_fp_half, stats="modelse"), method="FP 0.5", dgm=5)
df.bias[385,] <- c(get_data(s5_fp_half, stats="cover"), method="FP 0.5", dgm=5)
df.bias[386,] <- c(get_data(s5_fp_neghalf, stats="bias"), method="FP -0.5", dgm=5)
df.bias[387,] <- c(get_data(s5_fp_neghalf, stats="empse"), method="FP -0.5", dgm=5)
df.bias[388,] <- c(get_data(s5_fp_neghalf, stats="mse"), method="FP -0.5", dgm=5)
df.bias[389,] <- c(get_data(s5_fp_neghalf, stats="modelse"), method="FP -0.5", dgm=5)
df.bias[390,] <- c(get_data(s5_fp_neghalf, stats="cover"), method="FP -0.5", dgm=5)
df.bias[391,] <- c(get_data(s5_fp_zero, stats="bias"), method="FP 0", dgm=5)
df.bias[392,] <- c(get_data(s5_fp_zero, stats="empse"), method="FP 0", dgm=5)
df.bias[393,] <- c(get_data(s5_fp_zero, stats="mse"), method="FP 0", dgm=5)
df.bias[394,] <- c(get_data(s5_fp_zero, stats="modelse"), method="FP 0", dgm=5)
df.bias[395,] <- c(get_data(s5_fp_zero, stats="cover"), method="FP 0", dgm=5)
df.bias[396,] <- c(get_data(s5_fp_one, stats="bias"), method="FP 1", dgm=5)
df.bias[397,] <- c(get_data(s5_fp_one, stats="empse"), method="FP 1", dgm=5)
df.bias[398,] <- c(get_data(s5_fp_one, stats="mse"), method="FP 1", dgm=5)
df.bias[399,] <- c(get_data(s5_fp_one, stats="modelse"), method="FP 1", dgm=5)
df.bias[400,] <- c(get_data(s5_fp_one, stats="cover"), method="FP 1", dgm=5)
df.bias[401,] <- c(get_data(s5_fp_two, stats="bias"), method="FP 2", dgm=5)
df.bias[402,] <- c(get_data(s5_fp_two, stats="empse"), method="FP 2", dgm=5)
df.bias[403,] <- c(get_data(s5_fp_two, stats="mse"), method="FP 2", dgm=5)
df.bias[404,] <- c(get_data(s5_fp_two, stats="modelse"), method="FP 2", dgm=5)
df.bias[405,] <- c(get_data(s5_fp_two, stats="cover"), method="FP 2", dgm=5)

df.bias[406,] <- c(get_data(s6_fp_half, stats="bias"), method="FP 0.5", dgm=6)
df.bias[407,] <- c(get_data(s6_fp_half, stats="empse"), method="FP 0.5", dgm=6)
df.bias[408,] <- c(get_data(s6_fp_half, stats="mse"), method="FP 0.5", dgm=6)
df.bias[409,] <- c(get_data(s6_fp_half, stats="modelse"), method="FP 0.5", dgm=6)
df.bias[410,] <- c(get_data(s6_fp_half, stats="cover"), method="FP 0.5", dgm=6)
df.bias[411,] <- c(get_data(s6_fp_neghalf, stats="bias"), method="FP -0.5", dgm=6)
df.bias[412,] <- c(get_data(s6_fp_neghalf, stats="empse"), method="FP -0.5", dgm=6)
df.bias[413,] <- c(get_data(s6_fp_neghalf, stats="mse"), method="FP -0.5", dgm=6)
df.bias[414,] <- c(get_data(s6_fp_neghalf, stats="modelse"), method="FP -0.5", dgm=6)
df.bias[415,] <- c(get_data(s6_fp_neghalf, stats="cover"), method="FP -0.5", dgm=6)
df.bias[416,] <- c(get_data(s6_fp_zero, stats="bias"), method="FP 0", dgm=6)
df.bias[417,] <- c(get_data(s6_fp_zero, stats="empse"), method="FP 0", dgm=6)
df.bias[418,] <- c(get_data(s6_fp_zero, stats="mse"), method="FP 0", dgm=6)
df.bias[419,] <- c(get_data(s6_fp_zero, stats="modelse"), method="FP 0", dgm=6)
df.bias[420,] <- c(get_data(s6_fp_zero, stats="cover"), method="FP 0", dgm=6)
df.bias[421,] <- c(get_data(s6_fp_one, stats="bias"), method="FP 1", dgm=6)
df.bias[422,] <- c(get_data(s6_fp_one, stats="empse"), method="FP 1", dgm=6)
df.bias[423,] <- c(get_data(s6_fp_one, stats="mse"), method="FP 1", dgm=6)
df.bias[424,] <- c(get_data(s6_fp_one, stats="modelse"), method="FP 1", dgm=6)
df.bias[425,] <- c(get_data(s6_fp_one, stats="cover"), method="FP 1", dgm=6)
df.bias[426,] <- c(get_data(s6_fp_two, stats="bias"), method="FP 2", dgm=6)
df.bias[427,] <- c(get_data(s6_fp_two, stats="empse"), method="FP 2", dgm=6)
df.bias[428,] <- c(get_data(s6_fp_two, stats="mse"), method="FP 2", dgm=6)
df.bias[429,] <- c(get_data(s6_fp_two, stats="modelse"), method="FP 2", dgm=6)
df.bias[430,] <- c(get_data(s6_fp_two, stats="cover"), method="FP 2", dgm=6)

df.bias[431,] <- c(get_data(s7_fp_half, stats="bias"), method="FP 0.5", dgm=7)
df.bias[432,] <- c(get_data(s7_fp_half, stats="empse"), method="FP 0.5", dgm=7)
df.bias[433,] <- c(get_data(s7_fp_half, stats="mse"), method="FP 0.5", dgm=7)
df.bias[434,] <- c(get_data(s7_fp_half, stats="modelse"), method="FP 0.5", dgm=7)
df.bias[435,] <- c(get_data(s7_fp_half, stats="cover"), method="FP 0.5", dgm=7)
df.bias[436,] <- c(get_data(s7_fp_neghalf, stats="bias"), method="FP -0.5", dgm=7)
df.bias[437,] <- c(get_data(s7_fp_neghalf, stats="empse"), method="FP -0.5", dgm=7)
df.bias[438,] <- c(get_data(s7_fp_neghalf, stats="mse"), method="FP -0.5", dgm=7)
df.bias[439,] <- c(get_data(s7_fp_neghalf, stats="modelse"), method="FP -0.5", dgm=7)
df.bias[440,] <- c(get_data(s7_fp_neghalf, stats="cover"), method="FP -0.5", dgm=7)
df.bias[441,] <- c(get_data(s7_fp_zero, stats="bias"), method="FP 0", dgm=7)
df.bias[442,] <- c(get_data(s7_fp_zero, stats="empse"), method="FP 0", dgm=7)
df.bias[443,] <- c(get_data(s7_fp_zero, stats="mse"), method="FP 0", dgm=7)
df.bias[444,] <- c(get_data(s7_fp_zero, stats="modelse"), method="FP 0", dgm=7)
df.bias[445,] <- c(get_data(s7_fp_zero, stats="cover"), method="FP 0", dgm=7)
df.bias[446,] <- c(get_data(s7_fp_one, stats="bias"), method="FP 1", dgm=7)
df.bias[447,] <- c(get_data(s7_fp_one, stats="empse"), method="FP 1", dgm=7)
df.bias[448,] <- c(get_data(s7_fp_one, stats="mse"), method="FP 1", dgm=7)
df.bias[449,] <- c(get_data(s7_fp_one, stats="modelse"), method="FP 1", dgm=7)
df.bias[450,] <- c(get_data(s7_fp_one, stats="cover"), method="FP 1", dgm=7)
df.bias[451,] <- c(get_data(s7_fp_two, stats="bias"), method="FP 2", dgm=7)
df.bias[452,] <- c(get_data(s7_fp_two, stats="empse"), method="FP 2", dgm=7)
df.bias[453,] <- c(get_data(s7_fp_two, stats="mse"), method="FP 2", dgm=7)
df.bias[454,] <- c(get_data(s7_fp_two, stats="modelse"), method="FP 2", dgm=7)
df.bias[455,] <- c(get_data(s7_fp_two, stats="cover"), method="FP 2", dgm=7)

df.bias[456,] <- c(get_data(s8_fp_half, stats="bias"), method="FP 0.5", dgm=8)
df.bias[457,] <- c(get_data(s8_fp_half, stats="empse"), method="FP 0.5", dgm=8)
df.bias[458,] <- c(get_data(s8_fp_half, stats="mse"), method="FP 0.5", dgm=8)
df.bias[459,] <- c(get_data(s8_fp_half, stats="modelse"), method="FP 0.5", dgm=8)
df.bias[460,] <- c(get_data(s8_fp_half, stats="cover"), method="FP 0.5", dgm=8)
df.bias[461,] <- c(get_data(s8_fp_neghalf, stats="bias"), method="FP -0.5", dgm=8)
df.bias[462,] <- c(get_data(s8_fp_neghalf, stats="empse"), method="FP -0.5", dgm=8)
df.bias[463,] <- c(get_data(s8_fp_neghalf, stats="mse"), method="FP -0.5", dgm=8)
df.bias[464,] <- c(get_data(s8_fp_neghalf, stats="modelse"), method="FP -0.5", dgm=8)
df.bias[465,] <- c(get_data(s8_fp_neghalf, stats="cover"), method="FP -0.5", dgm=8)
df.bias[466,] <- c(get_data(s8_fp_zero, stats="bias"), method="FP 0", dgm=8)
df.bias[467,] <- c(get_data(s8_fp_zero, stats="empse"), method="FP 0", dgm=8)
df.bias[468,] <- c(get_data(s8_fp_zero, stats="mse"), method="FP 0", dgm=8)
df.bias[469,] <- c(get_data(s8_fp_zero, stats="modelse"), method="FP 0", dgm=8)
df.bias[470,] <- c(get_data(s8_fp_zero, stats="cover"), method="FP 0", dgm=8)
df.bias[471,] <- c(get_data(s8_fp_one, stats="bias"), method="FP 1", dgm=8)
df.bias[472,] <- c(get_data(s8_fp_one, stats="empse"), method="FP 1", dgm=8)
df.bias[473,] <- c(get_data(s8_fp_one, stats="mse"), method="FP 1", dgm=8)
df.bias[474,] <- c(get_data(s8_fp_one, stats="modelse"), method="FP 1", dgm=8)
df.bias[475,] <- c(get_data(s8_fp_one, stats="cover"), method="FP 1", dgm=8)
df.bias[476,] <- c(get_data(s8_fp_two, stats="bias"), method="FP 2", dgm=8)
df.bias[477,] <- c(get_data(s8_fp_two, stats="empse"), method="FP 2", dgm=8)
df.bias[478,] <- c(get_data(s8_fp_two, stats="mse"), method="FP 2", dgm=8)
df.bias[479,] <- c(get_data(s8_fp_two, stats="modelse"), method="FP 2", dgm=8)
df.bias[480,] <- c(get_data(s8_fp_two, stats="cover"), method="FP 2", dgm=8)

df.bias[481,] <- c(get_data(s1_fp_negone, stats="bias"), method="FP -1", dgm=1)
df.bias[482,] <- c(get_data(s1_fp_negone, stats="empse"), method="FP -1", dgm=1)
df.bias[483,] <- c(get_data(s1_fp_negone, stats="mse"), method="FP -1", dgm=1)
df.bias[484,] <- c(get_data(s1_fp_negone, stats="modelse"), method="FP -1", dgm=1)
df.bias[485,] <- c(get_data(s1_fp_negone, stats="cover"), method="FP -1", dgm=1)
df.bias[486,] <- c(get_data(s1_fp_negtwo, stats="bias"), method="FP -2", dgm=1)
df.bias[487,] <- c(get_data(s1_fp_negtwo, stats="empse"), method="FP -2", dgm=1)
df.bias[488,] <- c(get_data(s1_fp_negtwo, stats="mse"), method="FP -2", dgm=1)
df.bias[489,] <- c(get_data(s1_fp_negtwo, stats="modelse"), method="FP -2", dgm=1)
df.bias[490,] <- c(get_data(s1_fp_negtwo, stats="cover"), method="FP -2", dgm=1)
df.bias[491,] <- c(get_data(s1_fp_three, stats="bias"), method="FP 3", dgm=1)
df.bias[492,] <- c(get_data(s1_fp_three, stats="empse"), method="FP 3", dgm=1)
df.bias[493,] <- c(get_data(s1_fp_three, stats="mse"), method="FP 3", dgm=1)
df.bias[494,] <- c(get_data(s1_fp_three, stats="modelse"), method="FP 3", dgm=1)
df.bias[495,] <- c(get_data(s1_fp_three, stats="cover"), method="FP 3", dgm=1)

df.bias[496,] <- c(get_data(s2_fp_negone, stats="bias"), method="FP -1", dgm=2)
df.bias[497,] <- c(get_data(s2_fp_negone, stats="empse"), method="FP -1", dgm=2)
df.bias[498,] <- c(get_data(s2_fp_negone, stats="mse"), method="FP -1", dgm=2)
df.bias[499,] <- c(get_data(s2_fp_negone, stats="modelse"), method="FP -1", dgm=2)
df.bias[500,] <- c(get_data(s2_fp_negone, stats="cover"), method="FP -1", dgm=2)
df.bias[501,] <- c(get_data(s2_fp_negtwo, stats="bias"), method="FP -2", dgm=2)
df.bias[502,] <- c(get_data(s2_fp_negtwo, stats="empse"), method="FP -2", dgm=2)
df.bias[503,] <- c(get_data(s2_fp_negtwo, stats="mse"), method="FP -2", dgm=2)
df.bias[504,] <- c(get_data(s2_fp_negtwo, stats="modelse"), method="FP -2", dgm=2)
df.bias[505,] <- c(get_data(s2_fp_negtwo, stats="cover"), method="FP -2", dgm=2)
df.bias[506,] <- c(get_data(s2_fp_three, stats="bias"), method="FP 3", dgm=2)
df.bias[507,] <- c(get_data(s2_fp_three, stats="empse"), method="FP 3", dgm=2)
df.bias[508,] <- c(get_data(s2_fp_three, stats="mse"), method="FP 3", dgm=2)
df.bias[509,] <- c(get_data(s2_fp_three, stats="modelse"), method="FP 3", dgm=2)
df.bias[510,] <- c(get_data(s2_fp_three, stats="cover"), method="FP 3", dgm=2)

df.bias[511,] <- c(get_data(s3_fp_negone, stats="bias"), method="FP -1", dgm=3)
df.bias[512,] <- c(get_data(s3_fp_negone, stats="empse"), method="FP -1", dgm=3)
df.bias[513,] <- c(get_data(s3_fp_negone, stats="mse"), method="FP -1", dgm=3)
df.bias[514,] <- c(get_data(s3_fp_negone, stats="modelse"), method="FP -1", dgm=3)
df.bias[515,] <- c(get_data(s3_fp_negone, stats="cover"), method="FP -1", dgm=3)
df.bias[516,] <- c(get_data(s3_fp_negtwo, stats="bias"), method="FP -2", dgm=3)
df.bias[517,] <- c(get_data(s3_fp_negtwo, stats="empse"), method="FP -2", dgm=3)
df.bias[518,] <- c(get_data(s3_fp_negtwo, stats="mse"), method="FP -2", dgm=3)
df.bias[519,] <- c(get_data(s3_fp_negtwo, stats="modelse"), method="FP -2", dgm=3)
df.bias[520,] <- c(get_data(s3_fp_negtwo, stats="cover"), method="FP -2", dgm=3)
df.bias[521,] <- c(get_data(s3_fp_three, stats="bias"), method="FP 3", dgm=3)
df.bias[522,] <- c(get_data(s3_fp_three, stats="empse"), method="FP 3", dgm=3)
df.bias[523,] <- c(get_data(s3_fp_three, stats="mse"), method="FP 3", dgm=3)
df.bias[524,] <- c(get_data(s3_fp_three, stats="modelse"), method="FP 3", dgm=3)
df.bias[525,] <- c(get_data(s3_fp_three, stats="cover"), method="FP 3", dgm=3)

df.bias[526,] <- c(get_data(s4_fp_negone, stats="bias"), method="FP -1", dgm=4)
df.bias[527,] <- c(get_data(s4_fp_negone, stats="empse"), method="FP -1", dgm=4)
df.bias[528,] <- c(get_data(s4_fp_negone, stats="mse"), method="FP -1", dgm=4)
df.bias[529,] <- c(get_data(s4_fp_negone, stats="modelse"), method="FP -1", dgm=4)
df.bias[530,] <- c(get_data(s4_fp_negone, stats="cover"), method="FP -1", dgm=4)
df.bias[531,] <- c(get_data(s4_fp_negtwo, stats="bias"), method="FP -2", dgm=4)
df.bias[532,] <- c(get_data(s4_fp_negtwo, stats="empse"), method="FP -2", dgm=4)
df.bias[533,] <- c(get_data(s4_fp_negtwo, stats="mse"), method="FP -2", dgm=4)
df.bias[534,] <- c(get_data(s4_fp_negtwo, stats="modelse"), method="FP -2", dgm=4)
df.bias[535,] <- c(get_data(s4_fp_negtwo, stats="cover"), method="FP -2", dgm=4)
df.bias[536,] <- c(get_data(s4_fp_three, stats="bias"), method="FP 3", dgm=4)
df.bias[537,] <- c(get_data(s4_fp_three, stats="empse"), method="FP 3", dgm=4)
df.bias[538,] <- c(get_data(s4_fp_three, stats="mse"), method="FP 3", dgm=4)
df.bias[539,] <- c(get_data(s4_fp_three, stats="modelse"), method="FP 3", dgm=4)
df.bias[540,] <- c(get_data(s4_fp_three, stats="cover"), method="FP 3", dgm=4)

df.bias[541,] <- c(get_data(s5_fp_negone, stats="bias"), method="FP -1", dgm=5)
df.bias[542,] <- c(get_data(s5_fp_negone, stats="empse"), method="FP -1", dgm=5)
df.bias[543,] <- c(get_data(s5_fp_negone, stats="mse"), method="FP -1", dgm=5)
df.bias[544,] <- c(get_data(s5_fp_negone, stats="modelse"), method="FP -1", dgm=5)
df.bias[545,] <- c(get_data(s5_fp_negone, stats="cover"), method="FP -1", dgm=5)
df.bias[546,] <- c(get_data(s5_fp_negtwo, stats="bias"), method="FP -2", dgm=5)
df.bias[547,] <- c(get_data(s5_fp_negtwo, stats="empse"), method="FP -2", dgm=5)
df.bias[548,] <- c(get_data(s5_fp_negtwo, stats="mse"), method="FP -2", dgm=5)
df.bias[549,] <- c(get_data(s5_fp_negtwo, stats="modelse"), method="FP -2", dgm=5)
df.bias[550,] <- c(get_data(s5_fp_negtwo, stats="cover"), method="FP -2", dgm=5)
df.bias[551,] <- c(get_data(s5_fp_three, stats="bias"), method="FP 3", dgm=5)
df.bias[552,] <- c(get_data(s5_fp_three, stats="empse"), method="FP 3", dgm=5)
df.bias[553,] <- c(get_data(s5_fp_three, stats="mse"), method="FP 3", dgm=5)
df.bias[554,] <- c(get_data(s5_fp_three, stats="modelse"), method="FP 3", dgm=5)
df.bias[555,] <- c(get_data(s5_fp_three, stats="cover"), method="FP 3", dgm=5)

df.bias[556,] <- c(get_data(s6_fp_negone, stats="bias"), method="FP -1", dgm=6)
df.bias[557,] <- c(get_data(s6_fp_negone, stats="empse"), method="FP -1", dgm=6)
df.bias[558,] <- c(get_data(s6_fp_negone, stats="mse"), method="FP -1", dgm=6)
df.bias[559,] <- c(get_data(s6_fp_negone, stats="modelse"), method="FP -1", dgm=6)
df.bias[560,] <- c(get_data(s6_fp_negone, stats="cover"), method="FP -1", dgm=6)
df.bias[561,] <- c(get_data(s6_fp_negtwo, stats="bias"), method="FP -2", dgm=6)
df.bias[562,] <- c(get_data(s6_fp_negtwo, stats="empse"), method="FP -2", dgm=6)
df.bias[563,] <- c(get_data(s6_fp_negtwo, stats="mse"), method="FP -2", dgm=6)
df.bias[564,] <- c(get_data(s6_fp_negtwo, stats="modelse"), method="FP -2", dgm=6)
df.bias[565,] <- c(get_data(s6_fp_negtwo, stats="cover"), method="FP -2", dgm=6)
df.bias[566,] <- c(get_data(s6_fp_three, stats="bias"), method="FP 3", dgm=6)
df.bias[567,] <- c(get_data(s6_fp_three, stats="empse"), method="FP 3", dgm=6)
df.bias[568,] <- c(get_data(s6_fp_three, stats="mse"), method="FP 3", dgm=6)
df.bias[569,] <- c(get_data(s6_fp_three, stats="modelse"), method="FP 3", dgm=6)
df.bias[570,] <- c(get_data(s6_fp_three, stats="cover"), method="FP 3", dgm=6)

df.bias[571,] <- c(get_data(s7_fp_negone, stats="bias"), method="FP -1", dgm=7)
df.bias[572,] <- c(get_data(s7_fp_negone, stats="empse"), method="FP -1", dgm=7)
df.bias[573,] <- c(get_data(s7_fp_negone, stats="mse"), method="FP -1", dgm=7)
df.bias[574,] <- c(get_data(s7_fp_negone, stats="modelse"), method="FP -1", dgm=7)
df.bias[575,] <- c(get_data(s7_fp_negone, stats="cover"), method="FP -1", dgm=7)
df.bias[576,] <- c(get_data(s7_fp_negtwo, stats="bias"), method="FP -2", dgm=7)
df.bias[577,] <- c(get_data(s7_fp_negtwo, stats="empse"), method="FP -2", dgm=7)
df.bias[578,] <- c(get_data(s7_fp_negtwo, stats="mse"), method="FP -2", dgm=7)
df.bias[579,] <- c(get_data(s7_fp_negtwo, stats="modelse"), method="FP -2", dgm=7)
df.bias[580,] <- c(get_data(s7_fp_negtwo, stats="cover"), method="FP -2", dgm=7)
df.bias[581,] <- c(get_data(s7_fp_three, stats="bias"), method="FP 3", dgm=7)
df.bias[582,] <- c(get_data(s7_fp_three, stats="empse"), method="FP 3", dgm=7)
df.bias[583,] <- c(get_data(s7_fp_three, stats="mse"), method="FP 3", dgm=7)
df.bias[584,] <- c(get_data(s7_fp_three, stats="modelse"), method="FP 3", dgm=7)
df.bias[585,] <- c(get_data(s7_fp_three, stats="cover"), method="FP 3", dgm=7)

df.bias[586,] <- c(get_data(s8_fp_negone, stats="bias"), method="FP -1", dgm=8)
df.bias[587,] <- c(get_data(s8_fp_negone, stats="empse"), method="FP -1", dgm=8)
df.bias[588,] <- c(get_data(s8_fp_negone, stats="mse"), method="FP -1", dgm=8)
df.bias[589,] <- c(get_data(s8_fp_negone, stats="modelse"), method="FP -1", dgm=8)
df.bias[590,] <- c(get_data(s8_fp_negone, stats="cover"), method="FP -1", dgm=8)
df.bias[591,] <- c(get_data(s8_fp_negtwo, stats="bias"), method="FP -2", dgm=8)
df.bias[592,] <- c(get_data(s8_fp_negtwo, stats="empse"), method="FP -2", dgm=8)
df.bias[593,] <- c(get_data(s8_fp_negtwo, stats="mse"), method="FP -2", dgm=8)
df.bias[594,] <- c(get_data(s8_fp_negtwo, stats="modelse"), method="FP -2", dgm=8)
df.bias[595,] <- c(get_data(s8_fp_negtwo, stats="cover"), method="FP -2", dgm=8)
df.bias[596,] <- c(get_data(s8_fp_three, stats="bias"), method="FP 3", dgm=8)
df.bias[597,] <- c(get_data(s8_fp_three, stats="empse"), method="FP 3", dgm=8)
df.bias[598,] <- c(get_data(s8_fp_three, stats="mse"), method="FP 3", dgm=8)
df.bias[599,] <- c(get_data(s8_fp_three, stats="modelse"), method="FP 3", dgm=8)
df.bias[600,] <- c(get_data(s8_fp_three, stats="cover"), method="FP 3", dgm=8)


df.bias[601,] <- c(get_data(s9_pw1, stats="bias"), method="pw_c1", dgm=9)
df.bias[602,] <- c(get_data(s9_pw1, stats="empse"), method="pw_c1", dgm=9)
df.bias[603,] <- c(get_data(s9_pw1, stats="mse"), method="pw_c1", dgm=9)
df.bias[604,] <- c(get_data(s9_pw1, stats="modelse"), method="pw_c1", dgm=9)
df.bias[605,] <- c(get_data(s9_pw1, stats="cover"), method="pw_c1", dgm=9)
df.bias[606,] <- c(get_data(s9_pw2, stats="bias"), method="pw_c2", dgm=9)
df.bias[607,] <- c(get_data(s9_pw2, stats="empse"), method="pw_c2", dgm=9)
df.bias[608,] <- c(get_data(s9_pw2, stats="mse"), method="pw_c2", dgm=9)
df.bias[609,] <- c(get_data(s9_pw2, stats="modelse"), method="pw_c2", dgm=9)
df.bias[610,] <- c(get_data(s9_pw2, stats="cover"), method="pw_c2", dgm=9)
df.bias[611,] <- c(get_data(s9_pw3, stats="bias"), method="pw_c3", dgm=9)
df.bias[612,] <- c(get_data(s9_pw3, stats="empse"), method="pw_c3", dgm=9)
df.bias[613,] <- c(get_data(s9_pw3, stats="mse"), method="pw_c3", dgm=9)
df.bias[614,] <- c(get_data(s9_pw3, stats="modelse"), method="pw_c3", dgm=9)
df.bias[615,] <- c(get_data(s9_pw3, stats="cover"), method="pw_c3", dgm=9)

df.bias[616,] <- c(get_data(s10_pw1, stats="bias"), method="pw_c1", dgm=10)
df.bias[617,] <- c(get_data(s10_pw1, stats="empse"), method="pw_c1", dgm=10)
df.bias[618,] <- c(get_data(s10_pw1, stats="mse"), method="pw_c1", dgm=10)
df.bias[619,] <- c(get_data(s10_pw1, stats="modelse"), method="pw_c1", dgm=10)
df.bias[620,] <- c(get_data(s10_pw1, stats="cover"), method="pw_c1", dgm=10)
df.bias[621,] <- c(get_data(s10_pw2, stats="bias"), method="pw_c2", dgm=10)
df.bias[622,] <- c(get_data(s10_pw2, stats="empse"), method="pw_c2", dgm=10)
df.bias[623,] <- c(get_data(s10_pw2, stats="mse"), method="pw_c2", dgm=10)
df.bias[624,] <- c(get_data(s10_pw2, stats="modelse"), method="pw_c2", dgm=10)
df.bias[625,] <- c(get_data(s10_pw2, stats="cover"), method="pw_c2", dgm=10)
df.bias[626,] <- c(get_data(s10_pw3, stats="bias"), method="pw_c3", dgm=10)
df.bias[627,] <- c(get_data(s10_pw3, stats="empse"), method="pw_c3", dgm=10)
df.bias[628,] <- c(get_data(s10_pw3, stats="mse"), method="pw_c3", dgm=10)
df.bias[629,] <- c(get_data(s10_pw3, stats="modelse"), method="pw_c3", dgm=10)
df.bias[630,] <- c(get_data(s10_pw3, stats="cover"), method="pw_c3", dgm=10)

df.bias[631,] <- c(get_data(s11_pw1, stats="bias"), method="pw_c1", dgm=11)
df.bias[632,] <- c(get_data(s11_pw1, stats="empse"), method="pw_c1", dgm=11)
df.bias[633,] <- c(get_data(s11_pw1, stats="mse"), method="pw_c1", dgm=11)
df.bias[634,] <- c(get_data(s11_pw1, stats="modelse"), method="pw_c1", dgm=11)
df.bias[635,] <- c(get_data(s11_pw1, stats="cover"), method="pw_c1", dgm=11)
df.bias[636,] <- c(get_data(s11_pw2, stats="bias"), method="pw_c2", dgm=11)
df.bias[637,] <- c(get_data(s11_pw2, stats="empse"), method="pw_c2", dgm=11)
df.bias[638,] <- c(get_data(s11_pw2, stats="mse"), method="pw_c2", dgm=11)
df.bias[639,] <- c(get_data(s11_pw2, stats="modelse"), method="pw_c2", dgm=11)
df.bias[640,] <- c(get_data(s11_pw2, stats="cover"), method="pw_c2", dgm=11)
df.bias[641,] <- c(get_data(s11_pw3, stats="bias"), method="pw_c3", dgm=11)
df.bias[642,] <- c(get_data(s11_pw3, stats="empse"), method="pw_c3", dgm=11)
df.bias[643,] <- c(get_data(s11_pw3, stats="mse"), method="pw_c3", dgm=11)
df.bias[644,] <- c(get_data(s11_pw3, stats="modelse"), method="pw_c3", dgm=11)
df.bias[645,] <- c(get_data(s11_pw3, stats="cover"), method="pw_c3", dgm=11)

##### Note: In this next block for some reason I skip from 655 to 666
##### this results in some lines of NA in the resulting spreadsheet of results

df.bias[646,] <- c(get_data(s12_pw1, stats="bias"), method="pw_c1", dgm=12)
df.bias[647,] <- c(get_data(s12_pw1, stats="empse"), method="pw_c1", dgm=12)
df.bias[648,] <- c(get_data(s12_pw1, stats="mse"), method="pw_c1", dgm=12)
df.bias[649,] <- c(get_data(s12_pw1, stats="modelse"), method="pw_c1", dgm=12)
df.bias[650,] <- c(get_data(s12_pw1, stats="cover"), method="pw_c1", dgm=12)
df.bias[651,] <- c(get_data(s12_pw2, stats="bias"), method="pw_c2", dgm=12)
df.bias[652,] <- c(get_data(s12_pw2, stats="empse"), method="pw_c2", dgm=12)
df.bias[653,] <- c(get_data(s12_pw2, stats="mse"), method="pw_c2", dgm=12)
df.bias[654,] <- c(get_data(s12_pw2, stats="modelse"), method="pw_c2", dgm=12)
df.bias[655,] <- c(get_data(s12_pw2, stats="cover"), method="pw_c2", dgm=12)
df.bias[666,] <- c(get_data(s12_pw3, stats="bias"), method="pw_c3", dgm=12)
df.bias[667,] <- c(get_data(s12_pw3, stats="empse"), method="pw_c3", dgm=12)
df.bias[668,] <- c(get_data(s12_pw3, stats="mse"), method="pw_c3", dgm=12)
df.bias[669,] <- c(get_data(s12_pw3, stats="modelse"), method="pw_c3", dgm=12)
df.bias[670,] <- c(get_data(s12_pw3, stats="cover"), method="pw_c3", dgm=12)

df.bias[671,] <- c(get_data(s9_rplnt1, stats="bias"), method="rplnt1", dgm=9)
df.bias[672,] <- c(get_data(s9_rplnt1, stats="empse"), method="rplnt1", dgm=9)
df.bias[673,] <- c(get_data(s9_rplnt1, stats="mse"), method="rplnt1", dgm=9)
df.bias[674,] <- c(get_data(s9_rplnt1, stats="modelse"), method="rplnt1", dgm=9)
df.bias[675,] <- c(get_data(s9_rplnt1, stats="cover"), method="rplnt1", dgm=9)
df.bias[676,] <- c(get_data(s9_rplnt2, stats="bias"), method="rplnt2", dgm=9)
df.bias[677,] <- c(get_data(s9_rplnt2, stats="empse"), method="rplnt2", dgm=9)
df.bias[678,] <- c(get_data(s9_rplnt2, stats="mse"), method="rplnt2", dgm=9)
df.bias[679,] <- c(get_data(s9_rplnt2, stats="modelse"), method="rplnt2", dgm=9)
df.bias[680,] <- c(get_data(s9_rplnt2, stats="cover"), method="rplnt2", dgm=9)
df.bias[681,] <- c(get_data(s9_rplnt3, stats="bias"), method="rplnt3", dgm=9)
df.bias[682,] <- c(get_data(s9_rplnt3, stats="empse"), method="rplnt3", dgm=9)
df.bias[683,] <- c(get_data(s9_rplnt3, stats="mse"), method="rplnt3", dgm=9)
df.bias[684,] <- c(get_data(s9_rplnt3, stats="modelse"), method="rplnt3", dgm=9)
df.bias[685,] <- c(get_data(s9_rplnt3, stats="cover"), method="rplnt3", dgm=9)
df.bias[686,] <- c(get_data(s9_rplnt4, stats="bias"), method="rplnt4", dgm=9)
df.bias[687,] <- c(get_data(s9_rplnt4, stats="empse"), method="rplnt4", dgm=9)
df.bias[688,] <- c(get_data(s9_rplnt4, stats="mse"), method="rplnt4", dgm=9)
df.bias[689,] <- c(get_data(s9_rplnt4, stats="modelse"), method="rplnt4", dgm=9)
df.bias[690,] <- c(get_data(s9_rplnt4, stats="cover"), method="rplnt4", dgm=9)

df.bias[691,] <- c(get_data(s10_rplnt1, stats="bias"), method="rplnt1", dgm=10)
df.bias[692,] <- c(get_data(s10_rplnt1, stats="empse"), method="rplnt1", dgm=10)
df.bias[693,] <- c(get_data(s10_rplnt1, stats="mse"), method="rplnt1", dgm=10)
df.bias[694,] <- c(get_data(s10_rplnt1, stats="modelse"), method="rplnt1", dgm=10)
df.bias[695,] <- c(get_data(s10_rplnt1, stats="cover"), method="rplnt1", dgm=10)
df.bias[696,] <- c(get_data(s10_rplnt2, stats="bias"), method="rplnt2", dgm=10)
df.bias[697,] <- c(get_data(s10_rplnt2, stats="empse"), method="rplnt2", dgm=10)
df.bias[698,] <- c(get_data(s10_rplnt2, stats="mse"), method="rplnt2", dgm=10)
df.bias[699,] <- c(get_data(s10_rplnt2, stats="modelse"), method="rplnt2", dgm=10)
df.bias[700,] <- c(get_data(s10_rplnt2, stats="cover"), method="rplnt2", dgm=10)
df.bias[701,] <- c(get_data(s10_rplnt3, stats="bias"), method="rplnt3", dgm=10)
df.bias[702,] <- c(get_data(s10_rplnt3, stats="empse"), method="rplnt3", dgm=10)
df.bias[703,] <- c(get_data(s10_rplnt3, stats="mse"), method="rplnt3", dgm=10)
df.bias[704,] <- c(get_data(s10_rplnt3, stats="modelse"), method="rplnt3", dgm=10)
df.bias[705,] <- c(get_data(s10_rplnt3, stats="cover"), method="rplnt3", dgm=10)
df.bias[706,] <- c(get_data(s10_rplnt4, stats="bias"), method="rplnt4", dgm=10)
df.bias[707,] <- c(get_data(s10_rplnt4, stats="empse"), method="rplnt4", dgm=10)
df.bias[708,] <- c(get_data(s10_rplnt4, stats="mse"), method="rplnt4", dgm=10)
df.bias[709,] <- c(get_data(s10_rplnt4, stats="modelse"), method="rplnt4", dgm=10)
df.bias[710,] <- c(get_data(s10_rplnt4, stats="cover"), method="rplnt4", dgm=10)

df.bias[711,] <- c(get_data(s11_rplnt1, stats="bias"), method="rplnt1", dgm=11)
df.bias[712,] <- c(get_data(s11_rplnt1, stats="empse"), method="rplnt1", dgm=11)
df.bias[713,] <- c(get_data(s11_rplnt1, stats="mse"), method="rplnt1", dgm=11)
df.bias[714,] <- c(get_data(s11_rplnt1, stats="modelse"), method="rplnt1", dgm=11)
df.bias[715,] <- c(get_data(s11_rplnt1, stats="cover"), method="rplnt1", dgm=11)
df.bias[716,] <- c(get_data(s11_rplnt2, stats="bias"), method="rplnt2", dgm=11)
df.bias[717,] <- c(get_data(s11_rplnt2, stats="empse"), method="rplnt2", dgm=11)
df.bias[718,] <- c(get_data(s11_rplnt2, stats="mse"), method="rplnt2", dgm=11)
df.bias[719,] <- c(get_data(s11_rplnt2, stats="modelse"), method="rplnt2", dgm=11)
df.bias[720,] <- c(get_data(s11_rplnt2, stats="cover"), method="rplnt2", dgm=11)
df.bias[721,] <- c(get_data(s11_rplnt3, stats="bias"), method="rplnt3", dgm=11)
df.bias[722,] <- c(get_data(s11_rplnt3, stats="empse"), method="rplnt3", dgm=11)
df.bias[723,] <- c(get_data(s11_rplnt3, stats="mse"), method="rplnt3", dgm=11)
df.bias[724,] <- c(get_data(s11_rplnt3, stats="modelse"), method="rplnt3", dgm=11)
df.bias[725,] <- c(get_data(s11_rplnt3, stats="cover"), method="rplnt3", dgm=11)
df.bias[726,] <- c(get_data(s11_rplnt4, stats="bias"), method="rplnt4", dgm=11)
df.bias[727,] <- c(get_data(s11_rplnt4, stats="empse"), method="rplnt4", dgm=11)
df.bias[728,] <- c(get_data(s11_rplnt4, stats="mse"), method="rplnt4", dgm=11)
df.bias[729,] <- c(get_data(s11_rplnt4, stats="modelse"), method="rplnt4", dgm=11)
df.bias[730,] <- c(get_data(s11_rplnt4, stats="cover"), method="rplnt4", dgm=11)

df.bias[731,] <- c(get_data(s12_rplnt1, stats="bias"), method="rplnt1", dgm=12)
df.bias[732,] <- c(get_data(s12_rplnt1, stats="empse"), method="rplnt1", dgm=12)
df.bias[733,] <- c(get_data(s12_rplnt1, stats="mse"), method="rplnt1", dgm=12)
df.bias[734,] <- c(get_data(s12_rplnt1, stats="modelse"), method="rplnt1", dgm=12)
df.bias[735,] <- c(get_data(s12_rplnt1, stats="cover"), method="rplnt1", dgm=12)
df.bias[736,] <- c(get_data(s12_rplnt2, stats="bias"), method="rplnt2", dgm=12)
df.bias[737,] <- c(get_data(s12_rplnt2, stats="empse"), method="rplnt2", dgm=12)
df.bias[738,] <- c(get_data(s12_rplnt2, stats="mse"), method="rplnt2", dgm=12)
df.bias[739,] <- c(get_data(s12_rplnt2, stats="modelse"), method="rplnt2", dgm=12)
df.bias[740,] <- c(get_data(s12_rplnt2, stats="cover"), method="rplnt2", dgm=12)
df.bias[741,] <- c(get_data(s12_rplnt3, stats="bias"), method="rplnt3", dgm=12)
df.bias[742,] <- c(get_data(s12_rplnt3, stats="empse"), method="rplnt3", dgm=12)
df.bias[743,] <- c(get_data(s12_rplnt3, stats="mse"), method="rplnt3", dgm=12)
df.bias[744,] <- c(get_data(s12_rplnt3, stats="modelse"), method="rplnt3", dgm=12)
df.bias[745,] <- c(get_data(s12_rplnt3, stats="cover"), method="rplnt3", dgm=12)
df.bias[746,] <- c(get_data(s12_rplnt4, stats="bias"), method="rplnt4", dgm=12)
df.bias[747,] <- c(get_data(s12_rplnt4, stats="empse"), method="rplnt4", dgm=12)
df.bias[748,] <- c(get_data(s12_rplnt4, stats="mse"), method="rplnt4", dgm=12)
df.bias[749,] <- c(get_data(s12_rplnt4, stats="modelse"), method="rplnt4", dgm=12)
df.bias[750,] <- c(get_data(s12_rplnt4, stats="cover"), method="rplnt4", dgm=12)

df.bias[751,] <- c(get_data(s9_fp_half, stats="bias"), method="FP 0.5", dgm=9)
df.bias[752,] <- c(get_data(s9_fp_half, stats="empse"), method="FP 0.5", dgm=9)
df.bias[753,] <- c(get_data(s9_fp_half, stats="mse"), method="FP 0.5", dgm=9)
df.bias[754,] <- c(get_data(s9_fp_half, stats="modelse"), method="FP 0.5", dgm=9)
df.bias[755,] <- c(get_data(s9_fp_half, stats="cover"), method="FP 0.5", dgm=9)
df.bias[756,] <- c(get_data(s9_fp_neghalf, stats="bias"), method="FP -0.5", dgm=9)
df.bias[757,] <- c(get_data(s9_fp_neghalf, stats="empse"), method="FP -0.5", dgm=9)
df.bias[758,] <- c(get_data(s9_fp_neghalf, stats="mse"), method="FP -0.5", dgm=9)
df.bias[759,] <- c(get_data(s9_fp_neghalf, stats="modelse"), method="FP -0.5", dgm=9)
df.bias[760,] <- c(get_data(s9_fp_neghalf, stats="cover"), method="FP -0.5", dgm=9)
df.bias[761,] <- c(get_data(s9_fp_zero, stats="bias"), method="FP 0", dgm=9)
df.bias[762,] <- c(get_data(s9_fp_zero, stats="empse"), method="FP 0", dgm=9)
df.bias[763,] <- c(get_data(s9_fp_zero, stats="mse"), method="FP 0", dgm=9)
df.bias[764,] <- c(get_data(s9_fp_zero, stats="modelse"), method="FP 0", dgm=9)
df.bias[765,] <- c(get_data(s9_fp_zero, stats="cover"), method="FP 0", dgm=9)
df.bias[766,] <- c(get_data(s9_fp_one, stats="bias"), method="FP 1", dgm=9)
df.bias[767,] <- c(get_data(s9_fp_one, stats="empse"), method="FP 1", dgm=9)
df.bias[768,] <- c(get_data(s9_fp_one, stats="mse"), method="FP 1", dgm=9)
df.bias[769,] <- c(get_data(s9_fp_one, stats="modelse"), method="FP 1", dgm=9)
df.bias[770,] <- c(get_data(s9_fp_one, stats="cover"), method="FP 1", dgm=9)
df.bias[771,] <- c(get_data(s9_fp_two, stats="bias"), method="FP 2", dgm=9)
df.bias[772,] <- c(get_data(s9_fp_two, stats="empse"), method="FP 2", dgm=9)
df.bias[773,] <- c(get_data(s9_fp_two, stats="mse"), method="FP 2", dgm=9)
df.bias[774,] <- c(get_data(s9_fp_two, stats="modelse"), method="FP 2", dgm=9)
df.bias[775,] <- c(get_data(s9_fp_two, stats="cover"), method="FP 2", dgm=9)

df.bias[776,] <- c(get_data(s10_fp_half, stats="bias"), method="FP 0.5", dgm=10)
df.bias[777,] <- c(get_data(s10_fp_half, stats="empse"), method="FP 0.5", dgm=10)
df.bias[778,] <- c(get_data(s10_fp_half, stats="mse"), method="FP 0.5", dgm=10)
df.bias[779,] <- c(get_data(s10_fp_half, stats="modelse"), method="FP 0.5", dgm=10)
df.bias[780,] <- c(get_data(s10_fp_half, stats="cover"), method="FP 0.5", dgm=10)
df.bias[781,] <- c(get_data(s10_fp_neghalf, stats="bias"), method="FP -0.5", dgm=10)
df.bias[782,] <- c(get_data(s10_fp_neghalf, stats="empse"), method="FP -0.5", dgm=10)
df.bias[783,] <- c(get_data(s10_fp_neghalf, stats="mse"), method="FP -0.5", dgm=10)
df.bias[784,] <- c(get_data(s10_fp_neghalf, stats="modelse"), method="FP -0.5", dgm=10)
df.bias[785,] <- c(get_data(s10_fp_neghalf, stats="cover"), method="FP -0.5", dgm=10)
df.bias[786,] <- c(get_data(s10_fp_zero, stats="bias"), method="FP 0", dgm=10)
df.bias[787,] <- c(get_data(s10_fp_zero, stats="empse"), method="FP 0", dgm=10)
df.bias[788,] <- c(get_data(s10_fp_zero, stats="mse"), method="FP 0", dgm=10)
df.bias[789,] <- c(get_data(s10_fp_zero, stats="modelse"), method="FP 0", dgm=10)
df.bias[790,] <- c(get_data(s10_fp_zero, stats="cover"), method="FP 0", dgm=10)
df.bias[791,] <- c(get_data(s10_fp_one, stats="bias"), method="FP 1", dgm=10)
df.bias[792,] <- c(get_data(s10_fp_one, stats="empse"), method="FP 1", dgm=10)
df.bias[793,] <- c(get_data(s10_fp_one, stats="mse"), method="FP 1", dgm=10)
df.bias[794,] <- c(get_data(s10_fp_one, stats="modelse"), method="FP 1", dgm=10)
df.bias[795,] <- c(get_data(s10_fp_one, stats="cover"), method="FP 1", dgm=10)
df.bias[796,] <- c(get_data(s10_fp_two, stats="bias"), method="FP 2", dgm=10)
df.bias[797,] <- c(get_data(s10_fp_two, stats="empse"), method="FP 2", dgm=10)
df.bias[798,] <- c(get_data(s10_fp_two, stats="mse"), method="FP 2", dgm=10)
df.bias[799,] <- c(get_data(s10_fp_two, stats="modelse"), method="FP 2", dgm=10)
df.bias[800,] <- c(get_data(s10_fp_two, stats="cover"), method="FP 2", dgm=10)

df.bias[801,] <- c(get_data(s11_fp_half, stats="bias"), method="FP 0.5", dgm=11)
df.bias[802,] <- c(get_data(s11_fp_half, stats="empse"), method="FP 0.5", dgm=11)
df.bias[803,] <- c(get_data(s11_fp_half, stats="mse"), method="FP 0.5", dgm=11)
df.bias[804,] <- c(get_data(s11_fp_half, stats="modelse"), method="FP 0.5", dgm=11)
df.bias[805,] <- c(get_data(s11_fp_half, stats="cover"), method="FP 0.5", dgm=11)
df.bias[806,] <- c(get_data(s11_fp_neghalf, stats="bias"), method="FP -0.5", dgm=11)
df.bias[807,] <- c(get_data(s11_fp_neghalf, stats="empse"), method="FP -0.5", dgm=11)
df.bias[808,] <- c(get_data(s11_fp_neghalf, stats="mse"), method="FP -0.5", dgm=11)
df.bias[809,] <- c(get_data(s11_fp_neghalf, stats="modelse"), method="FP -0.5", dgm=11)
df.bias[810,] <- c(get_data(s11_fp_neghalf, stats="cover"), method="FP -0.5", dgm=11)
df.bias[811,] <- c(get_data(s11_fp_zero, stats="bias"), method="FP 0", dgm=11)
df.bias[812,] <- c(get_data(s11_fp_zero, stats="empse"), method="FP 0", dgm=11)
df.bias[813,] <- c(get_data(s11_fp_zero, stats="mse"), method="FP 0", dgm=11)
df.bias[814,] <- c(get_data(s11_fp_zero, stats="modelse"), method="FP 0", dgm=11)
df.bias[815,] <- c(get_data(s11_fp_zero, stats="cover"), method="FP 0", dgm=11)
df.bias[816,] <- c(get_data(s11_fp_one, stats="bias"), method="FP 1", dgm=11)
df.bias[817,] <- c(get_data(s11_fp_one, stats="empse"), method="FP 1", dgm=11)
df.bias[818,] <- c(get_data(s11_fp_one, stats="mse"), method="FP 1", dgm=11)
df.bias[819,] <- c(get_data(s11_fp_one, stats="modelse"), method="FP 1", dgm=11)
df.bias[820,] <- c(get_data(s11_fp_one, stats="cover"), method="FP 1", dgm=11)
df.bias[821,] <- c(get_data(s11_fp_two, stats="bias"), method="FP 2", dgm=11)
df.bias[822,] <- c(get_data(s11_fp_two, stats="empse"), method="FP 2", dgm=11)
df.bias[823,] <- c(get_data(s11_fp_two, stats="mse"), method="FP 2", dgm=11)
df.bias[824,] <- c(get_data(s11_fp_two, stats="modelse"), method="FP 2", dgm=11)
df.bias[825,] <- c(get_data(s11_fp_two, stats="cover"), method="FP 2", dgm=11)

df.bias[826,] <- c(get_data(s12_fp_half, stats="bias"), method="FP 0.5", dgm=12)
df.bias[827,] <- c(get_data(s12_fp_half, stats="empse"), method="FP 0.5", dgm=12)
df.bias[828,] <- c(get_data(s12_fp_half, stats="mse"), method="FP 0.5", dgm=12)
df.bias[829,] <- c(get_data(s12_fp_half, stats="modelse"), method="FP 0.5", dgm=12)
df.bias[830,] <- c(get_data(s12_fp_half, stats="cover"), method="FP 0.5", dgm=12)
df.bias[831,] <- c(get_data(s12_fp_neghalf, stats="bias"), method="FP -0.5", dgm=12)
df.bias[832,] <- c(get_data(s12_fp_neghalf, stats="empse"), method="FP -0.5", dgm=12)
df.bias[833,] <- c(get_data(s12_fp_neghalf, stats="mse"), method="FP -0.5", dgm=12)
df.bias[834,] <- c(get_data(s12_fp_neghalf, stats="modelse"), method="FP -0.5", dgm=12)
df.bias[835,] <- c(get_data(s12_fp_neghalf, stats="cover"), method="FP -0.5", dgm=12)
df.bias[836,] <- c(get_data(s12_fp_zero, stats="bias"), method="FP 0", dgm=12)
df.bias[837,] <- c(get_data(s12_fp_zero, stats="empse"), method="FP 0", dgm=12)
df.bias[838,] <- c(get_data(s12_fp_zero, stats="mse"), method="FP 0", dgm=12)
df.bias[839,] <- c(get_data(s12_fp_zero, stats="modelse"), method="FP 0", dgm=12)
df.bias[840,] <- c(get_data(s12_fp_zero, stats="cover"), method="FP 0", dgm=12)
df.bias[841,] <- c(get_data(s12_fp_one, stats="bias"), method="FP 1", dgm=12)
df.bias[842,] <- c(get_data(s12_fp_one, stats="empse"), method="FP 1", dgm=12)
df.bias[843,] <- c(get_data(s12_fp_one, stats="mse"), method="FP 1", dgm=12)
df.bias[844,] <- c(get_data(s12_fp_one, stats="modelse"), method="FP 1", dgm=12)
df.bias[845,] <- c(get_data(s12_fp_one, stats="cover"), method="FP 1", dgm=12)
df.bias[846,] <- c(get_data(s12_fp_two, stats="bias"), method="FP 2", dgm=12)
df.bias[847,] <- c(get_data(s12_fp_two, stats="empse"), method="FP 2", dgm=12)
df.bias[848,] <- c(get_data(s12_fp_two, stats="mse"), method="FP 2", dgm=12)
df.bias[849,] <- c(get_data(s12_fp_two, stats="modelse"), method="FP 2", dgm=12)
df.bias[850,] <- c(get_data(s12_fp_two, stats="cover"), method="FP 2", dgm=12)

df.bias[851,] <- c(get_data(s9_fp_negone, stats="bias"), method="FP -1", dgm=9)
df.bias[852,] <- c(get_data(s9_fp_negone, stats="empse"), method="FP -1", dgm=9)
df.bias[853,] <- c(get_data(s9_fp_negone, stats="mse"), method="FP -1", dgm=9)
df.bias[854,] <- c(get_data(s9_fp_negone, stats="modelse"), method="FP -1", dgm=9)
df.bias[855,] <- c(get_data(s9_fp_negone, stats="cover"), method="FP -1", dgm=9)
df.bias[856,] <- c(get_data(s9_fp_negtwo, stats="bias"), method="FP -2", dgm=9)
df.bias[857,] <- c(get_data(s9_fp_negtwo, stats="empse"), method="FP -2", dgm=9)
df.bias[858,] <- c(get_data(s9_fp_negtwo, stats="mse"), method="FP -2", dgm=9)
df.bias[859,] <- c(get_data(s9_fp_negtwo, stats="modelse"), method="FP -2", dgm=9)
df.bias[860,] <- c(get_data(s9_fp_negtwo, stats="cover"), method="FP -2", dgm=9)
df.bias[861,] <- c(get_data(s9_fp_three, stats="bias"), method="FP 3", dgm=9)
df.bias[862,] <- c(get_data(s9_fp_three, stats="empse"), method="FP 3", dgm=9)
df.bias[863,] <- c(get_data(s9_fp_three, stats="mse"), method="FP 3", dgm=9)
df.bias[864,] <- c(get_data(s9_fp_three, stats="modelse"), method="FP 3", dgm=9)
df.bias[865,] <- c(get_data(s9_fp_three, stats="cover"), method="FP 3", dgm=9)

df.bias[866,] <- c(get_data(s10_fp_negone, stats="bias"), method="FP -1", dgm=10)
df.bias[867,] <- c(get_data(s10_fp_negone, stats="empse"), method="FP -1", dgm=10)
df.bias[868,] <- c(get_data(s10_fp_negone, stats="mse"), method="FP -1", dgm=10)
df.bias[869,] <- c(get_data(s10_fp_negone, stats="modelse"), method="FP -1", dgm=10)
df.bias[870,] <- c(get_data(s10_fp_negone, stats="cover"), method="FP -1", dgm=10)
df.bias[871,] <- c(get_data(s10_fp_negtwo, stats="bias"), method="FP -2", dgm=10)
df.bias[872,] <- c(get_data(s10_fp_negtwo, stats="empse"), method="FP -2", dgm=10)
df.bias[873,] <- c(get_data(s10_fp_negtwo, stats="mse"), method="FP -2", dgm=10)
df.bias[874,] <- c(get_data(s10_fp_negtwo, stats="modelse"), method="FP -2", dgm=10)
df.bias[875,] <- c(get_data(s10_fp_negtwo, stats="cover"), method="FP -2", dgm=10)
df.bias[876,] <- c(get_data(s10_fp_three, stats="bias"), method="FP 3", dgm=10)
df.bias[877,] <- c(get_data(s10_fp_three, stats="empse"), method="FP 3", dgm=10)
df.bias[878,] <- c(get_data(s10_fp_three, stats="mse"), method="FP 3", dgm=10)
df.bias[879,] <- c(get_data(s10_fp_three, stats="modelse"), method="FP 3", dgm=10)
df.bias[880,] <- c(get_data(s10_fp_three, stats="cover"), method="FP 3", dgm=10)

df.bias[881,] <- c(get_data(s11_fp_negone, stats="bias"), method="FP -1", dgm=11)
df.bias[882,] <- c(get_data(s11_fp_negone, stats="empse"), method="FP -1", dgm=11)
df.bias[883,] <- c(get_data(s11_fp_negone, stats="mse"), method="FP -1", dgm=11)
df.bias[884,] <- c(get_data(s11_fp_negone, stats="modelse"), method="FP -1", dgm=11)
df.bias[885,] <- c(get_data(s11_fp_negone, stats="cover"), method="FP -1", dgm=11)
df.bias[886,] <- c(get_data(s11_fp_negtwo, stats="bias"), method="FP -2", dgm=11)
df.bias[887,] <- c(get_data(s11_fp_negtwo, stats="empse"), method="FP -2", dgm=11)
df.bias[888,] <- c(get_data(s11_fp_negtwo, stats="mse"), method="FP -2", dgm=11)
df.bias[889,] <- c(get_data(s11_fp_negtwo, stats="modelse"), method="FP -2", dgm=11)
df.bias[890,] <- c(get_data(s11_fp_negtwo, stats="cover"), method="FP -2", dgm=11)
df.bias[891,] <- c(get_data(s11_fp_three, stats="bias"), method="FP 3", dgm=11)
df.bias[892,] <- c(get_data(s11_fp_three, stats="empse"), method="FP 3", dgm=11)
df.bias[893,] <- c(get_data(s11_fp_three, stats="mse"), method="FP 3", dgm=11)
df.bias[894,] <- c(get_data(s11_fp_three, stats="modelse"), method="FP 3", dgm=11)
df.bias[895,] <- c(get_data(s11_fp_three, stats="cover"), method="FP 3", dgm=11)

df.bias[896,] <- c(get_data(s12_fp_negone, stats="bias"), method="FP -1", dgm=12)
df.bias[897,] <- c(get_data(s12_fp_negone, stats="empse"), method="FP -1", dgm=12)
df.bias[898,] <- c(get_data(s12_fp_negone, stats="mse"), method="FP -1", dgm=12)
df.bias[899,] <- c(get_data(s12_fp_negone, stats="modelse"), method="FP -1", dgm=12)
df.bias[900,] <- c(get_data(s12_fp_negone, stats="cover"), method="FP -1", dgm=12)
df.bias[901,] <- c(get_data(s12_fp_negtwo, stats="bias"), method="FP -2", dgm=12)
df.bias[902,] <- c(get_data(s12_fp_negtwo, stats="empse"), method="FP -2", dgm=12)
df.bias[903,] <- c(get_data(s12_fp_negtwo, stats="mse"), method="FP -2", dgm=12)
df.bias[904,] <- c(get_data(s12_fp_negtwo, stats="modelse"), method="FP -2", dgm=12)
df.bias[905,] <- c(get_data(s12_fp_negtwo, stats="cover"), method="FP -2", dgm=12)
df.bias[906,] <- c(get_data(s12_fp_three, stats="bias"), method="FP 3", dgm=12)
df.bias[907,] <- c(get_data(s12_fp_three, stats="empse"), method="FP 3", dgm=12)
df.bias[908,] <- c(get_data(s12_fp_three, stats="mse"), method="FP 3", dgm=12)
df.bias[909,] <- c(get_data(s12_fp_three, stats="modelse"), method="FP 3", dgm=12)
df.bias[910,] <- c(get_data(s12_fp_three, stats="cover"), method="FP 3", dgm=12)

df.bias[911,] <- c(get_data(s1_pw4, stats="bias"), method="pw2_6_12", dgm=1)
df.bias[912,] <- c(get_data(s1_pw4, stats="empse"), method="pw2_6_12", dgm=1)
df.bias[913,] <- c(get_data(s1_pw4, stats="mse"), method="pw2_6_12", dgm=1)
df.bias[914,] <- c(get_data(s1_pw4, stats="modelse"), method="pw2_6_12", dgm=1)
df.bias[915,] <- c(get_data(s1_pw4, stats="cover"), method="pw2_6_12", dgm=1)
df.bias[916,] <- c(get_data(s1_pw5, stats="bias"), method="pw2_6_18", dgm=1)
df.bias[917,] <- c(get_data(s1_pw5, stats="empse"), method="pw2_6_18", dgm=1)
df.bias[918,] <- c(get_data(s1_pw5, stats="mse"), method="pw2_6_18", dgm=1)
df.bias[919,] <- c(get_data(s1_pw5, stats="modelse"), method="pw2_6_18", dgm=1)
df.bias[920,] <- c(get_data(s1_pw5, stats="cover"), method="pw2_6_18", dgm=1)
df.bias[921,] <- c(get_data(s1_pw6, stats="bias"), method="pw2_12_18", dgm=1)
df.bias[922,] <- c(get_data(s1_pw6, stats="empse"), method="pw2_12_18", dgm=1)
df.bias[923,] <- c(get_data(s1_pw6, stats="mse"), method="pw2_12_18", dgm=1)
df.bias[924,] <- c(get_data(s1_pw6, stats="modelse"), method="pw2_12_18", dgm=1)
df.bias[925,] <- c(get_data(s1_pw6, stats="cover"), method="pw2_12_18", dgm=1)

df.bias[926,] <- c(get_data(s2_pw4, stats="bias"), method="pw2_6_12", dgm=2)
df.bias[927,] <- c(get_data(s2_pw4, stats="empse"), method="pw2_6_12", dgm=2)
df.bias[928,] <- c(get_data(s2_pw4, stats="mse"), method="pw2_6_12", dgm=2)
df.bias[929,] <- c(get_data(s2_pw4, stats="modelse"), method="pw2_6_12", dgm=2)
df.bias[930,] <- c(get_data(s2_pw4, stats="cover"), method="pw2_6_12", dgm=2)
df.bias[931,] <- c(get_data(s2_pw5, stats="bias"), method="pw2_6_18", dgm=2)
df.bias[932,] <- c(get_data(s2_pw5, stats="empse"), method="pw2_6_18", dgm=2)
df.bias[933,] <- c(get_data(s2_pw5, stats="mse"), method="pw2_6_18", dgm=2)
df.bias[934,] <- c(get_data(s2_pw5, stats="modelse"), method="pw2_6_18", dgm=2)
df.bias[935,] <- c(get_data(s2_pw5, stats="cover"), method="pw2_6_18", dgm=2)
df.bias[936,] <- c(get_data(s2_pw6, stats="bias"), method="pw2_12_18", dgm=2)
df.bias[937,] <- c(get_data(s2_pw6, stats="empse"), method="pw2_12_18", dgm=2)
df.bias[938,] <- c(get_data(s2_pw6, stats="mse"), method="pw2_12_18", dgm=2)
df.bias[939,] <- c(get_data(s2_pw6, stats="modelse"), method="pw2_12_18", dgm=2)
df.bias[940,] <- c(get_data(s2_pw6, stats="cover"), method="pw2_12_18", dgm=2)

df.bias[941,] <- c(get_data(s3_pw4, stats="bias"), method="pw2_6_12", dgm=3)
df.bias[942,] <- c(get_data(s3_pw4, stats="empse"), method="pw2_6_12", dgm=3)
df.bias[943,] <- c(get_data(s3_pw4, stats="mse"), method="pw2_6_12", dgm=3)
df.bias[944,] <- c(get_data(s3_pw4, stats="modelse"), method="pw2_6_12", dgm=3)
df.bias[945,] <- c(get_data(s3_pw4, stats="cover"), method="pw2_6_12", dgm=3)
df.bias[946,] <- c(get_data(s3_pw5, stats="bias"), method="pw2_6_18", dgm=3)
df.bias[947,] <- c(get_data(s3_pw5, stats="empse"), method="pw2_6_18", dgm=3)
df.bias[948,] <- c(get_data(s3_pw5, stats="mse"), method="pw2_6_18", dgm=3)
df.bias[949,] <- c(get_data(s3_pw5, stats="modelse"), method="pw2_6_18", dgm=3)
df.bias[950,] <- c(get_data(s3_pw5, stats="cover"), method="pw2_6_18", dgm=3)
df.bias[951,] <- c(get_data(s3_pw6, stats="bias"), method="pw2_12_18", dgm=3)
df.bias[952,] <- c(get_data(s3_pw6, stats="empse"), method="pw2_12_18", dgm=3)
df.bias[953,] <- c(get_data(s3_pw6, stats="mse"), method="pw2_12_18", dgm=3)
df.bias[954,] <- c(get_data(s3_pw6, stats="modelse"), method="pw2_12_18", dgm=3)
df.bias[955,] <- c(get_data(s3_pw6, stats="cover"), method="pw2_12_18", dgm=3)

df.bias[956,] <- c(get_data(s4_pw4, stats="bias"), method="pw2_6_12", dgm=4)
df.bias[957,] <- c(get_data(s4_pw4, stats="empse"), method="pw2_6_12", dgm=4)
df.bias[958,] <- c(get_data(s4_pw4, stats="mse"), method="pw2_6_12", dgm=4)
df.bias[959,] <- c(get_data(s4_pw4, stats="modelse"), method="pw2_6_12", dgm=4)
df.bias[960,] <- c(get_data(s4_pw4, stats="cover"), method="pw2_6_12", dgm=4)
df.bias[961,] <- c(get_data(s4_pw5, stats="bias"), method="pw2_6_18", dgm=4)
df.bias[962,] <- c(get_data(s4_pw5, stats="empse"), method="pw2_6_18", dgm=4)
df.bias[963,] <- c(get_data(s4_pw5, stats="mse"), method="pw2_6_18", dgm=4)
df.bias[964,] <- c(get_data(s4_pw5, stats="modelse"), method="pw2_6_18", dgm=4)
df.bias[965,] <- c(get_data(s4_pw5, stats="cover"), method="pw2_6_18", dgm=4)
df.bias[966,] <- c(get_data(s4_pw6, stats="bias"), method="pw2_12_18", dgm=4)
df.bias[967,] <- c(get_data(s4_pw6, stats="empse"), method="pw2_12_18", dgm=4)
df.bias[968,] <- c(get_data(s4_pw6, stats="mse"), method="pw2_12_18", dgm=4)
df.bias[969,] <- c(get_data(s4_pw6, stats="modelse"), method="pw2_12_18", dgm=4)
df.bias[970,] <- c(get_data(s4_pw6, stats="cover"), method="pw2_12_18", dgm=4)

df.bias[971,] <- c(get_data(s5_pw4, stats="bias"), method="pw2_6_12", dgm=5)
df.bias[972,] <- c(get_data(s5_pw4, stats="empse"), method="pw2_6_12", dgm=5)
df.bias[973,] <- c(get_data(s5_pw4, stats="mse"), method="pw2_6_12", dgm=5)
df.bias[974,] <- c(get_data(s5_pw4, stats="modelse"), method="pw2_6_12", dgm=5)
df.bias[975,] <- c(get_data(s5_pw4, stats="cover"), method="pw2_6_12", dgm=5)
df.bias[976,] <- c(get_data(s5_pw5, stats="bias"), method="pw2_6_18", dgm=5)
df.bias[977,] <- c(get_data(s5_pw5, stats="empse"), method="pw2_6_18", dgm=5)
df.bias[978,] <- c(get_data(s5_pw5, stats="mse"), method="pw2_6_18", dgm=5)
df.bias[979,] <- c(get_data(s5_pw5, stats="modelse"), method="pw2_6_18", dgm=5)
df.bias[980,] <- c(get_data(s5_pw5, stats="cover"), method="pw2_6_18", dgm=5)
df.bias[981,] <- c(get_data(s5_pw6, stats="bias"), method="pw2_12_18", dgm=5)
df.bias[982,] <- c(get_data(s5_pw6, stats="empse"), method="pw2_12_18", dgm=5)
df.bias[983,] <- c(get_data(s5_pw6, stats="mse"), method="pw2_12_18", dgm=5)
df.bias[984,] <- c(get_data(s5_pw6, stats="modelse"), method="pw2_12_18", dgm=5)
df.bias[985,] <- c(get_data(s5_pw6, stats="cover"), method="pw2_12_18", dgm=5)

df.bias[986,] <- c(get_data(s6_pw4, stats="bias"), method="pw2_6_12", dgm=6)
df.bias[987,] <- c(get_data(s6_pw4, stats="empse"), method="pw2_6_12", dgm=6)
df.bias[988,] <- c(get_data(s6_pw4, stats="mse"), method="pw2_6_12", dgm=6)
df.bias[989,] <- c(get_data(s6_pw4, stats="modelse"), method="pw2_6_12", dgm=6)
df.bias[990,] <- c(get_data(s6_pw4, stats="cover"), method="pw2_6_12", dgm=6)
df.bias[991,] <- c(get_data(s6_pw5, stats="bias"), method="pw2_6_18", dgm=6)
df.bias[992,] <- c(get_data(s6_pw5, stats="empse"), method="pw2_6_18", dgm=6)
df.bias[993,] <- c(get_data(s6_pw5, stats="mse"), method="pw2_6_18", dgm=6)
df.bias[994,] <- c(get_data(s6_pw5, stats="modelse"), method="pw2_6_18", dgm=6)
df.bias[995,] <- c(get_data(s6_pw5, stats="cover"), method="pw2_6_18", dgm=6)
df.bias[996,] <- c(get_data(s6_pw6, stats="bias"), method="pw2_12_18", dgm=6)
df.bias[997,] <- c(get_data(s6_pw6, stats="empse"), method="pw2_12_18", dgm=6)
df.bias[998,] <- c(get_data(s6_pw6, stats="mse"), method="pw2_12_18", dgm=6)
df.bias[999,] <- c(get_data(s6_pw6, stats="modelse"), method="pw2_12_18", dgm=6)
df.bias[1000,] <- c(get_data(s6_pw6, stats="cover"), method="pw2_12_18", dgm=6)

df.bias[1001,] <- c(get_data(s7_pw4, stats="bias"), method="pw2_6_12", dgm=7)
df.bias[1002,] <- c(get_data(s7_pw4, stats="empse"), method="pw2_6_12", dgm=7)
df.bias[1003,] <- c(get_data(s7_pw4, stats="mse"), method="pw2_6_12", dgm=7)
df.bias[1004,] <- c(get_data(s7_pw4, stats="modelse"), method="pw2_6_12", dgm=7)
df.bias[1005,] <- c(get_data(s7_pw4, stats="cover"), method="pw2_6_12", dgm=7)
df.bias[1006,] <- c(get_data(s7_pw5, stats="bias"), method="pw2_6_18", dgm=7)
df.bias[1007,] <- c(get_data(s7_pw5, stats="empse"), method="pw2_6_18", dgm=7)
df.bias[1008,] <- c(get_data(s7_pw5, stats="mse"), method="pw2_6_18", dgm=7)
df.bias[1009,] <- c(get_data(s7_pw5, stats="modelse"), method="pw2_6_18", dgm=7)
df.bias[1010,] <- c(get_data(s7_pw5, stats="cover"), method="pw2_6_18", dgm=7)
df.bias[1011,] <- c(get_data(s7_pw6, stats="bias"), method="pw2_12_18", dgm=7)
df.bias[1012,] <- c(get_data(s7_pw6, stats="empse"), method="pw2_12_18", dgm=7)
df.bias[1013,] <- c(get_data(s7_pw6, stats="mse"), method="pw2_12_18", dgm=7)
df.bias[1014,] <- c(get_data(s7_pw6, stats="modelse"), method="pw2_12_18", dgm=7)
df.bias[1015,] <- c(get_data(s7_pw6, stats="cover"), method="pw2_12_18", dgm=7)

df.bias[1016,] <- c(get_data(s8_pw4, stats="bias"), method="pw2_6_12", dgm=8)
df.bias[1017,] <- c(get_data(s8_pw4, stats="empse"), method="pw2_6_12", dgm=8)
df.bias[1018,] <- c(get_data(s8_pw4, stats="mse"), method="pw2_6_12", dgm=8)
df.bias[1019,] <- c(get_data(s8_pw4, stats="modelse"), method="pw2_6_12", dgm=8)
df.bias[1020,] <- c(get_data(s8_pw4, stats="cover"), method="pw2_6_12", dgm=8)
df.bias[1021,] <- c(get_data(s8_pw5, stats="bias"), method="pw2_6_18", dgm=8)
df.bias[1022,] <- c(get_data(s8_pw5, stats="empse"), method="pw2_6_18", dgm=8)
df.bias[1023,] <- c(get_data(s8_pw5, stats="mse"), method="pw2_6_18", dgm=8)
df.bias[1024,] <- c(get_data(s8_pw5, stats="modelse"), method="pw2_6_18", dgm=8)
df.bias[1025,] <- c(get_data(s8_pw5, stats="cover"), method="pw2_6_18", dgm=8)
df.bias[1026,] <- c(get_data(s8_pw6, stats="bias"), method="pw2_12_18", dgm=8)
df.bias[1027,] <- c(get_data(s8_pw6, stats="empse"), method="pw2_12_18", dgm=8)
df.bias[1028,] <- c(get_data(s8_pw6, stats="mse"), method="pw2_12_18", dgm=8)
df.bias[1029,] <- c(get_data(s8_pw6, stats="modelse"), method="pw2_12_18", dgm=8)
df.bias[1030,] <- c(get_data(s8_pw6, stats="cover"), method="pw2_12_18", dgm=8)

df.bias[1031,] <- c(get_data(s9_pw4, stats="bias"), method="pw2_6_12", dgm=9)
df.bias[1032,] <- c(get_data(s9_pw4, stats="empse"), method="pw2_6_12", dgm=9)
df.bias[1033,] <- c(get_data(s9_pw4, stats="mse"), method="pw2_6_12", dgm=9)
df.bias[1034,] <- c(get_data(s9_pw4, stats="modelse"), method="pw2_6_12", dgm=9)
df.bias[1035,] <- c(get_data(s9_pw4, stats="cover"), method="pw2_6_12", dgm=9)
df.bias[1036,] <- c(get_data(s9_pw5, stats="bias"), method="pw2_6_18", dgm=9)
df.bias[1037,] <- c(get_data(s9_pw5, stats="empse"), method="pw2_6_18", dgm=9)
df.bias[1038,] <- c(get_data(s9_pw5, stats="mse"), method="pw2_6_18", dgm=9)
df.bias[1039,] <- c(get_data(s9_pw5, stats="modelse"), method="pw2_6_18", dgm=9)
df.bias[1040,] <- c(get_data(s9_pw5, stats="cover"), method="pw2_6_18", dgm=9)
df.bias[1041,] <- c(get_data(s9_pw6, stats="bias"), method="pw2_12_18", dgm=9)
df.bias[1042,] <- c(get_data(s9_pw6, stats="empse"), method="pw2_12_18", dgm=9)
df.bias[1043,] <- c(get_data(s9_pw6, stats="mse"), method="pw2_12_18", dgm=9)
df.bias[1044,] <- c(get_data(s9_pw6, stats="modelse"), method="pw2_12_18", dgm=9)
df.bias[1045,] <- c(get_data(s9_pw6, stats="cover"), method="pw2_12_18", dgm=9)

df.bias[1046,] <- c(get_data(s10_pw4, stats="bias"), method="pw2_6_12", dgm=10)
df.bias[1047,] <- c(get_data(s10_pw4, stats="empse"), method="pw2_6_12", dgm=10)
df.bias[1048,] <- c(get_data(s10_pw4, stats="mse"), method="pw2_6_12", dgm=10)
df.bias[1049,] <- c(get_data(s10_pw4, stats="modelse"), method="pw2_6_12", dgm=10)
df.bias[1050,] <- c(get_data(s10_pw4, stats="cover"), method="pw2_6_12", dgm=10)
df.bias[1051,] <- c(get_data(s10_pw5, stats="bias"), method="pw2_6_18", dgm=10)
df.bias[1052,] <- c(get_data(s10_pw5, stats="empse"), method="pw2_6_18", dgm=10)
df.bias[1053,] <- c(get_data(s10_pw5, stats="mse"), method="pw2_6_18", dgm=10)
df.bias[1054,] <- c(get_data(s10_pw5, stats="modelse"), method="pw2_6_18", dgm=10)
df.bias[1055,] <- c(get_data(s10_pw5, stats="cover"), method="pw2_6_18", dgm=10)
df.bias[1056,] <- c(get_data(s10_pw6, stats="bias"), method="pw2_12_18", dgm=10)
df.bias[1057,] <- c(get_data(s10_pw6, stats="empse"), method="pw2_12_18", dgm=10)
df.bias[1058,] <- c(get_data(s10_pw6, stats="mse"), method="pw2_12_18", dgm=10)
df.bias[1059,] <- c(get_data(s10_pw6, stats="modelse"), method="pw2_12_18", dgm=10)
df.bias[1060,] <- c(get_data(s10_pw6, stats="cover"), method="pw2_12_18", dgm=10)

df.bias[1061,] <- c(get_data(s11_pw4, stats="bias"), method="pw2_6_12", dgm=11)
df.bias[1062,] <- c(get_data(s11_pw4, stats="empse"), method="pw2_6_12", dgm=11)
df.bias[1063,] <- c(get_data(s11_pw4, stats="mse"), method="pw2_6_12", dgm=11)
df.bias[1064,] <- c(get_data(s11_pw4, stats="modelse"), method="pw2_6_12", dgm=11)
df.bias[1065,] <- c(get_data(s11_pw4, stats="cover"), method="pw2_6_12", dgm=11)
df.bias[1066,] <- c(get_data(s11_pw5, stats="bias"), method="pw2_6_18", dgm=11)
df.bias[1067,] <- c(get_data(s11_pw5, stats="empse"), method="pw2_6_18", dgm=11)
df.bias[1068,] <- c(get_data(s11_pw5, stats="mse"), method="pw2_6_18", dgm=11)
df.bias[1069,] <- c(get_data(s11_pw5, stats="modelse"), method="pw2_6_18", dgm=11)
df.bias[1070,] <- c(get_data(s11_pw5, stats="cover"), method="pw2_6_18", dgm=11)
df.bias[1071,] <- c(get_data(s11_pw6, stats="bias"), method="pw2_12_18", dgm=11)
df.bias[1072,] <- c(get_data(s11_pw6, stats="empse"), method="pw2_12_18", dgm=11)
df.bias[1073,] <- c(get_data(s11_pw6, stats="mse"), method="pw2_12_18", dgm=11)
df.bias[1074,] <- c(get_data(s11_pw6, stats="modelse"), method="pw2_12_18", dgm=11)
df.bias[1075,] <- c(get_data(s11_pw6, stats="cover"), method="pw2_12_18", dgm=11)

df.bias[1076,] <- c(get_data(s12_pw4, stats="bias"), method="pw2_6_12", dgm=12)
df.bias[1077,] <- c(get_data(s12_pw4, stats="empse"), method="pw2_6_12", dgm=12)
df.bias[1078,] <- c(get_data(s12_pw4, stats="mse"), method="pw2_6_12", dgm=12)
df.bias[1079,] <- c(get_data(s12_pw4, stats="modelse"), method="pw2_6_12", dgm=12)
df.bias[1080,] <- c(get_data(s12_pw4, stats="cover"), method="pw2_6_12", dgm=12)
df.bias[1081,] <- c(get_data(s12_pw5, stats="bias"), method="pw2_6_18", dgm=12)
df.bias[1082,] <- c(get_data(s12_pw5, stats="empse"), method="pw2_6_18", dgm=12)
df.bias[1083,] <- c(get_data(s12_pw5, stats="mse"), method="pw2_6_18", dgm=12)
df.bias[1084,] <- c(get_data(s12_pw5, stats="modelse"), method="pw2_6_18", dgm=12)
df.bias[1085,] <- c(get_data(s12_pw5, stats="cover"), method="pw2_6_18", dgm=12)
df.bias[1086,] <- c(get_data(s12_pw6, stats="bias"), method="pw2_12_18", dgm=12)
df.bias[1087,] <- c(get_data(s12_pw6, stats="empse"), method="pw2_12_18", dgm=12)
df.bias[1088,] <- c(get_data(s12_pw6, stats="mse"), method="pw2_12_18", dgm=12)
df.bias[1089,] <- c(get_data(s12_pw6, stats="modelse"), method="pw2_12_18", dgm=12)
df.bias[1090,] <- c(get_data(s12_pw6, stats="cover"), method="pw2_12_18", dgm=12)




df.bias$dgm2 <- "NA"
df.bias$dgm2[df.bias$dgm==1] <- "Scenario 1"
df.bias$dgm2[df.bias$dgm==2] <- "Scenario 2"
df.bias$dgm2[df.bias$dgm==3] <- "Scenario 3"
df.bias$dgm2[df.bias$dgm==4] <- "Scenario 4"
df.bias$dgm2[df.bias$dgm==5] <- "Scenario 5"
df.bias$dgm2[df.bias$dgm==6] <- "Scenario 6"
df.bias$dgm2[df.bias$dgm==7] <- "Scenario 7"
df.bias$dgm2[df.bias$dgm==8] <- "Scenario 8"
df.bias$dgm2[df.bias$dgm==9] <- "Scenario 9"
df.bias$dgm2[df.bias$dgm==10] <- "Scenario 10"
df.bias$dgm2[df.bias$dgm==11] <- "Scenario 11"
df.bias$dgm2[df.bias$dgm==12] <- "Scenario 12"


df.bias$dgm3 <- "NA"
df.bias$dgm3[df.bias$dgm==1] <- "Scenario 1a"
df.bias$dgm3[df.bias$dgm==2] <- "Scenario 2a"
df.bias$dgm3[df.bias$dgm==3] <- "Scenario 3a"
df.bias$dgm3[df.bias$dgm==4] <- "Scenario 4a"
df.bias$dgm3[df.bias$dgm==5] <- "Scenario 1b"
df.bias$dgm3[df.bias$dgm==6] <- "Scenario 2b"
df.bias$dgm3[df.bias$dgm==7] <- "Scenario 3b"
df.bias$dgm3[df.bias$dgm==8] <- "Scenario 4b"
df.bias$dgm3[df.bias$dgm==9] <- "Scenario 1c"
df.bias$dgm3[df.bias$dgm==10] <- "Scenario 2c"
df.bias$dgm3[df.bias$dgm==11] <- "Scenario 3c"
df.bias$dgm3[df.bias$dgm==12] <- "Scenario 4c"


## Save dataset
write.csv(df.bias, "results_sa.csv")




# Table of datasets

# Build data frame with performance measures
n <- data.frame(stat="NA", est=numeric(1), mcse=numeric(1), method="NA", dgm=numeric(1))

n[1,] <- c(get_data(s1_pw1, stats="nsim"), method="pw_c1", dgm=1)
n[2,] <- c(get_data(s1_pw2, stats="nsim"), method="pw_c2", dgm=1)
n[3,] <- c(get_data(s1_pw3, stats="nsim"), method="pw_c3", dgm=1)

n[4,] <- c(get_data(s2_pw1, stats="nsim"), method="pw_c1", dgm=2)
n[5,] <- c(get_data(s2_pw2, stats="nsim"), method="pw_c2", dgm=2)
n[6,] <- c(get_data(s2_pw3, stats="nsim"), method="pw_c3", dgm=2)

n[7,] <- c(get_data(s3_pw1, stats="nsim"), method="pw_c1", dgm=3)
n[8,] <- c(get_data(s3_pw2, stats="nsim"), method="pw_c2", dgm=3)
n[9,] <- c(get_data(s3_pw3, stats="nsim"), method="pw_c3", dgm=3)

n[10,] <- c(get_data(s4_pw1, stats="nsim"), method="pw_c1", dgm=4)
n[11,] <- c(get_data(s4_pw2, stats="nsim"), method="pw_c2", dgm=4)
n[12,] <- c(get_data(s4_pw3, stats="nsim"), method="pw_c3", dgm=4)

n[13,] <- c(get_data(s5_pw1, stats="nsim"), method="pw_c1", dgm=5)
n[14,] <- c(get_data(s5_pw2, stats="nsim"), method="pw_c2", dgm=5)
n[15,] <- c(get_data(s5_pw3, stats="nsim"), method="pw_c3", dgm=5)

n[16,] <- c(get_data(s6_pw1, stats="nsim"), method="pw_c1", dgm=6)
n[17,] <- c(get_data(s6_pw2, stats="nsim"), method="pw_c2", dgm=6)
n[18,] <- c(get_data(s6_pw3, stats="nsim"), method="pw_c3", dgm=6)

n[19,] <- c(get_data(s7_pw1, stats="nsim"), method="pw_c1", dgm=7)
n[20,] <- c(get_data(s7_pw2, stats="nsim"), method="pw_c2", dgm=7)
n[21,] <- c(get_data(s7_pw3, stats="nsim"), method="pw_c3", dgm=7)

n[22,] <- c(get_data(s8_pw1, stats="nsim"), method="pw_c1", dgm=8)
n[23,] <- c(get_data(s8_pw2, stats="nsim"), method="pw_c2", dgm=8)
n[24,] <- c(get_data(s8_pw3, stats="nsim"), method="pw_c3", dgm=8)

n[25,] <- c(get_data(s1_rplnt1, stats="nsim"), method="rplnt1", dgm=1)
n[26,] <- c(get_data(s1_rplnt2, stats="nsim"), method="rplnt2", dgm=1)
n[27,] <- c(get_data(s1_rplnt3, stats="nsim"), method="rplnt3", dgm=1)
n[28,] <- c(get_data(s1_rplnt4, stats="nsim"), method="rplnt4", dgm=1)

n[29,] <- c(get_data(s2_rplnt1, stats="nsim"), method="rplnt1", dgm=2)
n[30,] <- c(get_data(s2_rplnt2, stats="nsim"), method="rplnt2", dgm=2)
n[31,] <- c(get_data(s2_rplnt3, stats="nsim"), method="rplnt3", dgm=2)
n[32,] <- c(get_data(s2_rplnt4, stats="nsim"), method="rplnt4", dgm=2)

n[33,] <- c(get_data(s3_rplnt1, stats="nsim"), method="rplnt1", dgm=3)
n[34,] <- c(get_data(s3_rplnt2, stats="nsim"), method="rplnt2", dgm=3)
n[35,] <- c(get_data(s3_rplnt3, stats="nsim"), method="rplnt3", dgm=3)
n[36,] <- c(get_data(s3_rplnt4, stats="nsim"), method="rplnt4", dgm=3)

n[37,] <- c(get_data(s4_rplnt1, stats="nsim"), method="rplnt1", dgm=4)
n[38,] <- c(get_data(s4_rplnt2, stats="nsim"), method="rplnt2", dgm=4)
n[39,] <- c(get_data(s4_rplnt3, stats="nsim"), method="rplnt3", dgm=4)
n[40,] <- c(get_data(s4_rplnt4, stats="nsim"), method="rplnt4", dgm=4)

n[41,] <- c(get_data(s5_rplnt1, stats="nsim"), method="rplnt1", dgm=5)
n[42,] <- c(get_data(s5_rplnt2, stats="nsim"), method="rplnt2", dgm=5)
n[43,] <- c(get_data(s5_rplnt3, stats="nsim"), method="rplnt3", dgm=5)
n[44,] <- c(get_data(s5_rplnt4, stats="nsim"), method="rplnt4", dgm=5)

n[45,] <- c(get_data(s6_rplnt1, stats="nsim"), method="rplnt1", dgm=6)
n[46,] <- c(get_data(s6_rplnt2, stats="nsim"), method="rplnt2", dgm=6)
n[47,] <- c(get_data(s6_rplnt3, stats="nsim"), method="rplnt3", dgm=6)
n[48,] <- c(get_data(s6_rplnt4, stats="nsim"), method="rplnt4", dgm=6)

n[49,] <- c(get_data(s7_rplnt1, stats="nsim"), method="rplnt1", dgm=7)
n[50,] <- c(get_data(s7_rplnt2, stats="nsim"), method="rplnt2", dgm=7)
n[51,] <- c(get_data(s7_rplnt3, stats="nsim"), method="rplnt3", dgm=7)
n[52,] <- c(get_data(s7_rplnt4, stats="nsim"), method="rplnt4", dgm=7)

n[53,] <- c(get_data(s8_rplnt1, stats="nsim"), method="rplnt1", dgm=8)
n[54,] <- c(get_data(s8_rplnt2, stats="nsim"), method="rplnt2", dgm=8)
n[55,] <- c(get_data(s8_rplnt3, stats="nsim"), method="rplnt3", dgm=8)
n[56,] <- c(get_data(s8_rplnt4, stats="nsim"), method="rplnt4", dgm=8)

n[57,] <- c(get_data(s1_fp_negtwo, stats="nsim"), method="FP -2", dgm=1)
n[58,] <- c(get_data(s1_fp_negone, stats="nsim"), method="FP -1", dgm=1)
n[59,] <- c(get_data(s1_fp_neghalf, stats="nsim"), method="FP -0.5", dgm=1)
n[60,] <- c(get_data(s1_fp_zero, stats="nsim"), method="FP 0", dgm=1)
n[61,] <- c(get_data(s1_fp_half, stats="nsim"), method="FP 0.5", dgm=1)
n[62,] <- c(get_data(s1_fp_one, stats="nsim"), method="FP 1", dgm=1)
n[63,] <- c(get_data(s1_fp_two, stats="nsim"), method="FP 2", dgm=1)
n[64,] <- c(get_data(s1_fp_three, stats="nsim"), method="FP 3", dgm=1)

n[65,] <- c(get_data(s2_fp_negtwo, stats="nsim"), method="FP -2", dgm=2)
n[66,] <- c(get_data(s2_fp_negone, stats="nsim"), method="FP -1", dgm=2)
n[67,] <- c(get_data(s2_fp_neghalf, stats="nsim"), method="FP -0.5", dgm=2)
n[68,] <- c(get_data(s2_fp_zero, stats="nsim"), method="FP 0", dgm=2)
n[69,] <- c(get_data(s2_fp_half, stats="nsim"), method="FP 0.5", dgm=2)
n[70,] <- c(get_data(s2_fp_one, stats="nsim"), method="FP 1", dgm=2)
n[71,] <- c(get_data(s2_fp_two, stats="nsim"), method="FP 2", dgm=2)
n[72,] <- c(get_data(s2_fp_three, stats="nsim"), method="FP 3", dgm=2)

n[73,] <- c(get_data(s3_fp_negtwo, stats="nsim"), method="FP -2", dgm=3)
n[74,] <- c(get_data(s3_fp_negone, stats="nsim"), method="FP -1", dgm=3)
n[75,] <- c(get_data(s3_fp_neghalf, stats="nsim"), method="FP -0.5", dgm=3)
n[76,] <- c(get_data(s3_fp_zero, stats="nsim"), method="FP 0", dgm=3)
n[77,] <- c(get_data(s3_fp_half, stats="nsim"), method="FP 0.5", dgm=3)
n[78,] <- c(get_data(s3_fp_one, stats="nsim"), method="FP 1", dgm=3)
n[79,] <- c(get_data(s3_fp_two, stats="nsim"), method="FP 2", dgm=3)
n[80,] <- c(get_data(s3_fp_three, stats="nsim"), method="FP 3", dgm=3)

n[81,] <- c(get_data(s4_fp_negtwo, stats="nsim"), method="FP -2", dgm=4)
n[82,] <- c(get_data(s4_fp_negone, stats="nsim"), method="FP -1", dgm=4)
n[83,] <- c(get_data(s4_fp_neghalf, stats="nsim"), method="FP -0.5", dgm=4)
n[84,] <- c(get_data(s4_fp_zero, stats="nsim"), method="FP 0", dgm=4)
n[85,] <- c(get_data(s4_fp_half, stats="nsim"), method="FP 0.5", dgm=4)
n[86,] <- c(get_data(s4_fp_one, stats="nsim"), method="FP 1", dgm=4)
n[87,] <- c(get_data(s4_fp_two, stats="nsim"), method="FP 2", dgm=4)
n[88,] <- c(get_data(s4_fp_three, stats="nsim"), method="FP 3", dgm=4)

n[89,] <- c(get_data(s5_fp_negtwo, stats="nsim"), method="FP -2", dgm=5)
n[90,] <- c(get_data(s5_fp_negone, stats="nsim"), method="FP -1", dgm=5)
n[91,] <- c(get_data(s5_fp_neghalf, stats="nsim"), method="FP -0.5", dgm=5)
n[92,] <- c(get_data(s5_fp_zero, stats="nsim"), method="FP 0", dgm=5)
n[93,] <- c(get_data(s5_fp_half, stats="nsim"), method="FP 0.5", dgm=5)
n[94,] <- c(get_data(s5_fp_one, stats="nsim"), method="FP 1", dgm=5)
n[95,] <- c(get_data(s5_fp_two, stats="nsim"), method="FP 2", dgm=5)
n[96,] <- c(get_data(s5_fp_three, stats="nsim"), method="FP 3", dgm=5)

n[97,] <- c(get_data(s6_fp_negtwo, stats="nsim"), method="FP -2", dgm=6)
n[98,] <- c(get_data(s6_fp_negone, stats="nsim"), method="FP -1", dgm=6)
n[99,] <- c(get_data(s6_fp_neghalf, stats="nsim"), method="FP -0.5", dgm=6)
n[100,] <- c(get_data(s6_fp_zero, stats="nsim"), method="FP 0", dgm=6)
n[101,] <- c(get_data(s6_fp_half, stats="nsim"), method="FP 0.5", dgm=6)
n[102,] <- c(get_data(s6_fp_one, stats="nsim"), method="FP 1", dgm=6)
n[103,] <- c(get_data(s6_fp_two, stats="nsim"), method="FP 2", dgm=6)
n[104,] <- c(get_data(s6_fp_three, stats="nsim"), method="FP 3", dgm=6)

n[105,] <- c(get_data(s7_fp_negtwo, stats="nsim"), method="FP -2", dgm=7)
n[106,] <- c(get_data(s7_fp_negone, stats="nsim"), method="FP -1", dgm=7)
n[107,] <- c(get_data(s7_fp_neghalf, stats="nsim"), method="FP -0.5", dgm=7)
n[108,] <- c(get_data(s7_fp_zero, stats="nsim"), method="FP 0", dgm=7)
n[109,] <- c(get_data(s7_fp_half, stats="nsim"), method="FP 0.5", dgm=7)
n[110,] <- c(get_data(s7_fp_one, stats="nsim"), method="FP 1", dgm=7)
n[111,] <- c(get_data(s7_fp_two, stats="nsim"), method="FP 2", dgm=7)
n[112,] <- c(get_data(s7_fp_three, stats="nsim"), method="FP 3", dgm=7)

n[113,] <- c(get_data(s8_fp_negtwo, stats="nsim"), method="FP -2", dgm=8)
n[114,] <- c(get_data(s8_fp_negone, stats="nsim"), method="FP -1", dgm=8)
n[115,] <- c(get_data(s8_fp_neghalf, stats="nsim"), method="FP -0.5", dgm=8)
n[116,] <- c(get_data(s8_fp_zero, stats="nsim"), method="FP 0", dgm=8)
n[117,] <- c(get_data(s8_fp_half, stats="nsim"), method="FP 0.5", dgm=8)
n[118,] <- c(get_data(s8_fp_one, stats="nsim"), method="FP 1", dgm=8)
n[119,] <- c(get_data(s8_fp_two, stats="nsim"), method="FP 2", dgm=8)
n[120,] <- c(get_data(s8_fp_three, stats="nsim"), method="FP 3", dgm=8)

n[121,] <- c(get_data(s9_pw1, stats="nsim"), method="pw_c1", dgm=9)
n[122,] <- c(get_data(s9_pw2, stats="nsim"), method="pw_c2", dgm=9)
n[123,] <- c(get_data(s9_pw3, stats="nsim"), method="pw_c3", dgm=9)

n[124,] <- c(get_data(s10_pw1, stats="nsim"), method="pw_c1", dgm=10)
n[125,] <- c(get_data(s10_pw2, stats="nsim"), method="pw_c2", dgm=10)
n[126,] <- c(get_data(s10_pw3, stats="nsim"), method="pw_c3", dgm=10)

n[127,] <- c(get_data(s11_pw1, stats="nsim"), method="pw_c1", dgm=11)
n[128,] <- c(get_data(s11_pw2, stats="nsim"), method="pw_c2", dgm=11)
n[129,] <- c(get_data(s11_pw3, stats="nsim"), method="pw_c3", dgm=11)

n[130,] <- c(get_data(s12_pw1, stats="nsim"), method="pw_c1", dgm=12)
n[131,] <- c(get_data(s12_pw2, stats="nsim"), method="pw_c2", dgm=12)
n[132,] <- c(get_data(s12_pw3, stats="nsim"), method="pw_c3", dgm=12)

n[133,] <- c(get_data(s9_rplnt1, stats="nsim"), method="rplnt1", dgm=9)
n[134,] <- c(get_data(s9_rplnt2, stats="nsim"), method="rplnt2", dgm=9)
n[135,] <- c(get_data(s9_rplnt3, stats="nsim"), method="rplnt3", dgm=9)
n[136,] <- c(get_data(s9_rplnt4, stats="nsim"), method="rplnt4", dgm=9)

n[137,] <- c(get_data(s10_rplnt1, stats="nsim"), method="rplnt1", dgm=10)
n[138,] <- c(get_data(s10_rplnt2, stats="nsim"), method="rplnt2", dgm=10)
n[139,] <- c(get_data(s10_rplnt3, stats="nsim"), method="rplnt3", dgm=10)
n[140,] <- c(get_data(s10_rplnt4, stats="nsim"), method="rplnt4", dgm=10)

n[141,] <- c(get_data(s11_rplnt1, stats="nsim"), method="rplnt1", dgm=11)
n[142,] <- c(get_data(s11_rplnt2, stats="nsim"), method="rplnt2", dgm=11)
n[143,] <- c(get_data(s11_rplnt3, stats="nsim"), method="rplnt3", dgm=11)
n[144,] <- c(get_data(s11_rplnt4, stats="nsim"), method="rplnt4", dgm=11)

n[145,] <- c(get_data(s12_rplnt1, stats="nsim"), method="rplnt1", dgm=12)
n[146,] <- c(get_data(s12_rplnt2, stats="nsim"), method="rplnt2", dgm=12)
n[147,] <- c(get_data(s12_rplnt3, stats="nsim"), method="rplnt3", dgm=12)
n[148,] <- c(get_data(s12_rplnt4, stats="nsim"), method="rplnt4", dgm=12)

n[149,] <- c(get_data(s9_fp_negtwo, stats="nsim"), method="FP -2", dgm=9)
n[150,] <- c(get_data(s9_fp_negone, stats="nsim"), method="FP -1", dgm=9)
n[151,] <- c(get_data(s9_fp_neghalf, stats="nsim"), method="FP -0.5", dgm=9)
n[152,] <- c(get_data(s9_fp_zero, stats="nsim"), method="FP 0", dgm=9)
n[153,] <- c(get_data(s9_fp_half, stats="nsim"), method="FP 0.5", dgm=9)
n[154,] <- c(get_data(s9_fp_one, stats="nsim"), method="FP 1", dgm=9)
n[155,] <- c(get_data(s9_fp_two, stats="nsim"), method="FP 2", dgm=9)
n[156,] <- c(get_data(s9_fp_three, stats="nsim"), method="FP 3", dgm=9)

n[157,] <- c(get_data(s10_fp_negtwo, stats="nsim"), method="FP -2", dgm=10)
n[158,] <- c(get_data(s10_fp_negone, stats="nsim"), method="FP -1", dgm=10)
n[159,] <- c(get_data(s10_fp_neghalf, stats="nsim"), method="FP -0.5", dgm=10)
n[160,] <- c(get_data(s10_fp_zero, stats="nsim"), method="FP 0", dgm=10)
n[161,] <- c(get_data(s10_fp_half, stats="nsim"), method="FP 0.5", dgm=10)
n[162,] <- c(get_data(s10_fp_one, stats="nsim"), method="FP 1", dgm=10)
n[163,] <- c(get_data(s10_fp_two, stats="nsim"), method="FP 2", dgm=10)
n[164,] <- c(get_data(s10_fp_three, stats="nsim"), method="FP 3", dgm=10)

n[165,] <- c(get_data(s11_fp_negtwo, stats="nsim"), method="FP -2", dgm=11)
n[166,] <- c(get_data(s11_fp_negone, stats="nsim"), method="FP -1", dgm=11)
n[167,] <- c(get_data(s11_fp_neghalf, stats="nsim"), method="FP -0.5", dgm=11)
n[168,] <- c(get_data(s11_fp_zero, stats="nsim"), method="FP 0", dgm=11)
n[169,] <- c(get_data(s11_fp_half, stats="nsim"), method="FP 0.5", dgm=11)
n[170,] <- c(get_data(s11_fp_one, stats="nsim"), method="FP 1", dgm=11)
n[171,] <- c(get_data(s11_fp_two, stats="nsim"), method="FP 2", dgm=11)
n[172,] <- c(get_data(s11_fp_three, stats="nsim"), method="FP 3", dgm=11)

n[173,] <- c(get_data(s12_fp_negtwo, stats="nsim"), method="FP -2", dgm=12)
n[174,] <- c(get_data(s12_fp_negone, stats="nsim"), method="FP -1", dgm=12)
n[175,] <- c(get_data(s12_fp_neghalf, stats="nsim"), method="FP -0.5", dgm=12)
n[176,] <- c(get_data(s12_fp_zero, stats="nsim"), method="FP 0", dgm=12)
n[177,] <- c(get_data(s12_fp_half, stats="nsim"), method="FP 0.5", dgm=12)
n[178,] <- c(get_data(s12_fp_one, stats="nsim"), method="FP 1", dgm=12)
n[179,] <- c(get_data(s12_fp_two, stats="nsim"), method="FP 2", dgm=12)
n[180,] <- c(get_data(s12_fp_three, stats="nsim"), method="FP 3", dgm=12)

n[181,] <- c(get_data(s1_pw4, stats="nsim"), method="pw2_6_12", dgm=1)
n[182,] <- c(get_data(s1_pw5, stats="nsim"), method="pw2_6_18", dgm=1)
n[183,] <- c(get_data(s1_pw6, stats="nsim"), method="pw2_12_18", dgm=1)

n[184,] <- c(get_data(s2_pw4, stats="nsim"), method="pw2_6_12", dgm=2)
n[185,] <- c(get_data(s2_pw5, stats="nsim"), method="pw2_6_18", dgm=2)
n[186,] <- c(get_data(s2_pw6, stats="nsim"), method="pw2_12_18", dgm=2)

n[187,] <- c(get_data(s3_pw4, stats="nsim"), method="pw2_6_12", dgm=3)
n[188,] <- c(get_data(s3_pw5, stats="nsim"), method="pw2_6_18", dgm=3)
n[189,] <- c(get_data(s3_pw6, stats="nsim"), method="pw2_12_18", dgm=3)

n[190,] <- c(get_data(s4_pw4, stats="nsim"), method="pw2_6_12", dgm=4)
n[191,] <- c(get_data(s4_pw5, stats="nsim"), method="pw2_6_18", dgm=4)
n[192,] <- c(get_data(s4_pw6, stats="nsim"), method="pw2_12_18", dgm=4)

n[193,] <- c(get_data(s5_pw4, stats="nsim"), method="pw2_6_12", dgm=5)
n[194,] <- c(get_data(s5_pw5, stats="nsim"), method="pw2_6_18", dgm=5)
n[195,] <- c(get_data(s5_pw6, stats="nsim"), method="pw2_12_18", dgm=5)

n[196,] <- c(get_data(s6_pw4, stats="nsim"), method="pw2_6_12", dgm=6)
n[197,] <- c(get_data(s6_pw5, stats="nsim"), method="pw2_6_18", dgm=6)
n[198,] <- c(get_data(s6_pw6, stats="nsim"), method="pw2_12_18", dgm=6)

n[199,] <- c(get_data(s7_pw4, stats="nsim"), method="pw2_6_12", dgm=7)
n[200,] <- c(get_data(s7_pw5, stats="nsim"), method="pw2_6_18", dgm=7)
n[201,] <- c(get_data(s7_pw6, stats="nsim"), method="pw2_12_18", dgm=7)

n[202,] <- c(get_data(s8_pw4, stats="nsim"), method="pw2_6_12", dgm=8)
n[203,] <- c(get_data(s8_pw5, stats="nsim"), method="pw2_6_18", dgm=8)
n[204,] <- c(get_data(s8_pw6, stats="nsim"), method="pw2_12_18", dgm=8)

n[205,] <- c(get_data(s9_pw4, stats="nsim"), method="pw2_6_12", dgm=9)
n[206,] <- c(get_data(s9_pw5, stats="nsim"), method="pw2_6_18", dgm=9)
n[207,] <- c(get_data(s9_pw6, stats="nsim"), method="pw2_12_18", dgm=9)

n[208,] <- c(get_data(s10_pw4, stats="nsim"), method="pw2_6_12", dgm=10)
n[209,] <- c(get_data(s10_pw5, stats="nsim"), method="pw2_6_18", dgm=10)
n[210,] <- c(get_data(s10_pw6, stats="nsim"), method="pw2_12_18", dgm=10)

n[211,] <- c(get_data(s11_pw4, stats="nsim"), method="pw2_6_12", dgm=11)
n[212,] <- c(get_data(s11_pw5, stats="nsim"), method="pw2_6_18", dgm=11)
n[213,] <- c(get_data(s11_pw6, stats="nsim"), method="pw2_12_18", dgm=11)

n[214,] <- c(get_data(s12_pw4, stats="nsim"), method="pw2_6_12", dgm=12)
n[215,] <- c(get_data(s12_pw5, stats="nsim"), method="pw2_6_18", dgm=12)
n[216,] <- c(get_data(s12_pw6, stats="nsim"), method="pw2_12_18", dgm=12)

n %>%
  write.csv("N_sims_sa.csv")
