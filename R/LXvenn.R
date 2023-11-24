
LXvenn <- function(){

# list all the packages that have been installed
all_packages <- data.frame(installed.packages())

# To judge whether a package was installed. If not, it will be installed.
pack <- data.frame(c("ggvenn","openxlsx","RColorBrewer","dplyr","ggplot2"))

pack$type <- pack[,1] %in% all_packages$Package

for (i in 1:nrow(pack)){
  if(pack[i,2]==FALSE)
    install.packages(pack[i,1])
}
rm(i)

# ibrary
for(i in pack[,1]){
  library(i, character.only = T)
}
rm(i)


#------------------------------------------------------------------

if(dir.exists("analysis result")==FALSE)
  dir.create("analysis result")


#--------------
if(is.logical(set3))
  set_3_j <- "null" else
  {if(is.null(set3))
    set_3_j <- "null" else
    {if(trimws(set3)=="")
      set_3_j <- "null" else
        set_3_j <- set3}
  }

set_3_j

if(is.logical(group3))
  group_3_j <- "unnamed" else
  {if(is.null(group3))
    group_3_j <- "unnamed" else
    {if(trimws(group3)=="")
      group_3_j <- "unnamed" else
        group_3_j <-group3}
  }

group_3_j

#-------------

if(set_3_j=="null"){

LXvenn_2 <- function(set1,set2,group1,group2){
df1 <- read.xlsx(set1)
df1[,1] <- as.character(df1[,1])
colnames(df1)[1] <- "id"
df1$id <- trimws(df1$id)

df2 <- read.xlsx(set2)
df2[,1] <- as.character(df2[,1])
colnames(df2)[1] <- "id"
df2$id <- trimws(df2$id)
#---------------two sets---------------------------------------------------
set_2 <- c(df1,df2)
names(set_2) <- c(group1,group2)

ggvenn2 <- ggvenn(set_2,
                  show_elements = FALSE,
                  show_percentage = F,
                  digits = 2,
                  fill_color = c("#f08080", "#40e0d0"),
                  fill_alpha = 0.6,
                  stroke_color = "white",
                  stroke_alpha = 0.5,
                  stroke_size = 0.5,
                  stroke_linetype = "solid",
                  set_name_color = "black",
                  set_name_size = 7,
                  text_color = "black",
                  text_size = 6,
                  label_sep = ","
                   )

ggsave("analysis result/Venn diagram_2.png",ggvenn2,width=1200, height =1000, dpi=150,units = "px")

set_2_inner <- dplyr::inner_join(df1,df2,by="id")
colnames(set_2_inner)[1] <- "Intersetction"
write.xlsx(set_2_inner,"analysis result/set_2_Intersetction.xlsx")

print("Please see the results in the folder of <analysis result>")

grid.draw(ggvenn2)

   }

LXvenn_2 (set1,set2,group1,group2)

}  else

#-----------------three sets ----------------------------------------------
{LXvenn_3 <- function(set1,set2,set3,group1,group2,group_3_j){

df1 <- read.xlsx(set1)
df1[,1] <- as.character(df1[,1])
colnames(df1)[1] <- "id"
df1$id <- trimws(df1$id)

df2 <- read.xlsx(set2)
df2[,1] <- as.character(df2[,1])
colnames(df2)[1] <- "id"
df2$id <- trimws(df2$id)

df3 <- read.xlsx(set3)
df3[,1] <- as.character(df3[,1])
colnames(df3)[1] <- "id"
df3$id <- trimws(df3$id)

set_3 <- c(df1,df2,df3)
names(set_3) <- c(group1,group2,group_3_j)

ggvenn3 <- ggvenn(set_3,
                  show_elements = FALSE,
                  show_percentage = F,
                  digits = 2,
                  fill_color = c("#00ff7f", "#40e0d0","#f08080"),
                  fill_alpha = 0.6,
                  stroke_color = "white",
                  stroke_alpha = 0.5,
                  stroke_size = 0.5,
                  stroke_linetype = "solid",
                  set_name_color = "black",
                  set_name_size = 7,
                  text_color = "black",
                  text_size = 6,
                  label_sep = ",",
                  )

ggsave("analysis result/Venn diagram_3.png",ggvenn3,width=1200, height =1000, dpi=150,units = "px")

set_2_inner <- dplyr::inner_join(df1,df2,by="id")
set_3_inner <- dplyr::inner_join(set_2_inner,df3,by="id")
colnames(set_3_inner)[1] <- "Intersetction"
write.xlsx(set_3_inner,"analysis result/set_3_Intersetction.xlsx")

print("==========================================================")

print("Please see the results in the folder of <analysis result>")

grid.draw(ggvenn3)}

LXvenn_3 (set1,set2,set3,group1,group2,group_3_j)
}



}
