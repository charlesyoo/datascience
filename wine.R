read.csv(file="wine.csv",head=TRUE,sep=",")
data <- read.csv(file="wine.csv",head=TRUE,sep=",")
head(data)
summary(data)
labels <- data$wine
labels <- data$Wine
data$Wine <- NULL
N <- nrow(data)
train.pct <- .7
train.index <- sample(1:N, train.pct * N) 
train.data <- data[train.index, ]
test.data <- data[-train.index, ]
train.labels <- as.factor(as.matrix(labels)[train.index, ])
test.labels <- as.factor(as.matrix(labels)[-train.index, ])
err.rates <- data.frame()
max.k <- 100
for (k in 1:max.k) {
  knn.fit <- knn(
    train = train.data,         # training set
    test = test.data,           # test set
    cl = train.labels,          # true labels
    k = k                       # number of NN to poll
)
 cat('\n', 'k = ', k, ', train.pct = ', train.pct, '\n', sep='')
  print(table(test.labels, knn.fit))
 this.err <- sum(test.labels != knn.fit) / length(test.labels)re
 this.err <- sum(test.labels != knn.fit) / length(test.labels)re
 this.err <- sum(test.labels != knn.fit) / length(test.labels)
  cat('\n', 'k = ', k, ', train.pct = ', train.pct, '\n', sep='')
 this.err <- sum(test.labels != knn.fit) / length(test.labels)
 this.err <- sum(test.labels != knn.fit) / length(test.labels)
# perform fit for various values of k
for (k in 1:max.k) {
  knn.fit <- knn(
    train = train.data,         # training set
    test = test.data,           # test set
    cl = train.labels,          # true labels
    k = k                       # number of NN to poll
  )
  # print params and confusion matrix for each value k
  cat('\n', 'k = ', k, ', train.pct = ', train.pct, '\n', sep='')
  print(table(test.labels, knn.fit))
this.err <- sum(test.labels != knn.fit) / length(test.labels)
  err.rates <- rbind(err.rates, this.err)
}
library(class)
library(ggplot2)
for (k in 1:max.k) {
  knn.fit <- knn(
    train = train.data,         # training set
    test = test.data,           # test set
    cl = train.labels,          # true labels
    k = k                       # number of NN to poll
  )
  # print params and confusion matrix for each value k
  cat('\n', 'k = ', k, ', train.pct = ', train.pct, '\n', sep='')
  print(table(test.labels, knn.fit))
  # store generalation error and append to total results
  this.err <- sum(test.labels != knn.fit) / length(test.labels)
  err.rates <- rbind(err.rates, this.err)
}
## OUTPUT RESULTS
results <- data.frame(1:max.k, err.rates)   # create results summary data frame
names(results) <- c('k', 'err.rate')        # label columns of results df
# create title for results plot
title <- paste('knn results (train.pct = ', train.pct, ')', sep='')
# create results plot
results.plot <- ggplot(results, aes(x=k, y=err.rate)) + geom_point() + geom_line()
results.plot <- results.plot + ggtitle(title)
# draw results plot
results.plot
head(labels)
q()
