\name{LXvenn}
\alias{LXvenn}
\title{LXvenn::venn}
\usage{
LXvenn()
}
\description{
LXvenn can be used for making venn diagram.
}
\examples{
if(!requireNamespace("devtools"))
  install.packages("devtools")
library(devtools)

install_github("gluck4668/LXvenn")

library(LXvenn)

#-----------------------------
data(set1_example)
data(set2_example)
data(set3_example)
#----------------------------


setwd("D:/LXvenn_example")
rm(list=ls())

set1 <- "set1.xlsx"
set2 <- "set2.xlsx"
set3 <- "set3.xlsx"  # if set3 is no available, it should be set as "", or NULL

group1 <- "Normal"
group2 <- "Model"
group3 <- "Treatment " # if group3 is no available, it should be set as "", or NULL


LXvenn()

}
