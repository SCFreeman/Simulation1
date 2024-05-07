# Fit piecewise model in OpenBUGS
# 18th July 2023
# Suzanne Freeman


piecewise_two_cut_try_1218 <- function(data, num.sims, burn.in, cutpoint1, cutpoint2){
  
  # cutpoint is a location so need to pull the actual value out of cutpoints
  #cut <- cutpoints[cutpoint]
  cut1 <- cutpoint1
  cut2 <- cutpoint2
  
  # Need to create z1 variable in data frame for the cut point
  data$z1[data$time<=cut1] <- 0
  data$z1[data$time>cut1] <- 1
  
  # Need to create z1 variable in data frame for the cut point
  data$z2[data$time<=cut2] <- 0
  data$z2[data$time>cut2] <- 1
  
  # No. of rows in data
  N <- nrow(data)
  
  # No. of time intervals 
  ints <- length(timepoints2)
  
  #-----------------------------------------------------------------------------
  # Data
  #-----------------------------------------------------------------------------
  
  # N=rows of data, ints=no. of time intervals, J=no. of studies, ntrt=no. of trts (NMA only)
  ma_data <- list(spgrp=data$spgrp, y=data$y, d=data$nevents, trialid=data$trialid, treatment=data$treatment,
                  z1=data$z1, z2=data$z2, N=N, ints=ints, J=num_studies, ntrt=num_trt, nt=2)
  
  
  #-----------------------------------------------------------------------------
  # Model
  #-----------------------------------------------------------------------------
  
  # Create initial values for model
  alpha1 <- 0.1
  alpha2 <- 0.2
  alpha3 <- 0.5
  
  # beta is a matrix (no. of trials by no.of time intervals)
  beta1 <- array(rep(c(0.1),num_studies*ints), dim=c(num_studies,ints))
  beta2 <- array(rep(c(0.2),num_studies*ints), dim=c(num_studies,ints))
  beta3 <- array(rep(c(0.3),num_studies*ints), dim=c(num_studies,ints))
  
  inits <- list(list(alpha=alpha1, beta=beta1), 
                list(alpha=alpha2, beta=beta2),
                list(alpha=alpha3, beta=beta3))
  
  params <- c("rmstD", "alpha", "phi1", "phi2")
  
  # Run OpenBUGS
  bugs.object<-try(R2OpenBUGS::bugs(data=ma_data, inits=inits, 
                                    parameters.to.save=params, 
                                    model.file="Model_PE_FE_two.txt", clearWD=F, 
                                    summary.only=FALSE, n.iter=(num.sims+burn.in),
                                    n.burnin=burn.in, n.chains=3, 
                                    bugs.seed=3, 
                                    working.directory="/alice-home/2/s/scf20/Documents/Example_HPC/PE_cut12_18", 
                                    debug=F, OpenBUGS.pgm="/alice-home/2/s/scf20/bin/OpenBUGS"))
  
  if(class(bugs.object)=="try-error"){
    print("error fitting in OpenBUGS")
    pe_results <- c(rmstD=NA, rmstD_lci=NA, rmstD_uci=NA, rmstD_sd=NA,
                    alpha=NA, alpha_lci=NA, alpha_uci=NA,
                    phi1=NA, phi1_lci=NA, phi1_uci=NA,
                    phi2=NA, phi2_lci=NA, phi2_uci=NA,
                    alpha_Rhat=NA, phi1_Rhat=NA, phi2_Rhat=NA)
  } else { 
    
    results <- bugs.object$summary
    
    # Row 1 is RMST Difference at 50 years
    # Row 2 is alpha
    # Row 3 is phi1
    # Row 4 is deviance
    # Columns are mean, sd, 2.5%, 25%, 50%, 75%, 97.5%, Rhat, n.eff
    
    # Save results into a data frame (median and credible intervals)
    pe_results <- data.frame(rmstD=results[1,5], rmstD_lci=results[1,3], rmstD_uci=results[1,7], rmstD_sd=results[1,2],
                             alpha=results[2,5], alpha_lci=results[2,3], alpha_uci=results[2,7],
                             phi1=results[3,5], phi1_lci=results[3,3], phi1_uci=results[3,7],
                             phi2=results[4,5], phi2_lci=results[4,3], phi2_uci=results[4,7],
                             alpha_Rhat=results[2,8], phi1_Rhat=results[3,8], phi2_Rhat=results[4,8])
  }
  return(pe_results)
  
}
