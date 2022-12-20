#' Helps assigns a bat species the same colour in graphs
#'
#' Assigns a bat species the same colour so graphs can be consistent (i.e. same colour for individual species.)
#'
#' @param bat_column Vector of bat species to be graphed and assigned a species colour
#' @param colour_vector A named vector of 'all' bat species and an assigned colour
#' @param default_colours_sci TRUE for default colours UK scientific names only
#'
#' @return A named vector of bat species and an assigned colour
#'
#' @examples
#' bat_colours <- c("Barbastelle" = "#1f78b4", "Common pipistrelle" = "#ffff99", "Myotis" = "#BCEE68", "Natterer's" = "#ff7f00")
#' bat_column_to_graph <- c("Myotis", "Common pipistrelle", "Common pipistrelle", "Barbastelle", "Natterer's")
#' bat_colours(bat_column_to_graph, colour_vector = bat_colours)
#'
#' bat_column_to_graph <- c("Barbastella barbastellus", "Myotis daubentonii", "Pipistrellus pygmaeus", "Pipistrellus pygmaeus")
#' bat_colours(bat_column_to_graph, colour_vector = NULL, default_colours_sci = TRUE)
#'
#' scales::show_col(bat_colours(bat_column_to_graph, colour_vector = bat_colours))
#'
#' @export
bat_colours <- function(bat_column_to_graph, colour_vector = bat_colours, default_colours_sci = FALSE){

  stopifnot("Input must be character vector" =  is.character(bat_column_to_graph))


  if(default_colours_sci) {

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

    #colour_vector = bat_colours

    graph_bat_list <- levels(factor(bat_column_to_graph))

    #Subset named vector
    colour_vector[(names(colour_vector) %in% graph_bat_list)]

  } else {

    stopifnot("Input must be character vector" =  is.character(colour_vector))

    graph_bat_list <- levels(factor(bat_column_to_graph))

    #Subset named vector
    colour_vector[(names(colour_vector) %in% graph_bat_list)]

  }




}
