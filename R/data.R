#' Households data
#'
#' Household data from the ECV for the years 2005, 2011, and 2019.
#'
#' @format A tibble (see [tibble::tibble-package]) with columns:
#' \describe{
#'   \item{id_hh}{Household identifier.}
#'   \item{ecv_year}{The year the survey was conducted. Data refer to
#'   the previous year.}
#'   \item{region}{Autonomous Community indicator. Values:
#'      \tabular{ll}{
#'        AND \tab Andalucía \cr
#'        ARA \tab Aragón \cr
#'        AST \tab Asturias \cr
#'        BAL \tab Baleares \cr
#'        CNR \tab Canarias \cr
#'        CNT \tab Cantabria \cr
#'        CYL \tab Castilla y León \cr
#'        CLM \tab Castilla La Mancha\cr
#'        CAT \tab Cataluña \cr
#'        VAL \tab Valencia \cr
#'        EXT \tab Extremadura \cr
#'        GAL \tab Galicia \cr
#'        MAD \tab Madrid \cr
#'        MUR \tab Murcia \cr
#'        NAV \tab Navarra \cr
#'        PVA \tab País Vasco \cr
#'        RIO \tab La Rioja \cr
#'        CEU \tab Ceuta \cr
#'        MEL \tab Melilla \cr
#'      }
#'   }
#'   \item{cluster}{Primary sampling unit indicator.}
#'   \item{weight_hh}{Household population weight.}
#'   \item{urb}{Degree of urbanisation. Factor levels: 'Low', 'Med', and 'High'.}
#'   \item{size_hh}{Number of persons per household}
#'   \item{type_hh}{Household type. Factor levels:
#'      \tabular{ll}{
#'        HH_01 \tab One member: a man aged less than 30. \cr
#'        HH_02 \tab One member: a man aged between 30 and 64. \cr
#'        HH_03 \tab One member: a man aged 65 or more. \cr
#'        HH_04 \tab One member: a woman aged less than 30. \cr
#'        HH_05 \tab One member: a woman aged between 30 and 64. \cr
#'        HH_06 \tab One member: a woman aged 65 or more. \cr
#'        HH_07 \tab Two adults without dependent children and at least
#'          one person aged 65 or more. \cr
#'        HH_08 \tab Two adults without dependent children and both of them
#'          aged less than 65.  \cr
#'        HH_09 \tab Other households without dependent children. \cr
#'        HH_10 \tab One adult with at least one dependent child. \cr
#'        HH_11 \tab Two adults with one dependent child. \cr
#'        HH_12 \tab Two adults with two dependent children. \cr
#'        HH_13 \tab Two adults with three or more dependent children.  \cr
#'        HH_14 \tab Other households with dependent children.\cr
#'      }
#'   }
#'   \item{cunits_hh}{Consumption units: Modified OECD equivalence scale.}
#'   \item{ydisp_hh}{Household disposable income.}
#'   \item{pov_hh}{At risk of poverty indicator.}
#'   \item{depriv_hh}{Severe material deprivation indicator.}
#' }
#'
#' @source \href{https://ine.es/dyngs/INEbase/en/operacion.htm?c=Estadistica_C&cid=1254736176807&menu=resultados&secc=1254736195153&idp=1254735976608#!tabs-1254736195153}{Microdata at INE, the Spanish Statistical Office}
'households'

#' Individuals data
#'
#' Personal data from the ECV for the years 2005, 2011, and 2019.
#'
#' @format A tibble (see [tibble::tibble-package]) with columns:
#'  \describe{
#'   \item{id_p}{Person identifier.}
#'   \item{id_hh}{Household identifier.}
#'   \item{ecv_year}{The year the survey was conducted. Data refer to
#'   the previous year.}
#'   \item{birth_year}{The year of birth.}
#'   \item{age}{Age, in years.}
#'   \item{sex}{Factor with levels `Female` and `Male`.}
#'   \item{absent}{Is the individual temporarily absent?}
#'   \item{lowjob}{Does the individual live in a household with low work intensity? }
#'   \item{eu2020}{Europe 2020 indicator on poverty and social exclusion.}
#'   \item{weight_p16}{Weight for individuals over 16 years old.}
#'   \item{country_birth}{Country of birth: factor with levels `Spain`, `EU` and `Other`.}
#'   \item{nationality}{Nationality: factor with levels `Spain`, `EU` and `Other`.}
#'   \item{educ_year}{Year in which the individual achieved the highest educational level.}
#'   \item{educ}{Education level. Factor with levels: `No`, `Prim`, `Sec 1st`, `Sec 2nd` and `Tert`.}
#'   \item{work_age}{Age at which the individual started working.}
#'   \item{work_years}{Years working.}
#'   \item{full_time}{Working full-time.}
#'   \item{part_time}{Working part-time.}
#'   \item{self}{Self-employed?}
#'   \item{worker}{Employee?}
#'   \item{unempl}{Unemployed?}
#'   \item{inactive}{Inactive?}
#'   \item{has_worked}{Has the individual ever worked?}
#'   \item{occup}{ISCO-08 occupation major group. Factor levels:
#'      \tabular{ll}{
#'        ISCO-1	\tab Managers. \cr
#'        ISCO-2	\tab Professionals. \cr
#'        ISCO-3	\tab Technicians and Associate Professionals. \cr
#'        ISCO-4	\tab Clerical Support Workers. \cr
#'        ISCO-5	\tab Services and Sales Workers. \cr
#'        ISCO-6	\tab Skilled Agricultural, Forestry and Fishery Workers. \cr
#'        ISCO-7	\tab Craft and Related Trades Workers. \cr
#'        ISCO-8	\tab Plant and Machine Operators and Assemblers. \cr
#'        ISCO-9	\tab Elementary Occupations. \cr
#'        ISCO-0	\tab Armed Forces Occupations. \cr
#'      }}
#' }
#' @source \href{https://ine.es/dyngs/INEbase/en/operacion.htm?c=Estadistica_C&cid=1254736176807&menu=resultados&secc=1254736195153&idp=1254735976608#!tabs-1254736195153}{Microdata at INE, the Spanish Statistical Office}
'individuals'

#' Intergenerational transmission of poverty data
#'
#' Data from the ECV for the years 2005, 2011, and 2019.
#'
#' @format A tibble (see [tibble::tibble-package]) with columns:
#'  \describe{
#'   \item{id_p}{Person identifier.}
#'   \item{ecv_year}{The year the survey was conducted. Data refer to
#'   the previous year.}
#'   \item{age}{Age, in years.}
#'   \item{mabsent}{}
#'   \item{fabsent}{}
#'   \item{adults}{}
#'   \item{children}{}
#'   \item{siblings}{}
#'   \item{nworking}{}
#'   \item{fcountry}{}
#'   \item{fnation}{}
#'   \item{mcountry}{}
#'   \item{mnation}{}
#'   \item{feduc}{}
#'   \item{meduc}{}
#'   \item{fworker}{}
#'   \item{fself}{}
#'   \item{funempl}{}
#'   \item{finactive}{}
#'   \item{foccup}{}
#'   \item{mworker}{}
#'   \item{mself}{}
#'   \item{munempl}{}
#'   \item{minactive}{}
#'   \item{moccup}{}
#'   \item{well_being}{}
#'   \item{fin_hardship}{}
#' }
#' @source \href{https://ine.es/dyngs/INEbase/en/operacion.htm?c=Estadistica_C&cid=1254736176807&menu=resultados&secc=1254736195153&idp=1254735976608#!tabs-1254736195153}{Microdata at INE, the Spanish Statistical Office}
'pov_trans'
