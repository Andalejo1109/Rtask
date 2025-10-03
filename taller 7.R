install.packages("tidyverse")


library(dplyr)
library(readxl)
Retail_sales_data <- read_excel("C:/Users/Laboratorio/Downloads/Retail sales data.xlsx")
View(Retail_sales_data)
nstall.packages("tidyverse")

library(dplyr)
filterdata <- filter(Retail_sales_data, Retail_sales_data$PaymentMethod == "Mobile Money")
filter(Retail_sales_data, Retail_sales_data$Discount >= 0.1)

filter2 <- filter(Retail_sales_data, Retail_sales_data$PaymentMethod == "Mobile Money" & Retail_sales_data$Discount >= 0.1)

selectdata <- select(Retail_sales_data, PaymentMethod, Discount)
print(selectdata)
selectdata <- select(Retail_sales_data, PaymentMethod, Discount, UnitPrice, Category)
print(selectdata)
selectdata1 <- select(Retail_sales_data, Date:Gender)
print(selectdata)
selectdata2 <- select(Retail_sales_data, -Gender)
print(selectdata)
install.packages("tidyverse")

library(dplyr)
library(readxl)
# install.packages("dplyr")
install.packages("ggplot2")

# Load the packages
library(dplyr)
library(ggplot2)


# Aggregate the data: calculate sum of UnitPrice per Category
summary_data <- Retail_sales_data %>%
  group_by(SubCategory) %>%
  summarise(Total_UnitPrice = sum(UnitPrice, na.rm = TRUE))

# View the aggregated data
print(summary_data)

# Create the bar chart
ggplot(summary_data, aes(x = SubCategory, y = Total_UnitPrice)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(
    title = "Sum of UnitPrice by Category",
    x = "Category",
    y = "Total UnitPrice"
  ) +
  theme_minimal()

# Aggregate the data: calculate sum of UnitPrice per Category
summary_data1 <- Retail_sales_data %>%
  group_by(Gender) %>%
  summarise(Total_UnitPrice = sum(UnitPrice, na.rm = TRUE))

# Calculate percentages and label positions from your data
pie_data <- summary_data1 %>%
  mutate(
    percentage = Total_UnitPrice / sum(Total_UnitPrice),
    label_position = cumsum(percentage) - percentage / 2
  )

# View the prepared data
print(pie_data)

# Create the pie chart
ggplot(pie_data, aes(x = "", y = Total_UnitPrice, fill = Gender)) +
  geom_bar(width = 1, stat = "identity") +
  coord_polar(theta = "y") +
  geom_text(aes(y = label_position, label = paste0(round(percentage * 100), "%")), color = "white") +
  labs(
    title = "Total UnitPrice by Gender",
    fill = "Gender"
  ) +
  theme_void() +
  theme(plot.title = element_text(hjust = 0.5))