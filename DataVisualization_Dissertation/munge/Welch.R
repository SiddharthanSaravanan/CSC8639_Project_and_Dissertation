#Welch T-test try

welch_no2 = ncl_mcu_geo %>% filter(ncl_mcu_geo$Variable=="NO2")
welch_pm10 = ncl_mcu_geo %>% filter(ncl_mcu_geo$Variable=="PM10")

welch_no2_a = welch_no2[,c("City", "Value")]
welch_pm10_a = welch_pm10[,c("City", "Value")]

#Summary statistics

welch_no2_a %>%
  group_by(City) %>%
  get_summary_stats(Value, type = "mean_sd")

welch_pm10_a %>%
  group_by(City) %>%
  get_summary_stats(Value, type = "mean_sd")


#Visualization

bxp_no2 <- ggboxplot(
  welch_no2_a, x = "City", y = "Value", 
  ylab = "Value", xlab = "Cities"#, add = "jitter"
)
bxp_no2

bxp_pm10 <- ggboxplot(
  welch_pm10_a, x = "City", y = "Value", 
  ylab = "Value", xlab = "Cities"#, add = "jitter"
)
bxp_pm10

#Computation

stat.test_no2 <- welch_no2_a %>%
  t_test(Value ~ City) %>%
  add_significance()
stat.test_no2


stat.test_pm10 <- welch_pm10_a %>%
  t_test(Value ~ City) %>%
  add_significance()
stat.test_pm10

#Cohen's d for Welch

welch_no2_a %>% cohens_d(Value ~ City, var.equal = FALSE)

welch_pm10_a %>% cohens_d(Value ~ City, var.equal = FALSE)


# Final plot

stat.test_1 <- stat.test_no2 %>% add_xy_position(x = "Cities")
bxp_no2 + 
  stat_pvalue_manual(stat.test_1, tip.length = 0) +
  labs(subtitle = get_test_label(stat.test_1, detailed = TRUE))


stat.test_2 <- stat.test_pm10 %>% add_xy_position(x = "Cities")
bxp_pm10 + 
  stat_pvalue_manual(stat.test_2, tip.length = 0) +
  labs(subtitle = get_test_label(stat.test_2, detailed = TRUE))

