#' Create night time metrics such as bat times (mins/hrs) relative to sun set and sun rise
#'
#' Create night time metrics of bat activity relative to sun rise and sun set. Such as
#' the time of bat activity after sun set and before sun rise in minutes and hours. The activity for each hour
#' after sunset is also calculated along with the length of the night in hours.
#'
#' @param bat_df bat data frame with DateTime, sunset & sunrise columns
#'
#' @return bat data frame with metrics of bat activity relative to sun set and sun rise
#'
#' @examples
#' night_time_metrics
#'
#'
#'
#' @export
night_time_metrics <- function(bat_df) {

  stopifnot("Input must be data frame" =  is.data.frame(bat_df))

  bat_df %>%
    mutate(post_set_min = as.numeric(difftime(DateTime, sunset, units='mins')),
           pre_rise_min = as.numeric(difftime(sunrise, DateTime, units='mins')),
           post_set_hr = as.numeric(difftime(DateTime, sunset, units='hours')),
           pre_rise_hr = as.numeric(difftime(sunrise, DateTime, units='hours')),
           post_set_hr_int = as.integer(round(post_set_hr, digits = 0)),
           pre_rise_hr_int = as.integer(round(pre_rise_hr, digits = 0)),
           night_length_hr = as.numeric(difftime(sunrise, sunset, units='hours')))

}
