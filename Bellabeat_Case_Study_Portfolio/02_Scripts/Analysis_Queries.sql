/*
  Bellabeat Data Analysis Project
  Author: Amna Muzzammil
  Date: 2026-01-15
  Description: SQL queries for data cleaning and user segmentation
*/

-- 1. Check for duplicates in the primary key (Id)
SELECT
  Id,
  COUNT(*) as duplicate_count
FROM
  daily_activity
GROUP BY
  Id
HAVING
  COUNT(*) > 1;

-- 2. Analysis: Calculate average daily steps and calories per user
SELECT
  Id,
  AVG(TotalSteps) AS avg_daily_steps,
  AVG(Calories) AS avg_daily_calories
FROM
  daily_activity
GROUP BY
  Id
ORDER BY
  avg_daily_steps DESC;

-- 3. Segmentation: Categorize users by activity level
-- (Sedentary < 5000 steps, Active > 10000 steps)
SELECT
  Id,
  CASE
    WHEN AVG(TotalSteps) < 5000 THEN 'Sedentary'
    WHEN AVG(TotalSteps) BETWEEN 5000 AND 10000 THEN 'Lightly Active'
    WHEN AVG(TotalSteps) > 10000 THEN 'Very Active'
  END AS User_Segment
FROM
  daily_activity
GROUP BY
  Id;