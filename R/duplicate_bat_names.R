#' Check for duplicate names in bat list vector
#'
#' @param look_up_list vector of bat names to check for duplicates
#'
#' @return bat character vector of duplicate names
#'
#' @examples
#' look_up <- c("45 pip" = "Pipistrellus", "45 pip" = "Pipistrellus", "bleb" = "Plecotus auritus")
#' duplicate_bat_names(look_up)
#'
duplicate_bat_names <- function(look_up_list) {

  #Test data
  #look_up_list <- BatScientific

  # check for duplicate names (all charcters made lower case and just a-z, 0-9)
  # look up table will not work for the named duplicated
  check <- names(look_up_list)

  stopifnot("Input must be character vector" =  is.character(look_up_list))

  duplicates <- names(look_up_list[which(duplicated(check))])

  duplicates = paste0('"', duplicates, '"\n')

  if (length(duplicates) > 1) {
    cat("Warning data has the following duplicates:\n\n", duplicates, "\nthese will not be found!\n")
  }

}
