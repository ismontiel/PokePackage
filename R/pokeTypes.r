#' Pokemon Types
#'
#' @description A helper function to display all available Pokemon Types. It's a one liner so I didn't really consider it part of the five.
#'
#' @return List of strings containing all pokemon types
#' @export
#'
#' @examples
pokeTypes = function() {
    return(jsonlite::fromJSON("https://pokeapi.co/api/v2/type/")$results$name)
}
