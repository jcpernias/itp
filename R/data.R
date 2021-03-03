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
#'   \item{absent}{Is the individual temporarily absent from the household?}
#'   \item{lowjob}{Does the individual live in a household with low work intensity?}
#'   \item{eu2020}{Europe 2020 indicator on poverty and social exclusion.}
#'   \item{weight_p16}{Weight for individuals over 16 years old.}
#'   \item{country_birth}{Country of birth. Factor with levels:
#'      \tabular{ll}{
#'        Spain	\tab Spain. \cr
#'        EU \tab European Union (EU 28). \cr
#'        Other	\tab Rest of the world. \cr
#'      }}
#'   \item{nationality}{Nationality. Factor with levels: see `country_birth`.}
#'   \item{educ_year}{Year in which the individual achieved the highest educational level.}
#'   \item{educ}{Education level. Factor with levels:
#'      \tabular{ll}{
#'        No	\tab Less than primary education. \cr
#'        Prim \tab Primary education. \cr
#'        LowerSec	\tab Lower secondary education. \cr
#'        UpperSec	\tab Upper secondary education. \cr
#'        Sup	\tab Tertiary education. \cr
#'      }}
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
#' Variables that describe the household of the individuals
#' when they were around 14 years old.
#'
#' @format A tibble (see [tibble::tibble-package]) with columns:
#'  \describe{
#'   \item{id_p}{Person identifier.}
#'   \item{ecv_year}{The year the survey was conducted. Data refer to
#'   the previous year.}
#'   \item{age}{Age, in years.}
#'   \item{mabsent}{Mother absent?}
#'   \item{fabsent}{Father absent?}
#'   \item{adults}{(Not available in the 2005 survey). Number of adults (18 years old or above).}
#'   \item{children}{(Not available in the 2005 survey). Number of children (less tha 18 years old).}
#'   \item{siblings}{(Only in the 2005 survey). Number of siblings.}
#'   \item{nworking}{Number of people with a job.}
#'   \item{fcountry}{(Not available in the 2005 survey). Father's country of birth. Factor with levels:
#'      \tabular{ll}{
#'        Spain	\tab Spain. \cr
#'        EU \tab European Union (EU 28). \cr
#'        Other	\tab Rest of the world. \cr
#'      }}
#'   \item{mcountry}{(Not available in the 2005 survey). Mother's country of birth. Factor with levels: see `fcountry`.}
#'   \item{fnation}{(Not available in the 2005 survey). Father's nationality. Factor with levels: see `fcountry`.}
#'   \item{mnation}{(Not available in the 2005 survey). Mother's nationality. Factor with levels: see `fcountry`.}
#'   \item{feduc}{Father's education level. Factor levels:
#'      \tabular{ll}{
#'        Low	\tab Lower secondary education or less. \cr
#'        Med	\tab Upper secondary education. \cr
#'        Sup	\tab Tertiary education. \cr
#'      }}
#'   \item{meduc}{Mother's education level. Factor levels: see `feduc`}
#'   \item{fworker}{Was the individual's father self-employed?}
#'   \item{mworker}{Was the individual's mother self-employed?}
#'   \item{fself}{Was the individual's father an employee?}
#'   \item{mself}{Was the individual's mother self-employed?}
#'   \item{funempl}{Was the individual's father unemployed?}
#'   \item{munempl}{Was the individual's mother unemployed?}
#'   \item{finactive}{Was the individual's father inactive?}
#'   \item{minactive}{Was the individual's mother unemployed?}
#'   \item{foccup}{ISCO-08 occupation major group for the individual's father. Factor levels:
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
#'   \item{moccup}{ISCO-08 occupation major group for the individual's mother. Factor levels: see `foccup`.}
#'   \item{well_being}{(Not available in the 2005 survey). Household well-being when the individual was a teenager. Factor with levels:
#'      \tabular{l}{
#'        Very bad. \cr
#'        Bad. \cr
#'        Fairly bad. \cr
#'        Fairly good. \cr
#'        Good. \cr
#'        Very good. \cr
#'      }}
#'   \item{fin_hardship}{(Only in the 2005 survey). Financial difficulties at home when the individual was a teenager. Factor with levels:
#'      \tabular{ll}{
#'        Very often. \cr
#'        Often. \cr
#'        Sometimes. \cr
#'        Rarely. \cr
#'        Never. \cr
#'      }}
#'  }
#' @source \href{https://ine.es/dyngs/INEbase/en/operacion.htm?c=Estadistica_C&cid=1254736176807&menu=resultados&secc=1254736195153&idp=1254735976608#!tabs-1254736195153}{Microdata at INE, the Spanish Statistical Office}
'pov_trans'
