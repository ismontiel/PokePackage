#' Pokemon Game Regions
#'
#'@description A helper function to display all available Pokemon Regions. Again, it's a one liner so I didn't really consider it part of the five.
#'
#' @return A list of Strings containing all pokemon regions available
#' @export
#'
#' @examples
regions = function() {
    return(jsonlite::fromJSON("https://pokeapi.co/api/v2/pokedex/")$results$name)
}
