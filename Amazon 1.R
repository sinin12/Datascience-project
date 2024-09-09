install.packages("rvest")
library(rvest)
install.packages("purrr")
library(purrr)
install.packages("stringr")
library(stringr)
install.packages("xml2")
library(xml2)
# Specify the URL to scrape
HTML_Dump <- read_html("https://www.amazon.com/dp/B0CH7Q92J8/ref=syn_sd_onsite_desktop_0?ie=UTF8&psc=1&pf_rd_p=d77a94d7-221a-4129-af34-3c16ad136bb7&pf_rd_r=YNTK2FX95T2BPRC3HF12&pd_rd_wg=FSYYQ&pd_rd_w=TDZN6&pd_rd_r=7a09b903-8aac-41c6-a840-1688fd39ba1d&aref=8LmVy0DGdd")

#user Name
HTML_Dump %>% html_nodes(".a-profile-name") %>% html_text() -> user_name

#Review Rating
HTML_Dump %>% html_nodes(".review-rating") %>% html_text() -> mobile_rating

#review
HTML_Dump %>% html_nodes(".a-expander-partial-collapse-content") %>% 
  html_text() %>% 
  str_split("\\n") %>% map_chr(11) %>% str_trim() -> mobile_review

user_name <- user_name[1:8] # Adjust the length to 8
mobile_rating <- mobile_rating[1:8] # Adjust the length to 8
mobile_review <- mobile_review[1:8] # Adjust the length to 8

Reviews <- data.frame(user_name,mobile_rating,mobile_review)
dim(Reviews)
head(Reviews, n=12)
write.csv(Reviews, 'Amazon_reviews.csv')




