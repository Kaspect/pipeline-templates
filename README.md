# Pipeline-Templates
#To use the docker instance:
1.  Run the Docker Quickstart console
2.  Move to pipeline-templates/Docker
3.  Build the dockerfile with docker build -t pipeline-templates .  (The period is important!)
4.  Run the docker image with docker run -d -p 5000:5000 --name Compiler pipeline-templates
6.  To compile a .Rtex to a pdf, curl $(docker-machine ip default):5000/ -d "data=https://github.com/Kaspect/DockerPipeline-SampleRepo" -X PUT

#Deliverable 1, for Li, Reminder, Schwarzer
0. Read the following carefully: http://kbroman.org/knitr_knutshell/pages/latex.html
1. Clone this repo, make a folder with your last name & commit it to master.
2. Make a new branch called your last name __i.e.__`cohn`
2. Within the repo, make an R-latex file like the one here https://github.com/yihui/knitr-examples/blob/master/005-latex.Rtex
3. Make frequent, useful commits as you develop https://try.github.io/levels/1/challenges/1
3. Make an in-line numerical statistic. `Of the 8492 elements in the data, the mean was 7.3 and the standard deviation was 3.3`.
4. Make an in-line string.

```
#for example
x <- "Claremont"
```
and have the string print to latex as normal text within a sentence.

# Technical Task assignments (below)

##Shuming
####Data
https://data.cityofnewyork.us/Education/SAT-Results/f9bf-2cp4
####Visualization
- Design a 3D plot using rgl snapshot http://stackoverflow.com/questions/27958226/adding-a-legend-to-an-rgl-3d-plot 

##Nick
####Data
https://controllerdata.lacity.org/Budget/City-Expenditures-by-Month/3ctd-sjrm
https://controllerdata.lacity.org/api/views/3ctd-sjrm/rows.csv?accessType=DOWNLOAD
####Visualization
- Design 2 boxplots, 1 with `base R` and one with `ggplot2`.  Find an interesting way to split up the data into groups, so you can make a comparison between the $ awared to different types of expenditures

###Max
####Data
https://controllerdata.lacity.org/Budget/City-Expenditures-by-Month/3ctd-sjrm
https://controllerdata.lacity.org/api/views/3ctd-sjrm/rows.csv?accessType=DOWNLOAD
####Visualization
- Design a hierarchical clustering approach to this dataset to look at the types of departments that are most similar
- https://stat.ethz.ch/R-manual/R-devel/library/stats/html/hclust.html


As with everything, Google it & collaborate with each other!
