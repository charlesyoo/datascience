
Card game: Blackjack

blackjack<- read.table("A file containing all the winning combination of 21. Jackpot is a column with strongest combo")


> m <- naiveBayes(Jackpot ~., data=Blackjack)
> summary(m)
> table(predict(m, blackjack), blackjack[, (the location of the Jackpot column)])


labels<- Blackjack$Jackpot
> set.seed(1234)
> N <-nrow(Blackjack)
> train.pct <- .7
> train.index <- sample(1:N, train.pct * N) 
> train.Blackjack <- Blackjack[train.index, ] 
> test.Blackjack <- Blackjack[-train.index, ] 
> train.labels <- as.factor(as.matrix(labels)[train.index, ]) 
> test.labels <- as.factor(as.matrix(labels)[-train.index, ]) 
> err.rates <- data.frame()
> max.i <- 10
#Creating a for loop to insert the naiveBayes model
> for (i in 1:max.i) {
+     naiveBayes.fit <- naiveBayes(
+         train = train.Blackjack,
+         test = test.Blackjack,
+         cl = train.labels,
+         i = i
+     )
+     cat('\n', 'i = ', i, ', train.pct = ', train.pct, '\n', sep='')
# Prediction?
+     print(table(predict(m, test.labels, naiveBayes.fit)) #??
+     this.err <- sum(test.labels != naiveBayes.fit) / length(test.labels)
+     err.rates <- rbind(err.rates, this.err)
+ }