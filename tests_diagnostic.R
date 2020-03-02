# this simple test snippet looks at disaggregated cases,
#  selecting certain variables and cases (scenarios)


CaseAssumpsResults %>%
  # perform and calculations for comparison
  mutate(
    rel_C_Time = C_Time/C_Time[DemScen=="Base" & VC=="LDV"]
  ) %>%
  # filter to choose desired cases
  filter(VC=="LDV", TechScen==9, ElasCase=="Low")  %>%
  filter(Automation=="No", Fuel=="Gas") %>%
  # select variables to be displayed in compact table
  select(DemScen, Automation, Fuel, Use, C_Time, C_deltaVoTT, rel_C_Time)

CaseAssumpsResults %>%
  # perform and calculations for comparison
  mutate(
    rel_C_Time = C_Time/C_Time[DemScen=="Base" & VC=="LDV"]
  ) %>%
  # filter to choose desired cases
  filter(VC=="LDV", TechScen==9, ElasCase=="Low")  %>%
  filter(Automation=="Partial", Fuel=="Gas") %>%
  # select variables to be displayed in compact table
  select(DemScen, Automation, Fuel, Use, C_Time, C_deltaVoTT, rel_C_Time)

CaseAssumpsResults %>%
  # filter to choose desired cases
  filter(VC=="LDV", TechScen==9, ElasCase=="Low")  %>%
  filter(Automation=="Full", Fuel=="Gas") %>%
  # perform and calculations for comparison
  mutate(
    rel_C_Time = C_Time/C_Time[DemScen=="Base" & VC=="LDV"]
  ) %>%
  # select variables to be displayed in compact table
  select(DemScen, Automation, Fuel, Use, C_Time, C_deltaVoTT, rel_C_Time)


# look at the ratio of VoTT multipliers for Automation==High vs Automation==Low
ScenAssumps_VoTT %>%
  select(-`Multiplier_Highway/Arterial`) %>%
  gather(key=Roadtype, value=VoTTmult, c("MultiplierHighway", "MultiplierArterial")) %>%
  mutate(
    Roadtype = str_replace(Roadtype, pattern = "Multiplier", replacement = "")
  ) %>%
  group_by(VOTT_Impact, Congestion, TimeSensitivity, Roadtype) %>%
  mutate(
    MultHighautoOverLowauto = (VoTTmult[CAVs == "High"])/(VoTTmult[CAVs == "Low"]),
    deltaVoTT_ALow_Over_AHigh = (1-VoTTmult[CAVs == "Low"])/(1-VoTTmult[CAVs == "High"])
  ) %>%
  ungroup() %>%
#
#ScenAssumps_VoTT %>%
  filter(VOTT_Impact != "Zero") %>%
  kable()

# %>%
#  select(MultHighautoOverLowauto, deltaVoTT_ALow_Over_AHigh) %>%
#  #pull(MultHighautoOverLowauto) %>%
#  #table()
#  summary()

# %>%
#   mutate(
#     MultHwyOverArt = MultiplierHighway/MultiplierArterial,
#     MultiplierAllroads = 0.26 * MultiplierHighway + (1-0.26) * MultiplierArterial
# )

# ##################################################################################
# Test demonstrating the risk of using a scalar as the condition in an `ifelse` statement
set.seed(42)
testRandVals = data.frame(samp = runif(100)) # create df of 100 random values
Condition = T
# now try to double the sample vector "samp" conditional on Condition
testRandVals$try_sampX2 = ifelse(Condition, testRandVals$samp*2.0, testRandVals$samp)
summary(testRandVals)



set.seed(42)
testRandVals = tibble(samp = runif(100)) # create df of 100 random values
scalarCondition = T
testRandVals %>%
  mutate(
    unconditional_sampX2 = samp*2.0,
    scalarcond_sampX2 = ifelse(scalarCondition, samp*2.0, samp),
    vec_Condition = scalarCondition, # define a column of logicals
    vectorcond_sampX2 = ifelse(vec_Condition, samp*2.0, samp),
    oldsamp = samp # confirm that samp is unchanged
  ) %>%
  summary()


set.seed(42)
testRandVals = data.frame(samp = runif(100)) # create df of 100 random values
scalarCondition = T
testRandVals$scalarcond_sampX2 = ifelse(scalarCondition, testRandVals$samp*2.0, testRandVals$samp)

testRandVals$unconditional_sampX2 = testRandVals$samp*2.0
testRandVals$vec_Condition = scalarCondition # define a column of logicals
testRandVals$vectorcond_sampX2 = ifelse(testRandVals$vec_Condition, testRandVals$samp*2.0, testRandVals$samp)
testRandVals$oldsamp = testRandVals$samp # confirm that samp is unchanged

summary(testRandVals)


# Adding lines or points to an existing barplot
# January 15, 2011 By danganothererror
# https://www.r-bloggers.com/adding-lines-or-points-to-an-existing-barplot/

par(mfrow = c(1,2))
df <- data.frame(stolpec1 = 10 * runif(10), stolpec2 = 30 * runif(10))
barplot(df$stolpec1)
lines(df$stolpec2/10) #implicitno x = 1:10
points(df$stolpec2/10)

df.bar <- barplot(df$stolpec1)
lines(x = df.bar, y = df$stolpec2/10)
points(x = df.bar, y = df$stolpec2/10)
