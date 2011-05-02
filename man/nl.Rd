\name{nl}
\alias{nl}
\alias{gamlss.nl}
\alias{nl.obj}


\title{Functions to fit nonlinear additive models in GAMLSS}
\description{
The function \code{nl.obs} generate a nonlinear object which can be used to fit a nonlinear additive model within the gamlss algorithm.
The function \code{nl} takes the nonlinear object created by \code{nl.obs} and returns it with several attributes which  are used  
in the function  \code{\link{gamlss.nl}()} which is doing the actual fitting within the backfitting  function 
\code{additive.fit}. The actual fit is done by the \R function \code{nlm}.  The  function \code{\link{gamlss.nl}()} is never used on its own).
}
\usage{
nl.obj(formula, start, data)
nl(obj)
gamlss.nl(x, y, w,  xeval = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{formula}{ a non linear formula or function }
  \item{start}{starting values for the parameters in the \code{formula}  }
  \item{data}{data where the formula can be interpreted }
  \item{obj}{a non linear object created by \code{nl.obj}}
  \item{x}{the nl object from \code{nl}}
  \item{y}{iterative y variable }
  \item{w}{iterative weights}
   \item{xeval}{used in prediction if implemented}
  
}
\details{
 The function \code{gamlss.nl()} is an internal function of GAMLSS allowing the use of  
the \code{nlm} function to be used within the backfitting cycle of \code{gamlss}, and should be not used on its own.  
}
\value{
 The function \code{nl.obs} returns a non linear object by using the Jim Lindsey's function \code{finterp}
 found in the R package \code{rmutil}.  
  
 The function \code{nl} returns a vector with values zero to be included in the design matrix but with attributes useful in the fitting 
  the non linear model.  
}
\references{
\url{http://popgen.unimaas.nl/~jlindsey/index.html}: Jim Lindsey web page 

Rigby, R. A. and  Stasinopoulos D. M. (2005). Generalized additive models for location, scale and shape,(with discussion), 
\emph{Appl. Statist.}, \bold{54}, part 3, pp 507-554.
                   
Stasinopoulos D. M., Rigby R.A. and Akantziliotou C. (2003) Instructions on how to use the GAMLSS package in R.
Accompanying documentation in the current GAMLSS  help files, (see also  \url{http://www.gamlss.com/}).}

\author{Mikis Stasinopoulos \email{d.stasinopoulos@londonmet.ac.uk}, Bob Rigby \email{b.rigby@londonmet.ac.uk }}

\seealso{ \code{\link{nlgamlss}}}
\examples{
data(la)
nlo<-nl.obj(formula=~bflow*(1-(1-exp(p1))*exp(-p2/bflow)), start=c(-.9, 90), data=la)
mod1<-gamlss(PET60~nl(nlo)-1, data=la ) 
}
\keyword{regression}%

