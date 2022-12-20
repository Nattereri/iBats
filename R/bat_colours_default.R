#' Assigns UK bat species a default colour in graphs
#'
#' Assigns UK bat species (with scientific names only) a default colour so graphs
#' can be consistent (i.e. same colour for individual species.)
#'
#' @param bat_column_to_graph Vector of bat species to be graphed and assigned a species colour
#'
#' @return A named vector of bat species and an assigned default colour
#'
#' @examples
#'
#' bat_colours_default(Lydford$Species)
#'
#' scales::show_col(bat_colours_default(Lydford$Species))
#'
#' @export
bat_colours_default <- function(bat_column_to_graph){

  stopifnot("Input must be character vector" =  is.character(bat_column_to_graph))


  colour_vector <- c(
      "Barbastella barbastellus" = "#1f78b4",
      "Myotis alcathoe" = "#a52a2a",
      "Myotis bechsteinii" = "#7fff00",
      "Myotis brandtii" = "#b2df8a",
      "Myotis mystacinus" = "#6a3d9a",
      "Myotis nattereri" = "#ff7f00",
      "Myotis daubentonii" = "#a6cee3",
      "Myotis spp." = "#bcee68",
      "Plecotus auritus" = "#8b0000",
      "Plecotus spp." = "#8b0000",
      "Plecotus austriacus" = "#000000",
      "Pipistrellus pipistrellus" = "#ffff99",
      "Pipistrellus nathusii" = "#8a2be2",
      "Pipistrellus pygmaeus" = "#b15928",
      "Pipistrellus spp." = "#fdbf6f",
      "Rhinolophus ferrumequinum" = "#e31a1c",
      "Rhinolophus hipposideros" = "#33a02c",
      "Nyctalus noctula" = "#cab2d6",
      "Nyctalus leisleri" = "#fb9a99",
      "Nyctalus spp." = "#eee8cd",
      "Eptesicus serotinus" = "#008b8b"
    )

    graph_bat_list <- levels(factor(bat_column_to_graph))

    #Subset named vector
    colour_vector[(names(colour_vector) %in% graph_bat_list)]


}
