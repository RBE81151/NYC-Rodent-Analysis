SELECT
    borough,
    COUNT(*) FILTER (WHERE result = 'Rat Activity') AS rat_activity_count,
    COUNT(*) FILTER (WHERE result = 'Passed')       AS passed_count,
    ROUND(
        COUNT(*) FILTER (WHERE result = 'Rat Activity') * 100.0 /
        COUNT(*) FILTER (WHERE result IN ('Rat Activity','Passed')), 2
    ) AS rat_activity_percent
FROM rodents
WHERE borough IS NOT NULL AND TRIM(borough) <> ''
GROUP BY borough
ORDER BY rat_activity_count DESC;
