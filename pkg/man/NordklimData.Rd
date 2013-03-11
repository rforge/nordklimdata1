\name{NordklimData}
\alias{NordklimData}
\docType{data}
\title{
The Nordklim Dataset
}
\description{
The NORDKLIM data set - monthly data for 7 climatic elements from 114 stations in 5 Nordic countries.
}
\usage{data(NordklimData)}
\format{
  A data frame with 71329 observations on the following 16 variables.
  \describe{
    \item{NordklimNumber}{Nordklim number identifier}
    \item{ClimateElement}{Climate element identifier}
    \item{FirstYear}{First year of the dataset}
    \item{January}{Readings for January}
    \item{February}{Readings for February}
    \item{March}{Readings for March}
    \item{April}{Readings for April}
    \item{May}{Readings for May}
    \item{June}{Readings for June}
    \item{July}{Readings for July}
    \item{August}{Readings for August}
    \item{September}{Readings for September}
    \item{October}{Readings for October}
    \item{November}{Readings for November}
    \item{December}{Readings for December}
    \item{CountryCode}{Country code}
  }
}
\details{
The NORDKLIM data set has 16 columns, the first three columns are the Nordklim number, climate
element number and first year of the dataset, the next 12 columns are twelve months of readings,
from January to December and the last column is the country code.
Monthly climatic elements in the NORDKLIM data set:
\tabular{llll}{
Element number \tab Climatic element \tab Unit \tab Abbreviation\cr
101 \tab Mean temperature  \tab 0.1 C \tab T\cr
111 \tab Mean maximum temperature  \tab 0.1 C \tab Tx\cr
112 \tab Highest maximum temperature  \tab 0.1 C \tab Th\cr
113 \tab Day of Th  \tab date \tab Thd\cr
121 \tab Mean minimum temperature  \tab 0.1 C \tab Tn\cr
122 \tab Lowest minimum temperature  \tab 0.1 C \tab Tl\cr
123 \tab Day of Tl  \tab date \tab Tld\cr
401 \tab Mean Pressure  \tab 0.1 hPa \tab P\cr
601 \tab Precipitation Sum  \tab 0.1 mm \tab R\cr
602 \tab Maximum 1-day precipitation  \tab 0.1 mm \tab Rx\cr
701 \tab Number of days with snow cover (> 50\% covered)  \tab days \tab dsc\cr
801 \tab Mean cloud cover  \tab \% \tab N\cr
}
}
\source{\url{http://www.smhi.se/hfa_coord/nordklim}}
\references{
Nordklim dataset 1.0 - description and illustrations
Norwegian meteorological institute, 08/01 KLIMA, 2001
}
\examples{
\dontrun{
data(NordklimData)
str(NordklimData)
# get all the country codes
countries <- unique(NordklimData$CountryCode)
# earliest and latest year of data collection
minFirstYear<- min(NordklimData$FirstYear)
maxFirstYear<- max(NordklimData$FirstYear)
allyears <- min(NordklimData$FirstYear):max(NordklimData$FirstYear)
# get the yearly average of all records
avgNordk <- cbind(NordklimData[,c('CountryCode','ClimateElement','FirstYear','NordklimNumber')], 
YrAvg=apply(NordklimData[,c('January','February','March','April','May','June','July','August','September','October','November','December')],1,function(x) {x[x==-9999]<-NA;mean(x,na.rm = TRUE)}))
str(avgNordk)
# plot the Danish mean temperatures for its 5 stations (for a quick visual inspection, no need for labels or legends)
DanavgNordk <- avgNordk[which(avgNordk$CountryCode=='DK' & avgNordk$ClimateElement==101),c('FirstYear','YrAvg','NordklimNumber')]
p <- unique(DanavgNordk$NordklimNumber)
for (Dp in p) { plot(DanavgNordk[which(DanavgNordk$NordklimNumber==Dp),c('FirstYear','YrAvg')],type='l',col=( which(Dp==p)),
xlim=c(min(DanavgNordk$FirstYear), max(DanavgNordk$FirstYear)),ylim=c(60,120)); par(new=T)}
# average each country
avgNordkCountry=aggregate(YrAvg ~ CountryCode+ClimateElement+FirstYear , data = avgNordk, function(x) {x[x==-9999]<-NA;mean(x,na.rm = TRUE)})
str(avgNordkCountry)
# plot the temperatures (mean of all stations) for each country
for (country in countries) { plot(avgNordkCountry[which(avgNordkCountry$CountryCode==country & avgNordkCountry$ClimateElement==101),
c('FirstYear','YrAvg')],type='l',col=( which(country==countries)),xlim=c(minFirstYear, maxFirstYear),ylim=c(0,120),
main='Mean of yearly means of all stations for each country',xlab='Years',ylab='Mean temperature'); par(new=T)}
legend('topleft', legend = countries, col=1:5, pch=1, lty=1, merge=TRUE)
}
}
\keyword{datasets}
