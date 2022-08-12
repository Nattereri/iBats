#' Merge Suntimes to Bat data frame
#'
#' Merges sunset and sunrise times to the bat data frame by Night. Makes a duplicate
#' of sunset and shifts the the column up one row to to make the sunrise for the Night
#' (it will do but not yet - fudged at the moment).
#'
#' @param bat_df bat data frame with Night column
#' @sun_df data frame of sun set and sun rise times by Day
#'
#' @return bat data frame with un set and sun rise times by Night
#'
#' @examples
#' night_sun_times
#'
#'
#'
#'
#' @export
night_sun_times <- function(bat_df, sun_df) {

  # Duplicate data.frame to make sunrise data
  risedata <- sun_df

  # Select  sunset date and time
  setdata <- sun_df %>%
    select(date, sunset) %>%
    mutate(date = lubridate::as_date(date))

  # Select  sunrise date and time
  risedata <- risedata %>%
    select(date, sunrise) %>%
    mutate(date = lubridate::as_date(date),
           date = date - lubridate::days(1))


  # Combine sunset and risedata by
  sun_data <- dplyr::full_join(setdata, risedata, by="date")

  # Rename date as Night
  colnames(sun_data) <- c("Night", "sunset", "sunrise")

  # Join bat data with the sundata by Night
  dplyr::left_join(bat_clean_data, sun_data, by="Night")

}
