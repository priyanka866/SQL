###Occupations

select 
max(case when occupation = 'Doctor' then name end) as Doctor,
max(case when occupation = 'Professor' then name end) as Professor,
max(case when occupation = 'Singer' then name end) as Singer,
max(case when occupation = 'Actor' then name end) as Actor
from (select *, row_number() over (partition by occupation
order by name) as occ from Occupations) A 
group by occ order by occ;

##Binary Tree Nodes

select N,
case
when P is null then 'Root' 
when N in (select distinct(P) from BST where P is not null) then 'Inner' 
else 'Leaf' end
from BST order by N;

##New Companies


###Weather Observation Station 18

select @a := MAX(LAT_N) from STATION;
select @c := MIN(LAT_N) from STATION;
select @b := MAX(LONG_W) from STATION;
select @d := MIN(LONG_W) from STATION;

SELECT ROUND(ABS(@a-@c)+ABS(@b-@d)),4)
FROM station;

SELECT ROUND(ABS(MAX(LAT_N)-MIN(LAT_N))+
ABS(MAX(LONG_W)-MIN(LONG_W)),4)
FROM station;

#Weather Observation Station 19

SELECT ROUND(SQRT(power(MAX(LONG_W)-MIN(LONG_W),2)
+power(MAX(LAT_N)-MIN(LAT_N),2)),4)
FROM station;

##Weather Observation Station 20
SELECT ROUND(AVG(LAT_N), 4) 
FROM (SELECT LAT_N, ROW_NUMBER() OVER(ORDER BY LAT_N DESC) AS rn
FROM STATION) AS a
WHERE a.rn <= CEIL(((SELECT COUNT(*) FROM STATION)+1)/2) 
AND a.rn >= FLOOR(((SELECT COUNT(*) FROM STATION)+1)/2)
