#' Number nights between bat observations
#'
#' Calculates the number nights between first and last bat observation (plus 1 for dawn)
#'
#' @param night Vector of Dates
#'
#' @return Integer of the number of nights
#'
#' @examples
#' date_vector <- seq.Date(from=Sys.Date(), length.out = 14L, by='days')
#' No_Nights(date_vector)
#'
#' @export
No_Nights <- function(night_vector){

  stopifnot("Night is not in Date format" =  lubridate::is.Date(night_vector))

  as.integer(difftime(max(night_vector, na.rm = T) ,
                      min(night_vector, na.rm = T) ,
                      units = c("days"))) + 1

}

