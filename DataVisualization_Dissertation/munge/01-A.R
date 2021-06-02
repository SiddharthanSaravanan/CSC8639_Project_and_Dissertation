# Example preprocessing script.
# Downloading data from Newcastle Urban Observatory
# Download Air quality data from the observatory based on the range of data variables and time period of 1st feb 2020 till 1st March 2020

d1 = curl('http://uoweb3.ncl.ac.uk/api/v1.1/sensors/data/csv/?starttime=20200201000000&endtime=20200301000000&theme=Air+Quality&data_variable=O3')
feb_data1 = read.csv(d1)
feb_data1 = feb_data1[,c("Sensor.Name", "Variable", "Timestamp", "Value", "Location..WKT.")]

d2 = curl('http://uoweb3.ncl.ac.uk/api/v1.1/sensors/data/csv/?starttime=20200201000000&endtime=20200301000000&theme=Air+Quality&data_variable=NO2')
feb_data2 = read.csv(d2)
feb_data2 = feb_data2[,c("Sensor.Name", "Variable", "Timestamp", "Value", "Location..WKT.")]

d3 = curl('http://uoweb3.ncl.ac.uk/api/v1.1/sensors/data/csv/?starttime=20200201000000&endtime=20200301000000&theme=Air+Quality&data_variable=PM10')
feb_data3 = read.csv(d3)
feb_data3 = feb_data3[,c("Sensor.Name", "Variable", "Timestamp", "Value", "Location..WKT.")]

# Download Air quality data from the observatory based on the range of data variables and time period of 1st March 2020 till 1st April 2020

d4 = curl('http://uoweb3.ncl.ac.uk/api/v1.1/sensors/data/csv/?starttime=20200301000000&endtime=20200401000000&theme=Air+Quality&data_variable=O3')
feb_data4 = read.csv(d4)
feb_data4 = feb_data4[,c("Sensor.Name", "Variable", "Timestamp", "Value", "Location..WKT.")]

d5 = curl('http://uoweb3.ncl.ac.uk/api/v1.1/sensors/data/csv/?starttime=20200301000000&endtime=20200401000000&theme=Air+Quality&data_variable=NO2')
feb_data5 = read.csv(d5)
feb_data5 = feb_data5[,c("Sensor.Name", "Variable", "Timestamp", "Value", "Location..WKT.")]

d6 = curl('http://uoweb3.ncl.ac.uk/api/v1.1/sensors/data/csv/?starttime=20200301000000&endtime=20200401000000&theme=Air+Quality&data_variable=PM10')
feb_data6 = read.csv(d6)
feb_data6 = feb_data6[,c("Sensor.Name", "Variable", "Timestamp", "Value", "Location..WKT.")]

#combine both months data of NCL into a single dataframe

ncl_data = rbind(feb_data1, feb_data2, feb_data3, feb_data4, feb_data5, feb_data6)

#write.csv(ncl_data, file = 'data/ncl_data.csv', row.names = FALSE)
