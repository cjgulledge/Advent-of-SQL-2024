//psql 
WITH final_table AS (
SELECT
    id,
    CASE
        WHEN xpath('name(/*)', menu_data::xml)::text[] @> ARRAY['polar_celebration']
        THEN (xpath('//total_present/text()', menu_data::XML))[1]::TEXT::int
        WHEN xpath('name(/*)', menu_data::xml)::text[] @> ARRAY['northpole_database']
        THEN (xpath('//total_count/text()', menu_data::XML))[1]::TEXT::int
        WHEN xpath('name(/*)', menu_data::xml)::text[] @> ARRAY['christmas_feast']
        THEN (xpath('//total_guests/text()', menu_data::XML))[1]::TEXT::int
    END AS total_present,
    UNNEST(xpath('//food_item_id/text()', menu_data::xml)::text[]) AS food_item_ids
FROM
    christmas_menus
    )
SELECT
  food_item_ids, count(*)
FROM
  final_table
WHERE
  total_present > 78
GROUP BY
  food_item_ids
ORDER BY
  count(*) DESC
LIMIT 1;
