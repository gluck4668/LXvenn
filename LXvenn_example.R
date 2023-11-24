
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

set1 <- "set1.xlsx"
set2 <- "set2.xlsx"
set3 <- "set3.xlsx"  # 如果没有set3??? 就设???""??? 或NULL

group1 <- "Normal"
group2 <- "Model"
group3 <- "Treatment" # 如果没有group3??? 就设???""??? 或NULL


LXvenn()


