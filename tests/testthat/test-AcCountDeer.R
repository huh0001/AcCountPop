
test_that("AcCountDeer works", {

  results <- AcCountDeer(
    # Preharvest population
    preharvest_pop = 40000,

    # Sex ratio
    doe_ratio = 130,

    # Age distribution
    adult_prop = 0.51,
    y1_prop = 0.04,
    yearling_prop = 0.2,
    fawn_prop = 0.25,

    # Fawn rate
    adult_fawn_rate = 1.6,
    yearling_fawn_rate = 0.2,

    # Harvest
    antlered_harvest = 2305,
    antlerless_harvest = 2174,
    prop_ymale_in_antlered_harvest = 0.11,
    prop_yfemale_in_antlerless_harvest = 0.18,
    prop_fawn_in_antlerless_harvest = 0.12,

    # Hunting season
    birth_month = 6,
    season_open = 10,
    season_duration = 4,

    # Non-harvest mortality
    adult_male_nhm = 0.24,
    adult_female_nhm = 0.26,
    yearling_male_nhm = 0.255,
    yearling_female_nhm = 0.18,
    fawn_male_nhm = 0.46,
    fawn_female_nhm = 0.4523,
    six_month_fawn_nhm = 0.45,

    # Harvest change
    hc_adult_male = 0,
    hc_adult_female = 0,
    hc_y1_male = 0,
    hc_y1_female = 0,
    hc_yearling_male = 0,
    hc_yearling_female = 0,
    hc_fawn_male = 0,
    hc_fawn_female = 0,
    hc_specify = 0,

    # Additional mortality
    adm_adult_male = 0,
    adm_adult_female = 0,
    adm_y1_male = 0,
    adm_y1_female = 0,
    adm_yearling_male = 0,
    adm_yearling_female = 0,
    adm_fawn_male = 0,
    adm_fawn_female = 0,
    adm_specify = 0
  )

  # Verify output class
  expect_s3_class(results, "data.frame")

  # Verify results are returned
  expect_gt(nrow(results), 0)

  # Verify expected column exists
  expect_true("ModelYear" %in% names(results))

})

