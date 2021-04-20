## Problem Set 2: Trucks

Date assigned: April 20, 2021.  
Due Date: Wednesday, May 5 at midnight.

The data is in trucks.csv. It is a pull from the dataset from my paper on car markups with Paul Grieco and Ali Yurukoglu. It includes all of the "trucks" offered for sale in the U.S. from 1980 to 2018. 


```make``` Make of car (ex. Honda).  
```model``` Make and model of car (ex. Honda Accord).  
```parent``` Ultimate owner/manufactuer (ex. VW owns VW and Audi and Porsche).  
```sales``` Sales.  
```msrp``` Price.  
```curbweight``` weight of car with no passengers or cargo.  
```footprint``` width multiplied by length in square inches.  
```hp``` horsepower of car.  
```mpg``` Fuel economy rating of the car.
```marketsize``` scaled number of households in U.S.  
```yearssincedesign``` Number of years since the last styling redesign of the truck. Zero = the first year of the new design.   

The goal of the problem set it to estimate the fixed costs of redesigning a truck. Cars are redesigned roughly every 5-7 years, and this includes a change to the styling and update to mechanical components.  


### 1. Data description. 

(i) How many years pass, on average between re-design?
(ii) Present graphical reduced form evidence that redesign increases sales.
(ii) Plot the number of models and number of redesigns per year. 


### 2. Estimate demand for trucks. 

Estimate a simple logit demand for truck with the following specification for indirect utility. 

$$
u_{ijt} = X_{jt} β + αp_{jt} + ξ_{jt} + ε_{jt}
$$

where $X$ includes ```log(cubweight)```, ```log(footprint)```, ```log(hp)```, and ```yearssincedesign```, ```log(mpg)```, as well as ```make``` dummies and ```year``` dummies. You can estiamte the parameters of this model using OLS -- see Berry (1994) for details if you do not recall from IO I. (Typically, we would need to IV for price, but here the make and year dummies seem to do a decent job and getting us "reasonable" estimates of elasticities, so lets just stick with this empirical strategy.)

i. Report the coefficients in a table.  
ii. Report the average own-price elasticity of demand.  
iii. Graph average markups across time. 

### 3. Estimate a marginal cost equation

$$
log(mc_{jt}) = [Z_{jt} ξ_{jt}] γ +  ω_{jt}
$$

and also include make and year effects, like in demand. $Z$ should include everything in X except ```yearssincedesign```. 

ii. Report the results. 
i. Why do I label the error in this regression as $ω$?  

### 4. Estimate fixed costs of redesign. 

Estimate fixed costs of redesign by using the revealed preference approach a la Eizenberg (2014) and the following necessary condition

$$
\mathbb{E}π_{jt}(R_{jt}=1;X,p,R) ≥ \mathbb{E}π_{jt}(R_{jt}=0;X,p,R)
$$
where $R$ denotes the redesign status of the car and the expectation is taken over ξ and ω. 

In order to operationalize these necessary conditions, assume that counterfactual redesign decisions include delaying redesign by one year or moving redesign up by one year. Note: each time a truck gets redesigned its $R$ variable changes, but also the other $X$'s tend to have non-trival differences. 

You will need to compute expected profits from the empirical distribution of ξ and ω. Use 10 draws from the joint distribution. (In practice, this is too few. But I do not want this to be a bottleneck.)

Estimate lower and upper bounds for $\bar{F}$ for the following fixed costs specification,

$$
F_{jt} =  \bar{F} + \nu_{jt}.
$$

(i) Report your upper and lower bounds. You do not need report confidence intervals, as in Eizenberg (2014) eq. (14).  
(ii) Is the nature of selection different in this case than in the setting of Eizenberg? Why or why not?
(iii) Consider that in reality all truck manufacturers always redesigned as quickly as possible? In other words, the option to redesign 1 year earlier is not a feasible option and cannot be used to estimate $\bar{F}$. How would that change your results? Are the additional issues that arise?
