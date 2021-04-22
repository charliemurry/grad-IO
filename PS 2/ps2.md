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

Eizenberg(2014) uses a revealed preference approach to estimate fixed cost bounds. The idea is that given every other choice (by all other firms in period t and in all other periods), a parent firm has no profitable single deviation. In this section we will use the same approach to estimate fixed cost bounds for redesigning a truck.  

If a firm chooses to redesign a truck j in year t, the following necessary condition must hold:

$$
\mathbb{E}π_{jt}(R_{jt}=0;X,p,R_{-jt}, \gamma, \alpha, \beta)  \geq \mathbb{E}π_{jt}(R_{jt}=1;X,p,R_{-jt},  \gamma, \alpha, \beta) - F_{jt}
$$

$R_{jt}$ is the decision to redesign truck j at time t, and $R_{-jt}$ has the redesign decisions for all other products.  The expectation is over the $\xi$ and $\omega$ distributions, which we estimated in sections 2 and 3.

If truck $j$ from firm $f$ is redesigned in year $t$, estimate $\bar{F}_{jt}$ in the following steps:  

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
$$  

Note that there is a selection problem, i.e. conditional on observed decisions, $E(\nu_{jt}) \neq 0$. Because of this, you cannot use the mean of estimated $\bar{F}_{jt}$s to estimate $\bar{F}$, and the mean of estimated $\underline{F}_{jt}$s to estimate $\underline{F}$. Solve this selection problem as in Eizenberg(2014) to estimate $\bar{F}$ and $\underline{F}$.

(i) Report your upper and lower bounds. You do not need report confidence intervals, as in Eizenberg (2014) eq. (14). 

(ii) Is the nature of selection different in this case than in the setting of Eizenberg? Why or why not?

(iii) Consider that in reality all truck manufacturers always redesigned as quickly as possible? In other words, the option to redesign 1 year earlier is not a feasible option and cannot be used to estimate $\bar{F}$. How would that change your results? Are the additional issues that arise?
