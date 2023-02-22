library(ggplot2)

data <- read_csv("~/Downloads/NCHS_-_Leading_Causes_of_Death__United_States.csv")
 view(data)
 
 bar_data <- data[data$Year == 2017,]
 newbar_data <- bar_data[bar_data$`Cause.Name` != "All causes",]
 bardata_new <- newbar_data[newbar_data$State != "United States",]
 
ggplot(bardata_new,aes(x=`Cause Name`, y= Deaths, fill= `Cause Name`)) +
  geom_bar(stat = "identity") +
  labs(title = "Top 10 Leading Causes of Deaths in the US in 2017" ,
       x = "Cause of Death",
       y = "Number of Deaths") +
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE))+
  theme(axis.text.x = element_text(size = 6, angle = 0, hjust = .5))