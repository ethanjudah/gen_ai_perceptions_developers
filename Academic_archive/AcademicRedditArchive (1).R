
library(jsonlite)
library(tidyverse)
library(httr)

# command = paste("https://api.pullpush.io/reddit/search/comment/?q=artificial%20intelligence&subreddit=machinelearning&sort=desc&size=100&before=",as.integer(before),sep ='')


body <- c()
author_created_utc <- c()
author_fullname <- c()
permalink <- c()

after <- as.POSIXct("2022-11-30", tz = "UTC")#86400 
before <- as.POSIXct("2022-12-01", tz = "UTC")
before == after

repeat {
# change subreddit in line 20 for for each subreddit
command = paste("https://api.pullpush.io/reddit/search/comment/?q=copilot&sort=desc&size=100&before=",as.integer(before),sep ='')
command = paste(command,'&after=',sep ='')
command = paste(command,as.integer(after),sep ='')
  
response <- GET(
  command
)

posts <- content(response)[1]$data


for (post in posts){
  body <- c(body,post$body)
  if (is.null(post$author_created_utc)==TRUE){
    author_created_utc <- c(author_created_utc,0)
  }
  else{
    author_created_utc <- c(author_created_utc,post$author_created_utc)
  }
  if (is.null(post$author_fullname)==TRUE){
    author_fullname <- c(author_fullname,'Unknown')
  }
  else{
    author_fullname <- c(author_fullname,post$author_fullname)
  }
  if (is.null(post$author_fullname)==TRUE){
    permalink <- c(permalink,'Unknown')
  }
  else{
    permalink <- c(permalink,post$permalink)
  }
}

after <- after + 86400 
before <- before + 86400 
print(before)
if (before==as.POSIXct("2023-08-01", tz = "UTC")){
  output <- data.frame(body,author_created_utc,author_fullname,permalink)
  stop('End date')
}

}
library(dplyr)

sum(!duplicated(output))



