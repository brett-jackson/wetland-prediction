library(rinat)

get_observations <- function(taxon, range)
{
    # Validate inputs
    stopifnot(
        "`taxon` must be a string" = is.character(taxon))
    stopifnot(
        "`range` must be a vector"     = is.vector((range)),
        "`range` must have 4 elements" = length(range) == 4)
    stopifnot(
        "`range[1]` must be a valid latitude"  = abs(range[1]) <= 90.0,
        "`range[2]` must be a valid longitude" = abs(range[2]) <= 180.0,
        "`range[3]` must be a valid latitude"  = abs(range[3]) <= 90.0,
        "`range[4]` must be a valid longitude" = abs(range[4]) <= 180.0)
    # Rearrange lat/long to order expected by API
    if(range[3] < range[1])
    {
        temp <- range[1]
        range[1] <- range[3]
        range[3] <- temp
    }
    if(range[4] < range[2])
    {
        temp <- range[2]
        range[2] <- range[4]
        range[4] <- temp
    }
    # Get observations with iNat API 
    obs <- get_inat_obs(query = taxon, bounds = range)
    plot(obs$longitude, obs$latitude)
}