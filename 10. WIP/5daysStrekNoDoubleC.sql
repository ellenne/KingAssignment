SELECT COUNT( DISTINCT Tbl.users ) AS Users_5days_Streak

FROM 
(
  SELECT DISTINCT ACT.playerid as users

  FROM abtest.activity AS ACT
  JOIN abtest.assignment AS A
  ON ACT.playerid = A.playerid

  WHERE 1=1
  AND A.abtest_group = 'A'
  AND ACT.activity_date BETWEEN '2017-04-21' AND '2017-04-25'
  AND ACT.playerid IN (

  SELECT DISTINCT ACT2.playerid
  FROM abtest.activity AS ACT2
  WHERE ACT2.activity_date BETWEEN '2017-04-22' AND '2017-04-26'
  )

  AND ACT.playerid IN (

  SELECT ACT3.playerid
  FROM abtest.activity AS ACT3
  WHERE ACT3.activity_date BETWEEN '2017-04-23' AND '2017-04-27'
  )

  AND ACT.playerid IN (

  SELECT ACT4.playerid
  FROM abtest.activity AS ACT4
  WHERE ACT4.activity_date BETWEEN '2017-04-24' AND '2017-04-28'
  )

  AND ACT.playerid IN (

  SELECT ACT5.playerid
  FROM abtest.activity AS ACT5
  WHERE ACT5.activity_date BETWEEN '2017-04-25' AND '2017-04-29'
  )


  AND ACT.playerid IN (

  SELECT ACT6.playerid
  FROM abtest.activity AS ACT6
  WHERE ACT6.activity_date BETWEEN '2017-04-26' AND '2017-04-30'
  )


  AND ACT.playerid IN (

  SELECT ACT7.playerid
  FROM abtest.activity AS ACT7
  WHERE ACT7.activity_date BETWEEN '2017-04-27' AND '2017-05-01'
  )


  AND ACT.playerid IN (

  SELECT ACT8.playerid
  FROM abtest.activity AS ACT8
  WHERE ACT8.activity_date BETWEEN '2017-04-28' AND '2017-05-02'
  )

  AND ACT.playerid IN (

  SELECT ACT9.playerid
  FROM abtest.activity AS ACT9
  WHERE ACT9.activity_date BETWEEN '2017-04-29' AND '2017-05-03'
  )

  AND ACT.playerid IN (

  SELECT ACT10.playerid
  FROM abtest.activity AS ACT10
  WHERE ACT10.activity_date BETWEEN '2017-04-30' AND '2017-05-04'
  )

  AND ACT.playerid IN (

  SELECT ACT11.playerid
  FROM abtest.activity AS ACT11
  WHERE ACT11.activity_date BETWEEN '2017-05-01' AND '2017-05-05'
  )

  AND ACT.playerid IN (

  SELECT ACT12.playerid
  FROM abtest.activity AS ACT12
  WHERE ACT12.activity_date BETWEEN '2017-05-02' AND '2017-05-06'
  )

  AND ACT.playerid IN (

  SELECT ACT13.playerid
  FROM abtest.activity AS ACT13
  WHERE ACT13.activity_date BETWEEN '2017-05-03' AND '2017-05-07'
  )

  AND ACT.playerid IN (

  SELECT ACT14.playerid
  FROM abtest.activity AS ACT14
  WHERE ACT14.activity_date BETWEEN '2017-05-04' AND '2017-05-08'
  )

  AND ACT.playerid IN (

  SELECT ACT15.playerid
  FROM abtest.activity AS ACT15
  WHERE ACT15.activity_date BETWEEN '2017-05-05' AND '2017-05-09'
  )

  AND ACT.playerid IN (

  SELECT ACT16.playerid
  FROM abtest.activity AS ACT16
  WHERE ACT16.activity_date BETWEEN '2017-05-06' AND '2017-05-10'
  )

  AND ACT.playerid IN (

  SELECT ACT17.playerid
  FROM abtest.activity AS ACT17
  WHERE ACT17.activity_date BETWEEN '2017-05-07' AND '2017-05-11'
  )

  AND ACT.playerid IN (

  SELECT ACT18.playerid
  FROM abtest.activity AS ACT18
  WHERE ACT18.activity_date BETWEEN '2017-05-08' AND '2017-05-12'
  )

  AND ACT.playerid IN (

  SELECT ACT19.playerid
  FROM abtest.activity AS ACT19
  WHERE ACT19.activity_date BETWEEN '2017-05-09' AND '2017-05-13'
  )

  AND ACT.playerid IN (

  SELECT ACT20.playerid
  FROM abtest.activity AS ACT20
  WHERE ACT20.activity_date BETWEEN '2017-05-10' AND '2017-05-14'
  )

  AND ACT.playerid IN (

  SELECT ACT21.playerid
  FROM abtest.activity AS ACT21
  WHERE ACT21.activity_date BETWEEN '2017-05-11' AND '2017-05-15'
  )

  AND ACT.playerid IN (

  SELECT ACT22.playerid
  FROM abtest.activity AS ACT22
  WHERE ACT22.activity_date BETWEEN '2017-05-12' AND '2017-05-16'
  )

  AND ACT.playerid IN (

  SELECT ACT23.playerid
  FROM abtest.activity AS ACT23
  WHERE ACT23.activity_date BETWEEN '2017-05-13' AND '2017-05-17'
  )

  AND ACT.playerid IN (

  SELECT ACT24.playerid
  FROM abtest.activity AS ACT24
  WHERE ACT24.activity_date BETWEEN '2017-05-14' AND '2017-05-18'
  )

  AND ACT.playerid IN (

  SELECT ACT25.playerid
  FROM abtest.activity AS ACT25
  WHERE ACT25.activity_date BETWEEN '2017-05-15' AND '2017-05-19'
  )

  AND ACT.playerid IN (

  SELECT ACT26.playerid
  FROM abtest.activity AS ACT26
  WHERE ACT26.activity_date BETWEEN '2017-05-16' AND '2017-05-20'
  )

  AND ACT.playerid IN (

  SELECT ACT27.playerid
  FROM abtest.activity AS ACT27
  WHERE ACT27.activity_date BETWEEN '2017-05-17' AND '2017-05-21'
  )

  AND ACT.playerid IN (

  SELECT ACT28.playerid
  FROM abtest.activity AS ACT28
  WHERE ACT28.activity_date BETWEEN '2017-05-18' AND '2017-05-22'
  )
  
 ) AS Tbl