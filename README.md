
<!-- README.md is generated from README.Rmd. Please edit that file -->

# *AcCountPop*

<!-- badges: start -->

<!-- badges: end -->

The goal of *AcCountPop* is to provide an accessible method to calculate
the dynamics of wild game populations using data that is readily
available for wild game agencies. These models are deterministic but
provide enough realism to make informed harvest-management decisions.

## Installation

You can install the development version of *AcCountPop* like so:

``` r
remotes::install_github("huh0001/AcCountPop")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(AcCountPop)
library(ggplot2)

## Baseline Scenario Example
results <- AcCountDeer(preharvest_pop = 40000,
             doe_ratio = 130,
             adult_prop = 0.51,
             y1_prop = 0.04,
             yearling_prop = 0.2,
             fawn_prop = 0.25,
             adult_fawn_rate = 1.6,
             yearling_fawn_rate = 0.2,
             antlered_harvest = 2305,
             antlerless_harvest = 2174,
             prop_ymale_in_antlered_harvest = 0.11,
             prop_yfemale_in_antlerless_harvest = 0.18,
             prop_fawn_in_antlerless_harvest = 0.12,
             birth_month = 6,
             season_open = 10,
             season_duration = 4,
             adult_male_nhm = 0.24,
             adult_female_nhm = 0.26,
             yearling_male_nhm = 0.255,
             yearling_female_nhm = 0.18,
             fawn_male_nhm = 0.46,
             fawn_female_nhm = 0.4523,
             six_month_fawn_nhm = 0.45)

#Postharvest Population
head(results[,c(1:10)])
#>   ModelYear N_adult_male_posth N_adult_female_posth N_y1_male_posth
#> 1         1               6244                 9150             553
#> 2         2               4030                 6385            1923
#> 3         3               3529                 5907            1365
#> 4         4               2901                 5135            2793
#> 5         5               3375                 5364            2500
#> 6         6               3483                 5295            2569
#>   N_y1_female_posth N_yearling_male_posth N_yearling_female_posth
#> 1               767                  2900                    3884
#> 2              2790                  2059                    2882
#> 3              2070                  4211                    4449
#> 4              3196                  3769                    3983
#> 5              2861                  3873                    4093
#> 6              2940                  3840                    4059
#>   N_fawn_male_posth N_fawn_female_posth N_postharvest
#> 1              3397                4570         31465
#> 2              6949                7054         34072
#> 3              6221                6315         34067
#> 4              6392                6488         34657
#> 5              6338                6434         34838
#> 6              6339                6435         34960

#Mid-Year Population
head(results[,c(1,11:19)])
#>   ModelYear N_adult_male_mid N_adult_female_mid N_y1_male_mid N_y1_female_mid
#> 1         1             6063               8748          2565            3576
#> 2         2             5310               8093          1821            2653
#> 3         3             4365               7036          3725            4096
#> 4         4             5079               7349          3334            3667
#> 5         5             5240               7255          3426            3768
#> 6         6             5398               7264          3397            3737
#>   N_yearling_male_mid N_yearling_female_mid birth_male_fawn birth_female_fawn
#> 1                2628                  3556           10215             10215
#> 2                5376                  5489            9146              9146
#> 3                4812                  4914            9397              9397
#> 4                4945                  5049            9318              9318
#> 5                4903                  5007            9319              9319
#> 6                4904                  5007            9302              9302
#>   N_midyear
#> 1     47566
#> 2     47034
#> 3     47742
#> 4     48059
#> 5     48237
#> 6     48311

#Preharvest Population
head(results[,c(1,20:28)])
#>   ModelYear N_adult_male_preh N_adult_female_preh N_y1_male_preh
#> 1         1              5661                8114           2395
#> 2         2              4958                7506           1700
#> 3         3              4076                6526           3478
#> 4         4              4742                6816           3113
#> 5         5              4893                6729           3199
#> 6         6              5040                6737           3172
#>   N_y1_female_preh N_yearling_male_preh N_yearling_female_preh N_fawn_male_preh
#> 1             3317                 2442                   3384             8797
#> 2             2461                 4995                   5223             7876
#> 3             3799                 4471                   4676             8092
#> 4             3401                 4594                   4805             8024
#> 5             3495                 4555                   4765             8025
#> 6             3466                 4556                   4765             8011
#>   N_fawn_female_preh N_preharvest
#> 1               8797        42907
#> 2               7876        42595
#> 3               8092        43210
#> 4               8024        43519
#> 5               8025        43686
#> 6               8011        43758

#Harvest Trajectory
head(results[,c(1,29:37)])
#>   ModelYear N_adult_male_mharvest N_adult_female_mharvest N_y1_male_mharvest
#> 1         1                  1245                    1055                287
#> 2         2                  1091                     976                204
#> 3         3                   897                     848                417
#> 4         4                  1043                     886                374
#> 5         5                  1076                     875                384
#> 6         6                  1109                     876                381
#>   N_y1_female_mharvest N_yearling_male_mharvest N_yearling_female_mharvest
#> 1                  232                      171                        305
#> 2                  172                      350                        470
#> 3                  266                      313                        421
#> 4                  238                      322                        432
#> 5                  245                      319                        429
#> 6                  243                      319                        429
#>   N_fawn_male_mharvest N_fawn_female_mharvest N_mharvest
#> 1                  264                    176       3735
#> 2                  236                    158       3657
#> 3                  243                    162       3567
#> 4                  241                    160       3696
#> 5                  241                    160       3729
#> 6                  240                    160       3757

#Model Lambda
head(results[,c(1,38)])
#>   ModelYear Lambda
#> 1         1     NA
#> 2         2   0.99
#> 3         3   1.01
#> 4         4   1.01
#> 5         5   1.00
#> 6         6   1.00


ggplot(data = results, aes(x = ModelYear, y = N_preharvest))+
  geom_line(linewidth = 1, color = "red")+
  geom_point(size = 2, color = "black")+
  geom_vline(xintercept = 3, linewidth = 1, linetype = 2, color = "grey25")+
  scale_y_continuous(limits = c(30000, 50000))+
  scale_x_continuous(breaks = c(1:15))+
  labs(x = "Model year", y = "Preharvest population")+
  theme_bw(base_size = 15, base_family = "serif")
```

<img src="man/figures/README-example-1.png" alt="" width="100%" />
