#---
#title: "CAVESim_DataPrep"
#author: "Paul Leiby"
#date: "02/16/2020"
#output: html_document
#---
#
##```{r setup, include=FALSE}
#knitr::opts_chunk$set(echo = TRUE)
#echoWorking = TRUE
##```

verbose = T # give more printed feedback on actions

#```{r readScenarioCommonAssumptions, echo = echoWorking}
# These are tne names of the Scenario Common Assumptions Files, 
#  which were extracted fromm SMART FY19 Workflow spreadsheets

Scenario_Assumptions_Basic_filename = "SMART_FY19_Scenario_Common_Assumptions_ 190821_v4_Basic_Reformatted.csv"

Scenario_Assumptions_Vehicles_LDV_filename = "SMART_FY19_Scenario_Common_Assumptions_ 190821_v4_Vehicles_LDV_Reformatted.csv"

Scenario_Assumptions_Vehicles_HDV_filename = "SMART_FY19_Scenario_Common_Assumptions_ 190821_v4_Vehicles_MD_HD_Reformatted.csv"

Scenario_Assumptions_VoTT_filename = "SMART_FY19_Scenario_Common_Assumptions_ 190821_v4_Basic_VoTT_Factor_Table.csv"

Scenario_Assumptions_Sharing_filename = "SMART_FY19_Scenario_Assumptions_Vehicle_Sharing_and_Retirement_20190815.csv"

# read the Scenario Common Assumptions Files,
library(tidyverse)

if (verbose) {
  cat("The following SMART scenario data files are read:\n")
  cat("  Basic assumptions:", Scenario_Assumptions_Basic_filename, "\n")
  cat("  LDV vehicle assumptions:", Scenario_Assumptions_Vehicles_LDV_filename, "\n")
  cat("  HDV vehicle assumptions:", Scenario_Assumptions_Vehicles_HDV_filename, "\n")
  cat("  VOTT assumptions:", Scenario_Assumptions_VoTT_filename, "\n")
  cat("  Ride hailing/sharing assumptions:", Scenario_Assumptions_Sharing_filename, "\n")
  cat("\n")
}

# This data file includes overall SMART Scenario assumptions (across Scenario in columns) for
#   Overall assumed penetration shares, by 
#    Sector: Passenger (LDV) & Freight (MDV_HDV)
#    Class: Vehicle size classes, LDV for Car, SUV, LtTruck, and MDV_HDV various classes
#    Powertrain: Fuel (Gas, Dies, BEV) x Technology (Conv, 48V, HEV, PHEV, BEV)
#   Also includes general params re 
#    VoTT_Impact (factors, in {Zero, Low, High}; 
#    Shared Use VMT expansion factors due to empty/ZOV travel (by Partial and Full Automation));
#    Accessory Power Load (in Watts, by Partial and Full Automation)
ScenAssumps_Basic <- read_csv(paste0("./Data/", 
                                     Scenario_Assumptions_Basic_filename), comment = '#')
# These 2 data file include, for LDV and HDV (MD_HD) sectors respectively:
#   Overall assumed penetration shares (by VehClass, VehSubClass.Fuel_Tech, and Automation) vs. SMART Scenario
ScenAssumps_LDV <- read_csv(paste0("./Data/", 
                      Scenario_Assumptions_Vehicles_LDV_filename), comment = '#')
ScenAssumps_HDV <- read_csv(paste0("./Data/", 
                      Scenario_Assumptions_Vehicles_HDV_filename), comment = '#')
# Data file including VoTT multiplier factors
#   by scenario-based "VoTT_Impact" (Zero, Low, High) - multipliers smaller (more VoTT reduction) for High
#   by "Congestion" (Low, High) - multipliers smaller (more VoTT reduction) for High
#   by "TimeSensitivity" (Low, High) - multipliers larger (less VoTT reduction) for High
#   by "CAVs" automation level (Low, High) - multipliers smaller (more VoTT reduction) for High
#   by Roadtype (Arterial, Highway) - mults usually the same, except Low VoTT_Impact, low CAVs (more VoTT reduction for Hwy)
ScenAssumps_VoTT <- read_csv(paste0("./Data/", 
                      Scenario_Assumptions_VoTT_filename), comment = '#')
# This Data file includes benchmarking estimates, by meso-scale Model (POLARIS, BEAM) and SMART Scenario
#   of of TNC_vehicle_share (1-Private_vehicle_share)
#   of "TNC_mode_share", fraction or road trips satisfied by TNC
ScenAssumps_Sharing <- read_csv(paste0("./Data/", 
                      Scenario_Assumptions_Sharing_filename), comment = '#')
#```

#```{r getSharingShares, echo=echoWorking}
names(ScenAssumps_Sharing) <- str_replace_all(names(ScenAssumps_Sharing), 
                                              c(" " = "_" , "," = "" ))

LDV_shares_by_SharedMode <- ScenAssumps_Sharing %>%
  filter(Model == "POLARIS") %>%
  rename(TNC_Mode_Share = `TNC_Mode_share`) %>%
  select(DemScen, TNC_Mode_Share)
# Original data/assumptions on sharing rates by Scenario
LDV_shares_by_SharedMode

shares_by_U <- LDV_shares_by_SharedMode %>%
  mutate(Private = 1 - TNC_Mode_Share) %>%
  rename(Shared = TNC_Mode_Share) %>%
  gather(key = Use, value = U_Shares, -DemScen)

# shares by Demand Scenario, Vehicle class, and use case:
shares_by_U <- shares_by_U %>%
  rename(LDV = U_Shares) %>%
  mutate(HDV = 0.0) %>% # add HDV assumptions re sharing
  mutate(
    HDV = ifelse(Use == "Private", 1.0, HDV)
    ) %>%
  gather(key = VC, value = U_Shares, c(LDV, HDV))

shares_by_U  
#```

#```{r getLDVAutomationShares, echo=echoWorking}
names(ScenAssumps_LDV) <- str_replace_all(names(ScenAssumps_LDV), 
                                              c("-" = "." ))
shares_by_Automation <- ScenAssumps_LDV %>%
  select(-(BASE_2025_Low:BASE_2040_High),-X15) %>%
  separate(VehSubClass.Fuel_Tech, into = c("VehSubClass", "Fuel_Tech"), sep = "-") %>%
  filter(!is.na(VehSubClass)) %>%
  rename(
    VC = VehClass,
    Base = Baseline
    )
shares_by_Automation <- shares_by_Automation %>%
  gather(key = DemScen, value = Share, Base:C_High) %>%
  mutate(Share = ifelse(is.na(Share), 0.0, Share))

FuelBEV = c("BEV_BEV")
FuelPHEV = c("Gas_PHEV")
FuelGas = c("Diesel_Conventional", "Gas_Conventional", "Gas_Conv48V","Gas_HEV" )

shares_by_Automation <- shares_by_Automation %>%
  mutate(Fuel = NA) %>%
  mutate(
    Fuel = ifelse(Fuel_Tech %in% FuelGas, "Gas", Fuel),
    Fuel = ifelse(Fuel_Tech %in% FuelPHEV, "PHEV", Fuel),
    Fuel = ifelse(Fuel_Tech %in% FuelBEV, "BEV", Fuel),
    Fuel = ifelse(Fuel_Tech == "TOTAL", "TOTAL", Fuel)
  )

#shares_by_Automation
LDV_shares_by_F_A = shares_by_Automation %>%
  filter(Fuel != "TOTAL") %>%
  filter(VehSubClass != "TOTAL") %>%
  group_by(VC, DemScen, Automation, Fuel) %>%
  summarize(F_A_Shares = sum(Share))

# Marginals - may not be needed
LDV_shares_by_A = shares_by_Automation %>%
  filter(Fuel != "TOTAL") %>%
  filter(VehSubClass != "TOTAL") %>%
  group_by(VC, DemScen, Automation) %>%
  summarize(A_Shares = sum(Share))
  
LDV_shares_by_F = shares_by_Automation %>%
  filter(Fuel != "TOTAL") %>%
  filter(VehSubClass != "TOTAL") %>%
  group_by(VC, DemScen, Fuel) %>%
  summarize(F_Shares = sum(Share))

# Checks - should be all 1.0s for each scenario DemScen
LDV_shares_by_F_A %>%
  group_by(VC, DemScen) %>%
  summarize(Tot_Shares = sum(F_A_Shares))

LDV_shares_by_F %>%
  group_by(VC, DemScen) %>%
  summarize(Tot_Shares = sum(F_Shares))

LDV_shares_by_A %>%
  group_by(VC, DemScen) %>%
  summarize(Tot_Shares = sum(A_Shares))

#```

#```{r getHDVAutomationHDShares, echo=echoWorking}
names(ScenAssumps_HDV) <- str_replace_all(names(ScenAssumps_HDV), 
                                              c("-" = "." ))
shares_by_Automation <- ScenAssumps_HDV %>%
  select(VehClass, VehSubClass.Fuel_Tech, Automation, Baseline, A_Low, A_High, B_Low, B_High, C_Low, C_High) %>%
  separate(VehSubClass.Fuel_Tech, into = c("VehSubClass", "Fuel_Tech"), sep = "-") %>%
  mutate(
      Fuel_Tech = ifelse(Fuel_Tech == "SUBTOTAL", "TOTAL", Fuel_Tech),
      VehSubClass = ifelse(VehSubClass == "SUBTOTAL", "TOTAL", VehSubClass),
  ) %>%
  filter(!is.na(VehSubClass)) %>%
  rename(
    VC = VehClass,
    Base = Baseline
    )
shares_by_Automation <- shares_by_Automation %>%
  gather(key = DemScen, value = Share, Base:C_High) %>%
  mutate(Share = ifelse(is.na(Share), 0.0, Share))

# unique(shares_by_Automation$Fuel_Tech)
FuelBEV = c("BEV_BEV", "BEV_BEVShortRange")
FuelPHEV = c("Gas_PHEV", "Diesel_PHEV", "Gas_BEV", "Gas_BEVShortRange" )
FuelGas = c(
  "Diesel_Conventional",
  "Gas_Conventional",
  "Gas_Conv", 
  "HEV", 
  "Gas_HEV",
  "Gas_Conv48V", 
  "Diesel_Conv48V",
  "Diesel_HEV"
)
shares_by_Automation <- shares_by_Automation %>%
  mutate(Fuel = "Unassigned") %>%
  mutate(
    Fuel = ifelse(Fuel_Tech %in% FuelGas, "Gas", Fuel),
    Fuel = ifelse(Fuel_Tech %in% FuelPHEV, "PHEV", Fuel),
    Fuel = ifelse(Fuel_Tech %in% FuelBEV, "BEV", Fuel),
    Fuel = ifelse(Fuel_Tech == "TOTAL", "TOTAL", Fuel),
    Fuel = ifelse(Fuel_Tech == "SUBTOTAL", "TOTAL", Fuel)
  )

#shares_by_Automation <- 
HDV_shares_by_F_A = shares_by_Automation %>%
  filter(Fuel != "TOTAL") %>%
  filter(VehSubClass != "TOTAL") %>%
  group_by(VC, DemScen, Automation, Fuel) %>%
  summarize(F_A_Shares = sum(Share))

# Marginals
HDV_shares_by_A = shares_by_Automation %>%
  filter(Fuel != "TOTAL") %>%
  filter(VehSubClass != "TOTAL") %>%
  group_by(VC, DemScen, Automation) %>%
  summarize(A_Shares = sum(Share))
  
HDV_shares_by_F = shares_by_Automation %>%
  filter(Fuel != "TOTAL") %>%
  filter(VehSubClass != "TOTAL") %>%
  group_by(VC, DemScen, Fuel) %>%
  summarize(F_Shares = sum(Share))

# Checks - should be all 1.0s for each scenario DemScen
HDV_shares_by_F_A %>%
  group_by(VC, DemScen) %>%
  summarize(Tot_Shares = sum(F_A_Shares))

HDV_shares_by_F %>%
  group_by(VC, DemScen) %>%
  summarize(Tot_Shares = sum(F_Shares))

HDV_shares_by_A %>%
  group_by(VC, DemScen) %>%
  summarize(Tot_Shares = sum(A_Shares))
#```

#```{r combineAutomationFuelShareAssumps, echo=echoWorking}
# Do not distingish between MD and HD, for sake of analysis so far. 
#   Need reference energy demand by Fuel_Tech category to do deeper dive.

shares_by_F_A = HDV_shares_by_F_A %>%
  ungroup() %>%
  mutate(VC = ifelse(VC == "MDV_HDV", "HDV", VC)) %>%
  #union(LDV_shares_by_F_A)
  bind_rows(LDV_shares_by_F_A)

if (verbose) {
  cat("Data for shares by Fuel/drivetrain type and Automation: \n")
  glimpse(shares_by_F_A)
}

# Checks - should all be 1.0
shares_by_F_A %>%
  group_by(VC, DemScen) %>%
  summarize(Tot_Shares = sum(F_A_Shares))

shares_by_Automation %>%
  filter(Fuel == "Unassigned")
#```

# VMT by Road Type
VMT_by_Roadtype = tribble(
~Year, ~Allroads, ~Interstate, ~OtherArterial, ~Collector, ~Local,
2015, 3095373, 776952, 1466217, 422110, 430095,
2016, 3174408, 805104, 1505453, 429797, 434055,
2017, 3212348, 819760, 1516479, 428450, 447657,
2018, 3240327, 828655, 1533687, 437761, 440224
)
# VMT Fraction by Road Type
VMT_Fraction_by_Roadtype = tribble(
  ~Year, ~Allroads, ~Interstate, ~OtherArterial, ~Collector, ~Local,
2015, 1.00000, 0.25100, 0.47368, 0.13637, 0.13895,
2016, 1.00000, 0.25362, 0.47425, 0.13539, 0.13674,
2017, 1.00000, 0.25519, 0.47208, 0.13338, 0.13936,
2018, 1.00000, 0.25573, 0.47331, 0.13510, 0.13586
)
# Datafile: "VMT_and_VMTperlanemile_by_Roadway_Class_BTS2020.csv"
# Source: https://www.bts.gov/content/roadway-vehicle-miles-traveled-vmt-and-vmt-lane-mile-functional-class        
# Table 1-36:  Roadway Vehicle-Miles Traveled (VMT) and VMT per Lane-Mile by Functional Classa         
# Units: VMT in millions of veh-miles; VMTPLM in thousands of veh-miles per lane mile         
# U.S. Department of Transportation, Federal Highway Administration, Highway Statistics (Washington, DC: Annual Issues), table VM-202, available at http://www.fhwa.dot.gov/policyinformation/statistics.cfm as of Dec. 3, 2019.         
# table_01_36_121719.xlsx; https://www.bts.gov/sites/bts.dot.gov/files/table_01_36_121719.xlsx         

# Take the most recent year fraction of VMT on Interstates as Highway (vs Arterial) fraction,
#   for the purpose of average VoTT calculation
HighwayVMTFraction <- VMT_Fraction_by_Roadtype %>%
  filter(Year == 2018) %>%
  pull(Interstate)
