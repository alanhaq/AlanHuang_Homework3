#Business Analytics HW3
#Alan Huang


# Question 1
# These will be useful later on
library(tidyverse)
library(ggplot2)
# a) Importing the coronavirus package
install.packages("coronavirus")
library(coronavirus)

# b) The first 100 elements in the coronavirus package
head(coronavirus, n=100)

# c) What each column of the data frame represents
# date column shows the date of the summary data.
# province shows the province if applicable.
# country shows the what country the data is representing.
# lat and long give the latitude and longitude coordinates respectively.
# type refers to the type of case, such as confirmed or death.
# cases gives the number of daily cases corresponding to the type.

# Question 2
# a) Summary of the total confirmed cases by country (Top 20)
library(dplyr)
top_total_cases = coronavirus %>% 
  filter(type == "confirmed") %>%
  group_by(country) %>%
  summarise(total_cases = sum(cases)) %>%
  arrange(-total_cases)

top_total_cases %>% head(20)

# b) Display of the top 5 countries in a bar graph
top5_countries = data.frame(head(total_cases_20, 5))
top5_countries_graph = ggplot(data = top5_countries, aes(x=reorder(country, total_cases), y = total_cases/1000000)) +
  geom_bar(stat="identity", color="black", fill="red", width=0.6, alpha=.75) +
  labs(x ="Country", y = "Cases (millions)") +
  theme(text=element_text(family="Comic Sans MS",size=14), panel.background = element_rect(fill = "skyblue"),)
top5_countries_graph 

# c) Display of the top 5 countries in a horizontal bar graph
top5_countries_graph + coord_flip()

# d) Title bar graph "Top 5 Countries by Total Cases"
print(top5_countries_graph + ggtitle("Top 5 Countries by Total Cases"))

# Question 3
# a) recent_cases represents the confirmed number of cases sorted by dates
recent_cases = coronavirus %>% 
  filter(type == "confirmed") %>%
  group_by(date) %>%
  summarise(total_cases = sum(cases))

# b) recent_cases data in a line graph
recent_cases_graph <- ggplot(data = recent_cases, aes(x=date, y = total_cases/1000)) +
  geom_line(stat="identity", color="red",size=.5, linetype="dashed") +
  labs(title ="Total Cases Overtime", x ="Date", y = "Cases (thousands)") +
  theme(text=element_text(size=14), 
        panel.background = element_rect(fill = "skyblue"))
recent_cases_graph

# Extra Credit Opportunity
# 1)  added background color to skyblue
# 2)  scaled axis to make easier to read
# 3)  added axis labels to make axis more clear
# 4)  changed text size to make easier to read
# 5)  changed color of bars
# 6)  added black outline around bars
# 7)  changed font to comic sans ms
# 8)  changed size of the bar
# 9)  change type of line
# 10) changed bar transparency