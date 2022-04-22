---
title: "Problem Set - 2"
output: pdf_document
---

## Problem Set 3: Endogenous Trucks

Date assigned: April 19, 2022.  
Date due: May 5, 2022.

The data is in trucks.csv. It is a slice from the dataset from the paper ```The Evolution of Market Power in the U.S. Automobile Industry``` by Paul Grieco, Charlie Murry, and Ali Yurukoglu. It includes all of the "trucks" offered for sale in the U.S. from 1980 to 2018. 


```make``` Make of car (ex. Honda).\
```model``` Make and model of car (ex. Honda Accord).\
```parent``` Ultimate owner/manufacturer (ex. VW owns VW and Audi and Porsche).\
```sales``` Sales.\
```msrp``` Price.  
```curbweight``` weight of car with no passengers or cargo.  
```footprint``` width multiplied by length in square inches.  
```hp``` horsepower of car.  
```mpg``` Fuel economy rating of the car.\
```marketsize``` scaled number of households in U.S.  
```yearssincedesign``` Number of years since the last styling redesign of the truck. Zero = the first year of the new design.   

The goal of the problem set it to estimate the fixed costs of redesigning a truck. In practice, vehicles are redesigned roughly every 5-7 years, and this includes a change to the styling and update to mechanical components.  


### 1. Descriptive Statistics. 

(i) How many years pass, on average, between re-design?\
(ii) Present graphical reduced form evidence that redesign increases sales (or doesn't).\
(iii) Plot the number of models and number of redesigns per year. 


### 2. Estimate demand for trucks. 

Estimate a simple logit demand for truck with the following specification for indirect utility. 

$$
u_{ijt} = X_{jt} β + αp_{jt} + ξ_{jt} + ε_{jt}
$$

where $X$ includes ```log(cubweight)```, ```log(footprint)```, ```log(hp)```, ```yearssincedesign```, ```log(mpg)```, as well as ```make``` and ```year``` dummies. Assume that $ε_{jt}$ is T1EV. You can estimate the parameters of this model using OLS -- see Berry (1994) for details if you do not recall from IO I. (Typically, we would need to instrument for price, but here the make and year dummies seem to do a decent job in getting us "reasonable" estimates of elasticities, so lets just stick with this empirical strategy.)

i. Report the coefficients in a table.  
ii. Report the average own-price elasticity of demand.  
iii. Graph average markups across time. 

### 3. Estimate a marginal cost equation

$$
log(mc_{jt}) = Z_{jt} γ +  ω_{jt}
$$

and also include make and year fixed effects, like in demand. $Z$ should include everything in X except ```yearssincedesign```. 

i. Report the results. 

### 4. Estimate fixed costs of redesign. 

Eizenberg (2014) uses a revealed preference approach to estimate fixed cost bounds. 
<!-- The idea is that given every other choice (by all other firms in period t and in all other periods), a parent firm has no profitable single deviation.  -->
In this section we will use the same approach to estimate fixed cost bounds for redesigning a truck.  

If a firm chooses to redesign a truck $j$ in year $t$, the following necessary condition must hold:

$$
\mathbb{E}π_{jt}(R_{jt}=0;X,p,R_{-jt}, \gamma, \alpha, \beta)  \leq \mathbb{E}π_{jt}(R_{jt}=1;X,p,R_{-jt},  \gamma, \alpha, \beta) - F_{jt}
$$

$R_{jt}$ is the decision to redesign truck j at time t, and $R_{-jt}$ has the redesign decisions for all other products.  The expectation is over the $\xi$ and $\omega$ distributions, which we estimated in sections 2 and 3.

Use the following specification for fixed costs, which is analogous to Eizenberg's specification.

$$
F_{jt} = F^{f} + \nu_{jt}
$$
where $f$ is the parent firm.\
Some suggestions. 

1. Don't use too many draws of $\xi$ and $\omega$ when computing expectations.
2. Make sure you recompute pricing equilibrium for deviations. 
3. Use deviations that involve a single year. For example, 
   1. If a truck was redesigned in 2014, use redesign in 2013 or 2015 as a deviation.[^1]  
   2. If a truck was not redesigned in 2014, use redesign in 2014 without change in product characteristic as a deviation.



[^1]: Note that, while considering redesign in 2013, you would be changing only the ```yearssincedesign``` variable in 2014 from 0 to 1 and not any other $X$s. While considering redesign in 2015, you would be changing ```yearssincedesign``` in 2014 from 0 to `yearssincedesign`_2013 + 1. You would also be changing other $X$s to the ones in 2013, that is, $X_2014 = X_2013.

<!-- If truck $j$ from firm $f$ is redesigned in year $t$, estimate $\bar{F}_{jt}$ in the following steps:  

   1. Take a random draw from the estimated vector of ($\xi_{jt}$, $\omega_{jt}$).  
   2. For this draw, estimate variable profits for firm $f$ in year $t$ at the observed equilibrium (i.e. the observed redesign decisions).  
   3. Keeping the redesign decisions for all other trucks constant, set the redesign decision for truck $j$ to 0, and use the pricing FOCs to re-estimate the shares and pricing equilibrium. Note: each time a truck gets redesigned its $R$ variable changes, but also the other $X$'s tend to have non-trival differences.   
   4. Calculate profits at the equilibrium in step 3.  
   5. Calculate the difference between estimated variable profits in 2 and 3. Let's call this $F^i_{jt}$.  


Repeat the above steps for 10 draws of $\xi_{jt}$ and $\omega_{jt}$ (In practice, this is too few. But I do not want this to be a bottleneck). Calculate $F_{jt} = 1/10(\sum_i F^i_{jt})$.

Similarly, estimate $\underline{F_{jt}}$ when a firm did not choose to redesign its truck $j$ year $t$, $\textbf{but did so in t+1}$, i.e. the counterfactual decision is to move the redesign decision up by one year. For example, estimate $\underline{F_{jt}}$ for 2014 if a firm chose to redesign truck $j$ in 2015.  

Our goal is to estimate lower and upper bounds for F for the following fixed costs specification:
$$
F_{jt} =  F + \nu_{jt}
$$   -->

Note that there is a selection problem, i.e. conditional on observed decisions, $E(\nu_{jt}) \neq 0$. Because of this, you cannot use the mean of estimated $\bar F_{jt}$ to estimate $\bar{F}$, and the mean of estimated $\underline{F}_{jt}$ to estimate $\underline{F}$. Solve this selection problem as in Eizenberg (2014) to estimate $\bar{F}$ and $\underline{F}$. 

(i) Report your upper and lower bounds. You do not need report confidence intervals, as in Eizenberg (2014) eq. (14). 

(ii) Is the nature of selection different in this case than in the setting of Eizenberg? Why or why not? How different do the bounds look if you don't account for selection at all?

(iii) Consider that in reality all truck manufacturers always redesigned as quickly as possible? In other words, the option to redesign 1 year earlier is not a feasible option and cannot be used to estimate $\bar{F}$. How would that change your results? Are there additional issues that arise?

(iv) Without recomputing anything, explain how your results would change if there was a large random coefficient on the dummy variable for ```U.S. Brand```?


<script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
<script type="text/x-mathjax-config"> MathJax.Hub.Config({ tex2jax: {inlineMath: [['$', '$']]}, messageStyle: "none" });</script>
