# Load necessary libraries
library(dplyr)
library(tokenizers)
library(tm)
library(udpipe)
library(vader)    # For VADER sentiment analysis
library(ggplot2)  # For visualization

# Load your data
combined_reddit_posts <- read.csv("combined_reddit_posts.csv")

combined_reddit_posts$X <- NULL
combined_reddit_posts$X.1 <- NULL
combined_reddit_posts$X.2 <- NULL



# Data preprocessing (tokenization, stopwords removal, lemmatization)
ud_model <- udpipe_download_model(language = "english")
ud_model <- udpipe_load_model(ud_model$file_model)

lemmatize_text <- function(text) {
  if (!is.na(text) && nchar(text) > 0) {
    x <- udpipe_annotate(ud_model, x = text)
    x <- as.data.frame(x)
    x <- x[x$lemma != "", ]
    return(paste(x$lemma, collapse = " "))
  } else {
    return("")
  }
}

combined_reddit_posts$lemmatized_text <- sapply(combined_reddit_posts$full_text, lemmatize_text)

# Remove rows with empty lemmatized_text
combined_reddit_posts <- combined_reddit_posts[combined_reddit_posts$lemmatized_text != "", ]

# Sentiment Analysis using VADER
sentiment_scores <- vader(combined_reddit_posts$lemmatized_text)

# Add sentiment scores to the dataframe
combined_reddit_posts$sentiment_scores <- sentiment_scores$compound

# Visualizing Results
ggplot(combined_reddit_posts, aes(x = sentiment_scores, fill = sentiment_scores)) +
  geom_histogram(binwidth = 0.05) +
  labs(title = "Sentiment Distribution", x = "Sentiment Score (Compound)", y = "Count") +
  scale_fill_gradient(low = "red", high = "green")
In this code, we've used the vader() function from the vader package to perform sentiment analysis. The compound sentiment score is added to the dataframe, and then we visualize the sentiment distribution using a histogram.







