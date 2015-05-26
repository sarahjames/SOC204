setwd("data/")
library(plyr)

# 1. download response file from Google Docs as .csv file ####

# 2. process (clean) responses separately for each day of course feedback ####
# Notes: Some response categories differed for each survey date; ideally, survey 
# questions would remain constant and could be processed simultaneously. When 
# items in the survey change, the order of items in the .csv file changes, so 
# variable names must be created for each day separately. 

responses.020915 <- read.csv("data/responses.020915.csv")
head(responses.020915)
# Google Docs names each variable with all words of the variable name; I find
# these cumbersome, so I made standardized names that I apply to each day's
# feedback (this standardization also facilitates plotting with ggplot); note
# that these names need to be in the same order as the variable names in the
# dataset
names(responses.020915) <- c("date", "rating_today", "mins_bored", 
                             "mins_confused", "best", "worst", "rating_course", 
                             "comments") # new variable names
head(responses.020915)

# shorten date and precise timestamp to just the characters corresponding to the
# MM/DD/YYYY date; repeat for each day's feedback
responses.020915$date <- substring(responses.020915$date, 0, 9) 

# shorten/standardize some response categories for easier plotting later
responses.020915$mins_bored <- 
  ifelse(as.numeric(responses.020915$mins_bored) <= 50 & 
           as.numeric(responses.020915$mins_bored) >= 0, 
         as.numeric(responses.020915$mins_bored),
         ifelse(responses.020915$mins_bored == "2-3", 2.5, NA))
responses.020915$mins_confused <- 
  ifelse(as.numeric(responses.020915$mins_confused) <= 50 & 
           as.numeric(responses.020915$mins_confused) >= 0, 
         as.numeric(responses.020915$mins_confused),
         ifelse(responses.020915$mins_confused == "<2", 1, 
                ifelse(responses.020915$mins_confused == "none" | 
                         responses.020915$mins_confused == "None", 0, 
                       ifelse(responses.020915$mins_confused == 
                                "10 because I couldn't remember the reading", 
                              10, NA))))

responses.021115 <- read.csv("data/responses.021115.csv")
head(responses.021115)
names(responses.021115) <- c("date", "rating_today", "mins_bored", 
                             "mins_confused_old", "best", "worst_old", 
                             "rating_course", "comments", "mins_confused", 
                             "pace_old", "reading_help", "lecture_help", 
                             "how_beautiful", "worst")
head(responses.021115)
responses.021115$date <- substring(responses.021115$date, 0, 9)

responses.021615 <- read.csv("data/responses.021615.csv")
head(responses.021615)
names(responses.021615) <- c("date", "rating_today", "mins_bored", 
                             "mins_confused", "best", "worst", 
                             "reading_help_old", "lecture_help_old", 
                             "how_beautiful_old", "rating_course", "comments")
responses.021615$date <- substring(responses.021615$date, 0, 9)
head(responses.021615)

responses.021815 <- read.csv("data/responses.021815.csv")
head(responses.021815)
names(responses.021815) <- c("date", "rating_today", "mins_bored", 
                             "mins_confused", "best", "worst", "rating_course", 
                             "comments", "course_impressions", "recommend")
responses.021815$date <- substring(responses.021815$date, 0, 9)
head(responses.021815)

responses.022315 <- read.csv("data/responses.022315.csv")
head(responses.022315)
names(responses.022315) <- c("date", "rating_today", "mins_bored", 
                             "mins_confused", "best", "worst", "rating_course", 
                             "summary_balance", "recommend_old", "comments")
responses.022315$date <- substring(responses.022315$date, 0, 9)
head(responses.022315)

responses.022515 <- read.csv("data/responses.022515.csv")
head(responses.022515)
names(responses.022515) <- c("date", "rating_today", "mins_bored", 
                             "mins_confused", "best", "worst", "rating_course", 
                             "summary_balance", "comments")
responses.022515$date <- substring(responses.022515$date, 0, 9)
head(responses.022515)

responses.030215 <- read.csv("data/responses.030215.csv")
head(responses.030215)
names(responses.030215) <- c("date", "rating_today", "mins_bored", 
                             "mins_confused", "best", "worst", "rating_course", 
                             "summary_balance", "comments")
responses.030215$date <- substring(responses.030215$date, 0, 9)
head(responses.030215)

responses.030415 <- read.csv("data/responses.030415.csv")
head(responses.030415)
names(responses.030415) <- c("date", "rating_today", "mins_bored", 
                             "mins_confused", "best", "worst", "rating_course", 
                             "summary_balance", "comments")
responses.030415$date <- substring(responses.030415$date, 0, 9)
head(responses.030415)

responses.030915 <- read.csv("data/responses.030915.csv")
head(responses.030915)
names(responses.030915) <- c("date", "rating_today", "mins_bored", 
                             "mins_confused", "best", "worst", "rating_course", 
                             "summary_balance", "comments")
responses.030915$date <- substring(responses.030915$date, 0, 9)
head(responses.030915)

responses.032315 <- read.csv("data/responses.032315.csv")
head(responses.032315)
names(responses.032315) <- c("date", "rating_today", "mins_bored", 
                             "mins_confused", "best", "worst", "rating_course", 
                             "summary_balance", "comments")
responses.032315$date <- substring(responses.032315$date, 0, 9)
head(responses.032315)

responses.032515 <- read.csv("data/responses.032515.csv")
head(responses.032515)
names(responses.032515) <- c("date", "rating_today", "mins_bored", 
                             "mins_confused", "best", "worst", "rating_course", 
                             "invite_again", "comments", "old")
responses.032515$date <- substring(responses.032515$date, 0, 9)
responses.032515$date <- "3/25/2015"
head(responses.032515)

responses.033015 <- read.csv("data/responses.033015.csv")
head(responses.033015)
names(responses.033015) <- c("date", "rating_today", "mins_bored", 
                             "mins_confused", "rating_course", "invite_again", 
                             "comments")
responses.033015$date <- substring(responses.033015$date, 0, 9)
head(responses.033015)

responses.040115 <- read.csv("data/responses.040115.csv")
head(responses.040115)
names(responses.040115) <- c("date", "rating_today", "mins_bored", 
                             "mins_confused", "best", "worst", "rating_course", 
                             "summary_balance", "comments", "what_read")
responses.040115$date <- substring(responses.040115$date, 0, 9)
head(responses.040115)

responses.040615 <- read.csv("data/responses.040615.csv")
head(responses.040615)
names(responses.040615) <- c("date", "rating_today", "mins_bored", 
                             "mins_confused", "best", "worst", "rating_course", 
                             "summary_balance", "comments", "what_read")
responses.040615$date <- substring(responses.040615$date, 0, 9)
head(responses.040615)

responses.040815 <- read.csv("data/responses.040815.csv")
head(responses.040815)
names(responses.040815) <- c("date", "rating_today", "mins_bored", 
                             "mins_confused", "best", "worst", "rating_course", 
                             "summary_balance", "comments", "what_read")
responses.040815$date <- substring(responses.040815$date, 0, 9)
head(responses.040815)

responses.041315 <- read.csv("data/responses.041315.csv")
head(responses.041315)
names(responses.041315) <- c("date", "rating_today", "mins_bored", 
                             "mins_confused", "best", "worst", "rating_course", 
                             "what_read", "summary_balance", "comments")
responses.041315$date <- substring(responses.041315$date, 0, 9) 
head(responses.041315)

responses.041515 <- read.csv("data/responses.041515.csv")
head(responses.041515)
names(responses.041515) <- c("date", "rating_today", "mins_bored", 
                             "mins_confused", "best", "worst", "rating_course", 
                             "what_read", "summary_balance", "comments")
responses.041515$date <- substring(responses.041515$date, 0, 9)
head(responses.041515)

responses.042015 <- read.csv("data/responses.042015.csv")
head(responses.042015)
names(responses.042015) = c("date", "rating_today", "mins_bored", 
                            "mins_confused", "best", "worst", "rating_course", 
                            "what_read", "summary_balance", "comments")
responses.042015$date <- substring(responses.042015$date, 0, 9)
head(responses.042015)

responses.042215 <- read.csv("data/responses.042215.csv")
head(responses.042215)
names(responses.042215) = c("date", "rating_today", "mins_bored", 
                            "mins_confused", "best", "worst", "rating_course", 
                            "what_read", "summary_balance", "comments")
responses.042215$date <- substring(responses.042215$date, 0, 9)
head(responses.042215)

responses.042715 <- read.csv("data/responses.042715.csv")
head(responses.042715)
names(responses.042715) = c("date", "rating_today", "mins_bored", 
                            "mins_confused", "best", "worst", "rating_course", 
                            "what_read", "summary_balance", "comments")
responses.042715$date <- substring(responses.042715$date, 0, 9)
head(responses.042715)
# 3. merge responses from all days ####

# merge responses for each day into one dataset and fills in the "blanks" for
# questions which we didn't ask for every date with NA; this produces a long 
# form dataset with one line for each survey response in the semester
responses <- rbind.fill(responses.020915, responses.021115, responses.021615, 
                        responses.021815, responses.022315, responses.022515, 
                        responses.030215, responses.030415, responses.030915, 
                        responses.032315, responses.032515, responses.033015,
                        responses.040115, responses.040615, responses.040815, 
                        responses.041315, responses.041515, responses.042015,
                        responses.042215, responses.042715) 
# order the dates so that they are chronological when plotted
responses$date <- factor(responses$date, levels = c("2/9/2015 ", "2/11/2015", 
                                                    "2/16/2015", "2/18/2015", 
                                                    "2/23/2015", "2/25/2015", 
                                                    "3/2/2015 ", "3/4/2015 ",
                                                    "3/9/2015 ", "3/23/2015", 
                                                    "3/25/2015", "3/30/2015",
                                                    "4/1/2015 ", "4/6/2015 ", 
                                                    "4/8/2015 ", "4/13/2015", 
                                                    "4/15/2015", "4/20/2015",
                                                    "4/22/2015", "4/27/2015")) 

# shorten long variable response categories
responses$best_short <- ifelse(responses$best == "demonstrations", "demos",
                               ifelse(responses$best == "lecture", "lecture",
                                      ifelse(responses$best == "readings", 
                                             "readings",
                                             ifelse(responses$best == 
                                                      "think/pair/share", 
                                                    "T/P/S", "other"))))
responses$best_short <- factor(responses$best_short, 
                               levels = c("lecture", "demos", "T/P/S", 
                                          "readings", "other"))
responses$worst_short <- ifelse(responses$worst == "demonstrations", "demos",
                                ifelse(responses$worst == "lecture", "lecture",
                                       ifelse(responses$worst == "readings", 
                                              "readings",
                                              ifelse(responses$worst == 
                                                       "think/pair/share", 
                                                     "T/P/S", 
                                                     ifelse(responses$worst == 
                                                              "nothing", 
                                                            "nothing", "other")))))
responses$worst_short <- factor(responses$worst_short, 
                                levels = c("lecture", "demos", "T/P/S", 
                                           "readings", "other", "nothing"))
responses$summary_balance_short <- 
  ifelse(responses$summary_balance == 
           "had the right mix of reviewing the reading and covering new material", 
         "right mix",
         ifelse(responses$summary_balance == 
                  "spent too much time covering new material and not enough time reviewing the reading", 
                "too much new",
                ifelse(responses$summary_balance == 
                         "spent too much time reviewing the reading and not enough time covering new material", 
                       "too much summary", NA)))
responses$summary_balance_short <- factor(responses$summary_balance_short, 
                                          levels = c("too much summary", "right mix", "too much new"))

# calculate mean response to various questions by date to be used in ggplot facet plotting
responses <- ddply(responses, .(date), transform, rating_today_mean = mean(rating_today))
responses <- ddply(responses, .(date), transform, rating_course_mean = mean(rating_course))
responses <- ddply(responses, .(date), transform, mins_bored_mean = mean(mins_bored))
responses <- ddply(responses, .(date), transform, mins_confused_mean = mean(mins_confused))

# 4. save dataset ####
save(responses, list = "responses", 
     file = "data/responses.RData")
