
setwd("D:/R-lin study/R-packages/LXvenn")

set1 <- "set1.xlsx"
set2 <- "set2.xlsx"
set3 <- "set3.xlsx"

library(openxlsx)

set1_example <- read.xlsx("set1.xlsx")
set2_example <- read.xlsx("set2.xlsx")
set3_example <- read.xlsx("set3.xlsx")

usethis::use_data(set1_example,overwrite = T)
usethis::use_data(set2_example,overwrite = T)
usethis::use_data(set3_example,overwrite = T)


rm(list=ls())

data(set1_example)
data(set2_example)
data(set3_example)

