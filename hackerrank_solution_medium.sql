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

select round(avg(LAT_N),4) from
(select *,row_number() over (order by LAT_N asc) as lat_asc,
row_number() over (order by LAT_N desc) as lat_desc
from STATION) a
where lat_asc in (lat_desc,lat_desc+1,lat_desc-1);

with median as (select *,row_number() over (order by LAT_N asc) as lat_asc,
row_number() over (order by LAT_N desc) as lat_desc
from STATION)
 
select round(avg(LAT_N),4) from median
where abs(cast(lat_asc as signed)-cast(lat_desc as signed)) <= 1;

###New Companies

select c.company_code,c.founder,
count(DISTINCT l.lead_manager_code),count(DISTINCT s.senior_manager_code),
count(DISTINCT m.manager_code),count(DISTINCT e.employee_code )
from Company c
inner join Lead_Manager l on c.company_code= l.company_code
inner join Senior_Manager s on c.company_code= s.company_code
inner join Manager m on c.company_code= m.company_code
inner join Employee e on c.company_code= e.company_code
group by 1,2
order by 1;

###The Report
select CASE when Grade < 8 then Name = NULL ELSE NAME end,Grade,
Marks
from Students s
left join GRADES g on s.marks >= g.min_mark and s.marks <= g.max_mark
order by Grade DESC, Name ASC;

###Top Competitors

SELECT s.hacker_id, h.name FROM Submissions s
inner join Challenges c on c.challenge_id = s.challenge_id
inner join Hackers h on s.hacker_id = s.hacker_id
inner join Difficulty d on c.difficulty_level  = d.difficulty_level  
WHERE s.score = d.score
GROUP BY 1,2
HAVING COUNT(s.hacker_id) > 1
order by count(s.hacker_id) desc,s.hacker_id;


###Contest Leaderboard
select m.hacker_id, h.name, sum(score) as total_score from
(select hacker_id, challenge_id, max(score) as score
from Submissions group by hacker_id, challenge_id) as m
inner join Hackers as h
on m.hacker_id = h.hacker_id
group by m.hacker_id, h.name
having total_score > 0
order by total_score desc, m.hacker_id;

##Prime number

with recursive numbers (n) as
( select 1 
 union all 
 select n+1 
 from numbers 
 where n<1000 )
 
select group_concat(t.n separator '&') from
( select v.n, count(d.n) 'd' from numbers v 
 inner join numbers d on d.n <= v.n and mod(v.n,d.n) = 0
 group by v.n order by v.n ) t 
 where t.d = 2 order by t.n;
 
##Placements

select s.name from students s
inner join Friends f on s.id= f.id
inner join Packages p on s.id= p.id
inner join Packages pf on f.friend_id= pf.id
where pf.salary > p.salary
order by pf.salary asc;


