* Clean the car data
clear

import delimited data_blp.csv

keep if truck == 1

gen marketsize = number_households/2.5 - 10000000

keep model parent sales msrp mpg curbweight footprint hp usbrand lag_pl_con marketsize year make steel_weight nafta_d nafta_t


gen shares = sales / marketsize
bysort year: egen insideshare = total(shares)
gen outsideshare = 1-insideshare

gen y = log(shares) - log(outsideshare)

foreach var of varlist mpg curbweight footprint hp {
  gen log_`var' = log(`var')
}


egen makenum = group(make)
egen modelnum = group(model)

reg y msrp log_mpg log_curbweight log_footprint log_hp i.year i.makenum 
gen  ELAS = _b[msrp]*(1-shares)*msrp
tabstat ELAS, s(mean median min max) save

// ivreg2 y (msrp = nafta_d) log_mpg log_curbweight log_footprint log_hp i.year i.makenum, first


STOP
keep make model parent sales msrp mpg curbweight footprint hp usbrand marketsize year make nafta_d nafta_t
export delimited using trucks.csv, replace
