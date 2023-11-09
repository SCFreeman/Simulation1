# Royston-Parmar model in R with 4 knots

royston_parmar_fe_lnt_4knots <- function(df, num.sims, burn.in){

  data <- df
  
  # Put eventtime onto the ln scale
  data$lnt <- log(data$eventtime)
  
  # Create trt*lnt variable
  data$trtlnt <- data$treat*data$lnt
  
  # Total number of patients
  pts <- nrow(data)
  
  # Create new columns to be filled in - not strictly needed but programme runs quicker with it
  data$k1 <- numeric(pts)
  data$k2 <- numeric(pts)
  data$k3 <- numeric(pts)
  data$k4 <- numeric(pts)
  data$k5 <- numeric(pts)
  data$k6 <- numeric(pts)
  data$t1 <- numeric(pts)
  data$t2 <- numeric(pts)
  data$t3 <- numeric(pts)
  data$t4 <- numeric(pts)
  data$t5 <- numeric(pts)
  data$t6 <- numeric(pts)
  data$a <- numeric(pts)
  data$b <- numeric(pts)
  data$c <- numeric(pts)
  data$e <- numeric(pts)
  data$p <- numeric(pts)
  data$q <- numeric(pts)
  data$phi1 <- numeric(pts)
  data$phi2 <- numeric(pts)
  data$phi3 <- numeric(pts)
  data$phi4 <- numeric(pts)
  data$v0 <- numeric(pts)
  data$v1 <- numeric(pts)
  data$v2 <- numeric(pts)
  data$v3 <- numeric(pts)
  data$v4 <- numeric(pts)
  data$mv0 <- numeric(pts)
  data$sdv0 <- numeric(pts)
  data$u0 <- numeric(pts)
  data$f <- numeric(pts)
  data$g <- numeric(pts)
  data$v1u0 <- numeric(pts)
  data$u0u0 <- numeric(pts)
  data$u1 <- numeric(pts)
  data$mu1 <- numeric(pts)
  data$sdu1 <- numeric(pts)
  data$u1n <- numeric(pts)
  data$h <- numeric(pts)
  data$aa <- numeric(pts)
  data$j <- numeric(pts)
  data$v2u0 <- numeric(pts)
  data$v2u1n <- numeric(pts)
  data$u1nu1n <- numeric(pts)
  data$u2 <- numeric(pts)
  data$mu2 <- numeric(pts)
  data$sdu2 <- numeric(pts)
  data$u2n <- numeric(pts)
  data$r <- numeric(pts)
  data$s <- numeric(pts)
  data$bb <- numeric(pts)
  data$cc <- numeric(pts)
  data$v3u0 <- numeric(pts)
  data$v3u1n <- numeric(pts)
  data$v3u2n <- numeric(pts)
  data$u2nu2n <- numeric(pts)
  data$u3<- numeric(pts)
  data$mu3 <- numeric(pts)
  data$sdu3 <- numeric(pts)
  data$u3n <- numeric(pts)
  data$dd <- numeric(pts)
  data$ee <- numeric(pts)
  data$ff <- numeric(pts)
  data$gg <- numeric(pts)
  data$hh <- numeric(pts)
  data$v4u0 <- numeric(pts)
  data$v4u1n <- numeric(pts)
  data$v4u2n <- numeric(pts)
  data$v4u3n <- numeric(pts)
  data$u3nu3n <- numeric(pts)
  data$u4 <- numeric(pts)
  data$mu4 <- numeric(pts)
  data$sdu4 <- numeric(pts)
  data$u4n <- numeric(pts)
  data$du0 <- numeric(pts)
  data$k <- numeric(pts)
  data$l <- numeric(pts)
  data$du1n <- numeric(pts)
  data$m <- numeric(pts)
  data$n <- numeric(pts)
  data$du2n <- numeric(pts)
  data$ii <- numeric(pts)
  data$kk <- numeric(pts)
  data$du3n <- numeric(pts)
  data$jj <- numeric(pts)
  data$ll <- numeric(pts)
  data$du4n <- numeric(pts)
  
  # Set location of knots for each trial - 20th, 40th, 60th and 80th percentiles of uncensored survival times
  # Need to calculate perentiles of uncensored survival times for each trial
  
  knots <- data.frame(trialid=1:num_studies, k1=numeric(num_studies), k2=numeric(num_studies), 
                      k3=numeric(num_studies), k4=numeric(num_studies), k5=numeric(num_studies),
                      k6=numeric(num_studies))
  for (i in 1:num_studies) {
    k <- quantile(data$lnt[data$died==1 & data$trialid==i], c(0, 0.2, 0.4, 0.6, 0.8, 1))
    knots[i,2] <- k[1]
    knots[i,3] <- k[2]
    knots[i,4] <- k[3]
    knots[i,5] <- k[4]
    knots[i,6] <- k[5]
    knots[i,7] <- k[6]
  }
  
  # Add knot values to data
  for (i in 1:num_studies) {
    data$k1[data$trialid==i] <- knots$k1[i]
    data$k2[data$trialid==i] <- knots$k2[i]
    data$k3[data$trialid==i] <- knots$k3[i]
    data$k4[data$trialid==i] <- knots$k4[i]
    data$k5[data$trialid==i] <- knots$k5[i]
    data$k6[data$trialid==i] <- knots$k6[i]
  }  
  
  # Let's attempt orthogonalisation
  data$t1 <- data$lnt-data$k1
  data$t2 <- data$lnt-data$k2
  data$t3 <- data$lnt-data$k3
  data$t4 <- data$lnt-data$k4
  data$t5 <- data$lnt-data$k5
  data$t6 <- data$lnt-data$k6
  
  for (i in 1:pts) {
    data$a[i] <- max(c(data$t1[i], 0))
    data$b[i] <- max(c(data$t2[i], 0))
    data$c[i] <- max(c(data$t3[i], 0))
    data$e[i] <- max(c(data$t4[i], 0))
    data$p[i] <- max(c(data$t5[i], 0))
    data$q[i] <- max(c(data$t6[i], 0))
    
    data$phi1[i] <- (data$k6[i]-data$k2[i])/(data$k6[i]-data$k1[i])
    data$phi2[i] <- (data$k6[i]-data$k3[i])/(data$k6[i]-data$k1[i])
    data$phi3[i] <- (data$k6[i]-data$k4[i])/(data$k6[i]-data$k1[i])
    data$phi4[i] <- (data$k6[i]-data$k5[i])/(data$k6[i]-data$k1[i])
    
    data$v0[i] <- data$lnt[i]
    data$v1[i] <- data$b[i]^3 - (data$phi1[i]*(data$a[i]^3)) - ((1-data$phi1[i])*(data$q[i]^3))
    data$v2[i] <- data$c[i]^3 - (data$phi2[i]*(data$a[i]^3)) - ((1-data$phi2[i])*(data$q[i]^3))
    data$v3[i] <- data$e[i]^3 - (data$phi3[i]*(data$a[i]^3)) - ((1-data$phi3[i])*(data$q[i]^3))
    data$v4[i] <- data$p[i]^3 - (data$phi4[i]*(data$a[i]^3)) - ((1-data$phi4[i])*(data$q[i]^3))
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
    data$h[i] <- data$v2[i]*data$u0[i]
    data$aa[i] <- data$v2[i]*data$u1n[i]
    data$j[i] <- data$u1n[i]*data$u1n[i]
  }
  
  df4 <- data.frame(trialid=1:num_studies, v2u0=numeric(num_studies), v2u1n=numeric(num_studies), 
                    u1nu1n=numeric(num_studies))
  for (i in 1:num_studies) {
    df4$v2u0[i] <- sum(data$h[data$trialid==i])
    df4$v2u1n[i] <- sum(data$aa[data$trialid==i])
    df4$u1nu1n[i] <- sum(data$j[data$trialid==i])
  }
  
  # Add values back to data
  for (i in 1:num_studies) {
    data$v2u0[data$trialid==i] <- df4$v2u0[i]
    data$v2u1n[data$trialid==i] <- df4$v2u1n[i]
    data$u1nu1n[data$trialid==i] <- df4$u1nu1n[i]
  }
  
  for (i in 1:pts) {
    data$u2[i] <- data$v2[i] - ((data$v2u0[i]/data$u0u0[i])*data$u0[i]) - ((data$v2u1n[i]/data$u1nu1n[i])*data$u1n[i])
    }
  
  df5 <- data.frame(trialid=1:num_studies, mean=numeric(num_studies), sd=numeric(num_studies))
  for (i in 1:num_studies) {
    df5$mean[i] <- mean(data$u2[data$trialid==i])
    df5$sd[i] <- sd(data$u2[data$trialid==i])
  }
  
  # Add values back to data
  for (i in 1:num_studies) {
    data$mu2[data$trialid==i] <- df5$mean[i]
    data$sdu2[data$trialid==i] <- df5$sd[i]
  } 
  
  for (i in 1:pts) {
    data$u2n[i] <- (data$u2[i]-data$mu2[i])/data$sdu2[i]
    data$r[i] <- data$v3[i]*data$u0[i]
    data$s[i] <- data$v3[i]*data$u1n[i]
    data$bb[i] <- data$v3[i]*data$u2n[i]
    data$cc[i] <- data$u2n[i]*data$u2n[i]
  }
  
  df6 <- data.frame(trialid=1:num_studies, v3u0=numeric(num_studies), v3u1n=numeric(num_studies), 
                    v3u2n=numeric(num_studies), u2nu2n=numeric(num_studies))
  for (i in 1:num_studies) {
    df6$v3u0[i] <- sum(data$r[data$trialid==i])
    df6$v3u1n[i] <- sum(data$s[data$trialid==i])
    df6$v3u2n[i] <- sum(data$bb[data$trialid==i])
    df6$u2nu2n[i] <- sum(data$cc[data$trialid==i])
  }
  
  # Add values back to data
  for (i in 1:num_studies) {
    data$v3u0[data$trialid==i] <- df6$v3u0[i]
    data$v3u1n[data$trialid==i] <- df6$v3u1n[i]
    data$v3u2n[data$trialid==i] <- df6$v3u2n[i]
    data$u2nu2n[data$trialid==i] <- df6$u2nu2n[i]
  }
  
  for (i in 1:pts) {
    data$u3[i] <- data$v3[i] - ((data$v3u0[i]/data$u0u0[i])*data$u0[i]) - ((data$v3u1n[i]/data$u1nu1n[i])*data$u1n[i]) - ((data$v3u2n[i]/data$u2nu2n[i])*data$u2n[i])
  } 
  
  df7 <- data.frame(trialid=1:num_studies, mean=numeric(num_studies), sd=numeric(num_studies))
  for (i in 1:num_studies) {
    df7$mean[i] <- mean(data$u3[data$trialid==i])
    df7$sd[i] <- sd(data$u3[data$trialid==i])
  }
  
  # Add values back to data
  for (i in 1:num_studies) {
    data$mu3[data$trialid==i] <- df7$mean[i]
    data$sdu3[data$trialid==i] <- df7$sd[i]
  } 
  
  for (i in 1:pts) {
    data$u3n[i] <- (data$u3[i]-data$mu3[i])/data$sdu3[i]
    data$dd[i] <- data$v4[i]*data$u0[i]
    data$ee[i] <- data$v4[i]*data$u1n[i]
    data$ff[i] <- data$v4[i]*data$u2n[i]
    data$gg[i] <- data$v4[i]*data$u3n[i]
    data$hh[i] <- data$u3n[i]*data$u3n[i]
  }
  
  df8 <- data.frame(trialid=1:num_studies, v4u0=numeric(num_studies), v4u1n=numeric(num_studies), 
                    v4u2n=numeric(num_studies), v4u3n=numeric(num_studies), u3nu3n=numeric(num_studies))
  for (i in 1:num_studies) {
    df8$v4u0[i] <- sum(data$dd[data$trialid==i])
    df8$v4u1n[i] <- sum(data$ee[data$trialid==i])
    df8$v4u2n[i] <- sum(data$ff[data$trialid==i])
    df8$v4u3n[i] <- sum(data$gg[data$trialid==i])
    df8$u3nu3n[i] <- sum(data$hh[data$trialid==i])
  }
  
  # Add values back to data
  for (i in 1:num_studies) {
    data$v4u0[data$trialid==i] <- df8$v4u0[i]
    data$v4u1n[data$trialid==i] <- df8$v4u1n[i]
    data$v4u2n[data$trialid==i] <- df8$v4u2n[i]
    data$v4u3n[data$trialid==i] <- df8$v4u3n[i]
    data$u3nu3n[data$trialid==i] <- df8$u3nu3n[i]
  }
  
  for (i in 1:pts) {
    data$u4[i] <- data$v4[i] - ((data$v4u0[i]/data$u0u0[i])*data$u0[i]) - ((data$v4u1n[i]/data$u1nu1n[i])*data$u1n[i]) - ((data$v4u2n[i]/data$u2nu2n[i])*data$u2n[i]) - ((data$v4u3n[i]/data$u3nu3n[i])*data$u3n[i])
  }
  
  df9 <- data.frame(trialid=1:num_studies, mean=numeric(num_studies), sd=numeric(num_studies))
  for (i in 1:num_studies) {
    df9$mean[i] <- mean(data$u4[data$trialid==i])
    df9$sd[i] <- sd(data$u4[data$trialid==i])
  }
  
  # Add values back to data
  for (i in 1:num_studies) {
    data$mu4[data$trialid==i] <- df9$mean[i]
    data$sdu4[data$trialid==i] <- df9$sd[i]
  } 
  
  for (i in 1:pts) {
    data$u4n[i] <- (data$u4[i]-data$mu4[i])/data$sdu4[i]
  }
  
  # Calculate derivatives of basis functions
  for (i in 1:pts) {
    data$du0[i] <- 1/data$sdv0[i]
    
    data$k[i] <- (3*(data$b[i]^2)) -((3*data$phi1[i])*(data$a[i]^2))- (3*(1-data$phi1[i])*(data$q[i]^2))
    data$l[i] <- data$sdu1[i]
    data$du1n[i] <- (1/data$l[i])*data$k[i] - (((data$v1u0[i]/data$u0u0[i])/data$l[i])*data$du0[i])
    
    data$m[i] <- (3*(data$c[i]^2)) - ((3*data$phi2[i])*(data$a[i]^2))- (3*(1-data$phi2[i])*(data$q[i]^2))
    data$n[i] <- data$sdu2[i]
    data$du2n[i] <- ((1/data$n[i])*data$m[i]) - (((data$v2u0[i]/data$u0u0[i])/data$n[i])*data$du0[i]) - (((data$v2u1n[i]/data$u1nu1n[[i]])/data$n[i])*data$du1n[i])
 
    data$ii[i] <- (3*(data$e[i]^2)) - ((3*data$phi3[i])*(data$a[i]^2))- (3*(1-data$phi3[i])*(data$q[i]^2))
    data$kk[i] <- data$sdu3[i]
    data$du3n[i] <- ((1/data$kk[i])*data$ii[i]) - (((data$v3u0[i]/data$u0u0[i])/data$kk[i])*data$du0[i]) - (((data$v3u1n[i]/data$u1nu1n[[i]])/data$kk[i])*data$du1n[i]) - (((data$v3u2n[i]/data$u2nu2n[[i]])/data$kk[i])*data$du2n[i])
    
    data$jj[i] <- (3*(data$p[i]^2)) - ((3*data$phi4[i])*(data$a[i]^2))- (3*(1-data$phi4[i])*(data$q[i]^2))
    data$ll[i] <- data$sdu4[i]
    data$du4n[i] <- ((1/data$ll[i])*data$jj[i]) - (((data$v4u0[i]/data$u0u0[i])/data$ll[i])*data$du0[i]) - (((data$v4u1n[i]/data$u1nu1n[[i]])/data$ll[i])*data$du1n[i]) - (((data$v4u2n[i]/data$u2nu2n[[i]])/data$ll[i])*data$du2n[i]) - (((data$v4u3n[i]/data$u3nu3n[[i]])/data$ll[i])*data$du3n[i])
    
     }
  
  offset <- c(0, numeric(num_studies))
  for (i in 1:num_studies) {
    offset[i+1] <- offset[i] + num_patients[i]
  }
  
  # Prepare to fit model in OpenBUGS

  # data
  bugs_data <- list(d=data$died, trt=data$treat, trtlnt=data$trtlnt, u0=data$u0, u1n=data$u1n, 
                    u2n=data$u2n, u3n=data$u3n, u4n=data$u4n, du0=data$du0,
                    du1n=data$du1n, du2n=data$du2n, du3n=data$du2n, du4n=data$du2n, 
                    Ntrials=num_studies, offset=offset,
                    k0=knots$k1[4], k1=knots$k2[4], k2=knots$k3[4], k3=knots$k4[4], 
                    k4=knots$k5[4], k5=knots$k6[4],
                    meanv0=df1$mean[4], sdv0=df1$sd[4], v1w0=df2$v1u0[4], w0w0=df2$u0u0[4],
                    meanw1=df3$mean[4], sdw1=df3$sd[4], v2w0=df4$v2u0[4], v2w1n=df4$v2u1n[4],
                    w1nw1n=df4$u1nu1n[4], meanw2=df5$mean[4], sdw2=df5$sd[4],
                    v3w0=df6$v3u0[4], v3w1n=df6$v3u1n[4], v3w2n=df6$v3u2n[4], w2nw2n=df6$u2nu2n[4],
                    meanw3=df7$mean[4], sdw3=df7$sd[4], 
                    v4w0=df8$v4u0[4], v4w1n=df8$v4u1n[4], v4w2n=df8$v4u2n[4], v4w3n=df8$v4u3n[4], 
                    w3nw3n=df8$u3nu3n[4], meanw4=df9$mean[4], sdw4=df9$sd[4],
                    nt=2)
  
  # Create initial values for model
  beta1 <- c(0.1, 0.2)
  beta2 <- c(0.2, 0.3)
  beta3 <- c(0.3, 0.1)
  
  gamma1 <- array(rep(c(0.2), 6*num_studies), dim=c(6,num_studies))
  gamma2 <- array(rep(c(0.4), 6*num_studies), dim=c(6,num_studies))
  gamma3 <- array(rep(c(0.1), 6*num_studies), dim=c(6,num_studies))
  
  inits <- list(list(beta=beta1, gamma=gamma1), 
                list(beta=beta2, gamma=gamma2),
                list(beta=beta3, gamma=gamma3))
  
  
  # OpenBUGS
  
  params <- c("rmstD", "beta")
  
  bugs.object<-try(R2OpenBUGS::bugs(data=bugs_data, inits=inits, 
                                    parameters.to.save=params, 
                                    model.file="Model_RP_FE_lnt_4knots.txt", clearWD=F, 
                                    summary.only=FALSE, n.iter=(num.sims+burn.in),
                                    n.burnin=burn.in, n.chains=3, 
                                    bugs.seed=3, 
                                    working.directory="/lustre/ahome3/s/scf20/Documents/Simulation/Scenario1/RP_lnt_4knots",
                                    debug=F, OpenBUGS.pgm="/lustre/ahome3/s/scf20/bin/OpenBUGS"))
  
  if(class(bugs.object)=="try-error"){
    print("error fitting in OpenBUGS")
    rp_results <- c(i=i, dgm=NA, knots=4,
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
    rp_results <- data.frame(i=data$i[1], dgm=data$dgm[1], knots=4,
                             rmstD=results[1,5], rmstD_lci=results[1,3], rmstD_uci=results[1,7], rmstD_sd=results[1,2],
                             beta1=results[2,5], beta1_lci=results[2,3], beta1_uci=results[2,7],
                             beta2=results[3,5], beta2_lci=results[3,3], beta2_uci=results[3,7],
                             beta1_Rhat=results[2,8], beta2_Rhat=results[3,8])
  }
  
  return(rp_results)
  
}

