\name{NordklimStationCatalogue}
\alias{NordklimStationCatalogue}
\docType{data}
\title{
The Nordklim Station Catalogue
}
\description{
Information about the Nordklim stations and climate element numbers.
}
\usage{data(NordklimStationCatalogue)}
\format{
  A data frame with 114 observations on the following 31 variables.
  \describe{
    \item{Station}{ Station id}
    \item{Catalogue}{ Catalogue id}
    \item{Station.name}{ Station name}
    \item{Height.ASL}{ Height at sea level}
    \item{Country}{ Country}
    \item{Nordklim.number}{ Nordklim id}
    \item{Lat.Long}{ Lat./Long.}
    \item{X101}{ Mean temperature }
    \item{X101E}{ Mean temperature error}
    \item{X111}{ Mean maximum temperature}
    \item{X111E}{ Mean maximum temperature  error}
    \item{X112}{ Highest maximum temperature }
    \item{X112E}{ Highest maximum temperature  error}
    \item{X113}{ Day of Th }
    \item{X113E}{ Day of Th  error}
    \item{X121}{ Mean minimum temperature }
    \item{X121E}{ Mean minimum temperature  error}
    \item{X122}{ Lowest minimum temperature }
    \item{X122E}{ Lowest minimum temperature  error}
    \item{X123}{ Day of Tl }
    \item{X123E}{ Day of Tl  error}
    \item{X401}{ Mean Pressure }
    \item{X401E}{ Mean Pressure  error}
    \item{X601}{ Precipitation Sum }
    \item{X601E}{ Precipitation Sum  error}
    \item{X602}{ Maximum 1-day precipitation }
    \item{X602E}{ Maximum 1-day precipitation  error}
    \item{X701}{ Number of days with snow cover (> 50\% covered) }
    \item{X701E}{ Number of days with snow cover (> 50\% covered)  error}
    \item{X801}{ Mean cloud cover }
    \item{X801E}{ Mean cloud cover  error}
  }
}
\details{
The station catalogue has five columns with station information (station name, height
at sea level, country code, NORDKLIM number and Lat./Long.) followed by 24 columns, two for each
climate element number, the first is the first year of the dataset and the second is the last year.
}
\source{\url{http://www.smhi.se/hfa_coord/nordklim}}
\references{
Nordklim dataset 1.0 - description and illustrations
Norwegian meteorological institute, 08/01 KLIMA, 2001
}
\examples{
\dontrun{
data(NordklimStationCatalogue)
str(NordklimStationCatalogue)
# 114 stations
length(NordklimStationCatalogue$Nordklim.number)
# in 5 Nordic countries
length(NordklimStationCatalogue$Country)
# how many stations per country?
table(NordklimStationCatalogue$Country,dnn = list("Number of stations per country"))
# how many climate elements recorded per station?
climElSta <- rowSums(sign(NordklimStationCatalogue[,c('X101','X111','X112','X113','X121','X122','X123','X401','X601','X602','X701','X801')]), na.rm = TRUE)
barplot(climElSta)
# how many stations per climate element?
staClimEl <- colSums(sign(NordklimStationCatalogue[,c('X101','X111','X112','X113','X121','X122','X123','X401','X601','X602','X701','X801')]), na.rm = TRUE)
barplot(staClimEl)
# how many stations have 1,2,3, ..., 12 climate elements? (same as Fig. 2 from Nordklim dataset 1.0 - description and illustrations)
barplot(table(climElSta),main='Number of stations as a function of number of climatic elements')
}
}
\keyword{datasets}
