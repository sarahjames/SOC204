---
title: "Feedback"
author: "Sarah James"
date: "May 26, 2015"
output: html_document
---

Surveys: [02.09.15](bit.do/soc204), [02.11.15](bit.do/soc204_4), [02.16.15](bit.do/soc204_feb16), [02.18.15](bit.do/soc204_feb18), [02.23.15](bit.do/soc204_feb23), [02.25.15](bit.do/soc204_feb25), [03.02.15](bit.do/soc204_mar2), [03.04.15](bit.do/soc204_mar4), [03.09.15](bit.do/soc204_mar9), [03.23.15](bit.do/soc204_mar23), [03.25.15](bit.do/soc204_mar25), [03.30.15](bit.do/soc204_mar30), [04.01.15](bit.do/soc204_apr1), [04.06.15](bit.do/soc204_apr6), [04.08.15](bit.do/soc204_apr8), [04.13.15](bit.do/soc204_apr13), [04.15.15](bit.do/soc204_apr15)

Notes: Daily means are indicated in red as appropriate. 

### Attendance 
```{r, echo=FALSE, warning=FALSE, message=FALSE, comment="", fig.width = 6, fig.height = 3}
setwd("/data")
load("responses.RData")
attendancenumbers <- c(74, 80, 73, 79, 72, 72, 61, 73, 68, 69, 76, 64, 71, 51, 
                       68, 57, 63, 45, 63, 63) # manually add attendance
attendance <- as.data.frame(cbind('date' = as.character(unique(responses$date)), 
                                  'attendance' = attendancenumbers)) 
attendance
```

#### Trends in response rate
```{r, echo=FALSE, warning=FALSE, message=FALSE, comment="", fig.width = 10.5, fig.height = 3}
library(ggplot2)
responserates <- as.data.frame(cbind('date' = unique(responses$date), 
                                     'rr' = table(responses$date)/
                                       attendancenumbers))
ggplot(responserates) + geom_point(aes(x = as.numeric(date), y = rr)) +
  geom_line(aes(x = as.numeric(date), y = rr)) +
  scale_y_continuous(limits = c(0, 1), breaks = c(seq(0, 1, 0.2))) + ylab("") + 
  xlab("") +
  scale_x_continuous(limits = c(1, length(levels(responses$date))), 
                     breaks = c(1:length(levels(responses$date))), 
                     labels = levels(responses$date)) + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
```

## Responses
#### Rate today's class; 1 = bad, 5 = great
```{r, echo=FALSE, warning=FALSE, message=FALSE, comment="", fig.width = 4, fig.height = 3}
levels.date <- levels(responses$date)

# select only the most recent date's responses to plot
responses.for.plotting <- responses[responses$date == 
                                      levels.date[length(levels.date)], ] 

ggplot(responses.for.plotting) + facet_grid(. ~ date) + 
  geom_histogram(aes(x = rating_today, 
                     y = (..count..)/tapply(..count..,..PANEL..,sum)[..PANEL..])) + 
  xlab("") + ylab("Proportion") + scale_x_continuous(limits = c(0.5, 5.5)) +
  geom_vline(aes(xintercept = rating_today_mean, colour = "red")) # daily mean
```

#### Trends in mean of rate today's class; 1 = bad, 5 = great
```{r, echo=FALSE, warning=FALSE, message=FALSE, comment="", fig.width = 10.5, fig.height = 3}
ggplot(responses) + geom_point(aes(x = as.numeric(date), y = rating_today_mean)) +
  geom_line(aes(x = as.numeric(date), y = rating_today_mean)) +
  scale_y_continuous(limits = c(1, 5), breaks = c(seq(1:5))) + ylab("") + 
  xlab("") +
  scale_x_continuous(limits = c(1, length(levels(responses$date))), 
                     breaks = c(1:length(levels(responses$date))), 
                     labels = levels(responses$date)) + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
```

#### Rate the course thus far; 1 = bad, 5 = great
```{r, echo=FALSE, warning=FALSE, message=FALSE, comment="", fig.width = 4, fig.height = 3}
ggplot(responses.for.plotting) + facet_grid(. ~ date) + 
  geom_histogram(aes(x = rating_course, 
                     y = (..count..)/tapply(..count..,..PANEL..,sum)[..PANEL..])) + 
  xlab("") + ylab("Proportion") + scale_x_continuous(limits = c(0.5, 5.5)) +
  geom_vline(aes(xintercept = rating_course_mean, colour = "red")) 
```

#### Trends in mean of rate the course thus far; 1 = bad, 5 = great
```{r, echo=FALSE, warning=FALSE, message=FALSE, comment="", fig.width = 10.5, fig.height = 3}
ggplot(responses) + geom_point(aes(x = as.numeric(date), y = rating_course_mean)) +
  geom_line(aes(x = as.numeric(date), y = rating_course_mean)) +
  scale_y_continuous(limits = c(1, 5), breaks = c(seq(1:5))) + ylab("") + 
  xlab("") +
  scale_x_continuous(limits = c(1, length(levels(responses$date))), 
                     breaks = c(1:length(levels(responses$date))), 
                     labels = levels(responses$date)) + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
```

#### What was best about today's class?
```{r, echo=FALSE, warning=FALSE, message=FALSE, comment="", fig.width = 4, fig.height = 3}
ggplot(responses.for.plotting) + facet_grid(. ~ date) + 
  geom_histogram(aes(x = best_short, 
                     y = (..count..)/tapply(..count..,..PANEL..,sum)[..PANEL..])) + 
  xlab("") + ylab("Proportion") 
```

#### What was worst about today's class?
```{r, echo=FALSE, warning=FALSE, message=FALSE, comment="", fig.width = 4, fig.height = 3}
ggplot(responses.for.plotting) + facet_grid(. ~ date) + 
  geom_histogram(aes(x = worst_short, 
                     y = (..count..)/tapply(..count..,..PANEL..,sum)[..PANEL..])) + 
  xlab("") + ylab("Proportion") 
```

#### How many minutes were you bored today?
```{r, echo=FALSE, warning=FALSE, message=FALSE, comment="", fig.width = 4, fig.height = 3}
ggplot(responses.for.plotting) + facet_grid(. ~ date) + 
  geom_histogram(aes(x = as.numeric(mins_bored), 
                     y = (..count..)/tapply(..count..,..PANEL..,sum)[..PANEL..])) + 
  xlab("") + ylab("Proportion") + 
  scale_x_continuous(limits = c(0, 51), breaks = c(seq(0, 50, 5)))+
  geom_vline(aes(xintercept = mins_bored_mean, colour = "red")) 
```

#### Trends in mean of minutes bored today
```{r, echo=FALSE, warning=FALSE, message=FALSE, comment="", fig.width = 10.5, fig.height = 3}
ggplot(responses) + geom_point(aes(x = as.numeric(date), y = mins_bored_mean)) +
  geom_line(aes(x = as.numeric(date), y = mins_bored_mean)) +
  scale_y_continuous(limits = c(0, 50), breaks = c(seq(0, 50, 5))) + ylab("") + 
  xlab("") +
  scale_x_continuous(limits = c(1, length(levels(responses$date))), 
                     breaks = c(1:length(levels(responses$date))), 
                     labels = levels(responses$date)) + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
```

#### How many minutes were you confused today?
```{r, echo=FALSE, warning=FALSE, message=FALSE, comment="", fig.width = 4, fig.height = 3}
ggplot(responses.for.plotting) + facet_grid(. ~ date) + 
  geom_histogram(aes(x = as.numeric(mins_confused), 
                     y = (..count..)/tapply(..count..,..PANEL..,sum)[..PANEL..])) + 
  xlab("") + ylab("Proportion") +
  scale_x_continuous(limits = c(0, 51), breaks = c(seq(0, 50, 5))) +
  geom_vline(aes(xintercept = mins_confused_mean, colour = "red")) 
```

#### Trends in mean of minutes confused today
```{r, echo=FALSE, warning=FALSE, message=FALSE, comment="", fig.width = 10.5, fig.height = 3}
ggplot(responses) + geom_point(aes(x = as.numeric(date), y = mins_confused_mean)) +
  geom_line(aes(x = as.numeric(date), y = mins_confused_mean)) +
  scale_y_continuous(limits = c(0, 50), breaks = c(seq(0, 50, 5))) + ylab("") + 
  xlab("") +
  scale_x_continuous(limits = c(1, length(levels(responses$date))), 
                     breaks = c(1:length(levels(responses$date))), 
                     labels = levels(responses$date)) + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
```

#### Which course materials did you engage with (read) prior to class?
```{r, echo=FALSE, warning=FALSE, message=FALSE, comment="", fig.width = 10, fig.height = 10}
ggplot(responses.for.plotting) + facet_grid(. ~ date) + 
  geom_histogram(aes(x = what_read, 
                     y = (..count..)/tapply(..count..,..PANEL..,sum)[..PANEL..])) + 
  xlab("") + ylab("Proportion") + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
```

#### For today's class meeting, how was the balance between reviewing the readings and covering new material?
```{r, echo=FALSE, warning=FALSE, message=FALSE, comment="", fig.width = 3, fig.height = 3}
ggplot(responses.for.plotting) + facet_grid(. ~ date) + 
  geom_histogram(aes(x = summary_balance_short, 
                     y = (..count..)/tapply(..count..,..PANEL..,sum)[..PANEL..])) + 
  xlab("") + ylab("Proportion") + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
```

### Student comments
`r setwd("data/")
load("responses.RData")
levels.date <- levels(responses$date)
levels.date[length(levels.date)]`
```{r, echo=FALSE, warning=FALSE, message=FALSE, comment=""}
unique(responses$comments[responses$date == levels.date[length(levels.date)]])
```
