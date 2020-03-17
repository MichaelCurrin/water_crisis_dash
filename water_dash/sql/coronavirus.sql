-- Aggregated Corona virus trends
SELECT
    trend.topic,
    DATE(MAX(trend.timestamp)) AS last_trended,
    DATE(MIN(trend.timestamp)) AS first_trended,
    COUNT(DISTINCT(DATE(trend.timestamp))) AS days_mentioned,
    MAX(trend.volume) AS highest_volume
FROM trend
INNER JOIN place ON trend.place_id = place.id
WHERE place.name = 'Worldwide'
 AND (
          trend.topic LIKE '%corona%'
       OR trend.topic LIKE '%covid%'
       OR trend.topic LIKE '%symptom%'
       OR trend.topic LIKE '%confirmed%case%'
       OR trend.topic LIKE '%chinese%virus%'
       OR trend.topic LIKE '%stay%home%'
       OR trend.topic LIKE '%quarantine%'
       OR trend.topic LIKE '%outbreak%'
       OR trend.topic LIKE '%lockdown%'
       OR trend.topic LIKE '%epidemic%'
       OR trend.topic LIKE '%pandemic%'
       OR trend.topic LIKE '%disease%'
     )
GROUP BY trend.topic
ORDER BY last_trended DESC;
