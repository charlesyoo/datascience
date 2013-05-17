> install.packages('DMwR')
trying URL 'http://mirrors.nics.utk.edu/cran/bin/macosx/contrib/3.0/DMwR_0.3.1.tgz'
Content type 'application/x-gzip' length 3381517 bytes (3.2 Mb)
opened URL
==================================================
downloaded 3.2 Mb


The downloaded binary packages are in
	/var/folders/p8/d55k_h5d5s92f2rryqp2rkh40000gn/T//Rtmp1gk619/downloaded_packages
> library(DMwR)
> data(algae) # Loading the algae data sets
> summary(algae) #Give summaries of algae
    season       size       speed         mxPH            mnO2       
 autumn:40   large :45   high  :84   Min.   :5.600   Min.   : 1.500  
 spring:53   medium:84   low   :33   1st Qu.:7.700   1st Qu.: 7.725  
 summer:45   small :71   medium:83   Median :8.060   Median : 9.800  
 winter:62                           Mean   :8.012   Mean   : 9.118  
                                     3rd Qu.:8.400   3rd Qu.:10.800  
                                     Max.   :9.700   Max.   :13.400  
                                     NA's   :1       NA's   :2       
       Cl               NO3              NH4                oPO4       
 Min.   :  0.222   Min.   : 0.050   Min.   :    5.00   Min.   :  1.00  
 1st Qu.: 10.981   1st Qu.: 1.296   1st Qu.:   38.33   1st Qu.: 15.70  
 Median : 32.730   Median : 2.675   Median :  103.17   Median : 40.15  
 Mean   : 43.636   Mean   : 3.282   Mean   :  501.30   Mean   : 73.59  
 3rd Qu.: 57.824   3rd Qu.: 4.446   3rd Qu.:  226.95   3rd Qu.: 99.33  
 Max.   :391.500   Max.   :45.650   Max.   :24064.00   Max.   :564.60  
 NA's   :10        NA's   :2        NA's   :2          NA's   :2       
      PO4              Chla               a1              a2        
 Min.   :  1.00   Min.   :  0.200   Min.   : 0.00   Min.   : 0.000  
 1st Qu.: 41.38   1st Qu.:  2.000   1st Qu.: 1.50   1st Qu.: 0.000  
 Median :103.29   Median :  5.475   Median : 6.95   Median : 3.000  
 Mean   :137.88   Mean   : 13.971   Mean   :16.92   Mean   : 7.458  
 3rd Qu.:213.75   3rd Qu.: 18.308   3rd Qu.:24.80   3rd Qu.:11.375  
 Max.   :771.60   Max.   :110.456   Max.   :89.80   Max.   :72.600  
 NA's   :2        NA's   :12                                        
       a3               a4               a5               a6        
 Min.   : 0.000   Min.   : 0.000   Min.   : 0.000   Min.   : 0.000  
 1st Qu.: 0.000   1st Qu.: 0.000   1st Qu.: 0.000   1st Qu.: 0.000  
 Median : 1.550   Median : 0.000   Median : 1.900   Median : 0.000  
 Mean   : 4.309   Mean   : 1.992   Mean   : 5.064   Mean   : 5.964  
 3rd Qu.: 4.925   3rd Qu.: 2.400   3rd Qu.: 7.500   3rd Qu.: 6.925  
 Max.   :42.800   Max.   :44.600   Max.   :44.400   Max.   :77.600  
                                                                    
       a7        
 Min.   : 0.000  
 1st Qu.: 0.000  
 Median : 1.000  
 Mean   : 2.495  
 3rd Qu.: 2.400  
 Max.   :31.600  
                 
> hist(algae$mxPH, prob = T) #Draw a historygram of algae's mxPH. Density as the Y-axis
> plot(algae$NH4, xlab = '') # Plot the data of algae's NH4
> abline(h = mean(algae$NH4, na.rm = T), lty = 1)  #Insert add a straight line that represents the mean of NH4
> abline(h = mean(algae$NH4, na.rm = T) + sd(algae$NH4, na.rm = T), lty = 2) #Then add the standard deviation of NH4's mean. Add a dashed line
> 
> abline(h = median(algae$NH4, na.rm = T), lty = 3) # Add a dotted line that represents the median.
> lm(PO4 ~ oPO4, data = algae) # add linear model, showing coeffiencients.

Call:
lm(formula = PO4 ~ oPO4, data = algae)

Coefficients:
(Intercept)         oPO4  
     42.897        1.293  

> clean.algae <- knnImputation(algae, k = 10) # Store the value of nearest neighbors - nearest 10 neighbors of algae.
> lm.a1 <- lm(a1 ~ ., data = clean.algae[, 1:12]) #Store the value of the linear model of the nearest neighbors of 10
> summary(lm.a1) #summarize the lm.a1

Call:
lm(formula = a1 ~ ., data = clean.algae[, 1:12])

Residuals:
    Min      1Q  Median      3Q     Max 
-37.293 -11.988  -2.623   7.177  62.465 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)   
(Intercept)  39.091753  23.609820   1.656  0.09948 . 
seasonspring  3.689773   4.125868   0.894  0.37233   
seasonsummer  0.333951   3.985869   0.084  0.93332   
seasonwinter  3.488576   3.840263   0.908  0.36484   
sizemedium    3.349192   3.752461   0.893  0.37327   
sizesmall     9.734007   4.123081   2.361  0.01928 * 
speedlow      3.706971   4.676117   0.793  0.42895   
speedmedium  -0.158543   3.207178  -0.049  0.96063   
mxPH         -3.098611   2.650299  -1.169  0.24385   
mnO2          1.053319   0.702830   1.499  0.13567   
Cl           -0.040731   0.033554  -1.214  0.22634   
NO3          -1.489958   0.549112  -2.713  0.00729 **
NH4           0.001626   0.001000   1.626  0.10575   
oPO4         -0.007084   0.039740  -0.178  0.85871   
PO4          -0.050298   0.030602  -1.644  0.10196   
Chla         -0.093264   0.079589  -1.172  0.24279   
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 17.6 on 184 degrees of freedom
Multiple R-squared:  0.3718,	Adjusted R-squared:  0.3205 
F-statistic: 7.259 on 15 and 184 DF,  p-value: 1.961e-12

> anova(lm.a1) # compute analysis of variance of tables for the fitted model.
Analysis of Variance Table

Response: a1
           Df Sum Sq Mean Sq F value    Pr(>F)    
season      3     66    21.9  0.0709 0.9754563    
size        2  11527  5763.5 18.6121 4.352e-08 ***
speed       2   4028  2014.1  6.5043 0.0018647 ** 
mxPH        1   1225  1224.8  3.9551 0.0482113 *  
mnO2        1   2304  2304.1  7.4408 0.0069940 ** 
Cl          1   4323  4323.5 13.9619 0.0002488 ***
NO3         1   3359  3359.5 10.8487 0.0011857 ** 
NH4         1    403   403.4  1.3026 0.2552235    
oPO4        1   4711  4711.2 15.2140 0.0001345 ***
PO4         1   1344  1343.9  4.3399 0.0386120 *  
Chla        1    425   425.2  1.3732 0.2427852    
Residuals 184  56978   309.7                      
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
> 
> lm2.a1 <- update(lm.a1, . ~ . - season)# Store into lm2.a1 the updated value of lm.a1 with season.
> summary(lm2.a1) #summarize the lms.a1

Call:
lm(formula = a1 ~ size + speed + mxPH + mnO2 + Cl + NO3 + NH4 + 
    oPO4 + PO4 + Chla, data = clean.algae[, 1:12])

Residuals:
    Min      1Q  Median      3Q     Max 
-36.154 -11.630  -3.147   7.515  64.133 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)   
(Intercept) 40.7783464 22.8107698   1.788  0.07545 . 
sizemedium   3.3370453  3.7353795   0.893  0.37281   
sizesmall   10.2988917  4.0747516   2.527  0.01232 * 
speedlow     2.8164171  4.5812576   0.615  0.53945   
speedmedium -0.7020072  3.1500823  -0.223  0.82389   
mxPH        -2.7541662  2.6042028  -1.058  0.29161   
mnO2         0.8003179  0.6569947   1.218  0.22470   
Cl          -0.0383725  0.0332854  -1.153  0.25045   
NO3         -1.5109859  0.5455540  -2.770  0.00618 **
NH4          0.0015741  0.0009922   1.586  0.11432   
oPO4        -0.0082091  0.0393637  -0.209  0.83503   
PO4         -0.0488663  0.0303671  -1.609  0.10926   
Chla        -0.0891708  0.0790896  -1.127  0.26099   
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 17.53 on 187 degrees of freedom
Multiple R-squared:  0.3666,	Adjusted R-squared:  0.3259 
F-statistic: 9.018 on 12 and 187 DF,  p-value: 1.46e-13

> anova(lm.a1, lm2.a1) # compute analysis of variance of tables for the fitted model.
Analysis of Variance Table

Model 1: a1 ~ season + size + speed + mxPH + mnO2 + Cl + NO3 + NH4 + oPO4 + 
    PO4 + Chla
Model 2: a1 ~ size + speed + mxPH + mnO2 + Cl + NO3 + NH4 + oPO4 + PO4 + 
    Chla
  Res.Df   RSS Df Sum of Sq      F Pr(>F)
1    184 56978                           
2    187 57450 -3   -471.71 0.5078 0.6774
> final.lm <- step(lm.a1)# Store the finale algorithm of all the steps we've followed into final.lm
Start:  AIC=1162.42
a1 ~ season + size + speed + mxPH + mnO2 + Cl + NO3 + NH4 + oPO4 + 
    PO4 + Chla

         Df Sum of Sq   RSS    AIC
- season  3    471.71 57450 1158.1
- speed   2    283.26 57261 1159.4
- oPO4    1      9.84 56988 1160.5
- mxPH    1    423.29 57402 1161.9
- Chla    1    425.22 57403 1161.9
- Cl      1    456.31 57435 1162.0
<none>                56978 1162.4
- mnO2    1    695.52 57674 1162.8
- NH4     1    818.27 57796 1163.3
- PO4     1    836.54 57815 1163.3
- size    2   1893.80 58872 1165.0
- NO3     1   2279.91 59258 1168.3

Step:  AIC=1158.07
a1 ~ size + speed + mxPH + mnO2 + Cl + NO3 + NH4 + oPO4 + PO4 + 
    Chla

        Df Sum of Sq   RSS    AIC
- speed  2    231.90 57682 1154.9
- oPO4   1     13.36 57463 1156.1
- mxPH   1    343.62 57794 1157.3
- Chla   1    390.53 57840 1157.4
- Cl     1    408.30 57858 1157.5
- mnO2   1    455.88 57906 1157.7
<none>               57450 1158.1
- NH4    1    773.25 58223 1158.7
- PO4    1    795.53 58245 1158.8
- size   2   2205.90 59656 1161.6
- NO3    1   2356.64 59807 1164.1

Step:  AIC=1154.88
a1 ~ size + mxPH + mnO2 + Cl + NO3 + NH4 + oPO4 + PO4 + Chla

       Df Sum of Sq   RSS    AIC
- oPO4  1     23.18 57705 1153.0
- Chla  1    258.78 57941 1153.8
- mxPH  1    351.12 58033 1154.1
- mnO2  1    429.29 58111 1154.4
- Cl    1    499.90 58182 1154.6
<none>              57682 1154.9
- NH4   1    718.50 58400 1155.3
- PO4   1    758.83 58441 1155.5
- size  2   2125.92 59808 1158.1
- NO3   1   2319.36 60001 1160.8

Step:  AIC=1152.96
a1 ~ size + mxPH + mnO2 + Cl + NO3 + NH4 + PO4 + Chla

       Df Sum of Sq   RSS    AIC
- Chla  1     235.8 57941 1151.8
- mxPH  1     383.5 58089 1152.3
- mnO2  1     415.2 58120 1152.4
- Cl    1     497.7 58203 1152.7
<none>              57705 1153.0
- NH4   1     697.6 58403 1153.4
- size  2    2104.3 59809 1156.1
- NO3   1    2307.3 60012 1158.8
- PO4   1    5743.5 63448 1169.9

Step:  AIC=1151.77
a1 ~ size + mxPH + mnO2 + Cl + NO3 + NH4 + PO4

       Df Sum of Sq   RSS    AIC
- mnO2  1     450.5 58391 1151.3
- Cl    1     462.0 58403 1151.4
<none>              57941 1151.8
- mxPH  1     661.6 58602 1152.0
- NH4   1     741.3 58682 1152.3
- size  2    2281.6 60222 1155.5
- NO3   1    2608.0 60549 1158.6
- PO4   1    6242.5 64183 1170.2

Step:  AIC=1151.32
a1 ~ size + mxPH + Cl + NO3 + NH4 + PO4

       Df Sum of Sq   RSS    AIC
- NH4   1     522.2 58914 1151.1
<none>              58391 1151.3
- Cl    1     617.0 59008 1151.4
- mxPH  1     644.7 59036 1151.5
- size  2    2553.8 60945 1155.9
- NO3   1    2182.3 60574 1156.7
- PO4   1    9046.0 67437 1178.1

Step:  AIC=1151.1
a1 ~ size + mxPH + Cl + NO3 + PO4

       Df Sum of Sq   RSS    AIC
<none>              58914 1151.1
- mxPH  1     614.9 59528 1151.2
- Cl    1     873.4 59787 1152.0
- NO3   1    1911.9 60825 1155.5
- size  2    2737.1 61651 1156.2
- PO4   1    8532.2 67446 1176.2
> 
> 