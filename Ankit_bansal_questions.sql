###pivot-unpivot

select emp_id,
sum(case when salary_component_type = 'salary' then val end) as salary,
sum(case when salary_component_type = 'bonus' then val end) as bonus,
sum(case when salary_component_type = 'hike_percent' then val end) as hike_percent
from emp_compensation
group by 1;