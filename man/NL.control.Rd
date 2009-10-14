\name{NL.control}
\alias{NL.control}

\title{Auxiliary for Controlling non linear GAMLSS Fitting}
\description{
This ia an auxiliary function  used to control the iterations  for \code{nlgamlss} fitting. Typically
     only used when calling \code{nlgamlss} function with the option \code{control}. 
     Since the \code{nlgamlss} uses \code{nlm} for fitting all of the \code{NL.control} argument are passed to 
     \code{nlm}.  
}
\usage{
NL.control(fscale = 1,  typsize = NULL, stepmax = NULL, iterlim = 100, 
           ndigit = 10, steptol = 1e-05, 
           gradtol = 1e-05, print.level = 0, check.analyticals = TRUE, 
           hessian = TRUE)
}
\arguments{
  \item{fscale}{an estimate of the size of log-likelihood at the minimum with default equal 1.}
  \item{typsize}{this argument is passed to \code{nlm} and it is an estimate of the size of each
                 parameter at the minimum. If its value is  NULL (the default value) 
                 the \code{typsize}is set within the \code{nlgamlss} function to \code{typsize=abs(p0)} 
                 where \code{p0} is the vector containing the starting values
                 of all the parameters to be maximized. \code{p0} is defined within \code{nlgamlss}}
\item{stepmax}{this argument is passed to \code{nlm} and it is  a positive scalar which
                gives the maximum allowable scaled step length. 
                \code{stepmax} is used to prevent steps which would cause the optimization
                function to overflow, to prevent the algorithm from leaving the area of interest in parameter
                space, or to detect divergence in the algorithm. \code{stepmax} would be chosen small enough
                to prevent the first two of these occurrences, but should be larger than any anticipated
                reasonable step. If its value is  NULL (the default value) it is defined within \code{nlgamlss} as
                \code{stepmax=sqrt(p0 \%*\% p0)}}
  \item{iterlim}{a positive integer specifying the maximum number of
          iterations to be performed before the program is terminated. The default is 100}
  \item{ndigit}{the number of significant digits in the log-likelihood function. The default is 10}
  \item{steptol}{ A positive scalar providing the minimum allowable relative
          step length. The defaults is 1e-05}
  \item{gradtol}{a positive scalar giving the tolerance at which the scaled
          gradient is considered close enough to zero to terminate the
          algorithm.  The scaled gradient is a measure of the relative
          change in log-likelihood in each direction 'p[i]' divided by the
          relative change in 'p[i]'. The default is 1e-05}
  \item{print.level}{this argument determines the level of printing which is
          done during the minimization process.  The default value of
          '0' means that no printing occurs, a value of '1' means that
          initial and final details are printed and a value of 2 means
          that full tracing information is printed.}
  \item{check.analyticals}{ a logical scalar specifying whether the analytic
          gradients and Hessians, if they are supplied, should be
          checked against numerical derivatives at the initial
          parameter values. This can help detect incorrectly formulated
          gradients or Hessians.}
  \item{hessian}{if \code{TRUE}, the hessian of the log likelihood at the maximum is returned ,the default is \code{hessian=TRUE} }
}
\details{See the R function \code{nlm} and the fist two refernces below for details of the algotithm. }
\value{
  A list with the arguments as components.
}
\references{
     Dennis, J. E. and Schnabel, R. B. (1983) \emph{Numerical Methods for
     Unconstrained Optimization and Nonlinear Equations.}
     Prentice-Hall, Englewood Cliffs, NJ.

     Schnabel, R. B., Koontz, J. E. and Weiss, B. E. (1985) A modular
     system of algorithms for unconstrained minimization. \emph{ACM Trans.
     Math. Software}, \bold{11}, 419-440.

Rigby, R. A. and  Stasinopoulos D. M. (2005). Generalized additive models for location, scale and shape,(with discussion), 
\emph{Appl. Statist.}, \bold{54}, part 3, pp 507-554.

Stasinopoulos D. M., Rigby R.A. and Akantziliotou C. (2003) Instructions on how to use the GAMLSS package in R.
Accompanying documentation in the current GAMLSS  help files, (see also  \url{http://www.gamlss.com/}).
}
\author{Mikis Stasinopoulos \email{d.stasinopoulos@londonmet.ac.uk}, Bob Rigby \email{r.rigby@londonmet.ac.uk}  }
\note{ This functions supports the function \code{nlgamlss} 
}
\seealso{\code{\link{nlgamlss}}, \code{\link{nlm}}}
\keyword{regression}
