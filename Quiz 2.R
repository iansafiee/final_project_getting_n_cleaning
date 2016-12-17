library(httr)
require(httpuv)
require(jsonlite)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at at
#    https://github.com/settings/applications. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("github",
                   key = "56b637a5baffac62cad9",
                   secret = "8e107541ae1791259e9987d544ca568633da2ebf")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
req <- GET("https://api.github.com/users/jtleek/repos", config(token = github_token))
stop_for_status(req)
output <- content(req)

for (i in (1:30)) {
print (unlist(output[[i]]$name))
print (unlist(output[[i]]$created_at))
}

##### Question 2-3 #####

install.packages('sqldf')
require(sqldf)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl, destfile = "./test.csv", method = "libcurl")
acs<-read.table('test.csv',sep=",",header=TRUE)
pwgtp1_less_than_50<-sqldf("select pwgtp1 from acs where AGEP < 50")
sqldf("select distinct AGEP from acs")

##### Question 4 #####

con <- url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode <- readLines(con)
nchar(htmlCode[10]); nchar(htmlCode[20]); nchar(htmlCode[30]); nchar(htmlCode[100]);

##### Question 5 ####
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
download.file(fileUrl, destfile = "./test.csv", method = "libcurl")
acs2<-read.table('test.csv',header=TRUE)
data <- read.fwf(file = "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for",
                 skip = 4,
                 widths = c(10,9,4,9,4,9,4,9,4))
sum(data[,4])





