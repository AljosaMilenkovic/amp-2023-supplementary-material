#MaxEnt analysis of the stress pattern of Gallipoli Serbian using the maxent.ot package (Mayer, Tan & Zuraw 2022)
#Gallipoli Serbian is a now extinct dialect of BCMS. The analysis is based on the fieldwork data by Pavle Ivic (Ivic 1957/1994). A generative account of the dialect's stress pattern is provided in Milenkovic (2022)
#Gallipoli Serbian consistently employs vowel lengthening to eliminate stressed toneless lights which form a monomoraic foot, but never lengthens High-toned lights that form a monomoraic foot.
#Two models were compared: (1) the baseline model, and (2) the baseline model enriched with Head-H&FtBin (the LCC proposed in the present survey)

library(maxent.ot)

#input files
baseline_url <- "https://raw.githubusercontent.com/AljosaMilenkovic/amp-2023-supplementary-material/main/baseline_maxent.txt"
lcc_url <- "https://raw.githubusercontent.com/AljosaMilenkovic/amp-2023-supplementary-material/main/lcc_maxent.txt"

baseline <- read.csv(baseline_url, header = 1, sep = "\t", encoding = "UTF-8")
lcc <- read.csv(lcc_url, header = 1, sep = "\t", encoding = "UTF-8")

###########################
#Models
baseline_model <- optimize_weights(baseline)
lcc_model <- optimize_weights(lcc)

#Constraint weights
baseline_model$weights
lcc_model$weights

#log likelihood
baseline_model$loglik
lcc_model$loglik

#likelihood ratio test
compare_models(baseline_model, lcc_model, method = 'lrt')


#predicted vs observed probabilities
prob_baseline <- predict_probabilities(baseline, baseline_model$weights)
write.csv(prob_baseline, "probability baseline.csv")

prob_lcc <- predict_probabilities(lcc, lcc_model$weights)
write.csv(prob_lcc, "probability lcc.csv")
