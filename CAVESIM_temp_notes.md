CAVESIM Temp Notes for Development
==================================

Completed 20190922 CAVdecom version
-----------------------------------

- This version: reset to Reproduce base test calculations in prior spreadsheet
    - see logical switch variantTechScen4 <- F, resets results to match test spreadsheet. Value T halves energy intensity savings in TechScen 4 for section 8 exploration of Pooling impacts

- display Printed date automatically
- use logical flag variantTechScen4 to switch off variant
- standardize numerical check reporting as "Check:"
- try using fn `janitor::adorn_totals()` for sum over rows

- _omits_ Variant input set in Section 3.2: "LDV Energy Intensity Reduction is halved for TechScen 4""
- satisfies Benchmark 0 checks on paramters and results
    - 3.2 Energy Intensity by Vehicle Type and Technology Scenario, by Composing Mechanism Effects
        - Check: Calculated Net Energy Intensity Changes match old workbook test values to within 1.287431e-09 total absolute error.
    - 4.5 Fractional VMT Changes in CAV Demand Scenario (Single Tech Case)
        - Check: Calculated test output to Kaya (VMTIncrease table) matches examples for CombScen in CS1 CS2 CS3 CS4 CS5 CS6 CS7 to within 3.783225e-08
    - 5.1 Final Scenario Results Table for 2050
        - Check: Calculated values match Scenario Results test values (intensity, VMT, EUse) to within total absolute error  6.526996e-09.
    - 8.1 Consider alternative occupancy levels, and their effects on costs, PMT, and VMT
        - Not checked yet
        
        
Next Steps for Benchmarking and Refining
-----------------------------------------
- Seek to benchmark average speed for local and intercity driving, for both LDVs and HDVs.
- Better-represent ways CAVs could alter average speed, and therefor travel time cost per mile.
- Add energy demand from automation load
    - can this fit in fractional change approach, given usually specified as fixed load?
    - see bounds report for reference
- Alter cost-elastic response to account for pooling. 
    Currently, the `VMTIncrease` table of `fracVMTincr` calculations applies the _VKT_ elasticity, estimated and appropriate for cost response at the reference level (near zero) pooling.

- Benchmark 
    - ReductCTAutomation    = 0.5   #   rho_A, reduction factor for the Cost of Travel Time (per hour) (now scenario dependent)
    - elas_VoTT_wrt_o <- 0.5 #    elas_{C_T,o}, elasticity of Cost of Travel time C_T = VoTT, w.r.t. occupancy,
        - an assumption regarding how higher occupancy (pooling) increases time cost VoTT
    - Elas_TourLength_wrt_Pooling <- 0.0 # elasticity of Vehicle tour length (for mult pooled trips) w.r.t. occupancy
    - Elas_RiderDetour_wrt_Pooling <- 0.0 # elasticity of Passenger trip length w.r.t. occupancy and pooling
    - PacePi <- 1 / 39.98 # base or default pace, hr/mi
    - ReductPaceAutomation <- 1 #     PaceReduct_A, reduction factor for the pace (hr/km) (or increase in average speed), i.e. the quantity of travel time per trip, from automation
- Review Data assumptions obtainble from Capstone report
- Review Data assumptions obtainable from Bounding Update drafts

ToDos for Refining
-------------------
- Next steps for functions CombScenResultsForOneTechScen() and GatherScenInputsForOneTechScen()
    - use _local_ vars to make iteratively make calculations of many dataframes
        - nie
        - DemRespParams (need DemRespParamsBase)
        - VTCShrAlt (needs VTCShrBase)
        - RelTotCost (needs VTCShrAlt)
        - VMTIncrease (needs) RelTotCost)
        - VMTIncrease
    - collapse the two long, largely duplicative, functions into 1, or have the second call the first

- Section 8: need to extract VTCostAlt from full set of CaseAssumptions, selecting out DemScen, TechScen, ElasCase of interest.
