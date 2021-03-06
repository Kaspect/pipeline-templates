install.packages("rgl")
library(rgl)
library(stats)
main <- function () {
  if (!exists("SATScore")) {
    SATScore_Data = read.csv("https://data.cityofnewyork.us/api/views/f9bf-2cp4/rows.csv?accessType=DOWNLOAD")
  } 
  SATScore_Data = Na_Rm(SATScore_Data)
  mainPlot(SATScore_Data)
  mainheatmap(SATScore_Data)
  mainline(SATScore_Data)
  return(c( DataAnalyst(SATScore_Data),
            HighestMath(SATScore_Data),
            HighestWritting(SATScore_Data),
            HighestReading(SATScore_Data)))
}

## Remve missing data from database
Na_Rm=function(data){
  na_index = which(data[,4]=="s")
  data = data[-na_index,] 
  return (data)
}

mainPlot=function(database){
  x=database[,4]
  y=database[,5]
  z=database[,6]
  x=as.numeric(as.character(x))
  y=as.numeric(as.character(y))
  z=as.numeric(as.character(z))
  cuts = cut(x = 1:length(database[,5]), breaks = 3)
  plot3d(x,y,z,lab="Reading Ave", ylab="Math Ave",zlab="Writing lab",col=rainbow(3)[cuts],size = 2, type='s')
  legend3d("topright", legend = paste(c("Reading","Math","Writting")), pch = 16, col = rainbow(3), cex=1, inset=c(0.02))
  snapshot3d(filename = '3dplot.png', fmt = 'png')  
}

mainheatmap = function(database){

  row.names(database) = database$SCHOOL.NAME
  data_sub = database[,-c(1,2)]
  data_matrix = data.matrix(data_sub)
  heatmap(data_matrix)
}

mainline = function(database){
  
  data1 = ts(database)
  par(mfcol=c(2,2))
  plot(data1[,4],ylab="Reading")
  plot(data1[,5],ylab="Math")
  plot(data1[,6],ylab="Wrting")
  plot(data1[,3],ylab="number of Taken")
}

DataAnalyst = function(data){
  row_data = dim(Na_Rm(data))[1]
  miss_row = dim(data)[1] - dim(Na_Rm(data))[1]
  paste("The SATScore data under analysis includes", row_data, "distinct high school SAT scocre plus",
        miss_row,"missing data" )
}


HighestReading = function(data){
  x=data[,4]
  x=as.numeric(as.character(x))
  paste("which highest Reading score is", max(x),"at",data[which(x==max(x)),2])
}


HighestMath = function(data){
  y=data[,5]
  y=as.numeric(as.character(y))
  paste("which highest Reading score is", max(y),"at",data[which(y==max(y)),2])
}

HighestWritting = function(data){
  z=data[,6]
  z=as.numeric(as.character(z))
  paste("which highest Reading score is", max(z),"at",data[which(z==max(z)),2])
}
main()
