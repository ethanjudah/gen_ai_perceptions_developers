library(RedditExtractoR)
library(radarchart)
library(tm)
library(syuzhet)

combined_reddit_posts <- read.csv("combined_reddit_posts.csv")

combined_reddit_posts$X <- NULL
combined_reddit_posts$X.1 <- NULL
combined_reddit_posts$X.2 <- NULL

body <- iconv(combined_reddit_posts$body, to = "utf-8-mac")
clov <- get_nrc_sentiment(body)

x1 <- data.frame(clov=100*colSums(clov)/sum(clov))
z <- cbind(x1)
labs <- rownames(z)

chartJSRadar(z, 
             labs = labs,
             labelSize = 40,
             main = 'reddit sentiment GENAI')