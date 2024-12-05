select GROUP_CONCAT(val separator '') from (select id, value, char(value) val
                               from letters_a
                               where char(value) regexp binary '^[a-zA-Z !"''\(\),\-.:;?]+$'
                               union all
                               select id, value, char(value)
                               from letters_b
                               where char(value) regexp binary '^[a-zA-Z !"''\(\),\-.:;?]+$'
                               order by 1) a;
