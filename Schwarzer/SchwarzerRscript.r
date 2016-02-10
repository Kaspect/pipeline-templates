main <- function (...) {
	x <- "Los Angeles"
	options(scipen = 999)
	if (!exists("LAControllerDatabase")) {
	  LAControllerDatabase <- read.csv("https://controllerdata.lacity.org/api/views/3ctd-sjrm/rows.csv?accessType=DOWNLOAD")
	} 
	LAControllerDatabase$EXPENDITURES <- as.numeric(gsub("\\$", "", as.character(LAControllerDatabase$EXPENDITURES)))
	departmentExpenditure <- aggregate(LAControllerDatabase$EXPENDITURE, by=list(Category=LAControllerDatabase$DEPARTMENT.NAME), FUN=sum)
	cluster <- hclust((dist(departmentExpenditure[2]))^(1/2), "ave")
	labels <- t(departmentExpenditure[1])
	labels <- substring(labels, 0, 10)
	mainPhyloPlot <- function(clustering = cluster, labeling = labels, ...) {
	  plot(clustering,  labeling, hang = -1, main = "Departments by Net Expenditure")
	}
	return (c(mainPhyloPlot, LAControllerDatabase))
}





#The \rinline{x} City Controller data under analysis includes \rinline{nrow(database)} distinct payments, whose mean size is \$\rinline{mean(database$EXPENDITURES)},
#with a median size of \$\rinline{median(database$EXPENDITURES)}.  The standard deviation is \$\rinline{sd(database$EXPENDITURES)}. 