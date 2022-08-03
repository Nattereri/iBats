#' Helps assigns a bat species the same colour in graphs
#'
#' Assigns a bat species the same colour so graphs can be consistent (i.e. same colour for individual species.)
#'
#' @param bat_column Vector of bat species to be graphed and assigned a species colour
#' @param colour_vector A named vector of 'all' bat species and an assigned colour
#'
#' @return A named vector of bat species and an assigned colour
#'
#' @examples
#' bat_colours <- c("Barbastelle" = "#1f78b4", "Common pipistrelle" = "#ffff99", "Myotis" = "#BCEE68", "Natterer's" = "#ff7f00")
#' bat_column_to_graph <- c("Myotis", "Common pipistrelle", "Common pipistrelle", "Barbastelle", "Natterer's")
#' bat_colours(bat_column_to_graph, colour_vector = bat_colours)
#'
#' scales::show_col(bat_colours(bat_column_to_graph, colour_vector = bat_colours))
#'
#' @export
bat_colours <- function(bat_column_to_graph, colour_vector = bat_colours){

  graph_bat_list <- levels(factor(bat_column_to_graph))

  #Subset named vector
  colour_vector[(names(colour_vector) %in% graph_bat_list)]


}
