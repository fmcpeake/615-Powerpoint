library(officer)
library(magrittr)
library(tidyverse)
library(readxl)
#Reading in companies in the DJI and formatting 
DJI <- read_excel("DJI.xlsx")
my_pres<-read_pptx("blank.pptx")
DJI <- as.data.frame(matrix(unlist(t(DJI)), byrow= T, 10, 3))
colnames(DJI) <- c("Companies of", "the Dow Jones", "Industrial Average")

knitr::kable(layout_summary(my_pres))

#Strings to be included in ppt
first = "Decide if this is a market correction or the start of something more"
second = "Review the stocks you own"
third = "Review stocks you wanted to own but were too expensive at time of 
research"
fourth = "Check your portfolio for balance or the type of stocks you own"
two.one = "1. Represents ownership in a firm"
two.two = "2. Earn a return in two ways"
two.two.one = "Price of the stock rises"
two.two.two = "Dividends are paid to the stock holder"
two.three = "3. Stockholders have claim on all assets"
two.four = "4. Right to vote for directors and on certain issues"
two.five = "5. Two types"
two.five.one = "Common stock"
two.five.one.one = "Right to vote"
two.five.one.two = "Receive dividends"
two.five.two = "Preferred stock"
two.five.two.one = "Receive a fixed devidend"
two.five.two.two = "Do not usually vote"
slide.4 = "A decline of 15-20% of the broad market coupled with pessimistic sentiment underlying the stock market."
seven.one = "Sept. 30, 2002  Dow 7,528"
seven.two = "Jan. 5, 2004    Dow 10,668"
seven.three = "Oct. 8, 2007  Dow 14,093"

#Slides
my_pres<-
  read_pptx("blank.pptx") %>%
  add_slide(layout = "Title Slide", master = "Office Theme") %>% #Slide 1
  ph_with_text(type = "ctrTitle", str = "Advantages of a Bear Market") %>%
  ph_with_text(type = "subTitle", str = "Yes there is a Positive Side to a Bear Market!") %>%
  ph_with_text(type = "sldNum", str = "1" ) %>%
  add_slide(layout = "Two Content", master = "Office Theme") %>% #Slide 2
  ph_with_text(type = "title", str = "Investing in Stocks") %>%
  ph_with_ul(type = "body", index = 1, str_list = c(two.one, two.two, two.two.one, two.two.two,
                                                    two.three), level_list = c(1, 1, 2, 2, 1)) %>%
  ph_with_ul(type = "body", index = 2, str_list = c(two.four, two.five, two.five.one, 
                                                    two.five.one.one, two.five.one.two, 
                                                    two.five.two, two.five.two.one, 
                                                    two.five.two.two),level_list = c(1, 1, 2, 3,
                                                                                     3, 2, 3, 3)) %>%
  ph_with_text(type = "sldNum", str = "2" ) %>%
  ph_with_text(type = "ftr", str = "Copyright © 2006 Pearson Addison-Wesley. All rights") %>%
  
  add_slide(layout = "Title and Content", master = "Office Theme") %>% #Slide 3
  ph_with_text(type = "title", str = "Investing in Stocks: Sample Corporate Stock Certificate") %>%
  ph_with_img(type = "body", index = 1, src = "Stock.jpg") %>%
  ph_with_text(type = "ftr", index = 1, str = "Figure 11.1. Wien Consolidated Airlines Stock") %>%
  ph_with_text(type = "sldNum", str = "3" ) %>%
  
  add_slide(layout = "Title and Content", master = "Office Theme") %>% #Slide 4
  ph_with_text(type = "title", str = "What is a Bear Market?") %>%
  ph_with_text(type = "body", index = 1, str = slide.4) %>%
  ph_with_img_at(src = "Cartoon.jpg", height = 3, width = 5, left = 4, top = 4) %>%
  ph_with_text(type = "sldNum", str = "4" ) %>%
  
  add_slide(layout = "Title and Content", master = "Office Theme") %>% #Slide 5
  ph_with_text(type = "title", str = "Stock Market Indexes: the Dow Jones Industrial Average") %>%
  ph_with_table(type = "body", index = 1, value = DJI) %>%
  #ph_with_img(type = "body", index = 1, src = "Companies.png") %>%
  ph_with_text(type = "sldNum", str = "5" ) %>%
  
  add_slide(layout = "Title and Content", master = "Office Theme") %>% #Slide 6
  ph_with_text(type = "title", str = "Dow Jones") %>%
  ph_with_img(type = "body", index = 1, src = "dow.png")%>%
  ph_with_text(type = "sldNum", str = "6" ) %>%

  add_slide(layout = "Title and Content", master = "Office Theme") %>%#Slide 7
  ph_with_text(type = "title", str = "The Last Bear Markets") %>%
  ph_with_ul(index = 1, type = "body", str_list = c(seven.one, seven.two, seven.three), 
             level_list = c(1, 1, 1)) %>%
  ph_with_text(type = "sldNum", str = "7" ) %>%
  
  add_slide(layout = "Title and Content", master = "Office Theme") %>% #Slide 8
  ph_with_text(type = "title",str = "What do I do in a Bear Market?") %>%
  ph_with_ul(type = "body", index = 1, str_list = c(first, second, third, fourth), 
             level_list = c(1, 1, 1, 1)) %>%
  ph_with_text(type = "sldNum", str = "8" )  %>%


print(my_pres, target = "blank.pptx") 
