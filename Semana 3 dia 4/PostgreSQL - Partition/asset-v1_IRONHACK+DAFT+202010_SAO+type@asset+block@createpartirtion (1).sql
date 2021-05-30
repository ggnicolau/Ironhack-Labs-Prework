select * from employees;

select column_name, data_type from information_schema.columns
where table_name = 'employees'

drop table if exists employees_partition;
create table employees_partition
(years_employed bigint,
role text,
name text,
bulding text)
PARTITION BY LIST(role);
CREATE TABLE employees_partition_manager PARTITION OF employees_partition
    FOR VALUES IN ('Manager');

CREATE TABLE employees_partition_engineer PARTITION OF employees_partition
    FOR VALUES IN ('Engineer');

CREATE TABLE employees_partition_artist PARTITION OF employees_partition
    FOR VALUES IN ('Artist');
	
insert into employees_partition select  years_employed, role ,name, building from employees;


select * from employees_partition_engineer where role='Engineer';
select * from employees where role='Engineer';
