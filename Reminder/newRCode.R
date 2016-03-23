library(stats)
main <- function () {
	if (!exists("Data")) {
	Data = read.csv("https://controllerdata.lacity.org/api/views/3ctd-sjrm/rows.csv?accessType=DOWNLOAD")
	}
	Data$EXPENDITURES <- as.numeric(gsub("\\$", "", as.characer(Data$EXPENDITURES)))
	departmentExpenditure <- aggregate(Data$EXPENDITURES, by=list(Category=Data$DEPARTMENT.NAME), FUN=sum)	

	boxPlot(Data)
	barPlot(Data)
	scatterPlot(Data)
	return
}

boxPlot=function(database){
	boxplot(departmentExpenditure~DEPARTMENT, data=Data, main="Cumulative Expenditures by Department", xlab="Department", ylab="Expenditures")
}

barPlot=function(database){
	barplot(departmentExpenditure)
}

scatterplot=function(database){
	plot(database$FISCAL_YEAR, database$EXPENDITURES, main="Department Level Annual Expenditures",
		xlab="Year", ylab="Expenditures")
}
main()
