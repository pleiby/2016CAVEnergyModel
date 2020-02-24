# this simple test snoippet looks at disaggregated cases,
#  selection certain variables and cases

CaseAssumpsResults %>%
  # filter to choose desired cases
  filter(VC=="LDV", TechScen==9, ElasCase=="Low")  %>%
  filter(Automation=="No", Fuel=="Gas") %>%
  # perform and calculations for comparison
  mutate(
    rel_C_Time = C_Time/C_Time[DemScen=="Base" & VC=="LDV"]
  ) %>%
  # select variables to be displayed in compact table
  select(DemScen, Automation, Fuel, Use, C_Time, C_deltaVoTT, rel_C_Time)
  