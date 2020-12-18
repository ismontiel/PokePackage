#' Type Effectiveness
#'
#' @description Describes the damage effectiveness of two Pokemon Types. For a list of types, see pokeTypes()
#'
#' @param attack String. The type of the attacking (your own) pokemon
#' @param defend String. The type of the defending (opponent's) pokemon
#'
#' @return Text describing the effectiveness. Maybe better as numeric?
#'
#'
#' @examples
#' effectiveness("water", "fire")
#' effectiveness("fire", "water")
effectiveness = function(attack, defend) {
    request = paste("https://pokeapi.co/api/v2/type/", attack, sep="")
    thisType = jsonlite::fromJSON(request)

    #There are if statements since it is possible for pokemon to both deal and take double damage from opponents
    if(defend %in% thisType$damage_relations$double_damage_to$name) {
        return("Your 'mon is super effective in this battle!")
    }
    if(defend %in% thisType$damage_relations$double_damage_from$name) {
        return("The opponent is super effective against you! Be careful!!")
    }
    return(FALSE)
}
