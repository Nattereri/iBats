#' Add date and time information
#'
#' Creates useful date and time information (Night, Month, MonthFull, Year, JustTime)
#' from the DateTime column, as extra columns in the data frame, from the date
#' and time of the bat observation. The default IANA time zone is "Europe/London".
#'
#' @param bat_df bat data frame with DateTime column
#'
#' @return Night, Month, MonthFull, Year, JustTime
#'
#' @examples
#' bat_data_frame <- tibble(DateTime = Sys.time())
#' date_time_info(bat_data_frame)
#'
#' date_time_info(bat_data_frame, time_zone = "Asia/Jakarta")
#'
#' @export
date_time_info <- function(bat_df, time_zone = "Europe/London") {

  # check data is data.frame
  stopifnot("df_with_date must be data frame" =  is.data.frame(bat_df))

  #check column names have DateTime column
  bat_df_col_names <- colnames(bat_df)
  stopifnot("DateTime column must be data frame" =  ("DateTime" %in% bat_df_col_names))

  #check DateTime column
  stopifnot("Input must have DateTime column" =  lubridate::is.POSIXct(bat_df$DateTime))


  #if("DateTime" %in% bat_df_col_names) {

    bat_df %>%
      mutate(DateTime = lubridate::force_tz(DateTime, time_zone),
             Night = DateTime - lubridate::hours(12), # DateTime minus 12 hours
             Night = lubridate::as_date(Night), # Make Night variable just a date
             Month = lubridate::month(Night, label = T), # Make Month of observation
             MonthFull = lubridate::month(Night, label = T, abbr = F), # Make FullMonth
             Year = lubridate::year(Night), # Make Year of observation
             JustTime = DateTime + lubridate::hours(12),
             JustTime = hms::as_hms(stringr::str_sub(as.character(JustTime),
                                                     start = 12, end = 19)))



  #} else {

   # print("No date time column present")

  #}

}
