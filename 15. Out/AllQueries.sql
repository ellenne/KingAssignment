-- Query 1
-- Activities by day

SELECT ACT.activity_date AS calendar_day
      , A.abtest_group AS test_group      
      , SUM(ACT.purchases) AS total_purchases
      , SUM(ACT.gameends) AS game_round
      , COUNT(DISTINCT ACT.playerid) AS num_players

FROM abtest.activity AS ACT
JOIN abtest.assignment AS A
ON ACT.playerid = A.playerid

GROUP BY ACT.activity_date
      , A.abtest_group

ORDER BY ACT.activity_date, A.abtest_group

-- Query 2
-- Unique players count

SELECT ACT.activity_date AS calendar_day
      , A.abtest_group AS test_group
      , ACT.playerid AS player
      , SUM(ACT.purchases) AS total_purchases
      , SUM(ACT.gameends) AS game_round
      , COUNT(DISTINCT ACT.playerid) AS total_players

FROM abtest.activity AS ACT
JOIN abtest.assignment AS A
ON ACT.playerid = A.playerid

GROUP BY ACT.activity_date
      , A.abtest_group
      , ACT.playerid

ORDER BY ACT.activity_date, A.abtest_group

-- Query 3
-- Conversion by period

SELECT A.abtest_group   
    ,CASE
        WHEN ACT.activity_date < '2017-05-04' THEN 'pre-study'
        WHEN ACT.activity_date >= '2017-05-04' AND ACT.activity_date <= '2017-05-22' THEN 'study'
        ELSE 'error'
     END AS study_period
     ,SUM(ACT.purchases) AS purchases
     ,SUM(ACT.gameends) AS games_played
     
FROM abtest.activity AS ACT
JOIN abtest.assignment AS A
ON ACT.playerid = A.playerid

--WHERE A.abtest_group = 'A'

GROUP BY A.abtest_group, study_period

ORDER BY 2,1

-- Query 4
-- Conversion with unique users

SELECT A.abtest_group   
    ,CASE
        WHEN ACT.activity_date < '2017-05-04' THEN 'pre-study'
        WHEN ACT.activity_date >= '2017-05-04' AND ACT.activity_date <= '2017-05-22' THEN 'study'
        ELSE 'error'
     END AS study_period
     ,SUM(ACT.purchases) AS purchases
     ,SUM(ACT.gameends) AS games_played
     ,COUNT(ACT.playerid) AS total_count_players
     ,COUNT(DISTINCT ACT.playerid) AS total_count_distinct_players
     
FROM abtest.activity AS ACT
JOIN abtest.assignment AS A
ON ACT.playerid = A.playerid

--WHERE A.abtest_group = 'A'

GROUP BY A.abtest_group, study_period

ORDER BY 2,1

-- Query 5
-- Query for Table 1 in the report 

SELECT A.abtest_group as groupings
      ,CASE
        WHEN ACT.activity_date BETWEEN '2017-04-21' AND '2017-05-03' THEN 'pre-study'
        WHEN ACT.activity_date BETWEEN '2017-05-04' AND '2017-05-22' THEN 'study'
        ELSE 'error'
      END AS period
      ,COUNT(ACT.playerid) as users
      ,COUNT(DISTINCT ACT.playerid) AS unique_users
      ,SUM(ACT.gameends) AS gamerounds
      ,SUM(ACT.purchases) AS purchases
      ,SUM(ACT.gameends) / COUNT(DISTINCT ACT.playerid) as perc_gamerounds
      ,SUM(ACT.purchases) / COUNT(DISTINCT ACT.playerid) as purc_per_client
      ,SUM(ACT.purchases) / SUM(ACT.gameends) as conversion

FROM abtest.activity AS ACT
JOIN abtest.assignment AS A
ON ACT.playerid = A.playerid

WHERE 1=1
AND ACT.activity_date BETWEEN '2017-04-21' AND '2017-05-22'

GROUP BY 1,2


-- Query 6
-- Basic query for the count of 5-day-streak
-- The idea here is to determine the list of playerid
-- then merge them together and remove the duplicates.
-- This query does a very little part but the Python code
-- in the notebook uses this query


SELECT DISTINCT ACT.playerid AS users

  FROM abtest.activity AS ACT
  JOIN abtest.assignment AS A
  ON ACT.playerid = A.playerid

  WHERE 1=1
  AND A.abtest_group = 'A'
  AND ACT.activity_date = '2017-04-21'
  AND ACT.playerid IN
  (
    SELECT ACT2.playerid
    FROM abtest.activity AS ACT2
    WHERE 1=1
    AND ACT2.activity_date = '2017-04-22'
  )
  AND ACT.playerid IN
  (
    SELECT ACT3.playerid
    FROM abtest.activity AS ACT3
    WHERE 1=1
    AND ACT3.activity_date = '2017-04-23'
  )
  AND ACT.playerid IN
  (
    SELECT ACT4.playerid
    FROM abtest.activity AS ACT4
    WHERE 1=1
    AND ACT4.activity_date = '2017-04-24'
  )
  AND ACT.playerid IN
  (
    SELECT ACT5.playerid
    FROM abtest.activity AS ACT5
    WHERE 1=1
    AND ACT5.activity_date = '2017-04-25'
  )