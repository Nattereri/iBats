#' Makes bat names scientific
#'
#' A function that takes a character vector of any bat name, or abbreviation, and
#' compares it with a reference scientific named character vector and returns the
#' scientific  name of bat species using “binomial nomenclature” from the International
#' Code of Zoological Nomenclature (ICZN)
#'
#' @param look_up_vector Character vector of any bat name, or abbreviation, to
#'       convert to scientific
#' @param bat_name_vector Named character vector of any bat name, or abbreviation,
#'       against the bat species scientific name
#'
#' @return Character Vector of scientific bat names
#'
#' @examples
#' look_up_vector <- c("45 pip" = "Pipistrellus pipistrellus", "bleb" = "Plecotus auritus")
#' bat_vector_to_name <- c("45 pip", "45 pip", "45 pip", "bleb")
#' make_scientific(look_up_vector, bat_vector_to_name)
#'
#' @export
make_scientific <- function(look_up_vector, bat_name_vector) {

  stopifnot("look_up_vector must be character vector" = is.character(look_up_vector))
  stopifnot("bat_name_vector must be character vector" = is.character(bat_name_vector))

  #Check for duplicates in look-up-list
  duplicate_bat_names(look_up_vector)

  #Tidy names up
  bat_name_tidy <- bat_name_vector %>%
    #make all lower case
    stringr::str_to_lower(locale = "en") %>%
    #trim leading and trailing whitespace
    stringr::str_trim() %>%
    #remove all except the alphabet & space
    stringr::str_replace_all("[^a-z0-9 ]", "") %>%
    #remove " or " e.g. "whiskered or brandts"
    stringr::str_replace_all(" or ", "")

  #Look up table - unname removes names attribute
  named_scientific <-  unname(look_up_vector[bat_name_tidy])

  return(named_scientific)

}
