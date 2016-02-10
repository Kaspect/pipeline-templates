x <- "Los Angeles"
options(scipen = 999)
database <- read.csv("https://controllerdata.lacity.org/api/views/3ctd-sjrm/rows.csv?accessType=DOWNLOAD")
database$EXPENDITURES <- as.numeric(gsub("\\$", "", as.character(database$EXPENDITURES)))
departmentExpenditure <- aggregate(database$EXPENDITURE, by=list(Category=database$DEPARTMENT.NAME), FUN=sum)

#The \rinline{x} City Controller data under analysis includes \rinline{nrow(database)} distinct payments, whose mean size is \$\rinline{mean(database$EXPENDITURES)},
#with a median size of \$\rinline{median(database$EXPENDITURES)}.  The standard deviation is \$\rinline{sd(database$EXPENDITURES)}. 

cluster <- hclust((dist(departmentExpenditure[2]))^(1/2), "ave")
labels <- t(departmentExpenditure[1])
labels <- substring(labels, 0, 10)
plot(cluster,  labels, hang = -1, main = "Departments by Net Expenditure")