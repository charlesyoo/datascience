> library('tm')
> library('ggplot2')
> spam.path <- file.path("data", "spam")
> spam2.path <- file.path("data", "spam_2")
> easyham.path <- file.path("data", "easy_ham")
> easyham2.path <- file.path("data", "easy_ham_2")
> hardham.path <- file.path("data", "hard_ham")
> hardham2.path <- file.path("data", "hard_ham_2")
> head(spam.path)
[1] "data/spam"
> x <- runif(1000, 0, 40)
> y1 <- cbind(runif(100, 0, 10), 1)
> y2 <- cbind(runif(800, 10, 30), 2)
> y3 <- cbind(runif(100, 30, 40), 1)
> val <- data.frame(cbind(x, rbind(y1, y2, y3)),
+                   stringsAsFactors = TRUE)
> ex1 <- ggplot(val, aes(x, V2)) +
+     geom_jitter(aes(shape = as.factor(V3)),
+                 position = position_jitter(height = 2)) +
+     scale_shape_discrete(guide = "none", solid = FALSE) +
+     geom_hline(aes(yintercept = c(10,30)), linetype = 2) +
+     theme_bw() +
+     xlab("X") +
+     ylab("Y")
> ggsave(plot = ex1,
+        filename = file.path("images", "00_Ex1.pdf"),
+        height = 10,
+        width = 10)
Error in grDevices::pdf(..., version = version) : 
  cannot open file 'images/00_Ex1.pdf'