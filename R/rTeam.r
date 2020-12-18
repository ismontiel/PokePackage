#' Random Team
#'
#' @description Generates a random team of pokemon
#'
#' @param n an integer indicating how big your team will be. Must be less than 899
#'
#' @return A list of strings
#'
#' @examples
#' rTeam()
#' rTeam(2)
#'
#'
rTeam = function(n = 5) {
    seeds = floor(runif(n, 1, 898.9))
    output = vector()
    for(i in seq(1,length(seeds))){
        request = paste("https://pokeapi.co/api/v2/pokemon/", seeds[i], sep="")
        temp = jsonlite::fromJSON(request)
        # output - append(output, temp$name)
        output[i] = temp$name
    }
    return(output)
}
