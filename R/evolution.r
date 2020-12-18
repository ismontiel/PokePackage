#' Next Pokemon Evolution
#'
#' @description Returns the next stage of evolution for the entered pokemon ID
#'
#' @param id integer. The id of the requested pokemon
#'
#' @return String name of the entered pokemon's evolution
#' @export
#'
#' @examples evolution(1)
evolution = function(id) {
    # Tried to enable passing in a string, but IDs don't match in database :(
    # thisMon = paste("https://pokeapi.co/api/v2/pokemon/", name, sep="")
    # thisMon = fromJSON(thisMon)

    request = paste("https://pokeapi.co/api/v2/evolution-chain/", id, sep="")
    thisEvo = jsonlite::fromJSON(request)
    return(thisEvo$chain$evolves_to$species$name)
}
