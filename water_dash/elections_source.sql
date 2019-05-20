SELECT
    place.name AS place_name,
    DATE(trend.timestamp) AS date,
    trend.topic,
    trend.volume
FROM trend
INNER JOIN place ON trend.place_id = place.id
WHERE place.name = 'South Africa'
    AND (
       trend.topic LIKE '%vote%'
    OR trend.topic LIKE '%voting%'
    OR trend.topic LIKE '%my%id%'
    OR trend.topic LIKE '%make%mark%'
    OR trend.topic LIKE '%decide%'
    OR (trend.topic LIKE '%elect%' AND trend.topic NOT LIKE '%selective%')
    OR (trend.topic LIKE '%iec%' AND trend.topic != '4 Piece Shopper Bag Set')
    OR trend.topic LIKE '%rally%'
    OR trend.topic LIKE '%one%sa%'
    OR trend.topic LIKE '%politic%'
    OR trend.topic LIKE '%register%'
    OR trend.topic LIKE '%south%africa%'

    OR trend.topic LIKE '%nandos%'

    OR trend.topic LIKE '%xse%'
    OR trend.topic LIKE '%Xsê%'

    OR trend.topic LIKE '%agang%'

    OR trend.topic LIKE '%our%da%'
    OR (trend.topic LIKE '#da%' AND trend.topic NOT LIKE '#date%' AND trend.topic NOT LIKE '%#dave%' AND trend.topic NOT LIKE '#dare%' AND trend.topic NOT LIKE '#dayone%')
    OR trend.topic LIKE '%khula%'

    OR (trend.topic LIKE '%eff%' AND trend.topic NOT LIKE '%jeff%' AND trend.topic != '#ReeceEffect')
    OR trend.topic LIKE '%nqoba%'
    OR trend.topic LIKE '%our%land%'
    OR trend.topic LIKE '%julias%'
    OR trend.topic LIKE '%malema%'

    OR trend.topic LIKE '%atm%'
    OR (
           trend.topic LIKE '%anc%'
       AND trend.topic NOT LIKE '%manc%'
       AND trend.topic NOT LIKE '%fiance%'
       AND trend.topic NOT IN ('sanchez', 'Sanchez', '#balanceforbetter', '#Vancouver7s', 'esperance', 'Routine Road Maintenance', '#carteblanche', '#CarteBlanche', 'Special Branch', '#DanciaDancia', '#sauvignonblancday')
       )
    OR trend.topic LIKE '%blf%'

    OR trend.topic LIKE '%purple%cow%'

    OR trend.topic LIKE '%thabo%'
    OR trend.topic LIKE '%mbeki%'
)
ORDER BY place_name ASC,
         date DESC,
         topic ASC
;
