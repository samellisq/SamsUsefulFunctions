rm(list = ls())

###create test daat for data wrangling session

wrangle.df =
  data.frame(
    numeric1 = seq(1:10),
    numeric2 =rev(seq(10:1))
  )

wrangle.df$numeric2[3] = as.character(wrangle.df$numeric2[3])
wrangle.df$numeric1[9] = NA


wrangle.df$character1 = rep("Sam", 10)
wrangle.df$character1[4:6] = "SAM"
wrangle.df$character1[7:9] = "sam"


wrangle.df$character2 = "Tim Fawcett"
wrangle.df$character2[4] = "Tim  Fawcett"
wrangle.df$character2[5] = "Tim Fawcett "

wrangle.df$factor1 = "Sam"
wrangle.df$factor1[6:10] = "Andy"
wrangle.df$factor1 = as.factor(wrangle.df$factor1)

usethis::use_data(wrangle.df, overwrite = TRUE)
