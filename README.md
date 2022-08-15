# MechaCar_Statistical_Analysis

## Linear Regression to Predict MPG
<!-- * Which variables/coefficients provided a non-random amount of variance to the mpg values in the dataset? -->
1. The variables which provided non-neglible amounts of variance to the mpg values were spoiler_angle, AWD, and vehicle_length. This analysis is based on the 'Pr(>|t|)' values of approximately .31, .19, and .08 respectively.
  
<!-- * Is the slope of the linear model considered to be zero? Why or why not? -->
2. The slope of the linear model is not zero. The p-value of the regression analysis is 5.35 e-11. This is much lower than the standard p-value of 0.05. Thus we can confidently reject the null hypothesis and we can assert that the slope is not zero.
  
<!-- * Does this linear model predict mpg of MechaCar prototypes effectively? Why or why not? -->
3. Since the Multiple R-squared value is approximately 0.72 (or 0.68 adjusted) we can say that there is a strong correlation between the MPG and this set of variables. Further testing may be needed to more accurately identify the exact strength of each individual variable in the set on the MPG.

The linear model results behind the above analysis can be seen in the picture below.

![lm](Resources/Images/linear_model.png)
  
## Summary Statistics on Suspension Coils
<!-- * The design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per square inch. Does the current manufacturing data meet this design specification for all manufacturing lots in total and each lot individually? Why or why not? -->
1. In total the MechaCar suspension coil requirement is met, as the variance is 62.29 PSI which does not exceed 100 PSI as per design specifications. 
2. When the data is grouped by Lot Number there is a single problematic lot: Lot #3. This lot has a variance of approximately 170 PSI which is nearly double the acceptable variance allowed. On the other hand lot 1 has a variance of 1 PSI, while lot 2 has a variance of 7.5 PSI, both of which are well within the tolerable range.

Reference the image below to view the variances for each sample.

![var](Resources/Images/psi_var.png)

  
## T-Tests on Suspension Coils
<!-- * Briefly summarize your interpretation and findings for the t-test results. Include screenshots of the t-test to support your summary. -->
1. While the result of the aggregate t-test is close to the standard allowing for rejection of the null hypothesis, currently the p-value is 0.06. This is slightly higher than the standard value of 0.05, which means we are NOT able to reject the null hypothesis of this t-test. In other words, we cannot say with true confidence that the mean of an aggregate sample is not 1500.
2. Similarly the t-tests for lots 1 and 2 do not allowing for rejection of the null hypothesis. Their p-values of 1 and 0.61 respectively are far higher than the standard value of 0.05. Only the t-test on lot 3 vehicles has a p-value of 0.04, which does allow us to reject the null hypothesis and conclude the true mean based on the lot 3 sample is not equal to 1500.

The results of each t-test can be found in the picture below.

![t-tests](Resources/Images/suspension_t_test.png)
  
## Study Design: MechaCar vs Competition
<!-- Write a short description of a statistical study that can quantify how the MechaCar performs against the competition. In your study design, think critically about what metrics would be of interest to a consumer: for a few examples, cost, city or highway fuel efficiency, horse power, maintenance cost, or safety rating -->
<!-- * What metric or metrics are you going to test?
* What is the null hypothesis or alternative hypothesis?
* What statistical test would you use to test the hypothesis? And why?
* What data is needed to run the statistical test? -->

In order to determine how MechaCar performs against the competition it will be important to identify metrics relating to the performance of the average MechaCar compared to the average car from multiple competitors. For the purpose of this analysis we will focus specifically on MPG performance, but bear in mind that this metric could be substituted for other metrics such as horse power, safety rating, or subsets such as city MPG/highway MPG.

The null hypothesis for the analysis will claim: "The average MechaCar vehicle has the same or lower average MPG rating than the competitor brand." The alternative hypothesis will claim: "The average MechaCar vehicle has higher MPG rating than the competitor brand." To test these hypotheses we will use multiple two-sample t-tests, each comparing a sample of vehicles from MechaCar to a sample of vehicles from a competitor brand. When running these t-tests it is necessary to include an additional argument in the code to account for the 'greater than' part of the alternative hypothesis (using the code "alternative = 'greater'").

To run each of the t-tests it will be necessary to collect a sample of vehicles from each company which will be included in the analysis. This sample of vehicles should be large enough to dampen the effects of any outliers -- at least 50 vehicles would be ideal for this effort. Ideally the vehicles would be operated under similar conditions and the observed MPG would be recorded after several different gas fill-ups. More practically, it would also be feasible to research the company statements on that vehicle's average MPG. Additional requirements to provide more accurate data would be limiting the analysis to similar vehicle class (i.e. only Trucks, Minivans, etc.) and similar driving environments (i.e. mostly City, Suburban, Highway, etc.)