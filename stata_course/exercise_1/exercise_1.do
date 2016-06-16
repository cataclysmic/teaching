/* --- 1)
    Author: 
    Contact: 
    Creation Date:
*/

/// header options
/// Command Hints: clear, log, set more off



* --- 2)
/// change to working directory
/// CMD: cd



/// load dataset and clear memory of necessary



* --- view dataset    3)
** -- summary statistics all vars



** -- overview over variable descriptions



** -- investigate string vars for usefulness
/// Hint: tabulate the string variables
/// use the variable description and "browser" command to understand the vars



* --- Cleaning Dataset ---  4)

** -- recode exp to something useful   5)
/// Hint: several approaches possible
/// 1) generate new var, gen , replace
/// 2) recode var manually, replace, destring
/// 3) recode



** -- label values 6)
/// Hint: look for "value labels"



** -- remove unused vars   7)
/// Hint: stata cannot work on strings
drop change* whatabout* interplay* andere*



* --- Graph some variables ---
** -- histogram unconditional contribution OS-VCM  8)
/// Look in the variable description for the correct var



** -- histogram unconditional contribution OS-VCM w P  8)



** -- plot contributions conditional on type 9)
/// CMD: preserve, restore collapse, graph twoway



* --- tests of unconditional contribution in C & P  10)
/// watch out, requires 2 variables for single individual
/// consider how many observations you need per individual
/// what happens if you use too many
/// use the UCLA test table



* --- relationship between 2 categorical variables  11)
/* t_cell51 = contribution types
   t_con1_inv31 = punishment types */
/// use the UCLA test table



* --- impact of gender age impulsiveness justice on unconditional contribution (type) in C-game   12)
/* impulsive justice a survey questions transformed from text and
   scaled from 1 to 5, 3 being "indifferent".
   Because there are potential non-linearities, we do not use the vars
   as is. Rather create binary variables for being "high" and "low",
   i.e., > 3 and < 3 for each variable */
/// consider which and how many observations you need per individual
/// Hint: cross-sectional OLS with clustered standard errors



/* --- end of file ---*/
/// close the log














































use stata_tut.dta, clear
keep sid cell group con1 con2 con3 treatment trust_2 - payback t_con1_inv31 t_cell51 condcon contrib u
rename u uncontrib
label var t_con1_inv31 "Punishment Types"
label var con1 "contribution of other player"
label var work "Do you work more than 10h per week?"
label var sid "Subject ID"
label var con1_inv "20 - g_i"
label var condcon "g_i given mean(g_j) in C-game"
label var uncontrib "unconditional contribution C-game"
label var contrib "unconditional contribution P-game"
label var justice     "I would consider myself to be strongly concerned about justice."
label var angry       "Unfair behavior makes me angry."
label var impulsive   "I have a tendency to make rash decisions."
label var toface      "If I dislike someone's behavior, I tell it to his face."
label var planner     "I usually plan my activities in advance."
label var temper      "I have a tendency to lose my temper when I get angry."
label var payback     "If someone inflicts loss on me, I pay him back later."
label var jointpaymax "I was interested in maximizing the joint payoff of all group participants."
cap replace t_cell51 = 2 if sid == 60103
cap replace t_cell51 = 2 if sid == 60113
cap replace t_cell51 = 2 if sid == 60116
cap replace t_cell51 = 2 if sid == 60123
cap replace t_cell51 = 2 if sid == 60209
cap replace t_cell51 = 2 if sid == 60220
cap replace t_cell51 = 2 if sid == 60308
cap replace t_cell51 = 2 if sid == 60309
cap replace t_cell51 = 2 if sid == 60310
cap replace t_cell51 = 2 if sid == 60311
cap replace t_cell51 = 2 if sid == 60312
cap replace t_cell51 = 2 if sid == 60322
cap replace t_cell51 = 2 if sid == 60324
cap replace t_cell51 = 2 if sid == 60410
cap replace t_cell51 = 2 if sid == 60414
cap replace t_cell51 = 2 if sid == 60514
cap replace t_cell51 = 2 if sid == 60607
cap replace t_cell51 = 2 if sid == 60609
cap replace t_cell51 = 2 if sid == 60612
save stata-tut.dta, replace
