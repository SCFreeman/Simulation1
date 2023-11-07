# Simulation1

Fit_PE_FE_one - fits the piecewise exponential model with one cut point. Note you will need to specify on line 71 which cut point you wish to include within your model. 
Fit_PE_FE_two - fits the piecewise exponential model with two cut points. Note you will need to specify on line 74 which cut points you wish to include within your model. 

Additional notes
1. You will need to change the file location to your own working directory and set your own file pathway to OpenBUGS within the R function files.
2. There are no data generating files for scenarios 9-12 becuase the data is the same as scenarios 1-4.
3. Scenarios 5-8 - When running the R files "Fit_RP_FE_1knot", "Fit_RP_FE_2knots", "Fit_RP_FE_3knots" and "Fit_RP_FE_4knots" you will need to change the number of studies in each meta-analysis (line 30) and the number of patients in each study (line 33) to reflect that there are 10 studies in each meta-analysis. 
4. Scenarios 5-8 - When running the R files "Fit_PE_FE_one" and "Fit_PE_FE_two" you will need to change the number of studies in each meta-analysis (line 28) to reflect that there are 10 studies in each meta-analysis. 
