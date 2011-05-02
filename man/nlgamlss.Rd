\name{nlgamlss}
\alias{nlgamlss}

\title{Fitting non linear Generalized Additive Models for Location Scale and Shape (GAMLSS)}

\description{ This function is an additional method for fitting GAMLSS models. It suitable to fit
linear or non linear parametric models using distributions available in the GAMLSS package.
It is based on the function  \code{stablereg()} of the R package \code{stable} created by 
Philippe Lambert and Jim Lindsey which can be found in Jim Lindsey's web page 
\url{http://popgen.unimaas.nl/~jlindsey/index.html} (see also Lambert, P. and Lindsey, J.K. (1999)).
The method is very general but requires starting values for all the parameters. For parametric models it can also
be used to give the exact (that is taking into the account the correlation between the distributional parameters) asymptotic standard errors.  
}
\usage{
nlgamlss(y = NULL, mu.formula = ~1, sigma.formula = ~1, 
         nu.formula = ~1, tau.formula = ~1, 
         mu.fix = FALSE, sigma.fix = FALSE, 
         nu.fix = FALSE, tau.fix = FALSE, all.fix = FALSE, 
         mu.start = NULL, sigma.start = NULL, 
         nu.start = NULL, tau.start = NULL, 
         family = NO(), weights = 1, 
         exact = FALSE, delta = 1, 
         data = parent.frame(), 
         control = NL.control(), 
         llik.output = FALSE)
}

\arguments{
 \item{y}{the response variable \code{y}. Note the difference between \code{gamlss} and \code{nlgamss} in declaring the \code{y} variable
           In \code{gamlss}, \code{y~x} is used for modelling the location parameters while here you need \code{y=y} and \code{mu.fo=x} }
 \item{mu.formula}{a formula object for fitting a model to the location mu parameter, e.g. \code{mu.fo=~x}
     The \code{mu.formula} is a linear or nonlinear language expression
     beginning with \code{~} or an R function, describing the regression function for the predictor of the location parameter
     (i.e. after transformation of \code{mu} by its link function). \code{mu.start} is a vector of initial conditions for the parameters
     in the regression for this parameter. \code{mu.fix} is a boolean indicating if an optimization of the likelihood has to be carried
     out on these parameters. If no optimization is desired on the location parameters \code{mu}, i.e. when the likelihood has to
      be evaluated or optimized at a fixed location, then \code{mu.fix=TRUE} has to be explicitly specified with \code{mu.start} indicating 
      the fixed value for the predictor of \code{mu}.}               
 \item{sigma.formula}{a formula object for fitting a model to the sigma parameter, as in the \code{mu.formula} above,
         e.g.  \code{sigma.formula=~x1+x2}. It can be abbreviated to \code{sigma.fo=~x1+x2}.  }
 \item{nu.formula}{a formula object for fitting a model to the nu parameter, e.g. \code{nu.fo=~x} }
 \item{tau.formula}{a formula object for fitting a model to the tau parameter, e.g. \code{tau.fo=~x}}
 \item{mu.fix}{whether the mu parameter should be kept fixed in the fitting processes e.g. \code{mu.fix=FALSE} }
 \item{sigma.fix}{whether the sigma parameter should be kept fixed in the fitting processes e.g. \code{sigma.fix=FALSE}}
 \item{nu.fix}{whether the nu parameter should be kept fixed in the fitting processes e.g. \code{nu.fix=FALSE}}
 \item{tau.fix}{whether the tau parameter should be kept fixed in the fitting processes e.g. \code{tau.fix=FALSE}}
 \item{all.fix}{whether all the parameters should be fixed at their starting values. This is a way of evaluating the likelihood function}
 \item{mu.start}{vector or scalar of initial values for the location parameter mu e.g.  \code{mu.start=4} } 
 \item{sigma.start}{vector or scalar of initial values for the scale parameter sigma e.g. \code{sigma.start=1}  }
 \item{nu.start}{vector or scalar of initial values for the parameter nu e.g. \code{nu.start=3}}
 \item{tau.start}{vector or scalar of initial values for the location parameter tau e.g. \code{tau.start=2} }   
 \item{family}{the distribution family of the gamlss object (see \code{\link[gamlss.dist]{gamlss.family}})}
 \item{weights}{a vector of weights. Here weights can be used to weight out observations (like in \code{subset})
                 or for a weighted likelihood analysis where the contribution of the observations to the
                 likelihood differs according to \code{weights}.
                The length of \code{weights} must be the same as the number of observations in the data.
                 By default, the weight is set to one.
                 To set  weights to vector w use \code{weights=w} }
 \item{exact}{If TRUE, fits the exact likelihood function for continuous data by integration over y observation intervals usually determined by the rounding used in the measurement of y, see \code{delta} below }
 \item{delta}{Scalar or vector giving the unit of measurement for each response value, set to unity by default.
               For example, if a response is measured to two decimals, delta=0.01. If the response is transformed,
               this must be multiplied by the Jacobian. For example, with a log transformation, delta=1/y.
               The transformation cannot contain unknown parameters. The delta values are used only if \code{exact=TRUE} }
 \item{data}{a data frame containing the variables occurring in the formula.
               If this is missing, the variables should be on the search list.
              e.g. \code{data=aids} }
\item{control}{this sets the control parameters for the \code{nlm()} iterations algorithm.
               The default setting is the \code{NL.control} function }
\item{llik.output}{is TRUE when the likelihood has to be displayed at each iteration of the optimization }
                
}


\value{
  
  Returns a nlgamlss object with components
  \item{family}{the distribution family of the nlgamlss object (see \code{\link[gamlss.dist]{gamlss.family}})}
  \item{parameters }{the name of the fitted parameters i.e. \bold{\code{mu}}, \bold{\code{sigma}}, \bold{\code{nu}}, \bold{\code{tau}} }
  \item{call}{the call of the nlgamlss function}
  \item{y}{the response variable}
  \item{control}{the nlgamlss fit control settings}
  \item{weights}{the vector of weights}
  \item{G.deviance}{the global deviance}
  \item{N}{the number of observations in the fit}
  \item{rqres}{a function to calculate the normalized (randomized) quantile residuals of the object}
  \item{iter}{the number of external iterations in the fitting process}
  \item{type}{the type of the distribution or the response variable (continuous , discrete or mixture)}
  \item{method}{which algorithm is used for the fit, JL() in this case}
  \item{aic}{the Akaike information criterion }
  \item{sbc}{the Schwatz Bayesian information criterion }
  \item{df.residual}{the residual degrees of freedom left after the model is fitted}
  \item{df.fit}{the total degrees of freedom use by the model}
  \item{converged}{whether the model fitting has have converged as in \code{nlm()}}
  \item{iter}{the number of iterations as in \code{nlm()}}
  \item{residuals}{the normalized (randomized) quantile residuals of the model}
  \item{coefficients}{all the fitted coefficients of the model}
  \item{se}{the standard errors of all the fitted coefficients of the model}
  \item{cov}{the covariance matrix of all the fitted coefficients of the model}
  \item{corr}{the correlation matrix of all the fitted coefficients of the model}
  \item{mu.fv}{the fitted values of the mu model, also  sigma.fv, nu.fv, tau.fv for the other parameters if present}
  \item{mu.lp}{the linear predictor of the mu model, also  sigma.lp, nu.lp, tau.lp for the other parameters if present}
  \item{mu.link}{the link function for the mu model, also  sigma.link, nu.link, tau.link for the other parameters if present}
  \item{mu.formula}{the formula for the mu model, also  sigma.formula, nu.formula, tau.formula for the other parameters if present}
  \item{mu.coefficients}{the estimated coefficients of the mu model, also  sigma.coefficients, nu.coefficients, tau.coefficients for the other parameters if present }
  \item{mu.coefficients}{the standard errors of the coefficients of the mu model, also  sigma.coefficients, nu.coefficients, tau.coefficients for the other parameters if present }
  \item{mu.df}{the mu degrees of freedom also  sigma.df, nu.df, tau.df for the other parameters if present}
  
}
\references{
 \url{http://popgen.unimaas.nl/~jlindsey/index.html} : Jim Lindsey web page

Lambert, P. and Lindsey, J.K. (1999) Analysing financial returns using regression models based on non-symmetric 
 stable distributions. \emph{Applied Statistics} \bold{48}, 409-424.

Rigby, R. A. and  Stasinopoulos D. M. (2005). Generalized additive models for location, scale and shape,(with discussion), 
\emph{Appl. Statist.}, \bold{54}, part 3, pp 507-554.

Rigby, R.A. Stasinopoulos, D.M. (2006).  Using the Box-Cox \emph{t} distribution in GAMLSS to mode skewnees and  and kurtosis.
to appear in \emph{Statistical Modelling}.

Stasinopoulos D. M., Rigby R.A. and Akantziliotou C. (2006) Instructions on how to use the GAMLSS package in R.
Accompanying documentation in the current GAMLSS  help files, (see also  \url{http://www.gamlss.com/}). }

\author{ Mikis Stasinopoulos \email{d.stasinopoulos@londonmet.ac.uk}, Bob Rigby \email{r.rigby@londonmet.ac.uk}}

\note{ The following generic functions can be used with a GAMLSS object: \code{print},  \code{fitted},  \code{coef},  
          \code{residuals}, \code{update},  \code{plot}, \code{deviance}, \code{formula}  }
\seealso{\code{\link[gamlss]{gamlss}}, \code{\link[gamlss.dist]{gamlss.family}} }
\examples{
data(la)
# fitting a BCPE distribtion to the data
modBCPE<- nlgamlss(y=PET60, mu.fo=~bflow*(1-(1-exp(p1))*exp(-p2/bflow)),
                   sigma.formula=~1,  mu.start = c(-.9, 90), 
                   sigma.start= -2.3, nu.start=0, tau.start=log(2.5),  
                   family=BCPE, data=la)
modBCPE
plot(modBCPE)
}
\keyword{regression}% at least one, from doc/KEYWORDS
