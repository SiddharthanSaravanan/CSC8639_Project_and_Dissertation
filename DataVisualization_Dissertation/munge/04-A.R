#Splitting the datasets into NO2 and PM10

ncl_final_lat_lon_no2 = ncl_final_lat_lon %>% filter(Variable == 'NO2')
ncl_final_lat_lon_pm10 = ncl_final_lat_lon %>% filter(Variable == 'PM10')

mcu_final_lat_lon_no2 = mcu_final_lat_lon %>% filter(Variable == 'NO2')
mcu_final_lat_lon_pm10 = mcu_final_lat_lon %>% filter(Variable == 'PM10')


#drop the columns:
ncl_final_lat_lon_no2 = ncl_final_lat_lon_no2[,c(3,2,4,10)]
ncl_final_lat_lon_pm10 = ncl_final_lat_lon_pm10[,c(3,2,4,10)]

mcu_final_lat_lon_no2 = mcu_final_lat_lon_no2[,c(1,6,7,10)]
mcu_final_lat_lon_pm10 = mcu_final_lat_lon_pm10[,c(1,6,7,10)]

names(mcu_final_lat_lon_no2)[1] = "Timestamp"
names(mcu_final_lat_lon_pm10)[1] = "Timestamp"

#timestamp conversion:

ncl_final_lat_lon_no2$datetime = as.POSIXct(ncl_final_lat_lon_no2$Timestamp, format = "%Y-%m-%d %H:%M:%S")
ncl_final_lat_lon_pm10$datetime = as.POSIXct(ncl_final_lat_lon_pm10$Timestamp, format = "%Y-%m-%d %H:%M:%S")

mcu_final_lat_lon_no2$datetime = as.POSIXct(mcu_final_lat_lon_no2$Timestamp, format = "%d-%m-%Y %H:%M")
mcu_final_lat_lon_pm10$datetime = as.POSIXct(mcu_final_lat_lon_pm10$Timestamp, format = "%d-%m-%Y %H:%M")

#Join both no2 and pm10 dataframe of mcu and ncl:
ncl_mcu_no2 = rbind(ncl_final_lat_lon_no2, mcu_final_lat_lon_no2)
ncl_mcu_pm10 = rbind(ncl_final_lat_lon_pm10, mcu_final_lat_lon_pm10)

ncl_mcu_no2 = ncl_mcu_no2[order(ncl_mcu_no2$Variable, ncl_mcu_no2$datetime),]
ncl_mcu_pm10 = ncl_mcu_pm10[order(ncl_mcu_pm10$Variable, ncl_mcu_pm10$datetime),]

write.csv(ncl_mcu_no2, file = 'data/ncl_mcu_no2.csv', row.names = FALSE)
write.csv(ncl_mcu_pm10, file = 'data/ncl_mcu_pm10.csv', row.names = FALSE)
