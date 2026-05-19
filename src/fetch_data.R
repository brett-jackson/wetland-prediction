library(rinat)

get_observations <- function(taxon, range)
{
    #
    # Validate inputs
    #
    if (is.vector((range))) {
        if (length(range) > 4) {
            warning(sprintf("Execessive elements for `range` in get_observations: expected 4, got %d", length(range)))
        }
        else if (length(range) < 4)
        {
            stop(sprintf("Insufficient elements for `range` in get_observations: expected 4, got %d", length(range)))
        }
    }
}