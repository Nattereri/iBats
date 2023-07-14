#' Sun times for the nights of bat observations
#'
#' Calculates the sunrise and sunset times for bat observations by Night (dusk to dawn). The function uses the package suncalcs to make sunset and sunrise columns for each Night and the location based on the Latitude and Longitude of the bat observation.
#'
#' @param bat_df bat data frame with Night, Latitude and Longitude columns
#' @param time_zone time zone location e.g. "Europe/London"
#'
#' @return night and sun times data frame
#'
#' @examples
#' bat_data_frame <- tibble(Night = Sys.Date(), Latitude = 51.5023, Longitude = -0.1352)
#' sun_times(bat_data_frame, time_zone = "Europe/London")
#'
#' bat_data_frame <- tibble(Night = Sys.Date(), Latitude = -6.1370, Longitude = 106.8497)
#' sun_times(bat_data_frame, time_zone = "Asia/Jakarta")
#'
#'
#' @importFrom stats median
#'
#' @export
sun_times <- function(bat_df, time_zone){

  # check data is data.frame
  stopifnot("data must be data frame" =  is.data.frame(bat_df))

  #check Date column
  stopifnot("Input must have Night column in date format" =  lubridate::is.Date(bat_df$Night))

  #check column names
  bat_df_col_names <- colnames(bat_df)

  if("Night" %in% bat_df_col_names &
     "Latitude" %in% bat_df_col_names &
     "Longitude" %in% bat_df_col_names) {

    bat_df$Night <- lubridate::force_tz(bat_df$Night, tzone = time_zone)

    bat_df$Night <- lubridate::as_date(bat_df$Night)

    num_nights <- No_Nights(bat_df$Night)


    # Make a date vector of nights between first and last bat observation.
    nightlist <- seq.Date(from=min(bat_df$Night),
                          length.out = num_nights + 1,
                          by='days')

    # Get suntimes for date vector and Location (Latitude and Longitude)
    suncalc::getSunlightTimes(date = nightlist,
                              lat = median(bat_df$Latitude, na.rm = T),
                              lon = median(bat_df$Longitude, na.rm = T),
                              keep = c("sunrise", "sunset"),
                              tz = time_zone)

  } else {

    print("Night or Latitude or Longitude is not in the data frame")

  }


}
