select field_name, harvest_year, season,
       round(avg(trees_harvested) over (partition by field_name  order by harvest_year, seasons  ROWS BETWEEN 2 PRECEDING AND CURRENT ROW),2) three_season_avg
from (
select field_name, harvest_year,season,
       case when season = 'Spring' then 1
            when season = 'Summer' then 2
            when season = 'Fall' then 3
            when season = 'Winter' then 4
        end as seasons, trees_harvested
from treeharvests order by field_name, harvest_year, seasons)
z order by three_season_avg desc;

