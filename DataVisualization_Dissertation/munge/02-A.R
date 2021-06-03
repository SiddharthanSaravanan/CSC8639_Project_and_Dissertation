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

# Drop NA values in both MCU and NCL data and aggregate:
#NCL data
Sample_ncl = Sample_ncl %>% drop_na()


#MCU data
Sample_mcu = Sample_mcu %>% drop_na()



#Aggregate the NCL data based on Variable, location, date and hours
sample_ncl_data = Sample_ncl %>% group_by(Variable, Location..WKT., date, hour) %>% summarise(Value = mean(Value))

#Use pivot longer to convert the column into rows in MCU data
pivot_mcu_data = Sample_mcu %>% pivot_longer(cols = -c(timestamp, StationName, PostCodes, date, hour) , names_to = "Variable", values_to = "Value")

#Aggregate the MCU data based on Variable, location, date and hours
sample_mcu_data = pivot_mcu_data %>% group_by(Variable, PostCodes, date, hour) %>% summarise(StationName = StationName, 
                                                                                             Value = mean(Value))


#Aggregation based on Variable, location and date on Both MCU and NCL data:

#NCL data
agg_date_sample_ncl_data = Sample_ncl %>% group_by(Variable, date) %>% summarise(Value = mean(Value))

agg_date_sample_ncl_data$City = "NCL"

#MCU data
agg_date_sample_mcu_data = pivot_mcu_data %>% group_by(Variable, date) %>% summarise(Value = mean(Value))

agg_date_sample_mcu_data$City = "MCU"

#Combine the dataframes:

sample_data = rbind(agg_date_sample_ncl_data, agg_date_sample_mcu_data)
