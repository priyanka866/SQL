#Type of Triangle

select 
CASE 
when A+B <=C or A+C <=B or B+C<=A then "Not A Triangle"
When A=B and B=C then "Equilateral"
when A=B or A=C or B=C then "Isosceles"
when A<>B and B<>C then "Scalene"
end
from TRIANGLES;

##The PADS (can be used as union)

select CONCAT(Name,"(", (SUBSTR(Occupation,1,1)),")")
from OCCUPATIONS 
order by Name asc ;
select concat("There are a total of",' ',
              count(occupation),' ',
              lower(occupation),'s',".")
              from OCCUPATIONS 
group by occupation
order by count(occupation) asc;

###Draw The Triangle 1 
#:= assign value to variable more like == in python

set @x = 0;
select repeat('* ', @x := @x + 1)
from information_schema.tables limit 20;

###Draw The Triangle 2

set @x = 21;
select repeat('* ', @x := @x - 1)
from information_schema.tables;

###Revising Aggregations - The Count Function

select count(*) from CITY where Population > 100000;

##Revising Aggregations - The Sum Function

select sum(population) from CITY where DISTRICT = 'California';

###Revising Aggregations - Averages

select avg(population) from CITY where DISTRICT = 'California';

#Average Population
select CAST(round(avg(population),2)As UNSIGNED) from CITY;

###Japan Population

select sum(population) from CITY where countrycode = 'JPN';

##Average Population of Each Continent

SELECT co.CONTINENT,Floor(avg(ct.population))
FROM CITY ct
inner join COUNTRY co
on ct.COUNTRYCODE = co.CODE
group by 1;

###Population Density Difference

select max(Population)-min(Population)
from CITY ;

##African Cities

SELECT ct.NAME FROM CITY ct
inner join COUNTRY co
on ct.COUNTRYCODE = co.CODE
WHERE co.CONTINENT = 'Africa';

###Population Census

SELECT sum(ct.POPULATION) FROM CITY ct
inner join COUNTRY co
on ct.COUNTRYCODE = co.CODE
WHERE co.CONTINENT = 'Asia';

