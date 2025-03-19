# ======================================================================================================================================================================
# "Question 1"

install.packages("readxl")
library(readxl)
install.packages("ggplot2")
library(ggplot2)
install.packages("zoo")
library(zoo)
install.packages("dplyr")
library(dplyr)

excel_file <- "/Users/ananya/Documents/UK/UoSouthampton/Assigmnets/Foundation BAMS/Covid and A&E Attendance (1).xlsx"
sheet_name_region <- "Sheet2"
df <- read_excel(excel_file, sheet = sheet_name_region)
# head(df)
# tail(df)

x_values <- df$Region
y_values <- df$`Total A&E Attendances in NHS each region`

options(scipen = 10)

# Extracting the Total_AE_Attendances column as a vector
total_attendances_vector <- aggregated_data$`Total A&E Attendances in NHS each region`


# Create a bar chart
barplot(total_attendances_vector, names.arg = aggregated_data$Region, col = "pink",
        main = "Total number of A&E attendances in different regions",
        xlab = "Region", ylab = "Total A&E Attendances in NHS each region")
# axis(side = 2, at = seq(0, 800, by = 100),
#      labels = seq(0, 800, by = 100),
#      las = 1)

# aggregated_data <- aggregate(`Total A&E Attendances in NHS each region` ~ Region, data = df, sum)
# 
# barplot(aggregated_data$Total_AE_Attendances, names.arg = aggregated_data$Region, col = "skyblue", 
#         main = "Total number of A&E attendances in different regions",
#         xlab = "Region", ylab = "Total A&E Attendances in NHS each region")

# barplot(y_values, names.arg = x_values, col = "skyblue", 
#         main = "Total number of A&E attendances in different regions",
#         xlab = "Region", ylab = "Total A&E Attendances in NHS each region")


# d <- read_excel("/Users/ananya/Documents/UK/UoSouthampton/Assigmnets/Foundation BAMS/Covid and A&E Attendance (1).xlsx",
#                 col_types = c("X axis", "Y axis", "Region"))

# Assuming your data frame is called df
# Structure of df: year, total_AE_attendance, region

# Create a line plot using ggplot2
# ggplot(df, aes(x = 'X axis', y = 'Y axis', color = 'Region', group = 'Region')) +
#   geom_line() +
#   labs(x = "Year", y = "Total A&E Attendance", title = "A&E Attendance by Region in England") +
#   theme_minimal()
# ======================================================================================================================================================================

# "Question 2"

# summary(df$`Total A&E Attendances in NHS each region`)

sheet_name_England <- "Sheet3"
dg <- read_excel(excel_file, sheet = sheet_name_England)

# plot(dg$Month, dg$`Total A&E Attendances in NHS England`, type = "l", col = "blue", lwd = 2,
#      main = "Total A&E Attendances in NHS England Over Months",
#        xlab = "Month", ylab = "Total A&E Attendances").      
# -->line graph

# plot(dg$Month, dg$`Total A&E Attendances in NHS England`,
#      type = "l", col = "blue", main = "Total A&E Attendances in NHS England Over Months",
#      xlab = "Month", ylab = "Total A&E Attendances")     --> time series plot

dg$Month <- as.yearmon(dg$Month, format = "%b-%y")

# Subset the data for the period before January 2020
before_covid <- dg[dg$Month < as.yearmon("Jan 2020"), ]
during_covid <- dg[dg$Month >= as.yearmon("Jan 2020"), ]

# Subset data for before and during COVID-19
# before_covid <- dg[dg$Month < as.Date("2020-01-01"), ]
# during_covid <- dg[dg$Month >= as.Date("2020-01-01"), ]

nrow(before_covid)
nrow(during_covid)

sum(is.na(before_covid$`Total A&E Attendances in NHS England`))
sum(is.na(during_covid$`Total A&E Attendances in NHS England`))

# Compare means with t-test
# t_test_result <- t.test(before_covid$`Total A&E Attendances in NHS England`, during_covid$`Total A&E Attendances in NHS England`)
# t_test_result$p.value  # Check p-value

# perform t test on columns Modelled Number of People Testing Positive for COVID-19 &	Total A&E Attendances in NHS England in shee4

# Visualize impact
# boxplot(`Total A&E Attendances in NHS England` ~ `Month`, data = rbind(before_covid, during_covid), col = c("blue", "red"), xlab = "Period", ylab = "A&E Attendance", main = "Impact of COVID-19 on A&E Attendance")

# Assuming your data frame is called df
# Structure of df: Month, Total A&E Attendances in NHS England, COVID_19_Indicator

# Create a line plot using ggplot2
ggplot(dg, aes(x = Month, y = `Total A&E Attendances in NHS England`, color = `Total A&E Attendances in NHS England`)) +
  geom_line() +
  labs(x = "Month", y = "A&E Attendance", title = "Impact of COVID-19 on A&E Attendance") +
  theme_minimal()



# total_attendances_vector <- aggregated_data$`Total A&E Attendances in NHS each region`


# sheet_name_test <- "Sheet4"
# dh <- read_excel(excel_file, sheet = sheet_name_test)
# dh$`Modelled Number of People Testing Positive for COVID-19` <- as.numeric(dh$`Modelled Number of People Testing Positive for COVID-19`)
# 
# dh$Month <- as.Date(dh$Month, format = "%b-%y")
# 
# # Subset the data for the COVID period (Apr 2020 to Mar 2023)
# covid_data <- dh %>% 
#   filter(Month >= as.Date("2020-04-01") & Month <= as.Date("2023-03-31"))
# 
# # Perform t-test
# t_test_result <- t.test(
#   covid_data$`Modelled Number of People Testing Positive for COVID-19`,
#   covid_data$`Total A&E Attendances in NHS England`
# )
# 
# # Print the t-test result
# print(t_test_result)
# 
# dh$Month <- as.Date(dh$Month, format = "%b-%y")
# 
# # Subset the data for the COVID period (Apr 2020 to Mar 2023)
# england_data <- subset(dh, Month >= as.Date("2020-04-01") & Month <= as.Date("2023-03-31"))
# 
# # Extract relevant columns
# attendances <- na.omit(england_data$`Total A&E Attendances in NHS England`)
# covid_cases <- na.omit(england_data$`Modelled Number of People Testing Positive for COVID-19`)
# 
# # Perform t-test
# t_test_result <- t.test(attendances, covid_cases)
# 
# # Print the t-test result
# cat('t-statistic:', t_test_result$statistic, '\n')
# cat('p-value:', t_test_result$p.value, '\n')

# Convert 'Month' column to Date format
dh$Month <- as.Date(dh$Month, format = "%b-%y")

# Define the COVID period
covid_start_date <- as.Date("2020-04-01")
covid_end_date <- as.Date("2023-03-31")

# Subset data for before and during COVID
before_covid <- subset(dh, Month < covid_start_date)
during_covid <- subset(dh, Month >= covid_start_date & Month <= covid_end_date)

t_test_result <- t.test(before_covid$`Total A&E Attendances in NHS England`, during_covid$`Total A&E Attendances in NHS England`)

cat('t-statistic:', t_test_result$statistic, '\n')
cat('p-value:', t_test_result$p.value, '\n')

# Combine data for visualization
combined_data <- bind_rows(
  mutate(before_covid, Period = "Before COVID"),
  mutate(during_covid, Period = "During COVID")
)

dev.off()
quartz()

# Create a boxplot
ggplot(combined_data, aes(x = `Month`, y = `Total A&E Attendances in NHS England`, fill = `Month`)) +
  geom_boxplot() +
  labs(title = "A&E Attendance Before and During COVID-19", y = "Total A&E Attendances") +
  theme_minimal()


# column_data_type <- typeof(dh$`Modelled Number of People Testing Positive for COVID-19`)
# print(column_data_type)
# sapply(dh, class)

# dh$Month <- as.yearmon(dh$Month, format = "%b-%y")
# 
# # Subset the data for the period before April 2020
# before_covid <- dh[dh$Month < as.yearmon("Apr 2020"), ]
# during_covid <- dh[dh$Month >= as.yearmon("Apr 2020") & as.yearmon("Mar 2023"), ]
# # dh[dh$Month >= as.Date("2020-04-01") & dh$Month <= as.Date("2023-03-31"), ]
# # Subset data for before and during COVID-19
# # before_covid <- dg[dg$Month < as.Date("2020-01-01"), ]
# # during_covid <- dg[dg$Month >= as.Date("2020-01-01"), ]
# 
# nrow(before_covid)
# nrow(during_covid)
# 
# sum(is.na(dh$`Modelled Number of People Testing Positive for COVID-19`))
# 
# # Perform your analysis (replace with your actual analysis code)
# t_test_result <- t.test(during_covid$`Modelled Number of People Testing Positive for COVID-19`, during_covid$`Total A&E Attendances in NHS England`)
# 
# # View results
# print(t_test_result)
# 
# # # Convert to numeric if needed
# # during_covid$`Modelled Number of People Testing Positive for COVID-19` <- as.numeric(during_covid$`Modelled Number of People Testing Positive for COVID-19`)
# # 
# # # Check for missing values
# # sum(is.na(during_covid$`Modelled Number of People Testing Positive for COVID-19`))
# 
# # Perform your t-test (replace with your actual analysis code)
# # t_test_result <- t.test(during_covid$`Modelled Number of People Testing Positive for COVID-19`, during_covid$`Total A&E Attendances in NHS England`)
# # 
# # # View results
# # print(t_test_result)
# 
# 
# # Compare means with t-test
# # t_test_result <- t.test(before_covid$`Total A&E Attendances in NHS England`, during_covid$`Total A&E Attendances in NHS England`)
# # t_test_result$p.value  # Check p-value
# 
# # sapply(dh, class)
# 
# # dh$`Modelled Number of People Testing Positive for COVID-19` <- as.numeric(dh$`Modelled Number of People Testing Positive for COVID-19`)
# 
# # Example: Performing t-test on columns X and Y
# t_test_result <- t.test(during_covid$`Modelled Number of People Testing Positive for COVID-19`, during_covid$`Total A&E Attendances in NHS England`)
# 
# # View results
# print(t_test_result)
# 
# 
# 

# ======================================================================================================================================================================

# "Question 3"









