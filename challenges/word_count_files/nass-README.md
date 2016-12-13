# nass

Data from: http://www.nhtsa.gov/Data/National-Automotive-Sampling-System-(NASS)

In development: **Currently only CDS from 2015**

## Crashworthiness Data System (CDS)
http://www.nhtsa.gov/Data/National-Automotive-Sampling-System-(NASS)/NASS-Crashworthiness-Data-System

> NASS CDS has detailed data on a representative, random sample of thousands of minor, serious, and fatal crashes. Field research teams located at Primary Sampling Units (PSU's) across the country study about 5,000 crashes a year involving passenger cars, light trucks, vans, and utility vehicles. Trained crash investigators obtain data from crash sites, studying evidence such as skid marks, fluid spills, broken glass, and bent guard rails. They locate the vehicles involved, photograph them, measure the crash damage, and identify interior locations that were struck by the occupants. These researchers follow up on their on-site investigations by interviewing crash victims and reviewing medical records to determine the nature and severity of injuries.

## General Estimates System (GES)
http://www.nhtsa.gov/Data/National-Automotive-Sampling-System-(NASS)/NASS-General-Estimates-System

> In order for a crash to be eligible for the GES sample a police accident report (PAR) must be completed, it must involve at least one motor vehicle traveling on a traffic way, and the result must be property damage, injury, or death.
>
> These accident reports are chosen from 60 areas that reflect the geography, roadway mileage, population, and traffic density of the U.S. GES data collectors make weekly visits to approximately 400 police jurisdictions in the 60 areas across the United States, where they randomly sample about 50,000 PARs each year. The collectors obtain copies of the PARs and send them to a central contractor for coding. No other data are collected beyond the selected PARs.

## To Do List

* Tidy `cds_acc_desc` to have one record per case (e.g. concatenate multi-row description)
* Improve documentation
* Add more years of CDS data
* Add GES data

