#' Assigns UK bat common name to a scientific name for default species
#'
#' Assigns UK bat common name to a scientific name for default species also
#' consistent with the default colours for individual species.)
#'
#' @param bat_column_to_graph Vector of UK bat species with scientific names
#'
#' @return A named vector of bat species with common names
#'
#' @examples
#'
#' bat_common_default(Lydford$Species)
#'
#'
#' @export
bat_common_default <- function(UK_bat_scientific_names){

  stopifnot("Input must be character vector" =  is.character(UK_bat_scientific_names))


  # List of bat common names and the scientific names
  BatCommon <- c(
    "Barbastella barbastellus" = "Barbastelle",
    "Myotis alcathoe" = "Alcathoe",
    "Myotis bechsteinii" = "Bechstein's",
    "Myotis brandtii" = "Brandt's",
    "Myotis daubentonii" = "Daubenton's",
    "Myotis mystacinus" = "Whiskered",
    "Myotis spp." = "Myotis",
    "Rhinolophus ferrumequinum" = "Greater horseshoe",
    "Rhinolophus hipposideros" = "Lesser horseshoe",
    "Nyctalus leisleri" = "Leisler's",
    "Plecotus auritus" = "Brown long-eared",
    "Plecotus austriacus" = "Grey long-eared",
    "Pipistrellus nathusii" = "Nathusius pipistrelle",
    "Myotis nattereri" = "Natterer's",
    "Nyctalus noctula" = "Noctule",
    "Nyctalus spp." = "Noctule or Leisler's",
    "Eptesicus serotinus" = "Serotine",
    "Pipistrellus pipistrellus" = "Common pipistrelle",
    "Pipistrellus pygmaeus" = "Soprano pipistrelle",
    "Pipistrellus spp." = "Pipistrelle",
    "Plecotus spp." = "Long-eared")

  # From Scientific name create a Common Name Vector
  unname(BatCommon[UK_bat_scientific_names])

}
