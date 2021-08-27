# #conversion of postcodes into lat and long
# 
# #Mcu data---------
# 
# mcu_lat_lon_data = as.data.frame(unique(pivot_mcu_data$PostCodes))
# names(mcu_lat_lon_data)[1] = "PostCodes"
# 
# mcu_lat_lon_data = cbind(mcu_lat_lon_data, geocode(mcu_lat_lon_data$PostCodes, output = "latlon"))
# 
# names(mcu_lat_lon_data)[2] = "Longitude"
# names(mcu_lat_lon_data)[3] = "Latitude"
# 
# mcu_lat_lon_data$Longitude = as.character(mcu_lat_lon_data$Longitude)
# mcu_lat_lon_data$Latitude = as.character(mcu_lat_lon_data$Latitude)
# 
# mcu_final_lat_lon = join(pivot_mcu_data, mcu_lat_lon_data, type = "left")
# mcu_final_lat_lon$City = "MCU"
# 
# #NCL data
# 
# 
# ncl_final_lat_lon = cbind(ncl_org_data, read.table(text = ncl_org_data$Location..WKT., sep = "("))
# ncl_final_lat_lon$V2 = as.character(ncl_final_lat_lon$V2)
# ncl_final_lat_lon = cbind(ncl_final_lat_lon, read.table(text = as.character(ncl_final_lat_lon$V2), sep = ")"))
# ncl_final_lat_lon = ncl_final_lat_lon[,-c(8,9,11)]
# ncl_final_lat_lon$V1 = as.character(ncl_final_lat_lon$V1)
# 
# ncl_final_lat_lon = cbind(ncl_final_lat_lon, read.table(text = as.character(ncl_final_lat_lon$V1), sep = ""))
# ncl_final_lat_lon = ncl_final_lat_lon[,-c(8)]
# 
# names(ncl_final_lat_lon)[8] = "Longitude"
# names(ncl_final_lat_lon)[9] = "Latitude"
# 
# ncl_final_lat_lon$City = "NCL"
