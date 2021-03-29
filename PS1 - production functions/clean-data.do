*--------------------------------------------------
* Clean African manufacturing data
* clean-data.do
* 12/24/2018
* Charlie Murry (BC)
*--------------------------------------------------

*--------------------------------------------------
* Program Setup
*--------------------------------------------------
version 15              // Set Version number for backward compatibility
set more off            // Disable partitioned output
clear all               // Start with a clean slate
set linesize 80         // Line size limit to make output more readable
macro drop _all         // clear all macros
capture log close       // Close existing log files
log using clean-data.log, text replace      // Open log file
* --------------------------------------------------

use firms.dta

keep firm year output routput routputva wages mata rmata misc rmisc capn rcapn inv rinv ///
  worker skill unsk yearsc manedu sec secname locdum owndum exports union

/*
yearsc = average years of schooling
manedu = the management educations
sec = sector
locdum = location dummy
owndum = owner type -- foreign, ghanaian, state
exports = dummy if firm exports
*/

gen sample = 0
replace sample=1 if routputva!=. & worker!=. & rcapn!=. & rmata!=. & rinv!=. & rmisc!=. & routputva>0

keep if sample

save firms-cleaned.dta, replace
