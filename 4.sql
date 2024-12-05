//psql
select toy_id, count(distinct new) newtags from (
select b.toy_id, a.toy_name, prev,new from (select toy_id, toy_name, unnest(previous_tags) prev from toy_production) a
full outer join (select toy_id, toy_name, unnest(new_tags) new from toy_production) b
on a.toy_id = b.toy_id and a.prev = b.new
)z
where prev is null
group by toy_id order by count(distinct new) desc limit 1;


// the value you get from the first one, plug into the next two queries
select  count(distinct prev) deleted from (
select a.toy_id, a.toy_name, prev,new from (select toy_id, toy_name, unnest(previous_tags) prev from toy_production) a
full outer join (select toy_id, toy_name, unnest(new_tags) new from toy_production) b
on a.toy_id = b.toy_id and a.prev = b.new
)z
where new is null
and toy_id=2726
group by toy_id order by count(distinct prev) desc limit 1;

select  count(distinct prev) unchanged from (
select a.toy_id, a.toy_name, prev,new from (select toy_id, toy_name, unnest(previous_tags) prev from toy_production) a
full outer join (select toy_id, toy_name, unnest(new_tags) new from toy_production) b
on a.toy_id = b.toy_id and a.prev = b.new
)z
where new is not null and prev is not null
and toy_id=2726
group by toy_id order by count(distinct prev) desc;
