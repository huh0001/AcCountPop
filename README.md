
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
library(gt)

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

## Postharvest Population

knitr::kable(
  results[, 1:10],
  format = "pipe"
)
```

| ModelYear | N_adult_male_posth | N_adult_female_posth | N_y1_male_posth | N_y1_female_posth | N_yearling_male_posth | N_yearling_female_posth | N_fawn_male_posth | N_fawn_female_posth | N_postharvest |
|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| 1 | 6244 | 9150 | 553 | 767 | 2900 | 3884 | 3397 | 4570 | 31465 |
| 2 | 4030 | 6385 | 1923 | 2790 | 2059 | 2882 | 6949 | 7054 | 34072 |
| 3 | 3529 | 5907 | 1365 | 2070 | 4211 | 4449 | 6221 | 6315 | 34067 |
| 4 | 2901 | 5135 | 2793 | 3196 | 3769 | 3983 | 6392 | 6488 | 34657 |
| 5 | 3375 | 5364 | 2500 | 2861 | 3873 | 4093 | 6338 | 6434 | 34838 |
| 6 | 3483 | 5295 | 2569 | 2940 | 3840 | 4059 | 6339 | 6435 | 34960 |
| 7 | 3588 | 5301 | 2547 | 2916 | 3841 | 4059 | 6328 | 6423 | 35003 |
| 8 | 3637 | 5290 | 2548 | 2916 | 3834 | 4051 | 6318 | 6414 | 35008 |
| 9 | 3667 | 5283 | 2543 | 2911 | 3828 | 4045 | 6309 | 6404 | 34990 |
| 10 | 3681 | 5276 | 2539 | 2905 | 3823 | 4039 | 6299 | 6394 | 34956 |
| 11 | 3687 | 5267 | 2536 | 2900 | 3817 | 4032 | 6289 | 6384 | 34912 |
| 12 | 3689 | 5258 | 2531 | 2896 | 3811 | 4027 | 6279 | 6374 | 34865 |
| 13 | 3687 | 5250 | 2527 | 2892 | 3804 | 4020 | 6269 | 6364 | 34813 |
| 14 | 3684 | 5242 | 2523 | 2888 | 3798 | 4013 | 6260 | 6354 | 34762 |
| 15 | 3679 | 5234 | 2519 | 2883 | 3793 | 4007 | 6250 | 6344 | 34709 |

``` r

## Mid-Year Population

knitr::kable(
  results[, c(1, 11:19)],
  format = "pipe"
)
```

| ModelYear | N_adult_male_mid | N_adult_female_mid | N_y1_male_mid | N_y1_female_mid | N_yearling_male_mid | N_yearling_female_mid | birth_male_fawn | birth_female_fawn | N_midyear |
|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| 1 | 6063 | 8748 | 2565 | 3576 | 2628 | 3556 | 10215 | 10215 | 47566 |
| 2 | 5310 | 8093 | 1821 | 2653 | 5376 | 5489 | 9146 | 9146 | 47034 |
| 3 | 4365 | 7036 | 3725 | 4096 | 4812 | 4914 | 9397 | 9397 | 47742 |
| 4 | 5079 | 7349 | 3334 | 3667 | 4945 | 5049 | 9318 | 9318 | 48059 |
| 5 | 5240 | 7255 | 3426 | 3768 | 4903 | 5007 | 9319 | 9319 | 48237 |
| 6 | 5398 | 7264 | 3397 | 3737 | 4904 | 5007 | 9302 | 9302 | 48311 |
| 7 | 5472 | 7248 | 3398 | 3737 | 4895 | 4998 | 9288 | 9288 | 48324 |
| 8 | 5517 | 7238 | 3391 | 3730 | 4887 | 4991 | 9274 | 9274 | 48302 |
| 9 | 5539 | 7228 | 3386 | 3724 | 4880 | 4983 | 9260 | 9260 | 48260 |
| 10 | 5548 | 7216 | 3382 | 3718 | 4873 | 4975 | 9245 | 9245 | 48202 |
| 11 | 5551 | 7204 | 3376 | 3712 | 4865 | 4968 | 9230 | 9230 | 48136 |
| 12 | 5548 | 7193 | 3371 | 3707 | 4857 | 4960 | 9216 | 9216 | 48068 |
| 13 | 5543 | 7182 | 3365 | 3701 | 4849 | 4952 | 9202 | 9202 | 47996 |
| 14 | 5536 | 7171 | 3360 | 3695 | 4843 | 4944 | 9187 | 9187 | 47923 |
| 15 | 5528 | 7160 | 3355 | 3689 | 4835 | 4937 | 9173 | 9173 | 47850 |

``` r

## Preharvest Population

knitr::kable(
  results[, c(1, 20:28)],
  format = "pipe"
)
```

| ModelYear | N_adult_male_preh | N_adult_female_preh | N_y1_male_preh | N_y1_female_preh | N_yearling_male_preh | N_yearling_female_preh | N_fawn_male_preh | N_fawn_female_preh | N_preharvest |
|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| 1 | 5661 | 8114 | 2395 | 3317 | 2442 | 3384 | 8797 | 8797 | 42907 |
| 2 | 4958 | 7506 | 1700 | 2461 | 4995 | 5223 | 7876 | 7876 | 42595 |
| 3 | 4076 | 6526 | 3478 | 3799 | 4471 | 4676 | 8092 | 8092 | 43210 |
| 4 | 4742 | 6816 | 3113 | 3401 | 4594 | 4805 | 8024 | 8024 | 43519 |
| 5 | 4893 | 6729 | 3199 | 3495 | 4555 | 4765 | 8025 | 8025 | 43686 |
| 6 | 5040 | 6737 | 3172 | 3466 | 4556 | 4765 | 8011 | 8011 | 43758 |
| 7 | 5109 | 6722 | 3173 | 3466 | 4548 | 4756 | 7999 | 7999 | 43772 |
| 8 | 5151 | 6713 | 3166 | 3460 | 4540 | 4749 | 7987 | 7987 | 43753 |
| 9 | 5172 | 6704 | 3161 | 3454 | 4534 | 4742 | 7974 | 7974 | 43715 |
| 10 | 5180 | 6693 | 3158 | 3448 | 4527 | 4734 | 7962 | 7962 | 43664 |
| 11 | 5183 | 6682 | 3152 | 3443 | 4520 | 4728 | 7949 | 7949 | 43606 |
| 12 | 5180 | 6671 | 3147 | 3438 | 4512 | 4720 | 7937 | 7937 | 43542 |
| 13 | 5175 | 6661 | 3142 | 3433 | 4505 | 4712 | 7925 | 7925 | 43478 |
| 14 | 5169 | 6651 | 3137 | 3427 | 4499 | 4705 | 7912 | 7912 | 43412 |
| 15 | 5161 | 6641 | 3133 | 3422 | 4492 | 4698 | 7900 | 7900 | 43347 |

``` r

## Harvest Trajectory

knitr::kable(
  results[, c(1, 29:37)],
  format = "pipe"
)
```

| ModelYear | N_adult_male_mharvest | N_adult_female_mharvest | N_y1_male_mharvest | N_y1_female_mharvest | N_yearling_male_mharvest | N_yearling_female_mharvest | N_fawn_male_mharvest | N_fawn_female_mharvest | N_mharvest |
|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| 1 | 1245 | 1055 | 287 | 232 | 171 | 305 | 264 | 176 | 3735 |
| 2 | 1091 | 976 | 204 | 172 | 350 | 470 | 236 | 158 | 3657 |
| 3 | 897 | 848 | 417 | 266 | 313 | 421 | 243 | 162 | 3567 |
| 4 | 1043 | 886 | 374 | 238 | 322 | 432 | 241 | 160 | 3696 |
| 5 | 1076 | 875 | 384 | 245 | 319 | 429 | 241 | 160 | 3729 |
| 6 | 1109 | 876 | 381 | 243 | 319 | 429 | 240 | 160 | 3757 |
| 7 | 1124 | 874 | 381 | 243 | 318 | 428 | 240 | 160 | 3768 |
| 8 | 1133 | 873 | 380 | 242 | 318 | 427 | 240 | 160 | 3773 |
| 9 | 1138 | 872 | 379 | 242 | 317 | 427 | 239 | 159 | 3773 |
| 10 | 1140 | 870 | 379 | 241 | 317 | 426 | 239 | 159 | 3771 |
| 11 | 1140 | 869 | 378 | 241 | 316 | 426 | 238 | 159 | 3767 |
| 12 | 1140 | 867 | 378 | 241 | 316 | 425 | 238 | 159 | 3764 |
| 13 | 1138 | 866 | 377 | 240 | 315 | 424 | 238 | 158 | 3756 |
| 14 | 1137 | 865 | 376 | 240 | 315 | 423 | 237 | 158 | 3751 |
| 15 | 1135 | 863 | 376 | 240 | 314 | 423 | 237 | 158 | 3746 |

``` r

## Model Lambda

knitr::kable(
  results[, c(1, 38)],
  format = "pipe"
)
```

| ModelYear | Lambda |
|----------:|-------:|
|         1 |     NA |
|         2 |   0.99 |
|         3 |   1.01 |
|         4 |   1.01 |
|         5 |   1.00 |
|         6 |   1.00 |
|         7 |   1.00 |
|         8 |   1.00 |
|         9 |   1.00 |
|        10 |   1.00 |
|        11 |   1.00 |
|        12 |   1.00 |
|        13 |   1.00 |
|        14 |   1.00 |
|        15 |   1.00 |

``` r


#Preharvest Population Plot
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
