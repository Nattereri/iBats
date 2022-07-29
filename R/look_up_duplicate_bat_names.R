look_up_duplicates <- function(look_up_list) {
  
  #Test data
  #look_up_list <- BatScientific
  
  # check for duplicate names (all charcters made lower case and just a-z, 0-9)
  # look up table will not work for the named duplicated
  check <- names(look_up_list)
  
  duplicates <- names(look_up_list[which(duplicated(check))])
  
  duplicates = paste0('"', duplicates, '"\n')
  
  if (length(duplicates) > 1) {
    cat("Warning data has the following duplicates:\n\n", duplicates, "\nthese will not be found!\n")
  }
  
}