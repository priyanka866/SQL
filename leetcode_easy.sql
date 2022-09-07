##175. Combine Two Tables

select firstName,LastName,city,state from Person p
left join Address a on p.personID=a.personID;

##181. Employees Earning More Than Their Managers

select e.name as Employee from Employee p 
left join Employee e on p.id= e.managerID
where e.salary> p.salary;


