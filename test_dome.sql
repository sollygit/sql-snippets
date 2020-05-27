/* Write a query that select all distinct pet names. */
select distinct name from (
	select name from dogs
	union all
	select name from cats) u

/* Write a query that selects userId and average session duration for each user who has more than one session. */
select
	userid, 
	avg(duration) as avg
from sessions 
where 
	userid in (select userid from sessions group by userid having count(*) > 1)
group by 
	userid

/*	Write a query that selects the names of employees who are not managers. */
select name
from employees
where id NOT IN (
	select a.Id from employees a inner join employees b on a.id = b.managerid)

/*
	The following two tables are used to define users and their respective roles:
	CREATE TABLE users (
	  id INTEGER NOT NULL PRIMARY KEY,
	  userName VARCHAR(50) NOT NULL)

	CREATE TABLE roles(
	  id INTEGER NOT NULL PRIMARY KEY,
	  role VARCHAR(20) NOT NULL)
	  
	The users_roles table should contain the mapping between each user and their roles. 
	Each user can have many roles, and each role can have many users.

	Modify the provided SQLite create table statement so that:

	1. Only users from the users table can exist within users_roles.
	2. Only roles from the roles table can exist within users_roles.
	3. A user can only have a specific role once.

	CREATE TABLE users_roles (
	  userId INTEGER NOT NULL,
	  roleId INTEGER NOT NULL,
	  FOREIGN KEY(userId) REFERENCES users(id),
	  FOREIGN KEY(roleId) REFERENCES roles(id),
	  PRIMARY KEY (userId, roleId)
	)
*/

