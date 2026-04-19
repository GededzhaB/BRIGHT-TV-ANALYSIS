select * from `workspace`.`viewship`.`viewership limit 100;
outter join from `workspace`.`userprofiles`.`user_profiles'

   --1. all Viewership columns
 SELECT
 v.UserID0,
 v.Channel2,
 v.RecordDate2,
 v'Duration 2',

 ----2. All user profiles
 u.Name,
 u.surname,
 u.Email,
 u.Gender,
 u.Race,
 u.age,
 u. province,
 u.'Social media handle',
-----------------------------
   3. classfication of age
 CASE
 WHEN u.age >50 THEN 'Senior'
 WHEN u.age BETWEEN 30 AND 49 THEN 'Adult'
WHEN u.age BETWEEN 20 AND 29 THEN 'Young_Adult'
WHEN u.age BETWEEN 12 AND 19 THEN 'Teenager'
ELSE 'Child'
END AS Age_classification,
-----------------------------------------------------------
----most channel watched
SELECT v.channel2, COUNT(v.channel) AS most_watched_channel
FROM `workspace`.`viewship`.`viewership` v
LEFT JOIN `workspace`.`userprofiles`.`user_profiles` u
ON v.UserID = u.UserID
GROUP BY v.channel2
ORDER BY most_watched_channel DESC;
-----------------------------------------------------------------
-- Convert time record2
SELECT from_utc_timestamp(v.RecordDate2,'Africa/johannesburg') AS SA_Converted_time
FROM `workspace`.`viewship`.`viewership` v
LEFT JOIN `workspace`.`userprofiles`.`user_profiles` u
ON v.UserID = u.UserID;
--------------------------------------------------------------------------
-- CASE STATEMENT of how long the channel is watched
SELECT v.UserID, u.surname,
CASE
  WHEN date_format(v.`Duration 2`, 'HH:mm:ss') BETWEEN '00:00:00' AND '00:09:59' THEN 'Too short'
  WHEN date_format(v.`Duration 2`, 'HH:mm:ss') BETWEEN '00:10:00' AND '00:19:59' THEN 'Moderate'
  WHEN date_format(v.`Duration 2`, 'HH:mm:ss') BETWEEN '00:20:00' AND '00:59:59' THEN 'satisfactory'
  ELSE 'Outstanding'
END AS duration_category
FROM `workspace`.`viewship`.`viewership` v
LEFT JOIN `workspace`.`userprofiles`.`user_profiles` u
ON v.UserID = u.UserID
province where BrightTV is watched
SELECT u.province, COUNT(u.province) AS Total_Povinces
FROM  `workspace`.`viewship`
left join `workspace`.`userprofiles`
on v.UserID = u.UserID;
GROUP BY u. province;

-------------------------------------------------------------------------------
----Times and dates in the dataset are supplied in UTC and should be converted to SA
time.

Select from _utc_ timestamp (v.'recorddate2','Africa/johannesburg')AS SA_converted_time
From `workspace`.`viewship`.`viewership` v

------------------------------------------------------
-----time took to watch the channel program
Date_FORMAT(v.RecordDate2, 'yyyy-MM-dd')AS DATE,
Date_FORMAT(v.RecordDate2, 'HH:mm:ss')AS TIME
FROM `workspace`.`viewship`.`viewership` v
Left JOIN `workspace`.`userprofiles`.`user_profiles` u
on v.UserID = u.UserID;
------------------------------------------

