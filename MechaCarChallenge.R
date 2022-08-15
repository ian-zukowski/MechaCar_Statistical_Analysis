# clear the previous environment
rm(list=ls())

#Import csv files and dplyr library
mecha <- read.csv('MechaCar_mpg.csv',check.names = F,stringsAsFactors = F)
msusp <- read.csv('Suspension_Coil.csv',check.names = F,stringsAsFactors = F)
library(dplyr)

#D1: Create a linear model of mpg compared to other variables in 'mecha' dataset
lm(mpg~vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD, data=mecha)
#D1: Generate a summary of the above linear model results
summary(lm(mpg~vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD, data=mecha))


#D2: Gather summary stastics of suspension coil PSI column
total_summary <- msusp %>% summarize(Mean=mean(PSI), Median=median(PSI),Variance=var(PSI),SD=sd(PSI))
#D2: Create lot summary using group_by on 'Manufacturing Lot' column
lot_summary <- msusp %>% group_by(msusp$Manufacturing_Lot)%>% summarize(Mean=mean(PSI), Median=median(PSI),Variance=var(PSI),SD=sd(PSI))
lot_summary
