# Forest plot of RMSTD results

library(metafor)

setwd("R:/SCFreeman/scf20/NIHR Fellowship/Work_Package_2/Example_HPC/Results")
df <- read.csv("RMSTD_results.csv")
colnames(df) <- c("model", "rmstd", "lci", "uci")

# Drop FP2 and FP3 as convergence not achieved
df <- df[c(1:16,19:20),]

forest(x=df$rmstd, ci.lb=df$lci, ci.ub=df$uci,
       slab=df$model, refline=0,
       xlab="RMSTD (months)",
       header=c("Model", "RMSTD (95% CrI)"),
       alim=c(-40,40))
