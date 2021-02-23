library(tidyverse)
library(haven)

donate <- read_sas("donate.sas7bdat")
summary(donate)

donate1 <- donate %>% pivot_longer(names_to = "Qtr", 
                                   values_to = "Donate_rate",
                                   cols = -ID)

donate1$Donate_nrate <- 
    (donate1$Donate_rate - mean(donate1$Donate_rate, na.rm = TRUE)) / 
    sd(donate1$Donate_rate, na.rm = TRUE)

par(mfrow=c(1,2))
boxplot(donate1$Donate_rate)
boxplot(donate1$Donate_nrate)
par(mfrow=c())