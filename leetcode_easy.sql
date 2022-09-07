##175. Combine Two Tables

select firstName,LastName,city,state from Person p
left join Address a on p.personID=a.personID;