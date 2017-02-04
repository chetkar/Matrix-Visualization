#Graph Visualization Tutorial
#http://tutorials.iq.harvard.edu/R/Rgraphics/Rgraphics.html

#Grammar of Graphics
# data 
# aesthetic mapping 
# geometric object 
# statistical transformation
# scales
# coordinate system
# position adjustment
# faceting


#Set Work Directory
wkdir <- "C:\\Users\\Certified Copy\\Workspace\\Guha\\Laplace Approximation\\Variscan-Mixed-LXXY"
setwd(wkdir)

#External File to get Data
source("main_base.R")

#Libraries
library(ggplot2)
library(reshape2)
library(RColorBrewer)
library(corrplot)
library(gplots)



# Mixed data generated
data   <- SimulateExample(n=50,p =150, prop.data.type =c(0.33,0.34,0.33,0,0))
# No of Cluster
# 64

#Indicator of Columns
ind_po <- which(data$X$data$data.type == 3)
ind_n  <- which(data$X$data$data.type == 2)
ind_p  <- which(data$X$data$data.type == 1)

data.poisson <- data$X$data$X[,ind_po]
data.normal  <- data$X$data$X[,ind_n]
data.probit  <- data$X$data$X[,ind_p]

#######################################################################
#Heatmap
#######################################################################

#Using RcolorBrewer to get color
mycolor <- colorRampPalette(brewer.pal(5,"Spectral"))(100) 

#Using gplots to plot custom heatmaps
heatmap.2(cor(data.normal),revC=TRUE,trace='none', dendrogram ="row",key=TRUE,density.info='none', col=mycolor, main="Heatmap of Correlation Submatrix of Continuous Data")

heatmap.2(cor(data.probit,method="spearman"),revC=TRUE,trace='none', dendrogram ="row",key=TRUE,density.info='none', col=mycolor , main="Heatmap of Correlation Submatrix of Binary Data")

heatmap.2(cor(data.poisson),revC=TRUE,trace='none', dendrogram ="row",key=TRUE,density.info='none', col=mycolor , main="Heatmap of Correlation Submatrix of Count Data")
