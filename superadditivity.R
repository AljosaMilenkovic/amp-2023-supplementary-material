library(dplyr)


#Baseline constraint model
baseline_url <- "https://raw.githubusercontent.com/AljosaMilenkovic/amp-2023-supplementary-material/main/baseline.csv"
baseline <- read.csv(baseline_url, header = 1)

#mappings that should be harmonically bounded (gratuitous faithfulness penalties)
which(baseline$A == "(a)")
which(baseline$A == "(aa)")
which(baseline$Aa == "(a)")
which(baseline$Aa == "(aa)")
which(baseline$Aa == "(A)")
which(baseline$aa == "(a)")
which(baseline$aa == "(A)")

#HG grammars that OT does not predict
which(baseline$solution == "HG")

#Does the model predict BCMS Monosyllabic Lenthening? = UNDERGENERATION?
which(baseline$A == "(A)" & baseline$a == "(aa)")

#Does the model predict dialectal BCMS Penultimate Lengthening?
which(baseline$a.A == "(aa).A")

#Does the model predict dialectal BCMS Tonal Flop?
which(baseline$a.A == "(A.a)")

#identifies cases of pathological vowel shortening
baseline <- baseline %>% mutate(shortening = ifelse(grepl("\\(A\\)", Aa) |
                                                      grepl("\\(A\\)", aa),1,0))

#identifies cases of pathological High tone deletion
baseline <- baseline %>% mutate(h_deletion = ifelse(grepl("\\(aa\\)", A) | 
                                                      grepl("\\(aa\\)", Aa),1,0))

#Is a given grammar pathological?
baseline <- baseline %>% mutate(pathological = if_else((shortening == 1 | h_deletion == 1),1,0))

#How many grammars are pathological? = OVERGENERATION?
sum(baseline$pathological)


#####################

#Constraint model employed in Zec, D. (1999). Footed tones and tonal feet: Rhythmic constituency in a pitch accent language. Phonology 16(2)
zec99_url <- "https://raw.githubusercontent.com/AljosaMilenkovic/amp-2023-supplementary-material/main/zec%201999.csv"
zec99 <- read.csv(zec99_url, header = 1)

#mappings that should be harmonically bounded (gratuitous faithfulness penalties)
which(zec99$A == "(a)")
which(zec99$A == "(aa)")
which(zec99$Aa == "(a)")
which(zec99$Aa == "(aa)")
which(zec99$Aa == "(A)")
which(zec99$aa == "(a)")
which(zec99$aa == "(A)")

#HG grammars that OT does not predict
which(zec99$solution == "HG")

#Does the model predict BCMS Monosyllabic Lenthening? = UNDERGENERATION?
which(zec99$A == "(A)" & zec99$a == "(aa)")

#Does the model predict dialectal BCMS Penultimate Lengthening?
which(zec99$a.A == "(aa).A")

#Does the model predict dialectal BCMS Tonal Flop?
which(zec99$a.A == "(A.a)")

#identifies cases of pathological vowel shortening
zec99 <- zec99 %>% mutate(shortening = ifelse(grepl("\\(A\\)", Aa) |
                                                grepl("\\(A\\)", aa),1,0))

#identifies cases of pathological High tone deletion
zec99 <- zec99 %>% mutate(h_deletion = ifelse(grepl("\\(aa\\)", A) | 
                                                grepl("\\(aa\\)", Aa),1,0))

#Is a given grammar pathological? = OVERGENERATION
zec99 <- zec99 %>% mutate(pathological = if_else((shortening == 1 | h_deletion == 1),1,0))

#How many grammars are pathological?
sum(zec99$pathological)


#########################
#Constraint model enriched with the local conjunction of Head-H and FootBinarity
lcc_url <- "https://github.com/AljosaMilenkovic/amp-2023-supplementary-material/blob/main/lcc.csv"
lcc <- read.csv(lcc_url, header = 1)

#mappings that should be harmonically bounded (gratuitous faithfulness penalties)
which(lcc$A == "(a)")
which(lcc$A == "(aa)")
which(lcc$Aa == "(a)")
which(lcc$Aa == "(aa)")
which(lcc$Aa == "(A)")
which(lcc$aa == "(a)")
which(lcc$aa == "(A)")

#HG grammars that OT does not predict
which(lcc$solution == "HG")

#Does the model predict BCMS Monosyllabic Lenthening? = UNDERGENERATION?
which(lcc$A == "(A)" & lcc$a == "(aa)")

#Does the model predict dialectal BCMS Penultimate Lengthening?
which(lcc$a.A == "(aa).A")

#Does the model predict dialectal BCMS Tonal Flop?
which(lcc$a.A == "(A.a)")

#identifies cases of pathological vowel shortening
lcc <- lcc %>% mutate(shortening = ifelse(grepl("\\(A\\)", Aa) |
                                            grepl("\\(A\\)", aa),1,0))

#identifies cases of pathological High tone deletion
lcc <- lcc %>% mutate(h_deletion = ifelse(grepl("\\(aa\\)", A) | 
                                            grepl("\\(aa\\)", Aa),1,0))

#Is a given grammar pathological? = OVERGENERATION
lcc <- lcc %>% mutate(pathological = if_else((shortening == 1 | h_deletion == 1),1,0))

#How many grammars are pathological?
sum(lcc$pathological)
