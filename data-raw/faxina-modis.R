library(tidyverse)
arq <- list.files("data-raw")
df <- read_csv(paste0("data-raw/",arq[2])) %>%
  select(Latitude:Date,MOD11A2_061_LST_Day_1km:MOD11A2_061_LST_Night_1km) %>%
  mutate(lst_d = MOD11A2_061_LST_Day_1km -273.15,
         lst_n = MOD11A2_061_LST_Night_1km -273.15)
write_rds(df,"data/lst.rds")

df <- read_csv(paste0("data-raw/",arq[3])) %>%
  select(Latitude:Date,MOD13Q1_061__250m_16_days_EVI,
         MOD13Q1_061__250m_16_days_NDVI)
glimpse(df)
write_rds(df,"data/ndvi_evi.rds")

df <- read_csv(paste0("data-raw/",arq[4])) %>%
  select(Latitude:Date, MOD15A2H_061_Lai_500m)
glimpse(df)
write_rds(df,"data/lai.rds")

df <- read_csv(paste0("data-raw/",arq[5])) %>%
  select(Latitude:Date, MOD17A2H_061_Gpp_500m )
glimpse(df)
write_rds(df,"data/gpp.rds")

df <- read_csv(paste0("data-raw/",arq[6])) %>%
  select(Latitude:Date,SPL3SMP_E_005_Soil_Moisture_Retrieval_Data_AM_soil_moisture)
glimpse(df)
write_rds(df,"data/soil_moisture.rds")
