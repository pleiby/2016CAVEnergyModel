CAVESIM - Benchmarking Notes from Capstone and Assumptions Docs
----------------------------------------

#### 6.1.1 – TNC
- vehicle replacement rate of 10 household vehicles per new SAV, consistent with many of the previous simulation studies referenced above (i.e. (Bischoff and Maciejewski, 2016)
- Figure X shows that shared automation (scenario B) produces significantly more efficient travel compared to the private automation scenario – with almost 50% less VMT

Figure X: Loaded and unloaded miles by auto-modes
Table: VMT by Case and Driving Type

          |B-low|B-High|C-low|C-high|  
----------|-----|-----|-----|-----|----
SOV Loaded|     |     |     |     |  
SOV Empty |    0|    0|     |     |  
SOV Total |     |     |     |     |  
TNC Loaded|     |     |     |     |  
TNC Empty |     |     |     |     |  
TNC Total |     |     |     |     |  
Tot Loaded|     |     |     |     |  
Tot Empty |     |     |     |     |  
Tot Total |     |     |     |     |  

Scenario Outcomes

                   |B-low |B-High|C-low |C-high|  
-------------------|------|------|------|------|----
Total VMT Change   |      |      |      |    44|  
HH AV Ownership Pct|      |      |      |    52|  

#### Other Findings in Literature re VMT Demand Impact of CAV
- Jane XXX Naturalistic Expt, 88% incease in VMT (corresponds to 100% private CAV ownership, also independent errand running)
- 16% VMT increase observed in the AV scenario (Simoni et al., 2019). Excludes CAV repositiong, which is substantial in other studies
    - "could also explain why that study found greater VMT increase in the SAV scenario than the AV scenario"
- "Zhao and Kockelman (Zhao Yong and Kockelman Kara M., 2018) also found a VMT increase up to 41% although significant limitations are mentioned in the study due to the use of a 4-step travel demand model, such as the lack of repositioning travel." 
- "Rodier (Rodier, 2018) also found substantially lower increase in VMT, up to 11% in AV and 18% in SAV scenarios, again opposite the findings in this study. In this case the lower VMT can be explained by the modest reduction in drive VOT assumed (25%), along with the lack of vehicle repositioning trips."

#### 6.1.2 – Individually Owned Shared AVs
- the use of privately owned AV leads to drastically increased vehicle miles traveled. In Scenario C, at 52% penetration of private fully automated vehicles, there is an increase of 44% in VMT [due t]
    - the increase in unloaded vehicle miles due to inefficient repositioning 
    - increase in overall travel driven due reduction in VoTT

#### 6.1.3 – Multi-Modal Travel
- [under the B-high scenario] "simulation results demonstrate a moderate reduction in auto-based VMT from single-occupant, high-occupancy, and taxi/TNC trips and a commensurate increase in transit use"
- "we find that transit and TNC complement each other." 
    - "Shared modes increase under Scenario B High Tech: Walk-to-bus/rail increases by 68%, walk-to-rail-only by 50%, and TNC by 544%. Transit grows in urban areas, whereas TNC grows where transit has already low demand."

- Energy Use from AV Accessory Load
    - Partial Automation
    - Full Automation


- VMT Adjustment for rideHailing/Pooling
    - CAVESIM has "baseRideHailingPoolingAdj <- -0.2" applied to account for widespread rideHailing in some segment
    - Replace with a table "refRideHailingPoolingAdj" of VMT shifts for range of cases and vehicle types (Use (Shared, Private), Automation (None, Partial, Full))

- Vehicle Stock (fractions) by type

        # fully automated vehicles/total stock
        ExogCAVPenetrationShare
        Year  :LDV    :HDV
        2020  :0.00   :0.00   
        2035  :0.40   :0.40
        2050  :1.00   :1.00