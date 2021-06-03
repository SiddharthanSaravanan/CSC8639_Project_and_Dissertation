#Manchester data pre-processing step:
names(MCU_data)[2] = "NO"
names(MCU_data)[3] = "PM10"
names(MCU_data)[4] = "NO2"
names(MCU_data)[5] = "NOx"
names(MCU_data)[8] = "O3"
names(MCU_data)[9] = "SO2"

#Sample comparision
Sample_mcu = MCU_data[,c("timestamp", "NO2", "PM10", "StationName", "PostCodes")]

Sample_ncl = ncl_data %>% filter(Variable == c("NO2","PM10"))

#Extract date and hour from timestamp for MCU data
#Sample_mcu$date = as.POSIXct(Sample_mcu$timestamp, format = "%d-%m-%Y")
Sample_mcu$date = as.Date(Sample_mcu$timestamp, format = "%d-%m-%Y")
Sample_mcu$hour = format(as.POSIXct(Sample_mcu$timestamp, format = "%d-%m-%Y %H:%M"),  "%H")

#Extract date and hour from timestamp for NCL data
Sample_ncl$date = as.Date(Sample_ncl$Timestamp, format = "%Y-%m-%d")
Sample_ncl$hour = format(as.POSIXct(Sample_ncl$Timestamp, format = "%Y-%m-%d %H:%M"),  "%H")

#Aggregate the NCL data based on Variable, location, date and hours
sample_ncl_data = Sample_ncl %>% group_by(Sample_ncl$Variable, Sample_ncl$Location..WKT., Sample_ncl$date, Sample_ncl$hour) %>%
  summarise(Value = mean(Value))

