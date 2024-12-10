 create schema if not exists OCD_Analysis;
 
 -- Count  Pctient of male vs Female that have OCD & -- Average Obsession Score by Gender
 
ALTER TABLE `ocd_analysis`.`ocd_patient_dataset` 
CHANGE COLUMN `Obsession Type` `Obsession_Type` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Compulsion Type` `Compulsion_Type` TEXT NULL DEFAULT NULL ;


SELECT 
  Gender,
  count(Patient_ID) as Total_patient
FROM ocd_analysis.ocd_patient_dataset
group by Gender
order by Total_patient;


--  Count of Patients by Ethnicity and their respective Average Obsession Score

SELECT 
  Ethnicity,
  count(Patient_ID) as Total_patient,
  round(Avg(Obsessions_Score),2) as Obsessions_percentage
FROM ocd_analysis.ocd_patient_dataset
group by Ethnicity
order by Total_patient;

--  Number of people diagnosed with OCD MoM


SELECT 
 year(date) as Year,
 monthname(date) as month,
 count(Patient_ID) as Total_patient_Permonths
 FROM ocd_analysis.ocd_patient_dataset
group by Year,month
order by Total_patient_Permonths;

-- What is the most common Obsession Type (Count) and  it's respective Average Obsession Score

SELECT 
 Obsession_Type,
 count(Patient_ID) as Total_patient,
 round(avg(Obsessions_Score),2) as obs_scor
 FROM ocd_analysis.ocd_patient_dataset
group by Obsession_Type
order by Total_patient;

-- What is the most common Compulsion type and  it's respective Average Compulsion Score

SELECT 
 Compulsion_Type,
 count(Patient_ID) as Total_patient,
 round(avg(Compulsions_Score),2) as comp_scor
 FROM ocd_analysis.ocd_patient_dataset
group by Compulsion_Type
order by Total_patient;
