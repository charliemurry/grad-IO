

# Problem Set -- Production Functions

I posted a dataset: firms-cleaned.dta. This is data from a survey of firms in Ghana starting in the 1991. An observation is a __firm-year__. 

When using the data, please use real values (real values are indexed to 1991 in the local currency) and use the value added measurement of output (variable already created), which is the value output minus the cost of materials.


## OLS 
__(a)__ Estimate output elasticities, assuming a Cobb-Douglas functional form for the production function, using OLS. 

*Note: Typically, the constant is not estimated in this literature. In order to do this, de-mean all of the logged variables before estimation.*

__(b)__ Now include fixed effects for the firm. Given the nature of the data do FEs seem appropriate. Why might FEs not take care of the endogeneity issue raised by Olley and Pakes and previous authors?

## Olley and Pakes
Estimate the output elasticities using the methodology proposed by Olley and Pakes (1996). Why might this methodology be particularly troublesome in this conext (ie, using these particular data from Ghana). [While it is probably best to estiamte the OLS and FE models in STATA/R, you should probably switch to Matlab/Julia for this and the following tasks.]

## LP

Estimate the output elasticities using the methodology proposed by Levinsohn and Petrin (2003). 

## ACF
Estimate the output elasticities using the methodology proposed by ACF. 

## Markups
Plot the average markup as a function of time. Regress markups on export status. Given the procedure you have done so far, why might the results from regressing markups on export status be suspect?

## Selection
What bias might be caused by selection out of the sample? Using the data, try to show that this might or might not be a problem. How might you deal with selection out of the sample?  

<!--stackedit_data:
eyJoaXN0b3J5IjpbLTMxMDc2NjUxN119
-->