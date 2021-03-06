library(tidyverse, warn.conflicts = FALSE)
library(glue, warn.conflicts = FALSE)
options(dplyr.summarise.inform = FALSE)

# Column types for the different ECV files
column_types <- list(
  d = cols(
    .default = '-',
    DB010 = 'i',
    DB030 = 'i',
    DB040 = 'c',
    DB060 = 'i',
    DB090 = 'd',
    DB100 = 'i'),
  h = cols(
    .default = '-',
    HB030 = 'i',
    HX040 = 'i',
    HX060 = 'i',
    HX240 = 'd',
    vhRentaa = 'd',
    vhPobreza = 'i',
    vhMATDEP = 'i'),
  r = cols(
    .default = '-',
    RB010 = 'i',
    RB030 = 'i',
    RB080 = 'i',
    RB090 = 'i',
    RB200 = 'i',
    vrLOWJOB = 'i',
    vrEU2020 = 'i'),
  p = cols(
    .default = '-',
    PB030 = 'i',
    PB040 = 'd',
    PB210 = 'i',
    PB220A = 'i',
    PE030 = 'i',
    PE040 = 'i',
    PE040_F = 'i',
    PL015 = 'i',
    PL030 = 'i',
    PL031 = 'i',
    PL040 = 'i',
    PL050 = 'i',
    PL051 = 'c',
    PL190 = 'i',
    PL200 = 'i',
    PT220 = 'i',
    PT220_F = 'i',
    PT230 = 'i',
    PT240 = 'i',
    PT020 = 'i',
    PT030 = 'i',
    PT040 = 'i',
    PT060 = 'i',
    PT070 = 'i',
    PT090 = 'i',
    PT100 = 'i',
    PT110 = 'i',
    PT120 = 'i',
    PT130 = 'i',
    PT150 = 'c',
    PT160 = 'i',
    PT180 = 'c',
    PT190 = 'i',
    PT200 = 'i',
    PT010 = 'i',
    PT010_F = 'i',
    PM010 = 'i',
    PM010_F = 'i',
    PM035 = 'i',
    PM040 = 'i',
    PM050 = 'i',
    PM060 = 'i',
    PM070 = 'c',
    PM080 = 'i',
    PM090 = 'c',
    PM100 = 'i'
  )
)


#' @param year numeric; one of 2005, 2011, 2019.
#' @param type 'd', 'h', 'r' or 'p'
#' @noRd
read_ecv_file <- function(year, type) {
  stopifnot(type %in% c('d', 'h', 'r', 'p'))
  stopifnot(year %in% c(2005, 2011, 2019))
  ecv_file <-
    file.path('data-raw',
              paste0('esudb',
                     formatC(year - 2000, width = 2, flag = '0'),
                     type, '.csv.gz'))

  ct <- column_types[[type]]

  if (type == 'p') {
    if (year == 2005) {
      ct$cols$PL031 <- NULL
      ct$cols$PL051 <- NULL
      ct$cols$PT010 <- NULL
      ct$cols$PT010_F <- NULL
      ct$cols$PT220 <- NULL
      ct$cols$PT220_F <- NULL
      ct$cols$PT230 <- NULL
      ct$cols$PT240 <- NULL
      ct$cols$PT020 <- NULL
      ct$cols$PT030 <- NULL
      ct$cols$PT040 <- NULL
      ct$cols$PT060 <- NULL
      ct$cols$PT070 <- NULL
      ct$cols$PT090 <- NULL
      ct$cols$PT100 <- NULL
      ct$cols$PT110 <- NULL
      ct$cols$PT120 <- NULL
      ct$cols$PT130 <- NULL
      ct$cols$PT150 <- NULL
      ct$cols$PT160 <- NULL
      ct$cols$PT180 <- NULL
      ct$cols$PT190 <- NULL
      ct$cols$PT200 <- NULL
    } else {
      if (year == 2019) {
        ct$cols$PT010 <- NULL
        ct$cols$PT010_F <- NULL
        ct$cols$PT200 <- NULL
      } else {
        ct$cols$PT220 <- NULL
        ct$cols$PT220_F <- NULL
        ct$cols$PT230 <- NULL
        ct$cols$PT240 <- NULL
      }

      ct$cols$PM010 <- NULL
      ct$cols$PM010_F <- NULL
      ct$cols$PM035 <- NULL
      ct$cols$PM040 <- NULL
      ct$cols$PM050 <- NULL
      ct$cols$PM060 <- NULL
      ct$cols$PM070 <- NULL
      ct$cols$PM080 <- NULL
      ct$cols$PM090 <- NULL
      ct$cols$PM100 <- NULL

      ct$cols$PL030 <- NULL
      ct$cols$PL050 <- NULL
    }
  }
  read_csv(ecv_file, col_types = ct)
}

build_household_db <- function(year) {
  # Basic household data
  d_file_db <- read_ecv_file(year, 'd')

  # Detailed household data
  h_file_db <- read_ecv_file(year, 'h')

  left_join(d_file_db, h_file_db,
            by = c('DB030' = 'HB030'))
}


build_people_db <- function(year) {
  # Basic individual data
  r_file_db <- read_ecv_file(year, 'r')

  # Detailed personal data
  p_file_db <- read_ecv_file(year, 'p')

  left_join(r_file_db, p_file_db,
            by = c('RB030' = 'PB030'))
}

years <- c(2005, 2011, 2019)

ecv_hh <- purrr::map(years, build_household_db) %>% bind_rows()
ecv_p <- purrr::map(years, build_people_db) %>% bind_rows()

# Factor levels
urb_levels <- c('High', 'Med', 'Low')

type_hh_levels <- function(x) {
  glue("HH_{formatC(x, width = 2, flag='0')}")
}

nation_levels <- c('Spain', 'EU', 'Other')
educ_levels <- c('No', 'Prim', 'LowerSec', 'UpperSec', 'Sup')
pov_educ_levels <- c('Low', 'Med', 'High')

well_being_levels <- c('Very bad', 'Bad', 'Fairly bad',
                       'Fairly good', 'Good', 'Very good')
fin_hardship_levels <- c('Very often', 'Often', 'Sometimes',
                         'Rarely', 'Never')
isco_levels <- glue("ISCO-{c(1:9,0)}")

# Region codes
region_table <-
  c(ES61 = 'AND', ES24 = 'ARA', ES12 = 'AST', ES53 = 'BAL', ES70 = 'CNR',
    ES13 = 'CNT', ES41 = 'CYL', ES42 = 'CLM', ES51 = 'CAT', ES52 = 'VAL',
    ES43 = 'EXT', ES11 = 'GAL', ES30 = 'MAD', ES62 = 'MUR', ES22 = 'NAV',
    ES21 = 'PVA', ES23 = 'RIO', ES63 = 'CEU', ES64 = 'MEL')

region_codes <- unname(region_table)


households <- ecv_hh %>%
  transmute(id_hh = as.integer((DB010 - 2000) * 10000000 + DB030),
            ecv_year = factor(DB010, levels = c(2005, 2011, 2019)),
            region = factor(region_table[DB040], levels = region_codes),
            cluster = fct_cross(ecv_year, region, as_factor(DB060)),
            weight_hh = DB090,
            urb = factor(urb_levels[DB100], levels = urb_levels),
            size_hh = HX040,
            type_hh =
              factor(type_hh_levels(HX060),
                     levels = type_hh_levels(1:14)),
            cunits = HX240,
            ydisp_hh = vhRentaa,
            pov_hh = vhPobreza == 1,
            depriv_hh = vhMATDEP == 1)

individuals <- ecv_p %>%
  transmute(id_p = as.integer((RB010 - 2000) * 10000000 + RB030),
            id_hh = as.integer((RB010 - 2000) * 10000000 + trunc(RB030 / 100)),
            ecv_year = factor(RB010, levels = c(2005, 2011, 2019)),
            birth_year = RB080,
            age = as.integer(RB010 - RB080 - 1),
            sex =
              factor(case_when(RB090 == 1 ~ 'Male',
                               RB090 == 2 ~ 'Female'),
                     levels = c('Female', 'Male')),
              absent = RB200 == 2,
            lowjob = vrLOWJOB == 1,
            eu2020 = vrEU2020 == 1,
            weight_p16 = PB040,
            country_birth =
              factor(case_when(PB210 == 1 ~ nation_levels[1],
                               PB210 == 2 ~ nation_levels[2],
                               PB210 > 2 ~ nation_levels[3]),
                     levels = nation_levels),
            nationality =
              factor(case_when(PB220A == 1 ~ nation_levels[1],
                               PB220A == 2 ~ nation_levels[2],
                               PB220A > 2 ~ nation_levels[3]),
                     levels = nation_levels),
            educ_year = PE030,
            educ =
              factor(case_when(PE040 == 0 | PE040_F == -2 ~ educ_levels[1],
                               PE040 %in% c(1, 100) ~ educ_levels[2],
                               PE040 %in% c(2, 200) ~ educ_levels[3],
                               PE040 %in% c(3, 300, 344, 353, 354) ~
                                 educ_levels[4],
                               PE040 %in% c(4, 5, 400, 450, 500) ~
                                 educ_levels[5]),
                     levels = educ_levels),
            work_age = PL190,
            work_years = PL200,
            full_time = PL031 %in% c(1, 3) | PL030 == 1,
            part_time = PL031 %in% c(2, 4) | PL030 == 2,
            self = case_when(ecv_year != 2005 ~ PL031 %in% c(3, 4),
                             ecv_year == 2005 ~ PL040 %in% c(1, 2)),
            worker = case_when(ecv_year != 2005 ~ PL031 %in% c(1, 2),
                               ecv_year == 2005 ~ PL040 == 3),
            unempl = PL031 == 5 | PL030 == 3,
            inactive = PL031 %in% 6:11 | PL030 %in% 4:9,
            has_worked = PL015 == 1,
            occup =
              factor(glue("ISCO-{str_sub(PL051, end = 1)}"),
                     levels = isco_levels))

pov_trans <- ecv_p %>%
  transmute(id_p = as.integer((RB010 - 2000) * 10000000 + RB030),
            ecv_year = factor(RB010, levels = c(2005, 2011, 2019)),
            age = as.integer(RB010 - RB080 - 1),
            eligible =
              case_when(ecv_year == 2019 ~ PT220_F == 1,
                        ecv_year == 2011 ~ PT010_F == 1,
                        ecv_year == 2005 ~ PM010_F == 1),
            institution =
              case_when(ecv_year == 2019 ~ PT220 == 2,
                        ecv_year == 2011 ~ PT010 == 5,
                        ecv_year == 2005 ~ PM010 == 7),
            mabsent =
              case_when(ecv_year == 2019 ~ PT230 != 1,
                        ecv_year == 2011 ~ !(PT010 %in% c(1, 3)),
                        ecv_year == 2005 ~ !(PM010 %in% c(1, 2, 4))),
            fabsent =
              case_when(ecv_year == 2019 ~ PT240 != 1,
                        ecv_year == 2011 ~ !(PT010 %in% c(1, 2)),
                        ecv_year == 2005 ~ !(PM010 %in% c(1, 3, 5))),
            adults = PT020,
            children = PT030,
            siblings = PM035,
            nworking = PT040,
            fcountry =
              factor(case_when(PT060 == 1 ~ nation_levels[1],
                               PT060 == 2 ~ nation_levels[2],
                               PT060 > 2 ~ nation_levels[3]),
                     levels = nation_levels),
            mcountry =
              factor(case_when(PT090 == 1 ~ nation_levels[1],
                               PT090 == 2 ~ nation_levels[2],
                               PT090 > 2 ~ nation_levels[3]),
                     levels = nation_levels),
            fnation =
              factor(case_when(PT070 == 1 ~ nation_levels[1],
                               PT070 == 2 ~ nation_levels[2],
                               PT070 > 2 ~ nation_levels[3]),
                     levels = nation_levels),
            mnation =
              factor(case_when(PT100 == 1 ~ nation_levels[1],
                               PT100 == 2 ~ nation_levels[2],
                               PT100 > 2 ~ nation_levels[3]),
                     levels = nation_levels),
            feduc =
              factor(case_when(PT110 <= 1 | PM040 <= 2 ~ pov_educ_levels[1],
                               PT110 == 2 | PM040 == 3 ~ pov_educ_levels[2],
                               PT110 == 3 | PM040 >= 3 ~ pov_educ_levels[3]),
                     levels = pov_educ_levels),
            meduc =
              factor(case_when(PT120 <= 1 | PM050 <= 2 ~ pov_educ_levels[1],
                               PT120 == 2 | PM050 == 3 ~ pov_educ_levels[2],
                               PT120 == 3 | PM050 >= 3 ~ pov_educ_levels[3]),
                     levels = pov_educ_levels),
            fworker =
              case_when(ecv_year == 2019 ~ PT130 %in% 1:2,
                        ecv_year == 2011 ~ PT130 == 1,
                        ecv_year == 2005 ~ PM060 == 1),
            mworker =
              case_when(ecv_year == 2019 ~ PT160 %in% 1:2,
                        ecv_year == 2011 ~ PT160 == 1,
                        ecv_year == 2005 ~ PM080 == 1),
            fself =
              case_when(ecv_year == 2019 ~ PT130 == 3,
                        ecv_year == 2011 ~ PT130 == 2,
                        ecv_year == 2005 ~ PM060 %in% 2:3),
            mself =
              case_when(ecv_year == 2019 ~ PT160 == 3,
                        ecv_year == 2011 ~ PT160 == 2,
                        ecv_year == 2005 ~ PM080 %in% 2:3),
            funempl =
              case_when(ecv_year == 2019 ~ PT130 == 4,
                        ecv_year == 2011 ~ PT130 == 3,
                        ecv_year == 2005 ~ PM060 == 4),
            munempl =
              case_when(ecv_year == 2019 ~ PT160 == 4,
                        ecv_year == 2011 ~ PT160 == 3,
                        ecv_year == 2005 ~ PM080 == 4),
            finactive =
              case_when(ecv_year == 2019 ~ PT130 %in% 6:8,
                        ecv_year == 2011 ~ PT130 %in% 5:6,
                        ecv_year == 2005 ~ PM060 %in% 5:7),
            minactive =
              case_when(ecv_year == 2019 ~ PT160 %in% 6:8,
                        ecv_year == 2011 ~ PT160 %in% 5:6,
                        ecv_year == 2005 ~ PM080 %in% 5:7),
            foccup0 =
              factor(case_when(ecv_year != 2005 ~ PT150,
                               ecv_year == 2005 ~ str_sub(PM070, end = 1))),
            moccup0 =
              factor(case_when(ecv_year != 2005 ~ PT180,
                               ecv_year == 2005 ~ str_sub(PM090, end = 1))),
            foccup = factor(glue("ISCO-{foccup0}"), levels = isco_levels),
            moccup = factor(glue("ISCO-{moccup0}"), levels = isco_levels),
            well_being =
              factor(case_when(PT190 == 1 ~ well_being_levels[1],
                               PT190 == 2 ~ well_being_levels[2],
                               PT190 == 3 ~ well_being_levels[3],
                               PT190 == 4 ~ well_being_levels[4],
                               PT190 == 5 ~ well_being_levels[5],
                               PT190 == 6 ~ well_being_levels[6]),
                     levels = well_being_levels),
            fin_hardship =
              factor(case_when(PM100 == 1 ~ fin_hardship_levels[1],
                               PM100 == 2 ~ fin_hardship_levels[2],
                               PM100 == 3 ~ fin_hardship_levels[3],
                               PM100 == 4 ~ fin_hardship_levels[4],
                               PM100 == 5 ~ fin_hardship_levels[5]),
                     levels = fin_hardship_levels)) %>%
  filter(eligible == TRUE, institution == FALSE) %>%
  select(-c(eligible, institution, foccup0, moccup0))

usethis::use_data(households, compress = 'xz', overwrite = TRUE)
usethis::use_data(individuals, compress = 'xz', overwrite = TRUE)
usethis::use_data(pov_trans, compress = 'xz', overwrite = TRUE)
