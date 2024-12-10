select * from (
            SELECT
    date,
    MAX(CASE WHEN drink_name = 'Eggnog' THEN quantity ELSE NULL END) AS eggnog,
    MAX(CASE WHEN drink_name = 'Hot Cocoa' THEN quantity ELSE NULL END) AS hot_cocoa,
    MAX(CASE WHEN drink_name = 'peppermint schnapps' THEN quantity ELSE NULL END) AS peppermint_schnapps,
    MAX(CASE WHEN drink_name = 'Baileys' THEN quantity ELSE NULL END) AS baileys,
    MAX(CASE WHEN drink_name = 'Mulled wine' THEN quantity ELSE NULL END) AS mulled_wine,
    MAX(CASE WHEN drink_name = 'Sherry' THEN quantity ELSE NULL END) AS Sherry
FROM (
    SELECT
        date,
        drink_name,
        SUM(quantity) AS quantity
    FROM Drinks
    GROUP BY date, drink_name
) a
GROUP BY date) z where hot_cocoa=38 and peppermint_schnapps = 298 and eggnog = 198
