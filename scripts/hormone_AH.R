#Day 3####
#Setting working directory ####

#  set the working directory. Change path to the folder where you installed the project
folder <- "~/RDM-LS"
setwd(folder)

# load packages
# install.packages("ggplot2")
library(ggplot2)

# Import the data
Hormone <- read.csv2("data/20201102-Hormone.csv")
Hormone

# Open a pdf file where the plot will be saved
png(file = "results/plots/20201102-effect-drug-concentration.png", width=600)

# Change name of third column
names(Hormone)[3] <- "Concentration"

Hormone.plot <- ggplot(Hormone, aes(Drug,Concentration)) +
  stat_summary(fun.y=mean,geom="bar") +
  stat_summary(fun.data=mean_cl_normal, geom="errorbar",width=0.25) + 
  geom_point() +
  coord_flip()

Hormone.plot
