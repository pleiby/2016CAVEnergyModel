Notes on CAV Literature - - 20160530
=========

Notes from Shladover 2016 Scientific American
------------
* Shladover, Steven E., 2016  "The Truth about 'Self-Driving' Cars," _Scientific American_, June, 52-57.
* Software hurdles very significant
    * requires extremely high reliability standards
    * formal proof or extensive testing/validation "of incredibly complex code"
    * new methods for debugging and verifying
    * need new ways to "prove" safety to satisfaction of
        * company risk management officers
        * insurance companies
        * safety advocates and regulators
        * customers
        * [based on what we have seen so far, does this really look so burdensome?]
    * "Testers would have to put hundreds of millions, if not billions, of miles on a vehicle"
    * Requires "new sensor-processing and data-fusion algorithms .. with nearly zero false negatives"
    * Problems testing/validating "non-deterministic" machine learning algorithms
    * Must be affordable (limiting sensor/control redundancy)
* When/Urgency
    * level 3 [SAE] - conditional automation with human backup] prospects very clouded 
        * "due to the very real problem of recapturing the attention, in an emergency, of a driver"
        * ""some automakers say this is such a hard problem that they simpley will not attempt level three" (outside traffic-jam assistants)
        * "… it is conceivable that level-three autoation will never happen"
    * Shladover level 5 by 2075, given challenges of handling all situations
    * level 4 [SAE - full automation in limited circumstanced/conditions] in next 10 years: "And yet we will see highly automated cars soon, probably with in the coming decade"
        * automated valet-parking in garages
        * low-speed passenger shuttles in urban pedestrian zones
        * segregated bus-ways and truck-only lanes
            Eventually truck platoons with human-driven lead vehicle (PATH, SARTRE, KONVOI, Japan ITS)
* **"Yet the most widespread implementation of [SAE]level-four automation within the next decade will probably be automated freeway systems for personal passenger vehicles."**
    * Why not level-four automated highway trucking? (not much discussed, beyond the dedicated lane idea)
    
Notes from C. Mui "Trillions Will Depend On Whether Driverless Cars Require Human Drivers" 
-----------
* Chunka Mui, [Trillions Will Depend On Whether Driverless Cars Require Human Drivers](http://www.forbes.com/sites/chunkamui/2015/04/22/human-drivers/#39ce17d01760) Forbes April 22, 2015

* [Mercedes retraces historic first road trip with autonomous S-Class](http://www.autoblog.com/2013/09/19/mercedes-retraces-road-trip-autonomous-s-class-video/) Retraces Trip 125 years earlier of Bertha Benz, Carl Benz's wife, from Mannheim to Pforzheim

Notes from Lee and Kochelman 2018 "Energy and Emission Implications of Self-Driving Vehicles (rvw version of TRB2019 paper)
-------------
- This is another literature review and basic simulation approach to estimate the full energy impacts of CAVs
- Identifies four impact types
    1. Travel Demand effect
    2. "Driving Details" (vehicle performance, operation, adoption)
    3. "Multi-vehicle operation" (systems level effects)
    4. "Powertrain energy source" (electrification)
- Lee and Kochelman CAV Impact ests
    1. Travel Demand (VMT) effect
        - improved route choice (from connectivity)
            - -5% to -20% reduction in *energy consumption* (Gonder et al. 2016, Guo et al. 2013)
        - demand from underserved population
            - induced travel from "improved accessibility"
            - +10% to +14% energy consumption from new trips (source not clear. Harper et al. 2016.)
        - SAV Increased VMT and Empty driving
            - +6% to +14% increase in energy cons. (Loeb et al. 2016, 2017)
    2. "Driving Details" (vehicle operation and performance) Effects
        - Smoother Driving Cycle
            - anticipated traffic and signals, optimized signals & traffic (Liu et al 2017)
            - intentional eco-driving (Barth et al 2009)
            - -10% to -20% change in energy consumption from smoother driving cycle
        - Computer and Sensor Power Demands
            - depends on automation level
            - assume 1000w aux load
            - +4% to 15% (lower end from Gawron et al 2018 LCA)
        - Faster travel "from improved driving skill"
            - Note that faster travel increases road capacity and reduces travel time.
            - +7% to +30% (citing Brown et al. 2014, Lee et al. 2018, no speed change noted)
    3. System/Multi-vehicle Operation Effects
        - Platooning and V2V
            - improves "string stability" and roadway capacity
            - energy savings from smoother drive cycle (Gonder et al 2012)
            - energy savings from aero drag reduction (e.g. Alsabaan et al 2013)
            - conclude -7% to -35% on _highway_ travel (Li et al 2015, 2017, Talebpour et al 2016, Zhao et al 2013, Gonder et al 2012, Alsabaan et al 2013)
            - apply this to "highway" driving fraction (33% to 55% of all VMT, depending on definition as interstate highway & expressway or that plus major arterial roads, Wadud et al 2016.)
            - net is -2% (7% * 33%) to -19% (35%*55%)
        - SAVs - Increased Fuel Efficiency
            - vehicle right-sizing
            - ride pooling (DRS)
            - -5% to -12% (Fagnant et al 2014)
Research Needs
-----------
* Travel Demand Models
    * [Forecasting New Driverless Reality – Will Our Current Modeling Paradigms Hold Water?](https://rns.trb.org/dproject.asp?n=40424)
    * Analyze current transportation modeling approaches, including integrated Activity-Based / Dynamic Traffic Assignment Models and Four-step based procedures for possibilities to incorporate autonomous vehicles and related technologies in travel demand forecasting models.
    * Suggest theoretical concepts and practical ways of incorporating passenger autonomous vehicles and corresponding changes in travel behavior in the travel forecasting models.
    * [Four-step models](https://en.wikipedia.org/wiki/Transportation_forecasting#Four-step_models):
        * The four steps of the classical urban transportation planning system model are (after lanu use forecasting of regional population and employment):
            * Trip generation determines the frequency of origins or destinations of trips in each zone by trip purpose, as a function of land uses and household demographics, and other socio-economic factors.
            * Trip distribution matches origins with destinations, often using a gravity model function, equivalent to an entropy maximizing model. Older models include the fratar model.
            * Mode choice computes the proportion of trips between each origin and destination that use a particular transportation mode. 
            * Route assignment
    * [Activity Based Model]() 
        * The major premise behind activity-based models is that travel demand is a derived demand from activities that people need or wish to perform, with travel decisions forming part of the scheduling decisions. Travel is then seen as just one of the attributes of a system. 
        * Whereas TBMs estimate travel at the aggregate zone level, ABMs estimate travel at the disaggregate person and household level and then aggregate the results to the zone level for trip assignment. (http://www.mwcog.org/transportation/activities/models/4step/4_step.asp)
    * See [NCHRP Synthesis 406: Advanced Practices in Travel Forecasting (2010).](http://onlinepubs.trb.org/onlinepubs/nchrp/nchrp_syn_406.pdf)
    
    
References
----------
* Alsabaan, M., Naik, K., & Khalifa, T. (2013). Optimization of fuel cost and emissions using V2V communications. _IEEE Transactions on Intelligent Transportation Systems_, 14(3):1449-1461.
* Al-Samari, A. (2017). Study of emissions and fuel economy for parallel hybrid versus conventional vehicles on real world and standard driving cycles. _Alexandria Engineering Journal_, 56(4):721-726.
* Barth, M., & Boriboonsomsin, K. (2009). Energy and emissions impacts of a freeway-based dynamic eco-driving system. _Transportation Research Part D: Transport and Environment_, 14(6):400-410.
* Brown, A., Gonder, J., & Repac, B. (2014). An analysis of possible energy impacts of automated vehicle. In _Road vehicle automation_ (137-153). Springer, Cham.
* Carlino, D., Boyles, S. D., & Stone, P. (2013, October). Auction-based autonomous intersection management. _Intelligent Transportation Systems (ITSC)_, 2013 16th International IEEE Conference on (pp. 529-534). IEEE.
* Chen, T. D., & Kockelman, K. M. (2016). Management of a Shared Autonomous Electric Vehicle Fleet: Implications of Pricing Schemes. Transportation Research Record No. 2572, 37-46.
* Fagnant, D. J., & Kockelman, K. M. (2014). The travel and environmental implications of shared autonomous vehicles, using agent-based model scenarios. Transportation Research Part C: Emerging Technologies, 40, 1-13.
* Fajardo, D., Au, T. C., Waller, S., Stone, P., & Yang, D. (2011). Automated intersection control: Performance of future innovation versus current traffic signal control. Transportation Research Record. No. 2259, 223-232.
* Farrington, R., & Rugh, J. (2000). Impact of vehicle air-conditioning on fuel economy, tailpipe emissions, and electric vehicle range: Preprint (No. NREL/CP-540-28960). National Renewable Energy Lab., Golden, CO (US).
* Gawron, J. H., Keoleian, G. A., De Kleine, R. D., Wallington, T. J., & Kim, H. C. (2018). Life Cycle Assessment of Connected and Automated Vehicles: Sensing and Computing Subsystem and Vehicle Level Effects. Environmental science & technology, 52(5), 3249-3256.
* Gonder, J., Earleywine, M., & Sparks, W. (2012). Analyzing vehicle fuel saving opportunities through intelligent driver feedback. SAE International Journal of Passenger Cars-Electronic and Electrical Systems, 5, 450-461.
* Gonder, J., Wood, E., & Rajagopalan, S. (2016). Connectivity-enhanced route selection and adaptive control for the Chevrolet Volt. Journal of Traffic and Transportation Engineering, 4 49-60.
* Guo, L., Huang, S., & Sadek, A. W. (2013). An evaluation of environmental benefits of time-dependent green routing in the greater Buffalo–Niagara region. _J. of Intelligent Transportation Systems_, 17(1):18-30.
* Harper, C. D., Hendrickson, C. T., Mangones, S., & Samaras, C. (2016). Estimating potential increases in travel with autonomous vehicles for the non-driving, elderly and people with travel-restrictive medical conditions. _Transportation research part C: Emerging Technologies_, 72:=1-9.
* Hawkins, T. R., Singh, B., Majeau‐ Bettez, G., & Strømman, A. H. (2013). Comparative environmental life cycle assessment of conventional and electric vehicles. _J. of Industrial Ecology_, 17(1):53-64.
* LaMondia, J., Fagnant, D., Qu, H., Barrett, J. and Kockelman, K., 2016. Long-Distance Travel Mode Shifts Due to Automated Vehicles: A Statewide Mode-Shift Simulation Experiment and Travel Survey Analysis. _Transportation Research Record_. No. 2566:1–10.
* Lee, J., Kockelman, K. M., (2018). Throughput vs. Emissions. Two conflicting aspects of automated vehicles., Working paper.
* Lee, J., & Park, B. (2012). Development and evaluation of a cooperative vehicle intersection control algorithm under the connected vehicles environment. _IEEE Transactions on Intelligent Transportation Systems_, 13(1):81-90.
* Li, S. E., Deng, K., Zheng, Y., & Peng, H. (2015). Effect of Pulse‐ and‐ Glide Strategy on Traffic Flow for a Platoon of Mixed Automated and Manually Driven Vehicles. _Computer‐Aided Civil and Infrastructure Engineering_, 30(11):892-905.
* Li, S. E., Zheng, Y., Li, K., Wu, Y., Hedrick, J. K., Gao, F., & Zhang, H. (2017). Dynamical modeling and distributed control of connected and automated vehicles: Challenges and opportunities. _IEEE Intelligent Transportation Systems Magazine_, 9(3):46-58.
* Liu, J., Kockelman, K.M., & Nichols, A. (2017). Anticipating Emissions Impacts of Smoother Driving by Connected and Autonomous Vehicles Using MOVES Model. Paper presented at the 96th Annual Meeting of the Transportation Research Board.
* Loeb, B., & Kockelman, K.M., (2017). Fleet performance and cost evaluation of a shared autonomous electric vehicle fleet: a case study for Austin, Texas. Presented at the Autonomous Vehicles Symposium 2017 (San Francisco), forthcoming in _Transportation Research Part A: Policy and Practice_.
* Loeb, B., Kockelman, K. M., & Liu, J. (2018). Shared autonomous electric vehicle (SAEV) operations across the Austin, Texas network with charging infrastructure decisions. _Transportation Research Part C: Emerging Technologies_, 89.
* Meyer, J., Becker, H., Bösch, P. M., & Axhausen, K. W. (2017). Autonomous vehicles: The next jump in accessibilities? _Research in Transportation Economics_, 62:80-91.
* NHTSA, 2013. U.S. Department of Transportation Releases Policy on Automated Vehicle Development. NHTSA 14-13, Thursday, May 30, 2013.
* Niu, D., & Sun, J. (2013). Eco-Driving versus green wave speed guidance for signalized highway traffic: a multi-vehicle driving simulator study. Procedia-Social and Behavioral Sciences, 96, 1079-1090.
* Perrine, K., Kockelman, K. and Huang, Y., 2016. Anticipating Long-Distance Travel Shifts Due to Self-Driving Vehicles. Under review for publication in Transportation.
* Pitanuwat, S., & Sripakagorn, A. (2015). An investigation of fuel economy potential of hybrid vehicles under real-world driving conditions in Bangkok. _Energy Procedia_, 79:1046-1053.
* Qian, G., & Chung, E. (2011, September). Evaluating effects of eco-driving at traffic intersections based on traffic micro-simulation. _Australasian Transport Research Forum 2011 Proceedings_, 1-11.
* Quarles, N., & Kockelman, K. M., (2018). America's Fleet Evolution in an Automated Future, Under review for publication in Transportation Research Part D: Transport and Environment (2018).
* Rakha, H., & Kamalanathsharma, R. K. (2011, October). Eco-driving at signalized intersections using V2I communication. _Intelligent Transportation Systems (ITSC), 2011 14th International IEEE Conference_ (341-346).
* Sanchez, M., Cano, J. C., & Kim, D. (2006, June). Predicting traffic lights to improve urban traffic fuel consumption. _ITS Telecommunications Proceedings, 2006 6th International Conference_ (331-336).
* Sharon, G., Boyles, S. D., & Stone, P. (2017). Intersection Management Protocol for Mixed Autonomous and Human-Operated Vehicles. Under review for publication in _Transportation Research Part C: Emerging Technologies_.
* Talebpour, A., & Mahmassani, H. S. (2016). Influence of connected and autonomous vehicles on traffic flow stability and throughput. _Transportation Research Part C: Emerging Technologies_, 71:143-163.
* Wadud, Z., MacKenzie, D., & Leiby, P. (2016). Help or hindrance? The travel, energy and carbon impacts of highly automated vehicles. _Transportation Research Part A: Policy and Practice_, 86:1-18.
* Zhao, L., & Sun, J. (2013). Simulation framework for vehicle platooning and car-following behaviors under connected-vehicle environment. _Procedia-Social and Behavioral Sciences_, 96:914-924.
