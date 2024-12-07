select a.* from (
           select c.name, c.name gift_name, g.price from children c, gifts g
            where g.child_id =c .child_id
       ) a,
       (select avg(price) avgprice
        from gifts) b
where a.price > b.avgprice
order by a.price limit 1;


