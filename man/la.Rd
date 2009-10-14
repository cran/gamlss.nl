\name{la}
\alias{la}
\docType{data}
\title{The blood flow dataset.}
\description{The blood flow dataset.}
\usage{data(la)}

\format{
  A data frame with 251 observations on the following 4 variables.
  \describe{
    \item{\code{bflow}}{the blood flow measured invasively using radioactively labelled micro-spheres}
    \item{\code{PET60}}{is the blood flow measured non-invasively by positron emission tomography using a scan
          up to 60 seconds}
    \item{\code{PETother}}{?}
    \item{\code{PET510}}{is the blood flow measured non-invasively by positron emission tomography using a scan
          up to 510 seconds}
  }
}
\details{ The blood flow data were analyzed by Lange \emph{et al.} (1989), Jones and Faddy (2003) and Rigby and Stasinopoulos (2006). 
As response variables y the variables PET60, PETother, PET510
can be used representing  blood flow
measured non-invasively by positron emission tomography using a scan
up to 60 seconds (PET60) or 510 second (PET510) respectively.  The explanatory variable x is the blood
flow measured invasively using radioactively labelled micro-spheres.
The distribution of y has previously been modelled by a normal (NO) and a  \emph{t} family
distribution (TF), Lange \emph{et al.} (1989), and by a skew \emph{t}
distribution (ST), Jones and Faddy (2003) and by Rigby and Stasinopoulos (2006) using several three and four parameter distributions, 
including the Box-Cox power exponential (BCPE), Rigby and Stasinopoulos (2004) and the Box-Cox t diastribution (BCT) . 

}

\references{
Jones, M. C. and Faddy, M. J. (2003). A skew extension of the t
distribution, with applications. \emph{J. Roy. Statist.} Soc B, \bold{65}, 159-174.

Lange, K. L., Little, R. J. A. and Taylor, J. M. G. (1989).
Robust statistical modelling using the t distribution. \emph{J. Am. Statist.
Ass.}, \bold{84}, 881-896. 

Rigby, R.A. Stasinopoulos, D.M. (2006).  Using the Box-Cox \emph{t} distribution in GAMLSS to mode skewnees and  and kurtosis.
to appear in \emph{Statistical Modelling}.
}
\examples{
data(la)
plot(PET60~bflow,data=la)
}
\keyword{datasets}
