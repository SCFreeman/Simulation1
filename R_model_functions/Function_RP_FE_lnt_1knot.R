# Royston-Parmar model in R - 1 knot

royston_parmar_fe_lnt_1knot <- function(df, num.sims, burn.in){
  
  data <- df
  
  # Put eventtime onto the ln scale
  data$lnt <- log(data$eventtime)
  
  # Create trt*lnt variable
  data$trtlnt <- data$treat*data$lnt
  
  # Total number of patients
  pts <- nrow(data)
  
  # Create new columns to be filled in 
  data$k1 <- numeric(pts)
  data$k2 <- numeric(pts)
  data$k3 <- numeric(pts)
  data$mv0 <- numeric(pts)
  data$sdv0 <- numeric(pts)
  data$t1 <- numeric(pts)
  data$t2 <- numeric(pts)
  data$t3 <- numeric(pts)
  data$a <- numeric(pts)
  data$b <- numeric(pts)
  data$c <- numeric(pts)
  data$phi1 <- numeric(pts)
  data$v0 <- numeric(pts)
  data$v1 <- numeric(pts)
  data$u0 <- numeric(pts)
  data$f <- numeric(pts)
  data$g <- numeric(pts)
  data$v1u0 <- numeric(pts)
  data$u0u0 <- numeric(pts)
  data$u1 <- numeric(pts)
  data$mu1 <- numeric(pts)
  data$sdu1 <- numeric(pts)
  data$u1n <- numeric(pts)
  data$du0 <- numeric(pts)
  data$k <- numeric(pts)
  data$l <- numeric(pts)
  data$du1n <- numeric(pts)

  # Set location of knots for each trial - 50th percentile of uncensored survival times
  # Need to calculate 50th percentile of uncensored survival times for each trial
  
  knots <- data.frame(trialid=1:num_studies, k1=numeric(num_studies), k2=numeric(num_studies), 
                      k3=numeric(num_studies))
  for (i in 1:num_studies) {
    k <- quantile(data$lnt[data$died==1 & data$trialid==i], c(0, 0.5, 1))
    knots[i,2] <- k[1]
    knots[i,3] <- k[2]
    knots[i,4] <- k[3]
  }
  
  # Add knot values to data
  for (i in 1:num_studies) {
    data$k1[data$trialid==i] <- knots$k1[i]
    data$k2[data$trialid==i] <- knots$k2[i]
    data$k3[data$trialid==i] <- knots$k3[i]
  }  
  
  # Let's attempt orthogonalisation
  data$t1 <- data$lnt-data$k2
  data$t2 <- data$lnt-data$k1
  data$t3 <- data$lnt-data$k3
  
  for (i in 1:pts) {
    data$a[i] <- max(c(data$t1[i], 0))
    data$b[i] <- max(c(data$t2[i], 0))
    data$c[i] <- max(c(data$t3[i], 0))
    
    data$phi1[i] <- (data$k3[i]-data$k2[i])/(data$k3[i]-data$k1[i])
    
    data$v0[i] <- data$lnt[i]
    data$v1[i] <- data$a[i]^3 - (data$phi1[i]*(data$b[i]^3)) - ((1-data$phi1[i])*(data$c[i]^3))
  }
  
  df1 <- data.frame(trialid=1:num_studies, mean=numeric(num_studies), sd=numeric(num_studies))
  for (i in 1:num_studies) {
    df1$mean[i] <- mean(data$v0[data$trialid==i])
    df1$sd[i] <- sd(data$v0[data$trialid==i])
  }
  
  # Add values back to data
  for (i in 1:num_studies) {
    data$mv0[data$trialid==i] <- df1$mean[i]
    data$sdv0[data$trialid==i] <- df1$sd[i]
  } 
  
  for (i in 1:pts) {
    data$u0[i] <- (data$v0[i]-data$mv0[i])/data$sdv0[i]
    data$f[i] <- data$v1[i]*data$u0[i]
    data$g[i] <- data$u0[i]*data$u0[i]
  }
  
  df2 <- data.frame(trialid=1:num_studies, v1u0=numeric(num_studies), u0u0=numeric(num_studies))
  for (i in 1:num_studies) {
    df2$v1u0[i] <- sum(data$f[data$trialid==i])
    df2$u0u0[i] <- sum(data$g[data$trialid==i])
  }
  
  # Add values back to data
  for (i in 1:num_studies) {
    data$v1u0[data$trialid==i] <- df2$v1u0[i]
    data$u0u0[data$trialid==i] <- df2$u0u0[i]
  }
  
  for (i in 1:pts) {
    data$u1[i] <- data$v1[i] - ((data$v1u0[i]/data$u0u0[i])*data$u0[i])
  }
  
  df3 <- data.frame(trialid=1:num_studies, mean=numeric(num_studies), sd=numeric(num_studies))
  for (i in 1:num_studies) {
    df3$mean[i] <- mean(data$u1[data$trialid==i])
    df3$sd[i] <- sd(data$u1[data$trialid==i])
  }
  
  # Add values back to data
  for (i in 1:num_studies) {
    data$mu1[data$trialid==i] <- df3$mean[i]
    data$sdu1[data$trialid==i] <- df3$sd[i]
  } 
  
  for (i in 1:pts) {
    data$u1n[i] <- (data$u1[i]-data$mu1[i])/data$sdu1[i]
  }
  
  for (i in 1:pts) {
    data$du0[i] <- 1/data$sdv0[i]
    data$k[i] <- (3*(data$a[i]^2)) -((3*data$phi1[i])*(data$b[i]^2))- (3*(1-data$phi1[i])*(data$c[i]^2))
    data$l[i] <- data$sdu1[i]
    data$du1n[i] <- (1/data$l[i])*data$k[i] - (((data$v1u0[i]/data$u0u0[i])/data$l[i])*data$du0[i])
  }
  
  offset <- c(0, numeric(num_studies))
  for (i in 1:num_studies) {
    offset[i+1] <- offset[i] + num_patients[i]
  }
  
  # Prepare to fit model in OpenBUGS
  
  # data
  bugs_data <- list(d=data$died, trt=data$treat, trtlnt=data$trtlnt, u0=data$u0, u1n=data$u1n, 
                    du0=data$du0, du1n=data$du1n, Ntrials=num_studies, offset=offset,
                    k0=knots$k1[4], k1=knots$k2[4], k2=knots$k3[4],
                    meanv0=df1$mean[4], sdv0=df1$sd[4], v1w0=df2$v1u0[4], w0w0=df2$u0u0[4],
                    meanw1=df3$mean[4], sdw1=df3$sd[4], nt=2)
  
  # Create initial values for model
  beta1 <- c(0.1, 0.2)
  beta2 <- c(0.2, 0.3)
  beta3 <- c(0.3, 0.1)
  
  gamma1 <- array(rep(c(0.2), 3*num_studies), dim=c(3,num_studies))
  gamma2 <- array(rep(c(0.4), 3*num_studies), dim=c(3,num_studies))
  gamma3 <- array(rep(c(0.1), 3*num_studies), dim=c(3,num_studies))
  
  inits <- list(list(beta=beta1, gamma=gamma1), 
                list(beta=beta2, gamma=gamma2),
                list(beta=beta3, gamma=gamma3))
  
  
  # OpenBUGS
  
  params <- c("rmstD", "beta")
  
  bugs.object<-try(R2OpenBUGS::bugs(data=bugs_data, inits=inits, 
                                    parameters.to.save=params, 
                                    model.file="Model_RP_FE_lnt_1knot.txt", clearWD=F, 
                                    summary.only=FALSE, n.iter=(num.sims+burn.in),
                                    n.burnin=burn.in, n.chains=3, 
                                    bugs.seed=3, 
                                    working.directory="/lustre/ahome3/s/scf20/Documents/Simulation/Scenario1/RP_lnt_1knot",
                                    debug=F))
  
  if(class(bugs.object)=="try-error"){
    print("error fitting in OpenBUGS")
    rp_results <- c(i=i, dgm=NA, knots=1,
                    rmstD=NA, rmstD_lci=NA, rmstD_uci=NA, rmstD_sd=NA,
                    beta1=NA, beta1_lci=NA, beta1_uci=NA, 
                    beta2=NA, beta2_lci=NA, beta2_uci=NA, 
                    beta1_Rhat=NA, beta2_Rhat=NA)
  } else { 
    
    results <- bugs.object$summary
    # Rows 1 is RMSTD at 50 years
    # Row 2 is beta1
    # Row 3 is beta2
    # Row 4 is deviance
    # Columns are mean, sd, 2.5%, 25%, 50%, 75%, 97.5%, Rhat, n.eff
    
    # Save results into a data frame (median and credible intervals)
    rp_results <- data.frame(i=data$i[1], dgm=data$dgm[1], knots=1,
                             rmstD=results[1,5], rmstD_lci=results[1,3], rmstD_uci=results[1,7], rmstD_sd=results[1,2],
                             beta1=results[2,5], beta1_lci=results[2,3], beta1_uci=results[2,7],
                             beta2=results[3,5], beta2_lci=results[3,3], beta2_uci=results[3,7],
                             beta1_Rhat=results[2,8], beta2_Rhat=results[3,8])
  }
  
  
  return(rp_results)
  
}

