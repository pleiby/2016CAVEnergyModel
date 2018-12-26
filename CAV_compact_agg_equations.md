---
title: "CAV Energy and Demand - Compact Aggregate Equations"

date: "Dec. 15, 2018"

author:
  - name: Paul N. Leiby
    email: leibypn@ornl.gov
    affiliation: Oak Ridge National Laboratory

address:
  - code: Oak Ridge National Laboratory
    address: ORNL Energy Analysis Group, One Bethel Valley Road, Oak Ridge, TN, 37831-6036
  
abstract:  A compact and aggregated model of road vehicle travel and energy use for Connected and Automated Vehicles

output: 
  word_document:
    toc: true
    fig_caption: yes
    fig_height: 5
    fig_width: 7
    df_print: kable
    reference_docx: mystyles.docx
#   pdf_document: default

file: CAV_compact_agg_equations.Rmd
---

```{r global_options, include=FALSE}
library(knitr)
#opts_chunk$set(echo=FALSE, warning=FALSE, message=FALSE)
```

# 2. Decomposition of Energy and GHG Impacts of CAVs


The composition of the effects of many of these mechanisms can be conveniently accounted with a _Kaya Identity_

From this *Kaya* or *ASIF* approach the total GHG emissions are the product of

1. the level of **A**ctivity (e.g., passenger miles of travel), 
2. the **S**hare of activity for each mode, vehicle, and fuel type, 
3. the energy **I**ntensity of the mode and vehicle type (e.g., energy use per vehicle mile), and 
4. the **F**uel carbon intensity (ghg emission mass per unit energy)

Energy use for particular vehicle type is given by total activity (travel demand) level $A_{tv}$, 
the share of travel on mode *m* and the average share-weighted energy intensity of travel by vehicle type and mode.

$$E_{tvf} = (A_{tv}/o_{tv}) ~ \sigma_{tmv} ~I({\vec x}_{tmv}) \phi_{tmvf}$$
Vehicle energy intensity *I* is a function of a vector $\vec x_{tmv}$ of CAV mechanism/technology levels.

Transportation GHG emissions are then the sum over all transportation modes, vehicle types, and fuels of the product of {Transportation Services Activity^[We differentiate between transportation services (PKT) and vehicle travel (VKT).]} x {Shares of each mode-vehicle-fuel type} x {Energy Intensity} x {Fuel GHG Intensity}.

$$G_t = \Sigma_{m,v} (A_{tv}/o_{tv}) ~ \sigma_{tmv} ~I(\vec x_{tmv}) ~\Sigma_f g_{tf} \phi_{tmvf}$$

Defining indices

- m = transportation mode
- v = vehicle type
- f = fuel type
- t = time period (year)

for sets[^2]

- M = set of transportation modes *m*
- V = set of vehicle types *v*
- F = set of fuel types *f*
- T = set of time periods *t*

[^2]: Additional potential disaggregations include by region, vehicle size class, drivetrain type, and time of day (e.g. operating costs vary by time of day, as described in Bösch et al. 2017).

The variables are

- $A_{tv}$ = the transportation services Activity provided by type (passenger v.s freight, or LDV/HDV) [billion passenger-km or tonne-km traveled/yr]
- $o_{tv}$ = occupancy of each vehicle type v in year t [pass/veh, or PKT/VKT, for passenger travel; tonne/veh for freight]
- $\sigma_{tmv}$ = share of energy services in transportation mode m by vehicle type v in year t [unitless]
- $\phi_{tmvf}$ = the share of energy-service share $\sigma_{tmv}$ produced by fuel type f [unitless]
- $I_{tvmf}$ = the energy intensity of vehicle v in mode m using fuel type f in year t [MJ/veh-km] ([EJ/Bill veh-km])
- $g_{tf}$ = the GHG intensity of fuel f in year t [g CO2e/MJ (MegaT CO2e/EJ)]
- $E_{tvf}$ = energy use in form of fuel f by vehicle type v in year t [EJ/y]
- $G_{tv}$ = GHGs emitted in year t by type v [MT CO2e/y]

Focusing on passenger travel, we can write energy use $E_{tvf}$ as

$$E_{tvf} = A_{tv} \cdot \frac {1}{o_{tv}} \cdot \Sigma_{m} \sigma_{tvm} \phi_{tvmf} I_{tvmf}$$
with units

$$[EJ/yr] = [bill~ pkm/yr] \cdot [vkm/pkm] \cdot [unitlessShare] \cdot [unitlessShare] \cdot [MJ/vkm]$$

Total Emissions are

$$G_{tv} = \Sigma_f E_{tvf} g_{tf}$$

Combining, overall total emissions per year are

$$G_{t} = \Sigma_v \Sigma_f \left [ 
A_{tv} \cdot \frac {1}{o_{tv}} \cdot \Sigma_{m} \left ( \sigma_{tvm} \phi_{tvmf} I_{tvmf} \right ) \right ] g_{tf}$$

Mechanisms by Which CAVs Can Alter Energy Use and Emissions
---------------------------
We identified a set *K* of "Mechanisms" or "Technologies" associated with vehicle automation, each $k \in K$ of which has an effect represented by multiplier $\mu_k$ that can increase or decrease a component term in the ASIF decomposition. In general, a mechanism can affect travel activity levels *A*, vehicle energy intensities *I*, or mode and fuel shares $\sigma, \phi$. 
Furthermore, a mechanism could also effect vehicle class shares or occupancy, but we do not yet consider such effects. 

Taking a Scenario Approach, we can construct scenarios *s* that combine technology cases $j \in J$ and demand cases $d \in D$. For each scenario values are indexed by year *t* (for selected years), vehicle class *v*, mechanism *k* and by the Combined Technology/Demand scenario *s*, i.e. $\mu_{tvks}$???.

# 3. Estimating Energy Impacts

We define the effects of automation on vehicle energy intensity (energy per vehicle km traveled) through a set of identified technological and operational "mechanisms." 

The estimation for the midcase energy intensity impacts of each mechanism is based on literature review^[We start from the values developed in Wadud, MacKenzie and Leiby 2016.] and the external calculations of the authors. Ranges of values, for sensitivity cases and scenarios, are constructed for each mechanism *k*, for effect sensitivity cases *s* from "zero" through "pessimistic," "midcase," and "optimistic." Mechanism intensity effect values $I_{E,tvks}$ indicate the fractional change in energy intensity for a particular mechanism *k*, and are differentiated by year *t*, vehicle class *v*, and effect sensitivity *s*.

### 3.1 Construct multiplicative factors to apply to energy intensities for each mechanism

From the fractional changes in energy intensity, multipliers $\mu_{tvks}$ are constructed to apply for each mechanism/technology *k*, year *t*, vehicle class *v*, and effect sensitivity case *s*.

$\mu_{tvks} = 1.0 + I_{E,tvks}$

A multiplier value of 1.0 indicates no change and less/greater than one implies a multiplicative reduction/increase in energy intensity.

### 3.2 Energy Intensity by Vehicle Type and Technology Scenario, by Composing Mechanism Effects

We construct Scenario Multipliers $\mu_{jtv}$ (supressing subscripts *m, f*) for the vehicle energy intensity of each Scenario *j*, for Year *t* and Vehicle class *v*. These scenario multipliers reflect the combined the effect of all the mechanisms on vehicle energy intensity.

For each technology scenario *j*, year *t*, vehicle class *v*, the estimated "EffectCase" or effect sensitivity case *s* is specified for each mechanism *k*, i.e. 

$s_{jtvk}$ for 
$s \in \{Zero, Low, Mid, High\}$.

This Effect Sensitivity case *s* determines the appropriate intensity multiplier for each mechanism in the technology scenario.

The total energy intensity multiplier for each technology scenario *j* is the product of all mechanism multipliers^[Here mode *m* and fuel *f* are initially fixed and suppressed, i.e. *m* = road_vehicle and *f* = petroleum.] 
$\mu_{jtv} = \prod_{k} \mu_{tvk{s_{jtvk}}}$

$s_{jtvk}$ is the sensitivity case value for mechanism *k* on vehicle class *v* in technology scenario *j* and year *t*.

The Net Energy Intensity change for the technology scenario *j* is the difference between the combined effect of the intensity mechanism multipliers and 1.0.

$$\Delta I_{jtv} \equiv \mu_{jtv}-1 ~=~ \prod_{k} \mu_{tvk{s_{jtvk}}}-1$$

# 4. Demand Response to CAVs

In addition to the changes in energy intensity we account for a travel demand response based on the net change in generalized cost of travel. The change in generalized costs reflects both the change in energy cost per mile and potential changes in several other cost components, including travel time cost and other vehicle capital and operating cost.

4.1 Key parameters for Demand scenarios
-----------------------

4.2 Establish Base Travel Costs for Each Cost Component
---------------------------------

### Simple Base Travel Time Cost Calculation

Unit travel time cost per mile $\underline c_{T,v}$ is differentiated by vehicle class, and depends on average speed and hourly time cost.

4.3 Cost Changes and Fractional Increase in VKT for Demand Scenarios
---------------------------------

Calculate fractional change in demand, by Demand Scenario *d*, Year *t*, and VehicleClass *v*, based on changes in 
time cost, other vehicle fuel and operating costs, and VMT demand elasticity w.r.t generalized cost.

### CAV Scenario Vehicle Travel Cost Shares by Component

Costs are adjusted relative to Base for the cost-related assumptions of each Demand Scenario and for the Energy Intensity change associated with the current Technology Scenario. Energy intensity drives the travel energy cost, but this component is typically less than 15% of total travel costs for LDVs, and less than 35% of total costs for HDVs.

Base cost component shares $\sigma_{ivt}^B$ are normalized and add to 1.0. Demand Scenario *relative* costs for each cost component *i* are relative to the Base (Manual Vehicle) level. The total relative cost for all components can be greater than or less than 1.0. Denoted $\sigma_{ivtdj}$, the scenario travel cost component shares depend on cost component *i*, Vehicle class *v*, Year *t* and Demand Scenario *d*, and TechScenario *j*.

Base fuel costs per mile $\sigma_{fuel,vt}^B$ are adjusted by the Scenario Multipliers for energy intensity, $\mu_{jtv}$ for TechScenario *j*, Year *t*, Vehicle class *v*. The perceived change in fuel cost effects for consumers/riders also depends on the fraction $f_{fuelvis,v})$ of fuel costs that are assumed visible to or perceived by them. That is, for cost component $i = fuel$:

$$\sigma_{fuel,vtdj} = \sigma_{fuel,vt}^B \cdot (1+\mu_{jtv} \cdot f_{fuelvis,v})$$

Other travel cost components *i* have similar scenario-based adjustments, some directly specified by assumption $\gamma_{dtv}$ for demand scenario *d*, year *t* and vehicle class *v*:

$$\sigma_{ivtdj} = \sigma_{ivt}^B \cdot (1+\gamma_{dtv})$$
Note that adjusted travel cost components are all determined relative to the reference level. Thus the adjusted component "shares" are not technically shares, and can total greater or less than 1.0, if the total adjusted costs are greater or less than total base costs.
Their sum indicates the relative travel cost for the combined demand-technology scenario *dj*:

$$c_{rel,vtdj} ~=~ \frac {\sum_i \sigma_{ivtdj}} { \sum_i \sigma_{ivt}^B } ~=~ {\sum_i \sigma_{ivtdj}} $$


4.4 Calculate Adjusted Travel Cost Components for Scenario Conditions
---------------------------

4.5 Fractional VMT Changes in CAV Scenario
-------------------

Compute fractional increases in VKT from the changes in total generalized travel costs that result from automation.

For Vehicle Type *v*, Time *t*, Demand Scenario *d*, Technology Scenario *j*, and Elasticity Case *c* (Low and High elasticity)
[??? is elasticity case to be governed by demand scenario *d*, or separate index *c*?]

Define

- $c_{rel,vtdj}$ = Relative Total Cost for vehicle travel [unitless, vehicle travel cost $/veh-km]
- $m_{vtdj}(c_{rel,vtdj})$ = fractional increase in VKT [unitless, VKT is in km/vehicle-yr]

$$c_{rel,vtdj} \equiv \frac {C_{tot,vtdj}} {C_{tot,vt}^B}$$
The fractional increase in VKT

$$m_{vtdj}(c_{rel,vtdj}) ~=~ (c_{rel,vtdj} )^{ElasVKT_{dv}}-1$$

### Effects on VMT Demand from Underserved Population, and Ride Hailing & Pooling
The fractional change in VMT demand due to the cost-elastic response is augmented by adjustments reflecting:

- estimated additional road travel by underserved/non-driving populations, specifically older and young people;
- a shift from ride hailing/pooling.

Specify Combined Scenarios. A combined scenario $CS_i$ associates each Demand Scenario $DS_i$ with and Underserved Multiplier Option `USOption` and possible further VMT adjustment for ride hailing/pooling (`baseRideHailingPoolingAdj`). Note that all of these demand adjustments, for cost-response $m_{vtdj}(c_{rel,vtdj})$, underserved-demand multiplier \gamma_{USD}, and ride hailing/pooling demand shift $\rho_{HailPool}$, are applied multiplicatively to the base demand level:

$$c_{rel,vtdj} ~=~ RelTotalCost_{vtdj}$$

$$\begin {align} m_{vtdj}(c_{rel,vtdj}) &~=~ (c_{rel,vtdj})^{ElasVKT_{cv}}-1 \\ 
M_{jsdt} &~=~ \left ( 1 + m_{vtdj}(c_{rel,vtdj}) \right ) \gamma_{USD} (1+\rho_{HailPool}) 
\end {align} 
$$



And the proportional change in VMT for the combined scenario is

$$\Delta M_{jsdt} = 1 - M_{jsdt}$$

# 5. Policy and Scenario Calculations

Energy intensity changes (net, accounting for the influence of all identified mechanisms) 
have been calculated by year *t*, vehicle class *v*, and technology scenario scenario *j* in `EnergyIntensityChanges`:

$$\Delta I_{tkv} = 1 - \mu_{jtv}$$
Travel demand or VMT fractional changes have been calculated by year *t*, vehicle class *v*, and technology scenario scenario *j* in `VMTIncrease`

$$m_{vtdj}(c_{rel,vtdj}) ~=~ (c_{rel,vtdj})^{ElasVKT_{cv}}-1$$
