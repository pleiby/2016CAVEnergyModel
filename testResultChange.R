# testResultChange.R

# compare CaseAssumpsResults with this saved file
#oldScenarioResultsCSVfilename = "CAV_Scenario_results_20200219_0450pm.csv"
oldScenarioResultsCSVfilename = "CAV_Scenario_results20200221_0542pm.csv"

old = read_csv(oldScenarioResultsCSVfilename)
new <- CaseAssumpsResults

cat("Following names in new but not in old:\n")
names(new)[!(names(new) %in% names(old))]
cat("Following names in old but not in new:\n")
names(old)[!(names(old) %in% names(new))]

# Could just 

tstold <- old %>%
  select(-RidePoolAdj) %>%
  select(c("VC", "DemScen", "ElasCase", "TechScen", "Automation", "Fuel", "Use"), everything()) %>% # reorder cols
  #select(c("VC", "DemScen", "ElasCase", "TechScen"), c("Automation", "Fuel", "Use"), F_A_Shares:fracEnergyUse)
  gather(key=varname, value=valueold, -c("VC", "DemScen", "ElasCase", "TechScen", "Automation", "Fuel", "Use")) # all values long
tstnew <- new %>%
  select(-RidePoolAdj) %>%
  select(c("VC", "DemScen", "ElasCase", "TechScen", "Automation", "Fuel", "Use"), everything()) %>% # reorder cols
  #select(c("VC", "DemScen", "ElasCase", "TechScen"), c("Automation", "Fuel", "Use"), F_A_Shares:fracEnergyUse)
  gather(key=varname, value=valuenew, -c("VC", "DemScen", "ElasCase", "TechScen", "Automation", "Fuel", "Use")) # all values long

tst <- tstold %>%
  inner_join(tstnew) %>% # keep only rows in both
  mutate(
    valuenew = as.numeric(valuenew),
    valueold = as.numeric(valueold)
  )  %>%
  mutate(
    newratio = ifelse((abs(valuenew)<1E-10) & (abs(valueold)<1E-10), 1.0, round(valuenew/valueold, 6)), # deal with zeros and rounding errors
    roundedratio = round(newratio, 9)
  )

# list count of obs by variable
tst %>%
  group_by(varname) %>%
  tally()


# Are there any NAs
tst %>% filter(is.na(roundedratio)) %>%  head()

cat("Read file", oldScenarioResultsCSVfilename, "and stats for the ratio of new values to old are\n")
summary(tst$roundedratio)
cat("(This ignores numerical differences < 1E-10.)\n")

cat("Read file", oldScenarioResultsCSVfilename, "and stats for the ratio of new values to old are\n")
tst %>% filter((varname != "EnergyUse") & (varname != "old_EnergyUse"))  %>%
  # filter(roundedratio != 1.0) #%>%
  pull(roundedratio) %>%
  summary()
cat("(This ignores numerical differences < 1E-10.)\n")


cat("A table of ratios of new values to old is\n")
table(tst$roundedratio) # rounded result ratio by variable

cat("A table of ratios of new values to old, by variable, is\n")
table(tst$roundedratio, tst$varname) # rounded result ratio by variable


# tst[tst$roundedratio == 0.0,]
