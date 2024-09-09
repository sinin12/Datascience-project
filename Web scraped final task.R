install.packages("rvest")
install.packages("dplyr")
install.packages("XML")
install.packages("string")
library(rvest)
library(dplyr)

library(rvest)

webpage <- read_html("https://www.geeksforgeeks.org/data-structures-in-r-programming")


heading <- html_node(webpage, '.entry-title')


heading_text <- html_text(heading)


paragraphs <- html_nodes(webpage, 'p')


paragraph_text <- html_text(paragraphs)


data <- data.frame(
  Heading = heading_text,
  Paragraph = paragraph_text,
  stringsAsFactors = FALSE
)


file_path <- "C:\\\\Users\\\\User\\\\Videos\\\\scraped.csv"


write.csv(data, file_path, row.names = FALSE)


print(paste("Data has been saved to", file_path))






