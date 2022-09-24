##175. Combine Two Tables

select firstName,LastName,city,state from Person p
left join Address a on p.personID=a.personID;

##181. Employees Earning More Than Their Managers

select e.name as Employee from Employee p 
left join Employee e on p.id= e.managerID
where e.salary> p.salary;
-- self join
select e.name as Employee from Employee p, Employee e 
where p.id= e.managerID
and e.salary> p.salary;

##182. Duplicate Emails
select email from Person 
group by 1
having count(email)>1;

#183. Customers Who Never Order
select name as Customers from Customers c
left join Orders o on c.id= o.customerId
where o.customerId is null;

select customers.name as 'Customers'
from customers
where customers.id not in
(
    select customerid from orders
);

###196. Delete Duplicate Emails

delete from Person 
where id in (select id from (
select id, Distinct email from Person group by 1)as a);

DELETE p1 FROM Person p1,
    Person p2
WHERE
    p1.Email = p2.Email AND p1.Id > p2.Id;
    
###


    