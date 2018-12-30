# Problem Set – Production Functions

I posted a dataset: firms-cleaned.dta. This is data from a survey of firms in Ghana starting in the 1991. An observation is a  **firm-year**.

When using the data, please use real values (real values are indexed to 1991 in the local currency) and use the value added measurement of output (variable already created), which is the value output minus the cost of materials.

## OLS

**(a)**  Estimate output elasticities, assuming a Cobb-Douglas functional form for the production function, using OLS.

_Note: Typically, the constant is not estimated in this literature. In order to do this, de-mean all of the logged variables before estimation._

**(b)**  Now include fixed effects for the firm. Given the nature of the data do FEs seem appropriate. Why might FEs not take care of the endogeneity issue raised by Olley and Pakes and previous authors?

## Olley and Pakes

Estimate the output elasticities using the methodology proposed by Olley and Pakes (1996). Why might this methodology be particularly troublesome in this conext (ie, using these particular data from Ghana). [While it is probably best to estiamte the OLS and FE models in STATA/R, you should probably switch to Matlab/Julia for this and the following tasks.]

## LP/ACF

Estimate the output elasticities using the methodology proposed by Levinsohn and Petrin (2003) (ie, using materials as a proxy) but using the moments suggested by ACF.

## Dynamic Panel
Another way to think about the endogeneity of TFP is to decompose TFP into two shocks like usual, $\omega_{it} + \epsilon_{it}$, and then put structure on $\omega$. 

One solution comes from the econometrics literature on dynamic panels: see Arrellano and Bond (1991, Restud). Suppose $\omega$ follows an AR(1) process: $\omega_{it} = \rho \omega_{i,t-1} + \xi_{it}. 
* $\epsilon$ is exogenous
* 

## Markups

Plot the average markup as a function of time. Regress markups on export status. Given the procedure you have done so far, why might the results from regressing markups on export status be suspect?

## Selection

What bias might be caused by selection out of the sample? Using the data, try to show that this might or might not be a problem. How might you deal with selection out of the sample?

<!--stackedit_data:
eyJoaXN0b3J5IjpbLTUxODAyNTk3MV19
-->