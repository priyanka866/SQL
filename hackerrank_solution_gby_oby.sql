###Hackerrank_solution_groupby

select CITY from STATION
where ID % 2= 0
group by 1;

##Weather Observation Station 4
select Count(CITY) - Count(DISTINCT CITY) from STATION;

####Weather Observation Station 6

select distinct city from station
where city RLIKE '^[aeiouAEIOU]';

#Weather Observation Station 7
select distinct city from station 
where city RLIKE '[aeiouAEIOU]$';

###Weather Observation Station 8

select distinct city from station 
where city RLIKE '^[aeiouAEIOU].*[aeiouAEIOU]$';

##Weather Observation Station 9
select distinct city from station where city NOT RLIKE '^[aeiouAEIOU]';

##Weather Observation Station 10

select distinct city from station where city not RLIKE '[aeiouAEIOU]$';

##Weather Observation Station 12
select distinct CITY from STATION where CITY not regexp '^[aeiou]' and CITY not regexp '[aeiou]$' order by CITY;

##Higher Than 75 Marks
select name from students
where marks > 75
group by name, ID
order by substr(name,-3), ID;

##Employee Names
select name from Employee
order by name;