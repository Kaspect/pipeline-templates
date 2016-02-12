main <- function () {
	if (!exists("LAControllerDatabase")) {
	  LAControllerDatabase <- read.csv("https://controllerdata.lacity.org/api/views/3ctd-sjrm/rows.csv?accessType=DOWNLOAD")
	} 
	mainPhyloPlot(LAControllerDatabase)
	return(c(	getNumPayments(LAControllerDatabase),
	          getMeanPayment(LAControllerDatabase),
	          getMedianPayment(LAControllerDatabase),
	          getSDPayment(LAControllerDatabase)))
}
mainPhyloPlot <- function(LAControllerDatabase) {
	LAControllerDatabase$EXPENDITURES <- as.numeric(gsub("\\$", "", as.character(LAControllerDatabase$EXPENDITURES)))
	departmentExpenditure <- aggregate(LAControllerDatabase$EXPENDITURE, by=list(Category=LAControllerDatabase$DEPARTMENT.NAME), FUN=sum)
	cluster <- hclust((dist(departmentExpenditure[2]))^(1/2), "ave")
	labels <- t(departmentExpenditure[1])
	labels <- substring(labels, 0, 10)
	plot(cluster,  labels, hang = -1, main = "Departments by Net Expenditure")
}

getNumPayments <- function(LAControllerDatabase) {
	return (nrow(LAControllerDatabase))
}

getMeanPayment <- function(LAControllerDatabase) {
	Expenditures <- as.numeric(gsub("\\$", "", as.character(LAControllerDatabase$EXPENDITURES)))
	return (mean(Expenditures))
}

getMedianPayment <- function(LAControllerDatabase) {
	Expenditures <- as.numeric(gsub("\\$", "", as.character(LAControllerDatabase$EXPENDITURES)))
	return (median(Expenditures))
}

getSDPayment <- function(LAControllerDatabase) {
	Expenditures <- as.numeric(gsub("\\$", "", as.character(LAControllerDatabase$EXPENDITURES)))
	return (sd(Expenditures))
}
