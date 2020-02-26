###TAYLOR DAMANN###
#####PDS PS3#####

########ggplot#########
#1- finish what we started in class 2/11/20
rm(list = ls())
library(ggplot2)
##Here, I am loading in data, only choosing Super Tuesday states and relevant candidates. 
primaryPolls<-read.csv('https://jmontgomery.github.io/PDS/Datasets/president_primary_polls_feb2020.csv', stringsAsFactors = F)
primaryPolls$start_date<-as.Date(primaryPolls$start_date, "%m/%d/%Y")
primaryPolls<-primaryPolls[primaryPolls$state%in%c("Alabama", "Arkansas", "California", "Colorado", "Maine", "Massachusetts", "Minnesota", "North Carolina", "Oklahoma", "Tennessee", "Texas", "Utah", "Vermont", "Virginia"),]
primaryPolls<-primaryPolls[primaryPolls$candidate_name%in%c("Amy Klobuchar", "Bernard Sanders", "Elizabeth Warren", "Joseph R. Biden Jr.", "Michael Bloomberg", "Pete Buttigieg", "Tom Steyer"),]

#I make a preliminary plot that shows the total for candidates across all of these states.
#Notice that Bloomberg's percent is in the negative and has a huge margin of error. This is
#because there isn't data for Bloomberg. R has to interpolate. 
ggplot(data=primaryPolls)+
  geom_smooth(mapping = aes(x=start_date, y=pct, color=candidate_name))
#We can interpret this plot by noting that Bernie Sanders and Joe Biden are the top-polling candidates,
#with Bernie on an upswing and Biden on a decline. Yet, this plot is too general. We can separate
#by state. The data separated into the 12 Super Tuesday states are below:
ggplot(data=primaryPolls)+
  geom_point(mapping = aes(x=start_date, y=pct, color=candidate_name), alpha=.9) + 
  facet_wrap(~ state, nrow=2)
#From this plot, we can see who is popular in which states. In Maine, Minnesota,
#Vermont, and California Elizabeth Warren leads the polls. Biden takes the lead
#in Alabama, North Carolina, Tennessee, Texas and Virginia. Bernie has the lead
#in only Colorado and Utah. Unfortunately, we cannot do smoothing on some of
#these states due to lack of data. 

#We can make our plots more appealing by taking a few steps. First, I use the
#minimal theme by using theme_minimal(). Next, I add my own labels by using labs().
#I also fix the jumble of dates by using theme(axis.text.x). Finally, I add a title
#to the plots.

#by state
ggplot(data=primaryPolls) +
  ggtitle("Candidate Support by State") +
  geom_point(mapping = aes(x=start_date, y=pct, color=candidate_name), alpha=.9) +
  labs(x="Polling Date", y="Percentage of Support", color = "Candidates")+
  facet_wrap(~ state, nrow=2)+
  theme_minimal()+
  theme(plot.title = element_text(hjust = 0.5), axis.text.x=element_text(angle=90, hjust=1)) 

#by candidate
ggplot(data=primaryPolls)+
  ggtitle("Support for Candidates") +
  geom_smooth(mapping = aes(x=start_date, y=pct, color=candidate_name)) + 
  geom_point(mapping = aes(x=start_date, y=pct, color=candidate_name), alpha=.4) +
  facet_wrap(~ candidate_name, nrow=2)+
  theme_minimal() +
  labs(x="Polling Date", y="Percentage of Support", color = "Candidates") +
  theme(plot.title = element_text(hjust = 0.5), axis.text.x=element_text(angle=90, hjust=1)) 

#2- finish what we started on 2/13/2020







######tidyverse######
#3

########text as data#######
#4
