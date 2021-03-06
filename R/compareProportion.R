#' Compare proportions between 2 groups
#' 
#' A function to facilitate 2 group permutation tests for a categorical outcome variable
#' 
#' @rdname compareProportion
#' @param formula a formula 
#' @param data a data frame in which \code{x} is evaluated if \code{x} is a
#' formula.
#' @param \dots other arguments
#' @return the difference in proportions between the second and first group
#' @seealso \code{\link{do}}, \code{\link{compareMean}} and \code{\link{shuffle}}
#' @keywords iteration
#' @keywords stats
#' @export
#' @examples
#' data(HELPrct)
#' # calculate the observed difference
#' mean(homeless=="housed" ~ sex, data=HELPrct)
#' obs <- compareProportion(homeless=="housed" ~ sex, data=HELPrct); obs
#' # calculate the permutation distribution
#' nulldist <- do(100) * compareProportion(homeless=="housed" ~ shuffle(sex), data=HELPrct)
#' xhistogram(~ result, groups=(result >= obs), nulldist, 
#'   xlab="difference in proportions")
compareProportion = function(formula, data=NULL, ...) {
  means = mean( formula, data=data, ... )
  if (length(means) != 2) {
  	stop("number of levels for grouping variable must be 2\n")
  }
  names(means) <- NULL
  return(diff(means))
}
