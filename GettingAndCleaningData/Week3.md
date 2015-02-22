Week 3 Quiz
===========
-------------------------------------------------------------------------------
Question 1
The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:

https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv

and load the data into R. The code book, describing the variable names is here:

https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf

Create a logical vector that identifies the households on greater than 10 acres who sold more than $10,000 worth of agriculture products. Assign that logical vector to the variable agricultureLogical. Apply the which() function like this to identify the rows of the data frame where the logical vector is TRUE. which(agricultureLogical) What are the first 3 values that result?

```
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "./data/survey_housing_state_of_idaho", method = "curl")
housingData <- read.csv("./data/survey_housing_state_of_idaho")
dim(housingData)
str(housingData)
names(housingData)
agricultureLogical <- c(housingData$ACR == 3 & housingData$AGS == 6)
head(housingData[which(agricultureLogical), ])
which(agricultureLogical)
```


***
###Links and References

>[List and Data Cleaning, Lecture 3](http://www.biostat.jhsph.edu/~ajaffe/lec_winterR/Lecture%203.pdf "www.biostat.jhsph.edu Lecture 203")

>[Reference Card](http://cran.r-project.org/doc/contrib/Short-refcard.pdf "cran.r-project.org")

>[Baltimore City Data](https://data.baltimorecity.gov/Transportation/Baltimore-Fixed-Speed-Cameras/dz54-2aru)

>[Code School Try R](http://www.codeschool.com/courses/try-r)

>[Quick-R](http://statmethods.net/)

>[Peer Review Experiment Data](http://www.plosone.org/article/info:doi/10.1371/journal.pone.0026895)

***
### Functions and Libraries

```



```
***

1. Glenn

    - Pinto
- Renne

* Hello
* PInto

*Glenn*

`Pito`

