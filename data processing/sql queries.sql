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
