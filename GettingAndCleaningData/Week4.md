Week 4 Quiz
===========

***

####Question 1

The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here: 

https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv

and load the data into R. The code book, describing the variable names is here: 

https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf

Apply strsplit() to split all the names of the data frame on the characters "wgtp". What is the value of the 123 element of the resulting list?

```
library(data.table)
if (!file.exists("./data")) {dir.create("./data")}
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileURL, destfile = "./data/us-acs-hid.csv", method = "curl")
usacshid <- fread("./data/us-acs-hid.csv", stringsAsFactors = FALSE, sep = ",")
splitNames <- strsplit(names(usacshid), "wgtp")
splitNames[123]

```
***
####Question 2

Load the Gross Domestic Product data for the 190 ranked countries in this data set: 

https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv 

Remove the commas from the GDP numbers in millions of dollars and average them. What is the average? 

Original data sources: http://data.worldbank.org/data-catalog/GDP-ranking-table

**Answer**

`"" "15"`

```
library(data.table)
if (!file.exists("./data")) {dir.create("./data")}
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileURL, destfile = "./data/FGDP.csv", method = "curl")
FGDP <- fread("./data/FGDP.csv", stringsAsFactors = FALSE, sep = ",", header = "auto", skip=",Ranking")
str(FGDP)
head(FGDP, 500)
colnames(FGDP)[5] <- "GDP" 
FGDP$GDP <- gsub(",", "", FGDP$GDP)
FGDP$GDP <- as.numeric(FGDP$GDP)
FGDP[Ranking != "", mean(GDP, na.rm = TRUE) ]
```
**Answer**

`377652.4`

***

####Question 3

In the data set from Question 2 what is a regular expression that would allow you to count the number of countries whose name begins with "United"? Assume that the variable with the country names in it is named countryNames. How many countries begin with United?

```
str(FGDP)
countryNames <- FGDP[, Economy]
grep("^United", countryNames, value = TRUE)

```

**Answer**

`grep("^United",countryNames), 3`

***

####Question 4

Load the Gross Domestic Product data for the 190 ranked countries in this data set: 

https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv 

Load the educational data from this data set: 

https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv 

Match the data based on the country shortcode. Of the countries for which the end of the fiscal year is available, how many end in June? 

Original data sources: 
http://data.worldbank.org/data-catalog/GDP-ranking-table 
http://data.worldbank.org/data-catalog/ed-stats

```
library(data.table)
if (!file.exists("./data")) {dir.create("./data")}
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileURL, destfile = "./data/FGDP.csv", method = "curl")
FGDP <- fread("./data/FGDP.csv", stringsAsFactors = FALSE, sep = ",", header = "auto", skip=",Ranking")

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileURL, destfile = "./data/FEDSTATS.csv", method = "curl")
FEDSTATS <- fread("./data/FEDSTATS.csv", stringsAsFactors = FALSE, sep = ",", header = "auto")

str(FGDP)
str(FEDSTATS)
setkey(FEDSTATS, CountryCode)
setkey(FGDP, V1)
fgdpColNames <- colnames(FGDP)
fgdpColNames[1] <- "CountryCode"
colnames(FGDP) <- fgdpColNames
mergedData <- merge(FGDP, FEDSTATS, by = c("CountryCode"), all = TRUE)
tables()
str(mergedData)
tail(mergedData)
colnames(mergedData) <- gsub(" ", ".", colnames(mergedData))
nrow(mergedData[grep("June 30", Special.Notes)])

```

**Answer**

`13`

***

####Question 5

You can use the quantmod (http://www.quantmod.com/) package to get historical stock prices for publicly traded companies on the NASDAQ and NYSE. Use the following code to download data on Amazon's stock price and get the times the data was sampled.

```
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 
```

How many values were collected in 2012? How many values were collected on Mondays in 2012?

```

```

**Answer**

` `
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


**String functions**
```
tolower()
toupper()
strsplit()
list()
sapply()
sub()
gsub()
grep()
grepl()
```
**library(stringr)**
```
nchar()
substr()
paste()
paste0()
str_trim()

```
**Regular Expressions**

Used with grep, grepl, sub, gsub


**Working with Dates**



