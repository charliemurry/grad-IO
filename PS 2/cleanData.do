* Clean the car data
clear

import delimited data_blp.csv

keep if truck == 1

gen marketsize = number_households/2.5 - 10000000

keep model parent sales msrp mpg curbweight footprint hp usbrand lag_pl_con marketsize year make steel_weight nafta_d nafta_t yearssincedesign releaseyear


gen shares = sales / marketsize
bysort year: egen insideshare = total(shares)
gen outsideshare = 1-insideshare

gen y = log(shares) - log(outsideshare)

foreach var of varlist mpg curbweight footprint hp {
  gen log_`var' = log(`var')
}

gen designyear = (yearssincedesign==0 & releaseyear!=1)

egen makenum = group(make)
egen modelnum = group(model)

reg y msrp log_mpg log_curbweight log_footprint log_hp yearssincedesign i.year i.makenum
gen  ELAS = _b[msrp]*(1-shares)*msrp
tabstat ELAS, s(mean median min max) save 


reg y msrp log_mpg log_curbweight log_footprint log_hp designyear i.year i.makenum 

STOP
keep make model parent sales msrp mpg curbweight footprint hp marketsize year yearssincedesign releaseyear

STOP

// label var make "Make of car (ex. Honda)"
// label var model "Make and model of car (ex. Honda Accord)"
// label var parent "Ultimate owner/manufactuer (ex. VW owns VW and Audi and Porsche)"
// label var 


export delimited using trucks.csv, replace
