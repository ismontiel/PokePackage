#' Team by weight
#'
#' @description Given a list of pokemon names (a "team"), the function will output the team sorted by weight. If no list is specified, the function will generate a random team of five.
#'
#' @param myTeam A list of string names of pokemon
#'
#' @return Dataframe of pokemon and corresponding weight
#' @export
#'
#' @examples
#' heaviest()
#' heaviest(c("piakachu", "lotad"))
heaviest = function(myTeam = rTeam()) {
    weights = vector()
    for(i in seq(1, length(myTeam))) {
        request = paste("https://pokeapi.co/api/v2/pokemon/", myTeam[i], sep="")
        thisMon = jsonlite::fromJSON(request)
        weights[i] = thisMon$weight
    }
    weights = as.numeric(weights)
    teamWeight = as.data.frame(cbind(myTeam, weights))
    teamWeight = teamWeight[order(as.numeric(teamWeight$weights)),]
    return(teamWeight)
}
