# Function to fit second order fixed effect Fractional Polynomial models in BUGS

fp_secondorder_fe <- function(data, P1, P2, num.sims, burn.in, maxt){
  
  # Length of time intervals
  data$length <- data$time-data$start
  
  # Number of treatments
  nt <- length(unique(data$treatment))
  
  # Number of studies
  ns <- length(unique(data$trialid)) 
  
  # Number of rows in dataset
  N <- nrow(data)
  
  # Maximum time 
  maxt <- maxt
  
  # Mean & precision
  mean <- c(0,0, 0)
  prec <- array(c(0.0001, 0, 0, 0, 0.0001, 0, 0, 0, 0.0001), dim=c(3,3))
  
  # Vector of number of  treatment arms in each trial
  na <- c(rep(2, ns))
  
  # Array of which treatment is received in each arm of each trial
  # Fills down the columns first
  t <- array(data=c(rep(1, ns), rep(2, ns)), dim=c(ns, nt))
  
  
  # Prepare to fit model in BUGS
  
  bugs_data <- list(s=data$trialid, r=data$nevents, z=data$natrisk, a=data$treatnumf, time=data$time,
                    dt=data$length, P1=P1, P2=P2, N=N, nt=nt, ns=ns, mean=mean, prec=prec,
                    t=t,  na=na, maxt=maxt)
  
  # Create initial values for model
  d1 <- array(c(NA, rep(0.1, nt-1), NA, rep(0.2, nt-1), NA, rep(-0.1, nt-1)), dim=c(nt,3))
  d2 <- array(c(NA, rep(0.2, nt-1), NA, rep(-0.1, nt-1), NA, rep(0.1, nt-1)), dim=c(nt,3))
  d3 <- array(c(NA, rep(-0.1, nt-1), NA, rep(0.1, nt-1), NA, rep(0.2, nt-1)), dim=c(nt,3))
  
  mu1 <- array(rep(0.4,ns*3), dim=c(ns,3))
  mu2 <- array(rep(0.1,ns*3), dim=c(ns,3))
  mu3 <- array(rep(0.3,ns*3), dim=c(ns,3))
  
  inits <- list(list(d=d1, mu=mu1), 
                list(d=d2, mu=mu2),
                list(d=d3, mu=mu3))
  
  params <- c("rmstD", "d")
  
  bugs.object<-try(R2OpenBUGS::bugs(data=bugs_data, inits=inits, 
                                    parameters.to.save=params, 
                                    model.file="Model_FP_2ndOrder_FE.txt", clearWD=F, 
                                    summary.only=FALSE, n.iter=(num.sims+burn.in),
                                    n.burnin=burn.in, n.chains=3, 
                                    bugs.seed=3, 
                                    working.directory="/alice-home/2/s/scf20/Documents/Example_HPC/FP2",
                                    debug=F, OpenBUGS.pgm="/alice-home/2/s/scf20/bin/OpenBUGS"))
  
  if(class(bugs.object)=="try-error"){
    print("error fitting in OpenBUGS")
    fp_results <- c(p1=P1, p2=P2,
                    rmstD=NA, rmstD_lci=NA, rmstD_uci=NA, rmstD_sd=NA,
                    d21=NA, d21_lci=NA, d21_uci=NA,
                    d22=NA, d22_lci=NA, d22_uci=NA,
                    d23=NA, d23_lci=NA, d23_uci=NA,
                    d21_Rhat=NA, d22_Rhat=NA, d23_Rhat=NA)
  } else { 
    results <- bugs.object$summary
    # Row 1 is RMST Difference at 50 years
    # Row 2 is d[2,1]
    # Row 3 is d[2,2]
    # Row 4 is deviance
    # Columns are mean, sd, 2.5%, 25%, 50%, 75%, 97.5%, Rhat, n.eff
    
    # Save results into a data frame (median and credible intervals)
    fp_results <- data.frame(p1=P1, p2=P2,
                             rmstD=results[1,5], rmstD_lci=results[1,3], rmstD_uci=results[1,7], rmstD_sd=results[1,2],
                             d21=results[2,5], d21_lci=results[2,3], d21_uci=results[2,7],
                             d22=results[3,5], d22_lci=results[3,3], d22_uci=results[3,7],
                             d23=results[4,5], d23_lci=results[4,3], d23_uci=results[4,7],
                             d21_Rhat=results[2,8], d22_Rhat=results[3,8], d23_Rhat=results[4,8])
  }
  return(fp_results)
  
}

