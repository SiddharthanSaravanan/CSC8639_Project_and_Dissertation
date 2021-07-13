#conversion of postcodes into lat and long

testing = list(paste0(unique(mcu_agg_1$PostCodes), collapse=","))

a = list("M1","M1 7EL")

pc_list <- list(
  postcodes = c("PR3 0SG", "M45 6GN", "EX165BL"))

post = bulk_postcode_lookup(pc_list)


postcodes = c("PR3 0SG", "M45 6GN", "EX165BL")

postcodes

unique(mcu_agg_1$PostCodes)

pc_list1 <- list(
  postcodes = unique(mcu_agg_1$PostCodes))

post1 = bulk_postcode_lookup(pc_list1)

