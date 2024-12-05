

select c.name,  replace(l.wishes->'$.first_choice','"','') primary_wish,
       replace(l.wishes->'$.second_choice','"','') backup_wish,
       replace(l.wishes->'$.colors[0]','"','') favorite_color,
       JSON_LENGTH(l.wishes->'$.colors') color_count,
       case when difficulty_to_make = 1 then 'Simple Gift'
            when difficulty_to_make = 2 then 'Moderate Gift'
            when difficulty_to_make >= 3 then 'Complex Gift' end as gift_complexity,
       case when t.category = 'outdoor' then 'Outside Workshop'
           when t.category = 'educational' then 'Learning Workshop'
           else 'General Workshop' end workshop_assignment
       from wish_lists l, children c, toy_catalogue t
where l.child_id = c.child_id
and l.wishes->'$.first_choice' = t.toy_name
order by c.name;
