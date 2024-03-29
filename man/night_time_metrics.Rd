% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/night_time_metrics.R
\name{night_time_metrics}
\alias{night_time_metrics}
\title{Create night time metrics such as bat times (mins/hrs) relative to sun set and sun rise}
\usage{
night_time_metrics(bat_df)
}
\arguments{
\item{bat_df}{bat data frame with DateTime, sunset & sunrise columns}
}
\value{
bat data frame with metrics of bat activity relative to sun set and sun rise
}
\description{
Create night time metrics of bat activity relative to sun rise and sun set. Such as
the time of bat activity after sun set and before sun rise in minutes and hours. The activity for each hour
after sunset is also calculated along with the length of the night in hours.
}
\examples{
night_time_metrics



}
