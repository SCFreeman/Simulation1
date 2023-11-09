# Generate survival data using the function simdata

library(survival)
library(simsurv)
library(foreach)
library(splitstackshape)


######  INPUTS FOR GENERATING DATA #####

# Number of treatments
num_trt <- 2

# Number of studies in each meta-analysis
num_studies <- 10

# Number of patients in each study
num_patients <- c(108,250,423,495,524,187,298,324,375,444)

# Allocation ratio for each study
alloc <- c(rep(0.5, num_studies))

# Length of follow-up for each study (in months)
fu <- seq(2, 5, length.out=num_studies)

# Average treatment effect across all studies
beta <- -0.5

# Degree of non-proportional hazards
# Allow treatment effect to diminsh over time
nph <- 0.2

# Number of DGMs for mixture Weibull model & parameters
dgm <- 1
lambdas <- c(0.1, 0.3)
gammas <- c(0.9, 1)
pi <- 0.5

# Number of datasets to generate
B <- 525

########################################

# GENERATE INDIVIDUAL PARTICIPANT DATA

# Load function
source("Function_simdata.R")

# Two DGM's
# Use the function simdata to generate data for mixture weibull model
df.list <- list()
set.seed(2020)
dfs <- foreach(j=dgm) %do% {
  
  if (j==1){
    k=c(1,2)
  }else if (j==2) {
    k=c(3,4)
  }
  
  foreach(i=1:B) %do% {
    message("Dataset i=", i, ", j=", j)
    data <- simdata(i=i, dgm=j, lambda=lambdas[k], gamma=gammas[k], beta=beta, pi=pi,
                    num_studies=num_studies, num_patients=num_patients,
                     alloc=alloc, fu=fu, nph=nph)
    data$eventtime <- data$eventtime*12 # Convert years to months
    name <- paste("ma", i, j, sep = "")
    assign(name, data)
    df.list[[name]] <- data
    write.csv(data, paste("data",i , j, ".csv", sep="_"))
  }
}

