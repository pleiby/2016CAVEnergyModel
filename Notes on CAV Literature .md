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
    