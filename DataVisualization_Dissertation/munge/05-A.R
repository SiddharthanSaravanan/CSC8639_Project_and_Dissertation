# #Welch t test
# a = ncl_mcu_geo %>% pivot_wider(names_from = "Variable", values_from = "Value")
# 
# a_mcu = a %>% filter(a$City=="MCU")
# a_ncl = a %>% filter(a$City=="NCL")
# 
# a_no2_mcu = a_mcu$NO2
# a_pm10_mcu = a_mcu$PM10
# 
# a_no2_ncl = a_ncl$NO2
# a_pm10_ncl = a_ncl$PM10
# 
# boxplot(a_no2_mcu, a_no2_ncl, names=c("NO2_MCU","NO2_NCL"))
# 
# t.test(a_no2_mcu, a_no2_ncl, alternative = "greater")
# 
# mean(a_no2_ncl)
# mean(a_no2_mcu)
# 
# hist(a_no2_mcu)
# hist(a_no2_ncl)
# 
# t.test(a_pm10_mcu, a_pm10_ncl, alternative = "greater")
# 
# wilcox.test(a_no2_mcu, a_no2_ncl)
