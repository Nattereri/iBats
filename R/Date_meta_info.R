#' Add date and time information
#'
#' Creates useful date and time information (Night, Month, MonthFull, Year, JustTime) 
#' from the DateTime column, as extra columns in the data frame, from the date 
#' and time of the bat observation
#'
#' @param bat_df bat data frame with DateTime column
#'
#' @return Night, Month, MonthFull, Year, JustTime
#'
#' @examples
#' bat_data_frame <- tibble(DateTime = c(lubridate::ymd_hms("20220801 23:30:00")))
#' date_time_info(bat_data_frame)
#'
#' @export
date_time_info <- function(bat_df, time_zone = "Europe/London") {

  #check column names
  bat_df_col_names <- colnames(bat_df)
  
  if("DateTime" %in% bat_df_col_names) {
    
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
    
    
    
  } else {
    
    print("No date time column present")
    
  }

}