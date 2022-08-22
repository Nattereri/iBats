#' Create sun and night time metrics including bat times relative to sun set and sun rise
#'
#' Create night time metrics of bat activity relative to sun rise and sun set. Such as
#' the time of bat activity after sun set and before sun rise in minutes and hours. The activity for each hour
#' after sunset is also calculated along with the length of the night in hours.
#'
#' @param bat_df bat data frame with DateTime, sunset & sunrise columns
#'
#' @return bat data frame with sun and night time metrics of bat activity relative to sun set and sun rise
#'
#' @examples
#' sun_night_metrics
#'
#'
#'
#'
#' @export
sun_night_metrics <- function(bat_df) {

  setdata <- iBats::sun_times(bat_df)

  joined_data <- iBats::night_sun_times(bat_df, setdata)

  iBats::night_time_metrics(joined_data)

}
