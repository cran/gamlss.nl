\name{gamlss-nl-package}
\alias{gamlss-nl-package}
\alias{gamlss-nl}
\docType{package}
\title{The GAMLSS add on package for fiting parametric non linear models
}
\description{
The main purpose of this package is to allow non-linear fitting within a GAMLSS model.
 The main function \code{nlgamlss()} can fit any parametric
            (up to four distribution parameters) GAMLSS family of distributions.
}
\details{
\tabular{ll}{
Package: \tab gamlss-nl\cr
Type: \tab Package\cr
Version: \tab 1.5.0 \cr
Date: \tab 2005-12-12\cr
License: \tab GPL (version 2 or later) \cr
}

}
\author{

Mikis Stasinopoulos <d.stasinopoulos@londonmet.ac.uk>, Bob Rigby <r.rigby@londonmet.ac.uk> based on work 
        of Jim Lindsey and Philippe Lambert.
}
\references{
Rigby, R. A. and  Stasinopoulos D. M. (2005). Generalized additive models for location, scale and shape,
(with discussion), \emph{Appl. Statist.}, \bold{54}, part 3, pp 507-554.

Stasinopoulos D. M., Rigby R.A. and Akantziliotou C. (2003) Instructions on how to use the GAMLSS package in R.
Accompanying documentation in the current GAMLSS  help files, (see also  \url{http://www.gamlss.com/}).
}
\keyword{ package }

\seealso{\code{\link[gamlss]{gamlss}}} 

\examples{
data(la)
# fitting the Johnson's Su distribtion to the data
modJSU   <- nlgamlss(y=PET60, mu.fo= ~bflow*(1-p1*exp(-p2/bflow)), sigma.formula=~1, 
                       nu.fo=~1, mu.start = c(.6, 110), sigma.start= 3, nu.start=1, 
                       tau.start=0.6, family=JSU, data=la) 
plot(modJSU)
summary(modJSU)
vcov(modJSU)
}
