CAV - Notes on CAV Energy Model Development 20161110
=====================

* Paul N. Leiby
* This file: "CAV - Notes on CAV Energy Model Development 20160714.md"

Status of Effort - 2016_11_10
--------------------
* Developing R version of ASIF energy decomposition, for experimentation
	* see: \Papers\2013AutomatedVehicles\2016CAVEnergyModel\CAVdecom20160614.Rmd
* Seeking data to benchmark travel demand components from NHTS
	* Idea is to determine the division of travel by mode and "regime."
		* Regime encompasses purpose: (business, personal, recreation)
		* Regime encompasses road type: (highway/local, urban/rural, congested/free)
	* Then can apply separate VTT cost to each regime
	* To determine CAV impact, also need
		* elasticity of travel demand within each regime
		* Effect of CAV on time cost in each regime
		* Effect of CAV on fraction of travel spent in each regime (mode-shifts, reduced congestion) 
	* see \Papers\2013AutomatedVehicles\2016CAVEnergyModel\NHTStests20160616a.Rmd
* Understanding the Valuation of Travel Time, for purposes of estimating demand response
	* See "Notes_on_Valuation_of_Travel_Time_20160526a.Rmd"
* Developing analytical model of optimal tax problem
	* See directory \Papers\2013AutomatedVehicles\2015CAVPaperWithUMaine\
		* See "OptimalFuelTaxForAVs_20160619.Rmd"
			* Compact statement of Small and Parry 2005 model
			* Identifying key placed model needs to be modified for CAVs
			* Focusing on difference between private and public optimality conditions
		* See "Mathematical Model of Optimal Tax System of Vehicles 20160618PL.docx"

