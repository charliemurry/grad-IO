---


---

<h1 id="problem-set----production-functions">Problem Set – Production Functions</h1>
<p>I posted a dataset: firms-cleaned.dta. This is data from a survey of firms in Ghana starting in the 1991. The link to the source data is: <a href="https://www.csae.ox.ac.uk/manufacturing-enterprise-surveys/regional-project-on-enterprise-development-ghana-manufacturing-enterprise-survey-rounds-i-vii-12-years-1992-2003">https://www.csae.ox.ac.uk/manufacturing-enterprise-surveys/regional-project-on-enterprise-development-ghana-manufacturing-enterprise-survey-rounds-i-vii-12-years-1992-2003</a>.</p>
<p>When using the data, please use real values (real values are indexed to 1991 in the local currency) and use the value added measurement of output.</p>
<h2 id="ols">OLS</h2>
<p><strong>(a)</strong> Estimate output elasticities, assuming a Cobb-Douglas functional form for the production function, using OLS.</p>
<p><em>Note: Typically, the constant is not estimated in this literature. In order to do this, de-mean all of the logged variables before estimation.</em></p>
<p><strong>(b)</strong> Now include fixed effects for the firm. Given the nature of the data do FEs seem appropriate. Why might FEs not take care of the endogeneity issue raised by Olley and Pakes and previous authors?</p>
<h2 id="olley-and-pakes">Olley and Pakes</h2>
<p>Estimate the output elasticities using the methodology proposed by Olley and Pakes (1996). Why might this methodology be particularly troublesome in this conext (ie, using these particular data from Ghana). [While it is probably best to estiamte the OLS and FE models in STATA/R, you should probably switch to Matlab/Julia for this and the following tasks.]</p>
<h2 id="lpacf">LP/ACF</h2>
<p>Estimate the output elasticities using the methodology proposed by Levinsohn and Petrin (2003) (ie, using materials as a proxy) but using the moments suggested by ACF.</p>
<h2 id="markups">Markups</h2>
<p>Plot the average markup as a function of time. Regress markups on export status. Given the procedure you have done so far, why might the results from regressing markups on export status be suspect?</p>
<h2 id="selection">Selection</h2>
<p>What bias might be caused by selection out of the sample? Using the data, try to show that this might or might not be a problem. How might you deal with selection out of the sample?</p>

