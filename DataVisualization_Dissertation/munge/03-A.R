sample_data_no2 = sample_data %>% filter(Variable == 'NO2')
sample_data_pm10 = sample_data %>% filter(Variable == 'PM10')


sample_ncl_no2 = Sample_ncl %>% filter(Variable == 'NO2')
sample_ncl_pm10 = Sample_ncl %>% filter(Variable == 'PM10')

pivot_mcu_no2 = pivot_mcu_data %>% filter(Variable == 'NO2')
pivot_mcu_pm10 = pivot_mcu_data %>% filter(Variable == 'PM10')

sample_ncl_no2$City = "NCL"
sample_ncl_pm10$City = "NCL"

pivot_mcu_no2$City = "MCU"
pivot_mcu_pm10$City = "MCU"

#drop the columns:
sample_ncl_no2 = sample_ncl_no2[,c(3,2,4,8)]
sample_ncl_pm10 = sample_ncl_pm10[,c(3,2,4,8)]

pivot_mcu_no2 = pivot_mcu_no2[,c(1,6,7,8)]
pivot_mcu_pm10 = pivot_mcu_pm10[,c(1,6,7,8)]

names(pivot_mcu_no2)[1] = "Timestamp"
names(pivot_mcu_pm10)[1] = "Timestamp"

#timestamp conversion:

sample_ncl_no2$datetime = as.POSIXct(sample_ncl_no2$Timestamp, format = "%Y-%m-%d %H:%M:%S")
sample_ncl_pm10$datetime = as.POSIXct(sample_ncl_pm10$Timestamp, format = "%Y-%m-%d %H:%M:%S")

pivot_mcu_no2$datetime = as.POSIXct(pivot_mcu_no2$Timestamp, format = "%d-%m-%Y %H:%M")
pivot_mcu_pm10$datetime = as.POSIXct(pivot_mcu_pm10$Timestamp, format = "%d-%m-%Y %H:%M")

#Join both no2 and pm10 dataframe of mcu and ncl:
ncl_mcu_no2 = rbind(sample_ncl_no2, pivot_mcu_no2)
ncl_mcu_pm10 = rbind(sample_ncl_pm10, pivot_mcu_pm10)

ncl_mcu_no2 = ncl_mcu_no2[order(ncl_mcu_no2$Variable, ncl_mcu_no2$datetime),]
ncl_mcu_pm10 = ncl_mcu_pm10[order(ncl_mcu_pm10$Variable, ncl_mcu_pm10$datetime),]

write.csv(ncl_mcu_no2, file = 'data/ncl_mcu_no2.csv', row.names = FALSE)
write.csv(ncl_mcu_pm10, file = 'data/ncl_mcu_pm10.csv', row.names = FALSE)
