Year <- c(1959, 1960, 1961, 1962, 1963, 1964, 1965, 1966, 1967, 1968, 1969) # Setting the Year variable by concantenating the years.
Population <- c(4835, 4970, 5085, 5160, 5310, 5260, 5235, 5255, 5235, 5210, 5175) # Setting the Population variable by concantenating the values.

sample1 <- data.frame(Year, Population) # Creating the data frame with Year and Population as the columns, then setting it as the sample1 variable
sample1 # Printing the data frame.


sample1$Year <- sample1$Year - 1964 # Creating 1964 sample's Year column as a variable. 1964 as the median for the column.
sample1 # Printing the data frame


plot(sample1$Year, sample1$Population, type="b") # Plotting the same year (scatter plot)



fit1 <- lm(sample1$Population ~ sample1$Year) # Storing the fit1 variable with the linear model 
fit2 <- lm(sample1$Population ~ sample1$Year + I(sample1$Year^2)) # Storing the fit2 variable
fit3 <- lm(sample1$Population ~ sample1$Year + I(sample1$Year^2) + I(sample1$Year^3)) # Storing the fit2 variable

# Pay particular attention to this one!
fit4 <- lm(sample1$Population ~ sample1$Year + I(sample1$Year^3)) #???

summary(fit2) #Looking at the coefficients
summary(fit3) #Looking at the coefficients
summary(fit4) #Looking at the coefficients

plot(sample1$Year, sample1$Population, type="l", lwd=3) # Adding the line graph
points(sample1$Year, predict(fit2), type="l", col="red", lwd=2) # Adding the line of best fit 
points(sample1$Year, predict(fit3), type="l", col="blue", lwd=2)
points(sample1$Year, predict(fit4), type="l", col="green", lwd=2)

# what is going on with fit4? Can you explain why it looks so different from fit2 and fit3?

