# Install packages that are needed.
install.packages('tm')
install.packages('stringr')
install.packages('RColorBrewer')
install.packages('wordcloud')
install.packages('textmineR')
install.packages('topicmodels')
install.packages('ggplot2')
install.packages('LDAvis')
install.packages('servr')

library(dplyr) # basic data manipulation
library(tm) # package for text mining package
library(stringr) # package for dealing with string
library(RColorBrewer)# package to get special theme color
library(wordcloud) # package to create wordcloud
library(topicmodels) # package for topic modelling
library(ggplot2) # basic data visualization
library(LDAvis) # LDA specific visualization
library(servr) # interactive support for LDA visualization
set.seed(1)

setwd("~/Documents/BADS/Dissertation/RedditDataAPI")
data <- read.csv(file = 'combined_reddit_posts.csv', header = TRUE)

posts <- stringr::str_conv(data$body, "UTF-8")

data$X <- NULL
data$X.1 <- NULL
data$X.2 <- NULL

# Create Corpus
docs <- Corpus(VectorSource(posts))


#Create DTM with term frequency
dtmdocs <- DocumentTermMatrix(docs,
                              control = list(lemma=TRUE,removePunctuation = TRUE,
                                             removeNumbers = TRUE, stopwords = TRUE,
                                             tolower = TRUE))
dtmdocsalternative <- textmineR::CreateDtm(data$body)
raw.sum=apply(dtmdocs,1,FUN=sum)
dtmdocs=dtmdocs[raw.sum!=0,]


dtm.new <- as.matrix(dtmdocs)
frequency <- colSums(dtm.new)
frequency <- sort(frequency, decreasing=TRUE)
doc_length <- rowSums(dtm.new)
frequency[1:10] #Example of the output

words <- names(frequency)# get back the word
wordcloud(words[1:100], frequency[1:100], rot.per=0.15,
          random.order = FALSE, scale=c(4,0.5),
          random.color = FALSE, colors=brewer.pal(8,"Dark2"))

# set number of iteration to run, more is usually better but take longer.
iter <- 200
coherence<- c()
for (i in (5:20)){
  ldaOut <- textmineR::FitLdaModel(dtmdocsalternative,i,iterations=iter)
  coherence_one <- mean(textmineR::CalcProbCoherence(phi = ldaOut$phi,
            dtm = dtmdocsalternative))
  coherence<-append(coherence,coherence_one)
}
k <- c(5:20)[which.max(coherence)]
print(k)


coherence_mat <- data.frame(k = c(5:20),
                            coherence = coherence,
                            stringsAsFactors = FALSE)
ggplot(coherence_mat, aes(x = k, y = coherence)) +
  geom_point() +
  geom_line(group = 1)+
  ggtitle("Best Topic by Coherence Score") + theme_minimal() +
  scale_x_continuous(breaks = seq(1,31,1)) + ylab("Coherence")

ldaOut <-LDA(dtmdocs,k, method="Gibbs",
             control=list(iter=iter,seed=1000))
phi <- terms(ldaOut)
theta <- terms(ldaOut)


phi <- posterior(ldaOut)$terms %>% as.matrix
#matrix, with each row containing the distribution over terms for a topic,
theta <- posterior(ldaOut)$topics %>% as.matrix
#matrix, with each row containing the probability distribution over topics for a document,


phi <- as.matrix(topics(ldaOut))  # topic-term matrix
theta <- as.matrix((terms(ldaOut)))

ldaOut.terms <- as.matrix(terms(ldaOut, 10))

# Which 'topic' is the post in (highest probability)
ldaOut.topics <- data.frame(topics(ldaOut))
ldaOut.topics$index <- as.numeric(row.names(ldaOut.topics))
data$index <- as.numeric(row.names(data))
datawithtopic <- merge(data, ldaOut.topics, by='index',all.x=TRUE)
datawithtopic <- datawithtopic[order(datawithtopic$index), ]
datawithtopic[0:20,]

# For each post, how closely it associate with each topics
topicProbabilities <- as.data.frame(ldaOut@gamma)
topicProbabilities[0:10,1:5]


# Create the JSON object for LDAvis
vocab <- colnames(phi) # vocab list in DTM
json_lda <- createJSON(phi = phi, theta = theta,
                       vocab = vocab, doc.length = doc_length,
                       term.frequency = frequency)

serVis(json_lda, out.dir = 'vis', open.browser = TRUE)