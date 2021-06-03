#Plotting:



(plot_1 = ggplot(sample_data_no2, aes(sample_data_no2$date, sample_data_no2$Value, color = sample_data_no2$City)) + geom_line())

(plot_2 = ggplot(sample_data_pm10, aes(sample_data_pm10$date, sample_data_pm10$Value, color = sample_data_pm10$City)) + geom_line())





(plot_3 = ggplot(ncl_mcu_no2, aes(datetime, Value, color = City)) + geom_line())

(plot_4 = ggplot(ncl_mcu_pm10, aes(ncl_mcu_pm10$datetime, ncl_mcu_pm10$Value, color = ncl_mcu_pm10$City)) + geom_line())
