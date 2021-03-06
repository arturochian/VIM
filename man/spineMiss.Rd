% Generated by roxygen2 (4.0.2): do not edit by hand
\name{spineMiss}
\alias{spineMiss}
\title{Spineplot with information about missing/imputed values}
\usage{
spineMiss(x, delimiter = NULL, pos = 1, selection = c("any", "all"),
  breaks = "Sturges", right = TRUE, col = c("skyblue", "red", "skyblue4",
  "red4", "orange", "orange4"), border = NULL, main = NULL, sub = NULL,
  xlab = NULL, ylab = NULL, axes = TRUE, labels = axes,
  only.miss = TRUE, miss.labels = axes, interactive = TRUE, ...)
}
\arguments{
\item{x}{a vector, matrix or \code{data.frame}.}

\item{delimiter}{a character-vector to distinguish between variables and
imputation-indices for imputed variables (therefore, \code{x} needs to have
\code{\link{colnames}}). If given, it is used to determine the corresponding
imputation-index for any imputed variable (a logical-vector indicating which
values of the variable have been imputed). If such imputation-indices are
found, they are used for highlighting and the colors are adjusted according
to the given colors for imputed variables (see \code{col}).}

\item{pos}{a numeric value giving the index of the variable of interest.
Additional variables in \code{x} are used for highlighting.}

\item{selection}{the selection method for highlighting missing/imputed
values in multiple additional variables.  Possible values are \code{"any"}
(highlighting of missing/imputed values in \emph{any} of the additional
variables) and \code{"all"} (highlighting of missing/imputed values in
\emph{all} of the additional variables).}

\item{breaks}{if the variable of interest is numeric, \code{breaks} controls
the breakpoints (see \code{\link[graphics]{hist}} for possible values).}

\item{right}{logical; if \code{TRUE} and the variable of interest is
numeric, the spinogram cells are right-closed (left-open) intervals.}

\item{col}{a vector of length six giving the colors to be used. If only one
color is supplied, the bars are transparent and the supplied color is used
for highlighting missing/imputed values.  Else if two colors are supplied,
they are recycled.}

\item{border}{the color to be used for the border of the cells.  Use
\code{border=NA} to omit borders.}

\item{main,sub}{main and sub title.}

\item{xlab,ylab}{axis labels.}

\item{axes}{a logical indicating whether axes should be drawn on the plot.}

\item{labels}{if the variable of interest is categorical, either a logical
indicating whether labels should be plotted below each cell, or a character
vector giving the labels.  This is ignored if the variable of interest is
numeric.}

\item{only.miss}{logical; if \code{TRUE}, the missing/imputed values in the
variable of interest are also visualized by a cell in the spineplot or
spinogram.  Otherwise, a small spineplot is drawn on the right hand side
(see \sQuote{Details}).}

\item{miss.labels}{either a logical indicating whether label(s) should be
plotted below the cell(s) on the right hand side, or a character string or
vector giving the label(s) (see \sQuote{Details}).}

\item{interactive}{a logical indicating whether the variables can be
switched interactively (see \sQuote{Details}).}

\item{\dots}{further graphical parameters to be passed to
\code{\link[graphics]{title}} and \code{\link[graphics]{axis}}.}
}
\value{
a table containing the frequencies corresponding to the cells.
}
\description{
Spineplot or spinogram with highlighting of missing/imputed values in other
variables by splitting each cell into two parts.  Additionally, information
about missing/imputed values in the variable of interest is shown on the
right hand side.
}
\details{
A spineplot is created if the variable of interest is categorial and a
spinogram if it is numerical.  The horizontal axis is scaled according to
relative frequencies of the categories/classes.  If more than one variable
is supplied, the cells are split according to missingness/number of imputed
values in the additional variables.  Thus the proportion of highlighted
observations in each category/class is displayed on the vertical axis. Since
the height of each cell corresponds to the proportion of highlighted
observations, it is now possible to compare the proportions of
missing/imputed values among the different categories/classes.

If \code{only.miss=TRUE}, the missing/imputed values in the variable of
interest are also visualized by a cell in the spine plot or spinogram.  If
additional variables are supplied, this cell is again split into two parts
according to missingness/number if imputed values in the additional
variables.

Otherwise, a small spineplot that visualizes missing/imputed values in the
variable of interest is drawn on the right hand side.  The first cell
corresponds to observed values and the second cell to missing/imputed
values.  Each of the two cells is again split into two parts according to
missingness/number of imputed values in the additional variables.  Note that
this display does not make sense if only one variable is supplied, therefore
\code{only.miss} is ignored in that case.

If \code{interactive=TRUE}, clicking in the left margin of the plot results
in switching to the previous variable and clicking in the right margin
results in switching to the next variable.  Clicking anywhere else on the
graphics device quits the interactive session.
}
\note{
Some of the argument names and positions have changed with version 1.3
due to extended functionality and for more consistency with other plot
functions in \code{VIM}.  For back compatibility, the arguments
\code{xaxlabels} and \code{missaxlabels} can still be supplied to
\code{\dots{}} and are handled correctly.  Nevertheless, they are deprecated
and no longer documented.  Use \code{labels} and \code{miss.labels} instead.

The code is based on the function \code{\link[graphics]{spineplot}} by Achim
Zeileis.
}
\examples{
data(tao, package = "VIM")
data(sleep, package = "VIM")
## for missing values
spineMiss(tao[, c("Air.Temp", "Humidity")])
spineMiss(sleep[, c("Exp", "Sleep")])

## for imputed values
spineMiss(kNN(tao[, c("Air.Temp", "Humidity")]), delimiter = "_imp")
spineMiss(kNN(sleep[, c("Exp", "Sleep")]), delimiter = "_imp")
}
\author{
Andreas Alfons, Matthias Templ, modifications by Bernd Prantner
}
\references{
M. Templ, A. Alfons, P. Filzmoser (2012) Exploring incomplete
data using visualization tools.  \emph{Journal of Advances in Data Analysis
and Classification}, Online first. DOI: 10.1007/s11634-011-0102-y.
}
\seealso{
\code{\link{histMiss}}, \code{\link{barMiss}},
\code{\link{mosaicMiss}}
}
\keyword{hplot}

