rm(list=ls())

library(dplyr)
library(tidyverse)
library(rsimsum)

# Set working directory
source("an_functions.R")

# 2nd Order Fractional Polynomial - read in & format results
s1_2fp_df1 <- read.csv("Scenario 1/Results_2FP_df1.csv")
s1_2fp_df2 <- read.csv("Scenario 1/Results_2FP_df2.csv")
s2_2fp_df1 <- read.csv("Scenario 2/Results_2FP_df1.csv")
s2_2fp_df2 <- read.csv("Scenario 2/Results_2FP_df2.csv")
s3_2fp_df1 <- read.csv("Scenario 3/Results_2FP_df1.csv")
s3_2fp_df2 <- read.csv("Scenario 3/Results_2FP_df2.csv")
s4_2fp_df1 <- read.csv("Scenario 4/Results_2FP_df1.csv")
s4_2fp_df2 <- read.csv("Scenario 4/Results_2FP_df2.csv")
s5_2fp_df1 <- read.csv("Scenario 5/Results_2FP_df1.csv")
s5_2fp_df2 <- read.csv("Scenario 5/Results_2FP_df2.csv")
s6_2fp_df1 <- read.csv("Scenario 6/Results_2FP_df1.csv")
s6_2fp_df2 <- read.csv("Scenario 6/Results_2FP_df2.csv")
s7_2fp_df1 <- read.csv("Scenario 7/Results_2FP_df1.csv")
s7_2fp_df2 <- read.csv("Scenario 7/Results_2FP_df2.csv")
s8_2fp_df1 <- read.csv("Scenario 8/Results_2FP_df1.csv")
s8_2fp_df2 <- read.csv("Scenario 8/Results_2FP_df2.csv")
s9_2fp_df1 <- read.csv("Scenario 9/Results_2FP_df1.csv")
s9_2fp_df2 <- read.csv("Scenario 9/Results_2FP_df2.csv")
s10_2fp_df1 <- read.csv("Scenario 10/Results_2FP_df1.csv")
s10_2fp_df2 <- read.csv("Scenario 10/Results_2FP_df2.csv")
s11_2fp_df1 <- read.csv("Scenario 11/Results_2FP_df1.csv")
s11_2fp_df2 <- read.csv("Scenario 11/Results_2FP_df2.csv")
s12_2fp_df1 <- read.csv("Scenario 12/Results_2FP_df1.csv")
s12_2fp_df2 <- read.csv("Scenario 12/Results_2FP_df2.csv")

# Drop datasets were convergence was not achieved
s1_2fp_df1 <- s1_2fp_df1[s1_2fp_df1$d21_Rhat <1.05 & s1_2fp_df1$d22_Rhat <1.05 & s1_2fp_df1$d23_Rhat <1.05,]
s1_2fp_df2 <- s1_2fp_df2[s1_2fp_df2$d21_Rhat <1.05 & s1_2fp_df2$d22_Rhat <1.05 & s1_2fp_df2$d23_Rhat <1.05,]
s2_2fp_df1 <- s2_2fp_df1[s2_2fp_df1$d21_Rhat <1.05 & s2_2fp_df1$d22_Rhat <1.05 & s2_2fp_df1$d23_Rhat <1.05,]
s2_2fp_df2 <- s2_2fp_df2[s2_2fp_df2$d21_Rhat <1.05 & s2_2fp_df2$d22_Rhat <1.05 & s2_2fp_df2$d23_Rhat <1.05,]
s3_2fp_df1 <- s3_2fp_df1[s3_2fp_df1$d21_Rhat <1.05 & s3_2fp_df1$d22_Rhat <1.05 & s3_2fp_df1$d23_Rhat <1.05,]
s3_2fp_df2 <- s3_2fp_df2[s3_2fp_df2$d21_Rhat <1.05 & s3_2fp_df2$d22_Rhat <1.05 & s3_2fp_df2$d23_Rhat <1.05,]
s4_2fp_df1 <- s4_2fp_df1[s4_2fp_df1$d21_Rhat <1.05 & s4_2fp_df1$d22_Rhat <1.05 & s4_2fp_df1$d23_Rhat <1.05,]
s4_2fp_df2 <- s4_2fp_df2[s4_2fp_df2$d21_Rhat <1.05 & s4_2fp_df2$d22_Rhat <1.05 & s4_2fp_df2$d23_Rhat <1.05,]
s5_2fp_df1 <- s5_2fp_df1[s5_2fp_df1$d21_Rhat <1.05 & s5_2fp_df1$d22_Rhat <1.05 & s5_2fp_df1$d23_Rhat <1.05,]
s5_2fp_df2 <- s5_2fp_df2[s5_2fp_df2$d21_Rhat <1.05 & s5_2fp_df2$d22_Rhat <1.05 & s5_2fp_df2$d23_Rhat <1.05,]
s6_2fp_df1 <- s6_2fp_df1[s6_2fp_df1$d21_Rhat <1.05 & s6_2fp_df1$d22_Rhat <1.05 & s6_2fp_df1$d23_Rhat <1.05,]
s6_2fp_df2 <- s6_2fp_df2[s6_2fp_df2$d21_Rhat <1.05 & s6_2fp_df2$d22_Rhat <1.05 & s6_2fp_df2$d23_Rhat <1.05,]
s7_2fp_df1 <- s7_2fp_df1[s7_2fp_df1$d21_Rhat <1.05 & s7_2fp_df1$d22_Rhat <1.05 & s7_2fp_df1$d23_Rhat <1.05,]
s7_2fp_df2 <- s7_2fp_df2[s7_2fp_df2$d21_Rhat <1.05 & s7_2fp_df2$d22_Rhat <1.05 & s7_2fp_df2$d23_Rhat <1.05,]
s8_2fp_df1 <- s8_2fp_df1[s8_2fp_df1$d21_Rhat <1.05 & s8_2fp_df1$d22_Rhat <1.05 & s8_2fp_df1$d23_Rhat <1.05,]
s8_2fp_df2 <- s8_2fp_df2[s8_2fp_df2$d21_Rhat <1.05 & s8_2fp_df2$d22_Rhat <1.05 & s8_2fp_df2$d23_Rhat <1.05,]
s9_2fp_df1 <- s9_2fp_df1[s9_2fp_df1$d21_Rhat <1.05 & s9_2fp_df1$d22_Rhat <1.05 & s9_2fp_df1$d23_Rhat <1.05,]
s9_2fp_df2 <- s9_2fp_df2[s9_2fp_df2$d21_Rhat <1.05 & s9_2fp_df2$d22_Rhat <1.05 & s9_2fp_df2$d23_Rhat <1.05,]
s10_2fp_df1 <- s10_2fp_df1[s10_2fp_df1$d21_Rhat <1.05 & s10_2fp_df1$d22_Rhat <1.05 & s10_2fp_df1$d23_Rhat <1.05,]
s10_2fp_df2 <- s10_2fp_df2[s10_2fp_df2$d21_Rhat <1.05 & s10_2fp_df2$d22_Rhat <1.05 & s10_2fp_df2$d23_Rhat <1.05,]
s11_2fp_df1 <- s11_2fp_df1[s11_2fp_df1$d21_Rhat <1.05 & s11_2fp_df1$d22_Rhat <1.05 & s11_2fp_df1$d23_Rhat <1.05,]
s11_2fp_df2 <- s11_2fp_df2[s11_2fp_df2$d21_Rhat <1.05 & s11_2fp_df2$d22_Rhat <1.05 & s11_2fp_df2$d23_Rhat <1.05,]
s12_2fp_df1 <- s12_2fp_df1[s12_2fp_df1$d21_Rhat <1.05 & s12_2fp_df1$d22_Rhat <1.05 & s12_2fp_df1$d23_Rhat <1.05,]
s12_2fp_df2 <- s12_2fp_df2[s12_2fp_df2$d21_Rhat <1.05 & s12_2fp_df2$d22_Rhat <1.05 & s12_2fp_df2$d23_Rhat <1.05,]

# Format datasets
s1_2fp_df1 <- data_format(s1_2fp_df1, "FP2 -0.5 & 0")
s1_2fp_df2 <- data_format(s1_2fp_df2, "FP2 0.5 & 1")
s2_2fp_df1 <- data_format(s2_2fp_df1, "FP2 -0.5 & 0")
s2_2fp_df2 <- data_format(s2_2fp_df2, "FP2 0.5 & 1")
s3_2fp_df1 <- data_format(s3_2fp_df1, "FP2 -0.5 & 0")
s3_2fp_df2 <- data_format(s3_2fp_df2, "FP2 0.5 & 1")
s4_2fp_df1 <- data_format(s4_2fp_df1, "FP2 -0.5 & 0")
s4_2fp_df2 <- data_format(s4_2fp_df2, "FP2 0.5 & 1")
s5_2fp_df1 <- data_format(s5_2fp_df1, "FP2 -0.5 & 0")
s5_2fp_df2 <- data_format(s5_2fp_df2, "FP2 0.5 & 1")
s6_2fp_df1 <- data_format(s6_2fp_df1, "FP2 -0.5 & 0")
s6_2fp_df2 <- data_format(s6_2fp_df2, "FP2 0.5 & 1")
s7_2fp_df1 <- data_format(s7_2fp_df1, "FP2 -0.5 & 0")
s7_2fp_df2 <- data_format(s7_2fp_df2, "FP2 0.5 & 1")
s8_2fp_df1 <- data_format(s8_2fp_df1, "FP2 -0.5 & 0")
s8_2fp_df2 <- data_format(s8_2fp_df2, "FP2 0.5 & 1")
s9_2fp_df1 <- data_format(s9_2fp_df1, "FP2 -0.5 & 0")
s9_2fp_df2 <- data_format(s9_2fp_df2, "FP2 0.5 & 1")
s10_2fp_df1 <- data_format(s10_2fp_df1, "FP2 -0.5 & 0")
s10_2fp_df2 <- data_format(s10_2fp_df2, "FP2 0.5 & 1")
s11_2fp_df1 <- data_format(s11_2fp_df1, "FP2 -0.5 & 0")
s11_2fp_df2 <- data_format(s11_2fp_df2, "FP2 0.5 & 1")
s12_2fp_df1 <- data_format(s12_2fp_df1, "FP2 -0.5 & 0")
s12_2fp_df2 <- data_format(s12_2fp_df2, "FP2 0.5 & 1")

# Calculate performance measures
s1_2fp_df1 <- s1_2fp_df1 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s1_2fp_df2 <- s1_2fp_df2 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s2_2fp_df1 <- s2_2fp_df1 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s2_2fp_df2 <- s2_2fp_df2 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s3_2fp_df1 <- s3_2fp_df1 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s3_2fp_df2 <- s3_2fp_df2 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s4_2fp_df1 <- s4_2fp_df1 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s4_2fp_df2 <- s4_2fp_df2 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)


s5_2fp_df1 <- s5_2fp_df1 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s5_2fp_df2 <- s5_2fp_df2 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s6_2fp_df1 <- s6_2fp_df1 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s6_2fp_df2 <- s6_2fp_df2 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s7_2fp_df1 <- s7_2fp_df1 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s7_2fp_df2 <- s7_2fp_df2 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s8_2fp_df1 <- s8_2fp_df1 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s8_2fp_df2 <- s8_2fp_df2 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)


s9_2fp_df1 <- s9_2fp_df1 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s9_2fp_df2 <- s9_2fp_df2 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 29.20266)

s10_2fp_df1 <- s10_2fp_df1 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s10_2fp_df2 <- s10_2fp_df2 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 24.23841)

s11_2fp_df1 <- s11_2fp_df1 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s11_2fp_df2 <- s11_2fp_df2 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = 8.210516)

s12_2fp_df1 <- s12_2fp_df1 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)

s12_2fp_df2 <- s12_2fp_df2 %>%
  simsum(estvarname = "rmstD", se = "rmstD_sd", true = -20.77719)



# Build data frame with performance measures
df.bias <- data.frame(stat="NA", est=numeric(1), mcse=numeric(1), method="NA", dgm=numeric(1))

df.bias[1,] <- c(get_data(s1_2fp_df1, stats="bias"), method="FP -0.5 & 0", dgm=1)
df.bias[2,] <- c(get_data(s1_2fp_df1, stats="empse"), method="FP -0.5 & 0", dgm=1)
df.bias[3,] <- c(get_data(s1_2fp_df1, stats="mse"), method="FP -0.5 & 0", dgm=1)
df.bias[4,] <- c(get_data(s1_2fp_df1, stats="modelse"), method="FP -0.5 & 0", dgm=1)
df.bias[5,] <- c(get_data(s1_2fp_df1, stats="cover"), method="FP -0.5 & 0", dgm=1)

df.bias[6,] <- c(get_data(s1_2fp_df2, stats="bias"), method="FP 0.5 & 1", dgm=1)
df.bias[7,] <- c(get_data(s1_2fp_df2, stats="empse"), method="FP 0.5 & 1", dgm=1)
df.bias[8,] <- c(get_data(s1_2fp_df2, stats="mse"), method="FP 0.5 & 1", dgm=1)
df.bias[9,] <- c(get_data(s1_2fp_df2, stats="modelse"), method="FP 0.5 & 1", dgm=1)
df.bias[10,] <- c(get_data(s1_2fp_df2, stats="cover"), method="FP 0.5 & 1", dgm=1)

df.bias[11,] <- c(get_data(s2_2fp_df1, stats="bias"), method="FP -0.5 & 0", dgm=2)
df.bias[12,] <- c(get_data(s2_2fp_df1, stats="empse"), method="FP -0.5 & 0", dgm=2)
df.bias[13,] <- c(get_data(s2_2fp_df1, stats="mse"), method="FP -0.5 & 0", dgm=2)
df.bias[14,] <- c(get_data(s2_2fp_df1, stats="modelse"), method="FP -0.5 & 0", dgm=2)
df.bias[15,] <- c(get_data(s2_2fp_df1, stats="cover"), method="FP -0.5 & 0", dgm=2)

df.bias[16,] <- c(get_data(s2_2fp_df2, stats="bias"), method="FP 0.5 & 1", dgm=2)
df.bias[17,] <- c(get_data(s2_2fp_df2, stats="empse"), method="FP 0.5 & 1", dgm=2)
df.bias[18,] <- c(get_data(s2_2fp_df2, stats="mse"), method="FP 0.5 & 1", dgm=2)
df.bias[19,] <- c(get_data(s2_2fp_df2, stats="modelse"), method="FP 0.5 & 1", dgm=2)
df.bias[20,] <- c(get_data(s2_2fp_df2, stats="cover"), method="FP 0.5 & 1", dgm=2)

df.bias[21,] <- c(get_data(s3_2fp_df1, stats="bias"), method="FP -0.5 & 0", dgm=3)
df.bias[22,] <- c(get_data(s3_2fp_df1, stats="empse"), method="FP -0.5 & 0", dgm=3)
df.bias[23,] <- c(get_data(s3_2fp_df1, stats="mse"), method="FP -0.5 & 0", dgm=3)
df.bias[24,] <- c(get_data(s3_2fp_df1, stats="modelse"), method="FP -0.5 & 0", dgm=3)
df.bias[25,] <- c(get_data(s3_2fp_df1, stats="cover"), method="FP -0.5 & 0", dgm=3)

df.bias[26,] <- c(get_data(s3_2fp_df2, stats="bias"), method="FP 0.5 & 1", dgm=3)
df.bias[27,] <- c(get_data(s3_2fp_df2, stats="empse"), method="FP 0.5 & 1", dgm=3)
df.bias[28,] <- c(get_data(s3_2fp_df2, stats="mse"), method="FP 0.5 & 1", dgm=3)
df.bias[29,] <- c(get_data(s3_2fp_df2, stats="modelse"), method="FP 0.5 & 1", dgm=3)
df.bias[30,] <- c(get_data(s3_2fp_df2, stats="cover"), method="FP 0.5 & 1", dgm=3)

df.bias[31,] <- c(get_data(s4_2fp_df1, stats="bias"), method="FP -0.5 & 0", dgm=4)
df.bias[32,] <- c(get_data(s4_2fp_df1, stats="empse"), method="FP -0.5 & 0", dgm=4)
df.bias[33,] <- c(get_data(s4_2fp_df1, stats="mse"), method="FP -0.5 & 0", dgm=4)
df.bias[34,] <- c(get_data(s4_2fp_df1, stats="modelse"), method="FP -0.5 & 0", dgm=4)
df.bias[35,] <- c(get_data(s4_2fp_df1, stats="cover"), method="FP -0.5 & 0", dgm=4)

df.bias[36,] <- c(get_data(s4_2fp_df2, stats="bias"), method="FP 0.5 & 1", dgm=4)
df.bias[37,] <- c(get_data(s4_2fp_df2, stats="empse"), method="FP 0.5 & 1", dgm=4)
df.bias[38,] <- c(get_data(s4_2fp_df2, stats="mse"), method="FP 0.5 & 1", dgm=4)
df.bias[39,] <- c(get_data(s4_2fp_df2, stats="modelse"), method="FP 0.5 & 1", dgm=4)
df.bias[40,] <- c(get_data(s4_2fp_df2, stats="cover"), method="FP 0.5 & 1", dgm=4)

df.bias[41,] <- c(get_data(s5_2fp_df1, stats="bias"), method="FP -0.5 & 0", dgm=5)
df.bias[42,] <- c(get_data(s5_2fp_df1, stats="empse"), method="FP -0.5 & 0", dgm=5)
df.bias[43,] <- c(get_data(s5_2fp_df1, stats="mse"), method="FP -0.5 & 0", dgm=5)
df.bias[44,] <- c(get_data(s5_2fp_df1, stats="modelse"), method="FP -0.5 & 0", dgm=5)
df.bias[45,] <- c(get_data(s5_2fp_df1, stats="cover"), method="FP -0.5 & 0", dgm=5)

df.bias[46,] <- c(get_data(s5_2fp_df2, stats="bias"), method="FP 0.5 & 1", dgm=5)
df.bias[47,] <- c(get_data(s5_2fp_df2, stats="empse"), method="FP 0.5 & 1", dgm=5)
df.bias[48,] <- c(get_data(s5_2fp_df2, stats="mse"), method="FP 0.5 & 1", dgm=5)
df.bias[49,] <- c(get_data(s5_2fp_df2, stats="modelse"), method="FP 0.5 & 1", dgm=5)
df.bias[50,] <- c(get_data(s5_2fp_df2, stats="cover"), method="FP 0.5 & 1", dgm=5)

df.bias[51,] <- c(get_data(s6_2fp_df1, stats="bias"), method="FP -0.5 & 0", dgm=6)
df.bias[52,] <- c(get_data(s6_2fp_df1, stats="empse"), method="FP -0.5 & 0", dgm=6)
df.bias[53,] <- c(get_data(s6_2fp_df1, stats="mse"), method="FP -0.5 & 0", dgm=6)
df.bias[54,] <- c(get_data(s6_2fp_df1, stats="modelse"), method="FP -0.5 & 0", dgm=6)
df.bias[55,] <- c(get_data(s6_2fp_df1, stats="cover"), method="FP -0.5 & 0", dgm=6)

df.bias[56,] <- c(get_data(s6_2fp_df2, stats="bias"), method="FP 0.5 & 1", dgm=6)
df.bias[57,] <- c(get_data(s6_2fp_df2, stats="empse"), method="FP 0.5 & 1", dgm=6)
df.bias[58,] <- c(get_data(s6_2fp_df2, stats="mse"), method="FP 0.5 & 1", dgm=6)
df.bias[59,] <- c(get_data(s6_2fp_df2, stats="modelse"), method="FP 0.5 & 1", dgm=6)
df.bias[60,] <- c(get_data(s6_2fp_df2, stats="cover"), method="FP 0.5 & 1", dgm=6)

df.bias[61,] <- c(get_data(s7_2fp_df1, stats="bias"), method="FP -0.5 & 0", dgm=7)
df.bias[62,] <- c(get_data(s7_2fp_df1, stats="empse"), method="FP -0.5 & 0", dgm=7)
df.bias[63,] <- c(get_data(s7_2fp_df1, stats="mse"), method="FP -0.5 & 0", dgm=7)
df.bias[64,] <- c(get_data(s7_2fp_df1, stats="modelse"), method="FP -0.5 & 0", dgm=7)
df.bias[65,] <- c(get_data(s7_2fp_df1, stats="cover"), method="FP -0.5 & 0", dgm=7)

df.bias[66,] <- c(get_data(s7_2fp_df2, stats="bias"), method="FP 0.5 & 1", dgm=7)
df.bias[67,] <- c(get_data(s7_2fp_df2, stats="empse"), method="FP 0.5 & 1", dgm=7)
df.bias[68,] <- c(get_data(s7_2fp_df2, stats="mse"), method="FP 0.5 & 1", dgm=7)
df.bias[69,] <- c(get_data(s7_2fp_df2, stats="modelse"), method="FP 0.5 & 1", dgm=7)
df.bias[70,] <- c(get_data(s7_2fp_df2, stats="cover"), method="FP 0.5 & 1", dgm=7)

df.bias[71,] <- c(get_data(s8_2fp_df1, stats="bias"), method="FP -0.5 & 0", dgm=8)
df.bias[72,] <- c(get_data(s8_2fp_df1, stats="empse"), method="FP -0.5 & 0", dgm=8)
df.bias[73,] <- c(get_data(s8_2fp_df1, stats="mse"), method="FP -0.5 & 0", dgm=8)
df.bias[74,] <- c(get_data(s8_2fp_df1, stats="modelse"), method="FP -0.5 & 0", dgm=8)
df.bias[75,] <- c(get_data(s8_2fp_df1, stats="cover"), method="FP -0.5 & 0", dgm=8)

df.bias[76,] <- c(get_data(s8_2fp_df2, stats="bias"), method="FP 0.5 & 1", dgm=8)
df.bias[77,] <- c(get_data(s8_2fp_df2, stats="empse"), method="FP 0.5 & 1", dgm=8)
df.bias[78,] <- c(get_data(s8_2fp_df2, stats="mse"), method="FP 0.5 & 1", dgm=8)
df.bias[79,] <- c(get_data(s8_2fp_df2, stats="modelse"), method="FP 0.5 & 1", dgm=8)
df.bias[80,] <- c(get_data(s8_2fp_df2, stats="cover"), method="FP 0.5 & 1", dgm=8)

df.bias[81,] <- c(get_data(s9_2fp_df1, stats="bias"), method="FP -0.5 & 0", dgm=9)
df.bias[82,] <- c(get_data(s9_2fp_df1, stats="empse"), method="FP -0.5 & 0", dgm=9)
df.bias[83,] <- c(get_data(s9_2fp_df1, stats="mse"), method="FP -0.5 & 0", dgm=9)
df.bias[84,] <- c(get_data(s9_2fp_df1, stats="modelse"), method="FP -0.5 & 0", dgm=9)
df.bias[85,] <- c(get_data(s9_2fp_df1, stats="cover"), method="FP -0.5 & 0", dgm=9)

df.bias[86,] <- c(get_data(s9_2fp_df2, stats="bias"), method="FP 0.5 & 1", dgm=9)
df.bias[87,] <- c(get_data(s9_2fp_df2, stats="empse"), method="FP 0.5 & 1", dgm=9)
df.bias[88,] <- c(get_data(s9_2fp_df2, stats="mse"), method="FP 0.5 & 1", dgm=9)
df.bias[89,] <- c(get_data(s9_2fp_df2, stats="modelse"), method="FP 0.5 & 1", dgm=9)
df.bias[90,] <- c(get_data(s9_2fp_df2, stats="cover"), method="FP 0.5 & 1", dgm=9)

df.bias[91,] <- c(get_data(s10_2fp_df1, stats="bias"), method="FP -0.5 & 0", dgm=10)
df.bias[92,] <- c(get_data(s10_2fp_df1, stats="empse"), method="FP -0.5 & 0", dgm=10)
df.bias[93,] <- c(get_data(s10_2fp_df1, stats="mse"), method="FP -0.5 & 0", dgm=10)
df.bias[94,] <- c(get_data(s10_2fp_df1, stats="modelse"), method="FP -0.5 & 0", dgm=10)
df.bias[95,] <- c(get_data(s10_2fp_df1, stats="cover"), method="FP -0.5 & 0", dgm=10)

df.bias[96,] <- c(get_data(s10_2fp_df2, stats="bias"), method="FP 0.5 & 1", dgm=10)
df.bias[97,] <- c(get_data(s10_2fp_df2, stats="empse"), method="FP 0.5 & 1", dgm=10)
df.bias[98,] <- c(get_data(s10_2fp_df2, stats="mse"), method="FP 0.5 & 1", dgm=10)
df.bias[99,] <- c(get_data(s10_2fp_df2, stats="modelse"), method="FP 0.5 & 1", dgm=10)
df.bias[100,] <- c(get_data(s10_2fp_df2, stats="cover"), method="FP 0.5 & 1", dgm=10)

df.bias[101,] <- c(get_data(s11_2fp_df1, stats="bias"), method="FP -0.5 & 0", dgm=11)
df.bias[102,] <- c(get_data(s11_2fp_df1, stats="empse"), method="FP -0.5 & 0", dgm=11)
df.bias[103,] <- c(get_data(s11_2fp_df1, stats="mse"), method="FP -0.5 & 0", dgm=11)
df.bias[104,] <- c(get_data(s11_2fp_df1, stats="modelse"), method="FP -0.5 & 0", dgm=11)
df.bias[105,] <- c(get_data(s11_2fp_df1, stats="cover"), method="FP -0.5 & 0", dgm=11)

df.bias[106,] <- c(get_data(s11_2fp_df2, stats="bias"), method="FP 0.5 & 1", dgm=11)
df.bias[107,] <- c(get_data(s11_2fp_df2, stats="empse"), method="FP 0.5 & 1", dgm=11)
df.bias[108,] <- c(get_data(s11_2fp_df2, stats="mse"), method="FP 0.5 & 1", dgm=11)
df.bias[109,] <- c(get_data(s11_2fp_df2, stats="modelse"), method="FP 0.5 & 1", dgm=11)
df.bias[110,] <- c(get_data(s11_2fp_df2, stats="cover"), method="FP 0.5 & 1", dgm=11)

df.bias[111,] <- c(get_data(s12_2fp_df1, stats="bias"), method="FP -0.5 & 0", dgm=12)
df.bias[112,] <- c(get_data(s12_2fp_df1, stats="empse"), method="FP -0.5 & 0", dgm=12)
df.bias[113,] <- c(get_data(s12_2fp_df1, stats="mse"), method="FP -0.5 & 0", dgm=12)
df.bias[114,] <- c(get_data(s12_2fp_df1, stats="modelse"), method="FP -0.5 & 0", dgm=12)
df.bias[115,] <- c(get_data(s12_2fp_df1, stats="cover"), method="FP -0.5 & 0", dgm=12)

df.bias[116,] <- c(get_data(s12_2fp_df2, stats="bias"), method="FP 0.5 & 1", dgm=12)
df.bias[117,] <- c(get_data(s12_2fp_df2, stats="empse"), method="FP 0.5 & 1", dgm=12)
df.bias[118,] <- c(get_data(s12_2fp_df2, stats="mse"), method="FP 0.5 & 1", dgm=12)
df.bias[119,] <- c(get_data(s12_2fp_df2, stats="modelse"), method="FP 0.5 & 1", dgm=12)
df.bias[120,] <- c(get_data(s12_2fp_df2, stats="cover"), method="FP 0.5 & 1", dgm=12)

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
write.csv(df.bias, "results_fp2.csv")



# Table of datasets

# Build data frame with performance measures
n <- data.frame(stat="NA", est=numeric(1), mcse=numeric(1), method="NA", dgm=numeric(1))

n[1,] <- c(get_data(s1_2fp_df1, stats="nsim"), method="FP -0.5 & 0", dgm=1)
n[2,] <- c(get_data(s1_2fp_df2, stats="nsim"), method="FP 0.5 & 1", dgm=1)
n[3,] <- c(get_data(s2_2fp_df1, stats="nsim"), method="FP -0.5 & 0", dgm=2)
n[4,] <- c(get_data(s2_2fp_df2, stats="nsim"), method="FP 0.5 & 1", dgm=2)
n[5,] <- c(get_data(s3_2fp_df1, stats="nsim"), method="FP -0.5 & 0", dgm=3)
n[6,] <- c(get_data(s3_2fp_df2, stats="nsim"), method="FP 0.5 & 1", dgm=3)
n[7,] <- c(get_data(s4_2fp_df1, stats="nsim"), method="FP -0.5 & 0", dgm=4)
n[8,] <- c(get_data(s4_2fp_df2, stats="nsim"), method="FP 0.5 & 1", dgm=4)
n[9,] <- c(get_data(s5_2fp_df1, stats="nsim"), method="FP -0.5 & 0", dgm=5)
n[10,] <- c(get_data(s5_2fp_df2, stats="nsim"), method="FP 0.5 & 1", dgm=5)
n[11,] <- c(get_data(s6_2fp_df1, stats="nsim"), method="FP -0.5 & 0", dgm=6)
n[12,] <- c(get_data(s6_2fp_df2, stats="nsim"), method="FP 0.5 & 1", dgm=6)
n[13,] <- c(get_data(s7_2fp_df1, stats="nsim"), method="FP -0.5 & 0", dgm=7)
n[14,] <- c(get_data(s7_2fp_df2, stats="nsim"), method="FP 0.5 & 1", dgm=7)
n[15,] <- c(get_data(s8_2fp_df1, stats="nsim"), method="FP -0.5 & 0", dgm=8)
n[16,] <- c(get_data(s8_2fp_df2, stats="nsim"), method="FP 0.5 & 1", dgm=8)
n[17,] <- c(get_data(s9_2fp_df1, stats="nsim"), method="FP -0.5 & 0", dgm=9)
n[18,] <- c(get_data(s9_2fp_df2, stats="nsim"), method="FP 0.5 & 1", dgm=9)
n[19,] <- c(get_data(s10_2fp_df1, stats="nsim"), method="FP -0.5 & 0", dgm=10)
n[20,] <- c(get_data(s10_2fp_df2, stats="nsim"), method="FP 0.5 & 1", dgm=10)
n[21,] <- c(get_data(s11_2fp_df1, stats="nsim"), method="FP -0.5 & 0", dgm=11)
n[22,] <- c(get_data(s11_2fp_df2, stats="nsim"), method="FP 0.5 & 1", dgm=11)
n[23,] <- c(get_data(s12_2fp_df1, stats="nsim"), method="FP -0.5 & 0", dgm=12)
n[24,] <- c(get_data(s12_2fp_df2, stats="nsim"), method="FP 0.5 & 1", dgm=12)

n %>%
  write.csv("N_sims_fp2.csv")
