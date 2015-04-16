library(dplyr)
library(ggplot2)


df <- read.csv("activity.csv")

df_clean <- df[complete.cases(df), ]

df_clean  %>%  group_by(date) %>%    
    summarise(totSteps=sum(steps)) -> df_byDates

ymax = max(df_byDates$totSteps)

qplot(date, totSteps, data=df_byDates, 
         geom = "histogram",
         stat="identity",
          xlab="Date", ylab="Total Number of Steps",
          ylim = c(0, ymax),
      	main="")