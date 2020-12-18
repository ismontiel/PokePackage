#' Pokemon Within Region
#'
#' @description Given a region and region-specific pokedex number, the function returns the associated pokemon. If either parameters are not specified, random ones are used
#'
#' @param region String indicating a pokemon region. See regions() for more list
#' @param dexNum integer
#'
#' @return
#' @export
#'
#' @examples
#' byRegion()
#' byRegion(region = "kanto")
#' byRegion(region = "national", 3)
#'
byRegion = function(region = NA, dexNum = NA) {
    if(is.na(region)) {
        region = regions()
        region = region[floor(runif(1, 1, length(region)+.9))]
    }

    request = paste("https://pokeapi.co/api/v2/pokedex/", region, sep="")
    region = jsonlite::fromJSON(request)

    if(is.na(dexNum)) {
        dexNum = runif(1, 1, length(region$pokemon_entries$entry_number))
    }
    region = region$pokemon_entries$pokemon_species$name
    return(region[dexNum])
}
