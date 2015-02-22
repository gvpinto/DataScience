fileURL <- "https://data.baltimorecity.gov/Transportation/Baltimore-Fixed-Speed-Cameras/dz54-2aru"
getwd()
setwd("./DataScience")
if (!file.exists("./data")) {dir.create("./data")}
fileURL <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileURL, destfile = "./data/cameras.csv", method = "curl")
cameraData <- read.csv("./data/cameras.csv")
names(cameraData)

## tolower() toupper()
tolower(names(cameraData))

## strsplit() - Returns List
## http://www.biostat.jhsph.edu/~ajaffe/lec_winterR/Lecture%203.pdf
## http://cran.r-project.org/doc/contrib/Short-refcard.pdf
splitNames <- strsplit(names(cameraData), "\\.")
splitNames
splitNames[[5]]
splitNames[[6]]
splitNames[[6]][1]

## list()
mylist <- list(letters = c("A", "b", "c"), numbers = 1:3, matrix(1:25, ncol = 5))
head(mylist)
mylist[1]
mylist$letters
mylist[[1]]

## sapply()
splitNames[[6]][1]
firstElement <- function(x){x[1]}
sapply(splitNames, firstElement)

## sub()
## Peer Review Experiment Data http://www.plosone.org/article/info:doi/10.1371/journal.pone.0026895
fileUrl1 = "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
fileUrl2 = "https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
download.file(fileUrl1, destfile = "./data/reviews.csv", method = "curl")
download.file(fileUrl2, destfile = "./data/solutions.csv", method = "curl")
reviews = read.csv("./data/reviews.csv"); solutions = read.csv("./data/solutions.csv")
head(reviews, 2)
head(solutions, 2)
names(reviews)
sub("_", "", names(reviews))

## gsub()
testName <- "this_is_a_test"
sub("_", "", testName)
gsub("_", "", testName)

## grep() grepl()
cameraData$intersection
grep("Alameda", cameraData$intersection)
table(grepl("Alameda", cameraData$intersection))
cameraData2 <- cameraData[!grepl("Alameda", cameraData$intersection), ]
cameraData2
grep("Alameda", cameraData$intersection, value = TRUE)
grep("JeffStreet", cameraData$intersection) ## Result integer(0)
length(grep("JeffStreet", cameraData$intersection))

## stringr - nchar(), substr(), paste(), paste0(), str_trim()
library(stringr)
nchar("Jeffrey Leek")
substr("Jeffrey Leek", 1, 7)
paste("Jeffrey", "Leek")
paste0("Jeffrey", "Leek")
str_trim("Jeff      ")


