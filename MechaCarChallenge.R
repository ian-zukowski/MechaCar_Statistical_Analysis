# clear the previous environment
rm(list=ls())

#Import csv files and dplyr library
mecha <- read.csv('Resources/Datasets/MechaCar_mpg.csv',check.names = F,stringsAsFactors = F)
msusp <- read.csv('Resources/Datasets/Suspension_Coil.csv',check.names = F,stringsAsFactors = F)
library(dplyr)

#D1: Create a linear model of mpg compared to other variables in 'mecha' dataset
lm(mpg~vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD, data=mecha)
#D1: Generate a summary of the above linear model results
summary(lm(mpg~vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD, data=mecha))


#D2: Gather summary stastics of suspension coil PSI column
total_summary <- msusp %>% summarize(Mean=mean(PSI), Median=median(PSI),Variance=var(PSI),SD=sd(PSI))
total_summary
#D2: Create lot summary using group_by on 'Manufacturing Lot' column
lot_summary <- msusp %>% group_by(msusp$Manufacturing_Lot)%>% summarize(Mean=mean(PSI), Median=median(PSI),Variance=var(PSI),SD=sd(PSI))
lot_summary


#D3: Filter dataset for only lot1, lot2, and lot3 vehicles
lot1 <- msusp %>% filter(msusp$Manufacturing_Lot=='Lot1')
lot2 <- msusp %>% filter(msusp$Manufacturing_Lot=='Lot2')
lot3 <- msusp %>% filter(msusp$Manufacturing_Lot=='Lot3')
#D3: t-test on PSI amongst all cars
t.test(msusp$PSI,mu=1500)
#D3: t-test on PSI separated by lot
t.test(lot1$PSI,mu=1500)
t.test(lot2$PSI,mu=1500)
t.test(lot3$PSI,mu=1500)

