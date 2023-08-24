select sal.emp_no, emp.last_name, emp.first_name, emp.gender, sal.salary
from employees as emp
inner join salaries as sal
on sal.emp_no = emp.emp_no
order by sal.emp_no;



select emp_no, last_name, first_name, hire_date 
from employees 
where extract(year from hire_date) = 1986;



select distinct on (dept_manager.dept_no) dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name,dept_manager.from_date, dept_manager.to_date
from dept_manager 
inner join departments 
on dept_manager.dept_no= departments.dept_no
inner join employees 
on dept_manager.emp_no = employees.emp_no
order by dept_manager.dept_no, dept_manager.to_date DESC;



select distinct on (emp.emp_no) emp.emp_no, emp.last_name, emp.first_name,dept.dept_name
from employees as emp
left join dept_emp as dept
on emp.emp_no = dept.emp_no
inner join departments as depart
on dept.dept_no = depart.dept_no
order by emp.emp_no, dept.to_date DESC;


select emp.last_name, emp.first_name
from employees as emp
where (emp.first_name = 'Hercules') and (lower(emp.last_name) like 'b%')
order by emp.last_name;


select distinct on (emp_no) *
into current_dept_emp
from dept_emp
order by emp_no, to_date DESC;


select emp.emp_no, emp.last_name, emp.first_name, depart.dept_name
from employees as emp
inner join current_dept_emp as cde
on emp.emp_no = cde.emp_no
inner join departments as depart
on cde.dept_no = depart.dept_no
where lower(depart.dept_name) = 'sales';


select emp.emp_no, emp.last_name, emp.first_name, depart.dept_name
from employees as emp
inner join current_dept_emp as cde
on emp.emp_no = cde.emp_no
inner join departments as depart
on cde.dept_no = d.dept_no
where (lower(depart.dept_name) = 'sales') or (lower(depart.dept_name) = 'development');



select last_name,count(last_name) as Frequency 
from employees 
group by last_name
order by frequency desc;