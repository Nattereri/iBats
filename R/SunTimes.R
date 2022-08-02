#' Sun times for the nights of bat observations
#'
#' Calculates the sunrise and sunset times for bat observations by Night (dusk to dawn). The function uses the package suncalcs to make sunset and sunrise columns for each Night and the location based on the Latitude and Longitude of the bat observation.
#'
#' @param bat_df bat data frame with DateTime, Latitude and Longitude columns
#'
#' @return night and suntimes data frame
#'
#' @examples
#'  bat_data_frame <- tibble(DateTime = Sys.time(), Latitude = 51.5023, Longitude = -0.1352)
#' SunTimes(bat_data_frame)
#'
#' @export
SunTimes <- function(bat_df, time_zone = "Europe/London"){

  #check column names
  bat_df_col_names <- colnames(bat_df)

  if("Night" %in% bat_df_col_names &
     "Latitude" %in% bat_df_col_names &
     "Longitude" %in% bat_df_col_names) {

    num_nights <- No_Nights(bat_df$Night)


    # Make a date vector of nights between first and last bat observation.
    nightlist <- seq.Date(from=min(bat_df$Night),
                          length.out = num_nights + 1,
                          by='days')

    # Get suntimes for date vector and Location (Latitude and Longitude)
    setdata <- getSunlightTimes(date = nightlist,
                                lat = median(bat_df$Latitude, na.rm = T),
                                lon = median(bat_df$Longitude, na.rm = T),
                                tz = time_zone)

  } else {

    print("Night or Latitude or Longitude is not in the data frame")

  }


}
