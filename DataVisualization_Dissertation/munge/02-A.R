#Manchester data pre-processing step:
names(MCU_data)[2] = "NO"
names(MCU_data)[3] = "PM10"
names(MCU_data)[4] = "NO2"
names(MCU_data)[5] = "NOx"
names(MCU_data)[8] = "O3"
names(MCU_data)[9] = "SO2"

#Sample comparision
mcu_org_data = MCU_data[,c("timestamp", "NO2", "PM10", "StationName", "PostCodes")]

mcu_org_data$PostCodes[mcu_org_data$PostCodes=="M1"]="M1, piccadilly gardens"

ncl_org_data = ncl_data %>% filter(Variable == c("NO2","PM10"))

#Extract date and hour from timestamp for MCU data
#mcu_org_data$date = as.POSIXct(mcu_org_data$timestamp, format = "%d-%m-%Y")
mcu_org_data$date = as.Date(mcu_org_data$timestamp, format = "%d-%m-%Y")
mcu_org_data$hour = format(as.POSIXct(mcu_org_data$timestamp, format = "%d-%m-%Y %H:%M"),  "%H")

#Extract date and hour from timestamp for NCL data
ncl_org_data$date = as.Date(ncl_org_data$Timestamp, format = "%Y-%m-%d")
ncl_org_data$hour = format(as.POSIXct(ncl_org_data$Timestamp, format = "%Y-%m-%d %H:%M"),  "%H")

# Drop NA values in both MCU and NCL data and aggregate:
#NCL data
ncl_org_data = ncl_org_data %>% drop_na()


#MCU data
mcu_org_data = mcu_org_data %>% drop_na()

#Use pivot longer to convert the column into rows in MCU data
pivot_mcu_data = mcu_org_data %>% pivot_longer(cols = -c(timestamp, StationName, PostCodes, date, hour) , names_to = "Variable", values_to = "Value")


#-----------------------------------------------------------------------------------------------------------
# 
# #Aggregation for location based info
# 
# #Aggregate the NCL data based on Variable, location, date and hours
# ncl_agg_1 = ncl_org_data %>% group_by(Variable, Location..WKT., date, hour) %>% summarise(Value = mean(Value))
# 
# #Use pivot longer to convert the column into rows in MCU data
# pivot_mcu_data = mcu_org_data %>% pivot_longer(cols = -c(timestamp, StationName, PostCodes, date, hour) , names_to = "Variable", values_to = "Value")
# 
# #Aggregate the MCU data based on Variable, location, date and hours
# mcu_agg_1 = pivot_mcu_data %>% group_by(Variable, PostCodes, date, hour) %>% summarise(StationName = StationName,
#                                                                                              Value = mean(Value))
# 
# 
# write.csv(ncl_agg_1, file = 'data/ncl_agg_1.csv', row.names = FALSE)
# write.csv(mcu_agg_1, file = 'data/mcu_agg_1.csv', row.names = FALSE)

#-------------------------------------------------------------------------------------------------------------------

