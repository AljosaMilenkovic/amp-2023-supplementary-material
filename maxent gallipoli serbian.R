#MaxEnt analysis of the stress pattern of Gallipoli Serbian using the maxent.ot package (Mayer & Zuraw 2023)
#Gallipoli Serbian is a now extinct dialect of BCMS. The analysis is based on the fieldwork data by Pavle Ivic (Ivic 1958/1994). A generative account of the dialect's stress pattern is provided in Milenkovic (2022)
#Gallipoli Serbian consistently employs vowel lengthening to eliminate stressed toneless lights which form a monomoraic foot, but never lengthens High-toned lights that form a monomoraic foot.
#Two models were compared: (1) the baseline model, and (2) the model that only differs from the baseline model by having the local conjunction of Head-H and FootBinarity

library(maxent.ot)

#input files
baseline <- "https://raw.githubusercontent.com/AljosaMilenkovic/amp-2023-supplementary-material/main/maxent.txt"
lcc <- "https://raw.githubusercontent.com/AljosaMilenkovic/amp-2023-supplementary-material/main/maxent-lcc.txt"

baseline_maxent <- read.csv(baseline, header=TRUE, sep = "\t", encoding = "UTF-8")
lcc_maxent <- read.csv(lcc, header=TRUE, sep = "\t", encoding = "UTF-8")

###############################################
#Models

baseline_model <- optimize_weights(baseline_maxent)
lcc_model <- optimize_weights(lcc_maxent)

#constraint weights
baseline_model$weights
lcc_model$weights

#models' log likelihood
baseline_model$loglik
lcc_model$loglik

#model comparison using likelihood ratio test
compare_models(baseline_model, lcc_model, method = 'lrt')