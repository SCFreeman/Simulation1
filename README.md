# Simulation1

This repository contains the R code to accompany the paper "Bayesian pairwise meta-analysis of time-to-event outcomes in the presence of non-proportional hazards: A simulation study of flexible parametric, piecewise exponential and fractional polynomial models" by Freeman et al. 

The folder OpenBUGS_model_txt_files contains .txt files with the model to be fitted written in BUGS code.

The folder R_data_gen_functions contains two R functions needed for generating data.

The folder R_files_to_run_models contains R code for running each model. These files call the functions from R_model_functions. 

The folder R_model_functions contains R functions which call OpenBUGS and fit the models. The files call the files from the folder OpenBUGS_model_txt_files.

The folders Scenario1, ..., Scenario8 contain R code to generate the datasets for each scenario. These files call the functions from the folder R_data_gen_functions. There are no data generating files for scenarios 9-12 becuase the data is the same as scenarios 1-4.

The folder BreastCancerData contains the reconstrcted IPD for the metastatic breast cancer example presented in the paper. 
