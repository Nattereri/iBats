#' Create sun and night time metrics including bat times relative to sun set and sun rise
#'
#' Create night time metrics of bat activity relative to sun rise and sun set. Such as
#' the time of bat activity after sun set and before sun rise in minutes and hours. The activity for each hour
#' after sunset is also calculated along with the length of the night in hours.
#'
#' @param bat_df bat data frame with Night, DateTime, Latitude and Longitude columns
#' @param time_zone time zone location default "Europe/London"
#'
#' @return bat data frame with sun and night time metrics of bat activity relative to sun set and sun rise
#'
#' @examples
#' Night <- lubridate::ymd(c("20220620", "20220621", "20220622"))
#' DateTime <- lubridate::ymd_hms(c("20220620 21:30:55", "20220621 22:10:34", "20220622 21:50:28"))
#' Latitude <- rep(51.5023, times = 3)
#' Longitude <- rep(-0.1352, times = 3)
#' bat_data_frame <- tibble(Night, DateTime, Latitude, Longitude)
#' sun_night_metrics(bat_data_frame, time_zone = "Europe/London")
#'
#'
#'
#' @export
sun_night_metrics <- function(bat_df, time_zone = "Europe/London") {

  setdata <- iBats::sun_times(bat_df, time_zone)

  joined_data <- iBats::night_sun_times(bat_df, setdata)

  iBats::night_time_metrics(joined_data)

}
