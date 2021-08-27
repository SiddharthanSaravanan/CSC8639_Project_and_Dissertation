# #Aggregate the NCL data based on Variable, location, date and hours
# ncl_agg_geo = ncl_final_lat_lon %>% group_by(Variable, Longitude, Latitude, date, hour, City) %>% summarise(Value = mean(Value))
# 
# #Geospatial informations-----
# ncl_geo = ncl_agg_geo[,c(1,4,5,3,2,7,6)]
# 
# mcu_geo = mcu_final_lat_lon[,c(6,4,5,9,8,7,10)]
# 
# ncl_mcu_geo = rbind(mcu_geo, ncl_geo)
# 
# write.csv(ncl_mcu_geo, file = 'data/ncl_mcu_geo.csv', row.names = FALSE)