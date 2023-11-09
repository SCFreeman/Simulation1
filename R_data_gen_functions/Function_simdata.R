# Function to generate survival data


simdata <- function(i, dgm, lambda, gamma, beta, pi, num_studies, 
                    num_patients, alloc, fu, nph, random=FALSE){
  
  
  tot_patients <- sum(num_patients)
  
  # covariate data
  # Data frame containing one row per study with trial ID variable, allocation ratio for each study and 
  # number of patients in each study
  cov <- data.frame(trialid=1:num_studies, 
                    alloc=alloc,
                    fu=fu,
                    nobs=num_patients)
  # Expand covariate data frame to one row per patient
  cov <- expandRows(cov, "nobs")
  
  # Update row numbers
  rownames(cov) <- 1:nrow(cov)
  
  #Calculate a subject ID variable
  cov$id <- 1:tot_patients
  
  # Calculate a treatment variable for each patient taking the value 0 or 1
  cov$treat <- rbinom(tot_patients, 1, cov$alloc)
  
  # Fixed effect assumption - default option - all studies estimate the same treatment effect
  pop_treat_effect <- beta
  
  # Random effects assumption - the study effects are drawn from a distribution
  # Assume average treatment effect across all studies is equal to -0.5
  # and that the study-specific deviations from the average treatment effect are drawn from
  # a normal distribution with mean 0 and standard deviation 0.2
  
  if (random==TRUE) {
    study_treat_effect <- pop_treat_effect + rnorm(num_studies, 0, 0.2)
    pars <- data.frame(treat=study_treat_effect, nobs=num_patients)
  } else {
    pars <- data.frame(treat=pop_treat_effect, nobs=num_patients)
  }
  
  pars <- expandRows(pars, "nobs")
  
  # Update row numbers
  rownames(pars) <- 1:nrow(pars)
  
  
  # Generate survival data
  # Non-PH mixture weibull model 
  dat <- try(simsurv(dist="weibull", lambdas=lambda, gammas=gamma, x=cov, betas=pars, mixture=TRUE,
                  pmix=pi, tde=c(treat=nph), tdefunction="log"))
  
  if(class(dat)=="try-error"){
    print("error generating data")
    dat <- c(id=NA, eventtime=NA, status=NA)
    
  } else { 
  
  dat <- merge(cov, dat)
  head(dat)
  
  
  # As f/up varies by trial I couldn't use the maxt option for simsurv so now I need to
  # identify the patients who died during f/up and censor them
  
  # Identify patients who died during f/up (1=died, 0=alive)
  dat$died <- ifelse(dat$eventtime <= dat$fu, 1, 0)
  
  # Censor patients who died after trial f/up
  # replace eventime=fu if died==0
  dat$eventtime[dat$died==0] <- dat$fu[dat$died==0]
  
  # Remove the column status (as this basically says everyone died at some point)
  # Also remove fu and alloc as no longer needed
  dat <- subset(dat, select=-c(status, fu, alloc))
  
  head(dat)
  
  dat[["i"]] <- i
  dat[["dgm"]] <- dgm
  
  # Save the seed
  attr(dat, "seed") <- .Random.seed
  
  }
  
  return(dat)
  
}



