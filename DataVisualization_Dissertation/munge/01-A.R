# Example preprocessing script.
# Downloading data from Newcastle Urban Observatory
# Download Air quality data from the observatory based on the range of data variables and time period of 1st feb 2020 till 1st April 2020

d1 = curl('http://uoweb3.ncl.ac.uk/api/v1.1/sensors/data/csv/?starttime=20200201000000&endtime=20200301000000&theme=Air+Quality&data_variable=O3')
feb_data1 = read.csv(d1)
feb_data1 = feb_data1[,c(1,2,4,5,7)]

d2 = curl('http://uoweb3.ncl.ac.uk/api/v1.1/sensors/data/csv/?starttime=20200201000000&endtime=20200301000000&theme=Air+Quality&data_variable=NO2')
feb_data2 = read.csv(d2)
feb_data2 = feb_data2[,c(1,2,4,5,7)]

d3 = curl('http://uoweb3.ncl.ac.uk/api/v1.1/sensors/data/csv/?starttime=20200201000000&endtime=20200301000000&theme=Air+Quality&data_variable=PM10')
feb_data3 = read.csv(d3)
feb_data3 = feb_data3[,c(1,2,4,5,7)]


#feb_data4 = read.csv('http://uoweb3.ncl.ac.uk/api/v1.1/sensors/data/csv/?starttime=20200201000000&endtime=20200301000000&theme=Air+Quality&data_variable=PM2.5')

