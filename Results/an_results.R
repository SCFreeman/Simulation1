rm(list=ls())

library(dplyr)
library(tidyverse)
library(rsimsum)

# Set working directory
df1 <- read.csv("results.csv")
df2 <- read.csv("results_fp2.csv")

df.bias <- rbind(df1, df2)

### Tables of results 

df.bias %>%
  filter(dgm==1) %>%
  arrange(stat) %>%
  write.csv("Scenario1.csv")

df.bias %>%
  filter(dgm==2) %>%
  arrange(stat) %>%
  write.csv("Scenario2.csv")

df.bias %>%
  filter(dgm==3) %>%
  arrange(stat) %>%
  write.csv("Scenario3.csv")

df.bias %>%
  filter(dgm==4) %>%
  arrange(stat) %>%
  write.csv("Scenario4.csv")

df.bias %>%
  filter(dgm==5) %>%
  arrange(stat) %>%
  write.csv("Scenario5.csv")

df.bias %>%
  filter(dgm==6) %>%
  arrange(stat) %>%
  write.csv("Scenario6.csv")

df.bias %>%
  filter(dgm==7) %>%
  arrange(stat) %>%
  write.csv("Scenario7.csv")

df.bias %>%
  filter(dgm==8) %>%
  arrange(stat) %>%
  write.csv("Scenario8.csv")

df.bias %>%
  filter(dgm==9) %>%
  arrange(stat) %>%
  write.csv("Scenario9.csv")

df.bias %>%
  filter(dgm==10) %>%
  arrange(stat) %>%
  write.csv("Scenario10.csv")

df.bias %>%
  filter(dgm==11) %>%
  arrange(stat) %>%
  write.csv("Scenario11.csv")

df.bias %>%
  filter(dgm==12) %>%
  arrange(stat) %>%
  write.csv("Scenario12.csv")


### Exclude models where few datasets converged

df.bias <- filter(df.bias, method !="FP 2" & method != "FP 3")

# Create a new method variable which includes the labels for the plot
df.bias$method2 <- df.bias$method
df.bias$method2[df.bias$method=="pw_c1"] <- "PE 6m"
df.bias$method2[df.bias$method=="pw_c2"] <- "PE 12m"
df.bias$method2[df.bias$method=="pw_c3"] <- "PE 18m"
df.bias$method2[df.bias$method=="pw2_6_12"] <- "PE 6m & 12m"
df.bias$method2[df.bias$method=="pw2_6_18"] <- "PE 6m & 18m"
df.bias$method2[df.bias$method=="pw2_12_18"] <- "PE 12m & 18m"
df.bias$method2[df.bias$method=="rplnt1"] <- "RP 1 knot"
df.bias$method2[df.bias$method=="rplnt2"] <- "RP 2 knots"
df.bias$method2[df.bias$method=="rplnt3"] <- "RP 3 knots"
df.bias$method2[df.bias$method=="rplnt4"] <- "RP 4 knots"

# Make method2 a factor variable to aid plots
df.bias$method2 <- factor(df.bias$method2, levels=c("PE 6m", "PE 12m", "PE 18m",
                                                    "PE 6m & 12m", "PE 6m & 18m", "PE 12m & 18m",
                                                    "RP 1 knot", "RP 2 knots",
                                                    "RP 3 knots", "RP 4 knots",
                                                    "FP -2", "FP -1", "FP -0.5",
                                                    "FP 0", "FP 0.5", "FP 1", 
                                                    "FP -0.5 & 0", "FP 0.5 & 1"))

# Check the order of the models
levels(df.bias$method2)

# Make method3 which reverse the factor levels
df.bias$method3 <- factor(df.bias$method2, levels=c("FP 0.5 & 1", "FP -0.5 & 0",
                                                    "FP 1", "FP 0.5", "FP 0", 
                                                    "FP -0.5", "FP -1", "FP -2",
                                                    "RP 4 knots", "RP 3 knots",
                                                    "RP 2 knots", "RP 1 knot",
                                                    "PE 12m & 18m", "PE 6m & 18m", "PE 6m & 12m",
                                                    "PE 18m", "PE 12m", "PE 6m"))
  
                                                    
# Make dgm2 a factor variable
df.bias$dgm2 <- factor(df.bias$dgm2, levels=c("Scenario 1", "Scenario 2", "Scenario 3",
                                              "Scenario 4", "Scenario 5", "Scenario 6",
                                              "Scenario 7", "Scenario 8", "Scenario 9",
                                              "Scenario 10", "Scenario 11", "Scenario 12"))

#### PLOTS

### BIAS

# All methods and all dgms
df.bias %>%
  filter(stat=="bias") %>%
  ggplot(aes(x=est, y=method3)) +
  geom_point() + 
  geom_segment( aes(x=0, xend=est, y=method3, yend=method3)) +
  geom_vline(xintercept=0, linetype="dotted") +
  geom_point(aes(x = (est-mcse), y = method3), shape = 40) +
  geom_point(aes(x = (est+mcse), y = method3), shape = 41) +
  facet_grid(.~dgm2) +
  xlab("Absolute bias") +
  ylab("Method") +
  ggtitle("Bias") 

### Mean Squared Error

# All methods and all dgms
df.bias %>%
  filter(stat=="mse") %>%
  ggplot(aes(x=est, y=method3)) +
  geom_point() + 
  geom_segment( aes(x=0, xend=est, y=method3, yend=method3)) +
  geom_vline(xintercept=0, linetype="dotted") +
  geom_point(aes(x = (est-mcse), y = method3), shape = 40) +
  geom_point(aes(x = (est+mcse), y = method3), shape = 41) +
  facet_grid(.~dgm2) +
  xlab("Mean Squared Error") +
  ylab("Method") +
  ggtitle("Bias") 

### BIAS

# Scenario 1
df.bias %>%
  filter(stat=="bias" & dgm==1) %>%
  ggplot(aes(x=est, y=method)) +
  geom_point() + 
  geom_segment( aes(x=0, xend=est, y=method, yend=method)) +
  geom_vline(xintercept=0, linetype="dotted") +
  geom_point(aes(x = (est-mcse), y = method), shape = 40) +
  geom_point(aes(x = (est+mcse), y = method), shape = 41) +
  xlab("Bias") +
  ylab("Method") +
  ggtitle("Scenario 1")

# Scenario 2
df.bias %>%
  filter(stat=="bias" & dgm==2) %>%
  ggplot(aes(x=est, y=method)) +
  geom_point() + 
  geom_segment( aes(x=0, xend=est, y=method, yend=method)) +
  geom_vline(xintercept=0, linetype="dotted") +
  geom_point(aes(x = (est-mcse), y = method), shape = 40) +
  geom_point(aes(x = (est+mcse), y = method), shape = 41) +
  xlab("Bias") +
  ylab("Method") +
  ggtitle("Scenario 2")

# Scenario 3
df.bias %>%
  filter(stat=="bias" & dgm==3) %>%
  ggplot(aes(x=est, y=method)) +
  geom_point() + 
  geom_segment( aes(x=0, xend=est, y=method, yend=method)) +
  geom_vline(xintercept=0, linetype="dotted") +
  geom_point(aes(x = (est-mcse), y = method), shape = 40) +
  geom_point(aes(x = (est+mcse), y = method), shape = 41) +
  xlab("Bias") +
  ylab("Method") +
  ggtitle("Scenario 3")

# Scenario 4
df.bias %>%
  filter(stat=="bias" & dgm==4) %>%
  ggplot(aes(x=est, y=method)) +
  geom_point() + 
  geom_segment( aes(x=0, xend=est, y=method, yend=method)) +
  geom_vline(xintercept=0, linetype="dotted") +
  geom_point(aes(x = (est-mcse), y = method), shape = 40) +
  geom_point(aes(x = (est+mcse), y = method), shape = 41) +
  xlab("Bias") +
  ylab("Method") +
  ggtitle("Scenario 4")



# EMPIRICAL STANDARD ERROR

# all methods and all dgms
df.bias %>%
  filter(stat=="empse") %>%
  ggplot(aes(x=est, y=method)) +
  geom_point() + 
  geom_segment( aes(x=0, xend=est, y=method, yend=method)) +
  geom_vline(xintercept=0, linetype="dotted") +
  geom_point(aes(x = (est-mcse), y = method), shape = 40) +
  geom_point(aes(x = (est+mcse), y = method), shape = 41) +
  facet_grid(.~dgm2) +
  xlab("Empirical SE") +
  ylab("Method") +
  ggtitle("Empirical Standard Error")


# MEAN SQUARED ERROR

# All methods and all dgms
df.bias %>%
  filter(stat=="mse") %>%
  ggplot(aes(x=est, y=method)) +
  geom_point() + 
  geom_segment( aes(x=0, xend=est, y=method, yend=method)) +
  geom_vline(xintercept=0, linetype="dotted") +
  geom_point(aes(x = (est-mcse), y = method), shape = 40) +
  geom_point(aes(x = (est+mcse), y = method), shape = 41) +
  facet_grid(.~dgm2) +
  xlab("Mean Squared Error") +
  ylab("Method") +
  ggtitle("Mean Squared Error")


# MODEL-BASED STANDARD ERROR

# All methods and all dgms
df.bias %>%
  filter(stat=="modelse") %>%
  ggplot(aes(x=est, y=method)) +
  geom_point() + 
  geom_segment( aes(x=0, xend=est, y=method, yend=method)) +
  geom_vline(xintercept=0, linetype="dotted") +
  geom_point(aes(x = (est-mcse), y = method), shape = 40) +
  geom_point(aes(x = (est+mcse), y = method), shape = 41) +
  facet_grid(.~dgm2) +
  xlab("Model-based Standard Error") +
  ylab("Method") +
  ggtitle("Model-based Standard Error")


# COVERAGE

# All methods and all dgms
df.bias %>%
  filter(stat=="cover") %>%
  ggplot(aes(x=est, y=method)) +
  geom_point() + 
  geom_segment( aes(x=0.95, xend=est, y=method, yend=method)) +
  geom_vline(xintercept=0.95, linetype="dotted") +
  geom_point(aes(x = (est-mcse), y = method), shape = 40) +
  geom_point(aes(x = (est+mcse), y = method), shape = 41) +
  facet_grid(.~dgm2) +
  xlab("Coverage") +
  ylab("Method") +
  ggtitle("Coverage")


########################################## 

#BIAS

# Scenarios 1, 3, 5, 7, 9, 11
df.bias %>%
  filter(dgm==1 | dgm==3 | dgm==5 | dgm==7 | dgm==9 | dgm==11) %>%
  filter(stat=="bias") %>%
  ggplot(aes(x=est, y=method3)) +
  geom_point(size=2, colour="blue") + 
  geom_segment( aes(x=0, xend=est, y=method3, yend=method3)) +
  geom_vline(xintercept=0, linetype="dotted") +
  geom_point(aes(x = (est-mcse), y = method3), size=5, shape = 40) +
  geom_point(aes(x = (est+mcse), y = method3), size=5, shape = 41) +
  facet_grid(.~dgm2) +
  xlab("Absolute Bias") +
  ylab("Method") +
  coord_cartesian((xlim=c(-10,10))) +
  theme(text=element_text(size=14))


# Scenarios 2, 4, 6, 8, 10, 12
df.bias %>%
  filter(dgm==2 | dgm==4 | dgm==6 | dgm==8 | dgm==10 | dgm==12) %>%
  filter(stat=="bias") %>%
  filter(method !="rplnt2" & method !="rplnt3" & method !="rplnt4") %>%
  ggplot(aes(x=est, y=method3)) +
  geom_point(size=2, colour="blue") + 
  geom_segment( aes(x=0, xend=est, y=method3, yend=method3)) +
  geom_vline(xintercept=0, linetype="dotted") +
  geom_point(aes(x = (est-mcse), y = method3), size=5, shape = 40) +
  geom_point(aes(x = (est+mcse), y = method3), size=5, shape = 41) +
  facet_grid(.~dgm2) +
  xlab("Absolute Bias") +
  ylab("Method") +
  coord_cartesian((xlim=c(-20,20))) +
  theme(text=element_text(size=14))

#MSE

# Scenarios 1, 3, 5, 7, 9, 11
df.bias %>%
  filter(dgm==1 | dgm==3 | dgm==5 | dgm==7 | dgm==9 | dgm==11) %>%
  filter(stat=="mse") %>%
  ggplot(aes(x=est, y=method3)) +
  geom_point(size=2, colour="blue") + 
  geom_segment( aes(x=0, xend=est, y=method3, yend=method3)) +
  geom_vline(xintercept=0, linetype="dotted") +
  geom_point(aes(x = (est-mcse), y = method3), size=5, shape = 40) +
  geom_point(aes(x = (est+mcse), y = method3), size=5, shape = 41) +
  facet_grid(.~dgm2) +
  xlab("Mean Squared Error") +
  ylab("Method") +
  coord_cartesian((xlim=c(0,100))) +
  theme(text=element_text(size=14))


# Scenarios 2, 4, 6, 8, 10, 12
df.bias %>%
  filter(dgm==2 | dgm==4 | dgm==6 | dgm==8 | dgm==10 | dgm==12) %>%
  filter(stat=="mse") %>%
  filter(method !="rplnt2" & method !="rplnt3" & method !="rplnt4") %>%
  ggplot(aes(x=est, y=method3)) +
  geom_point(size=2, colour="blue") + 
  geom_segment( aes(x=0, xend=est, y=method3, yend=method3)) +
  geom_vline(xintercept=0, linetype="dotted") +
  geom_point(aes(x = (est-mcse), y = method3), size=5, shape = 40) +
  geom_point(aes(x = (est+mcse), y = method3), size=5, shape = 41) +
  facet_grid(.~dgm2) +
  xlab("Mean Squared Error") +
  ylab("Method") +
  coord_cartesian((xlim=c(0,600))) +
  theme(text=element_text(size=14))

# Empirical standard error

# Scenarios 1, 3, 5, 7, 9, 11
df.bias %>%
  filter(dgm==1 | dgm==3 | dgm==5 | dgm==7 | dgm==9 | dgm==11) %>%
  filter(stat=="empse") %>%
  ggplot(aes(x=est, y=method3)) +
  geom_point(size=2, colour="blue") + 
  geom_segment( aes(x=0, xend=est, y=method3, yend=method3)) +
  geom_vline(xintercept=0, linetype="dotted") +
  geom_point(aes(x = (est-mcse), y = method3), size=5, shape = 40) +
  geom_point(aes(x = (est+mcse), y = method3), size=5, shape = 41) +
  facet_grid(.~dgm2) +
  xlab("Empirical Standard Error") +
  ylab("Method") +
  coord_cartesian((xlim=c(0,5))) +
  theme(text=element_text(size=14))


# Scenarios 2, 4, 6, 8, 10, 12
df.bias %>%
  filter(dgm==2 | dgm==4 | dgm==6 | dgm==8 | dgm==10 | dgm==12) %>%
  filter(stat=="empse") %>%
  filter(method !="rplnt2" & method !="rplnt3" & method !="rplnt4") %>%
  ggplot(aes(x=est, y=method3)) +
  geom_point(size=2, colour="blue") + 
  geom_segment( aes(x=0, xend=est, y=method3, yend=method3)) +
  geom_vline(xintercept=0, linetype="dotted") +
  geom_point(aes(x = (est-mcse), y = method3), size=5, shape = 40) +
  geom_point(aes(x = (est+mcse), y = method3), size=5, shape = 41) +
  facet_grid(.~dgm2) +
  xlab("Empirical Standard Error") +
  ylab("Method") +
  coord_cartesian((xlim=c(0,15))) +
  theme(text=element_text(size=14))

# Model-based standard error

# Scenarios 1, 3, 5, 7, 9, 11
df.bias %>%
  filter(dgm==1 | dgm==3 | dgm==5 | dgm==7 | dgm==9 | dgm==11) %>%
  filter(stat=="modelse") %>%
  ggplot(aes(x=est, y=method3)) +
  geom_point(size=2, colour="blue") + 
  geom_segment( aes(x=0, xend=est, y=method3, yend=method3)) +
  geom_vline(xintercept=0, linetype="dotted") +
  geom_point(aes(x = (est-mcse), y = method3), size=5, shape = 40) +
  geom_point(aes(x = (est+mcse), y = method3), size=5, shape = 41) +
  facet_grid(.~dgm2) +
  xlab("Model-Based Standard Error") +
  ylab("Method") +
  coord_cartesian((xlim=c(0, 5))) +
  theme(text=element_text(size=14))


# Scenarios 2, 4, 6, 8, 10, 12
df.bias %>%
  filter(dgm==2 | dgm==4 | dgm==6 | dgm==8 | dgm==10 | dgm==12) %>%
  filter(stat=="modelse") %>%
  filter(method !="rplnt2" & method !="rplnt3" & method !="rplnt4") %>%
  ggplot(aes(x=est, y=method3)) +
  geom_point(size=2, colour="blue") + 
  geom_segment( aes(x=0, xend=est, y=method3, yend=method3)) +
  geom_vline(xintercept=0, linetype="dotted") +
  geom_point(aes(x = (est-mcse), y = method3), size=5, shape = 40) +
  geom_point(aes(x = (est+mcse), y = method3), size=5, shape = 41) +
  facet_grid(.~dgm2) +
  xlab("Model-based Standard Error") +
  ylab("Method") +
  coord_cartesian((xlim=c(0,15))) +
  theme(text=element_text(size=14))

