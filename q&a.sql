/*
	Information about pets is kept in two separate tables:
	TABLE dogs
	  id INTEGER NOT NULL PRIMARY KEY,
	  name VARCHAR(50) NOT NULL

	TABLE cats
		  id INTEGER NOT NULL PRIMARY KEY,
		  name VARCHAR(50) NOT NULL

	Write a query that select all distinct pet names.
*/

select distinct name from 
(
 select name from dogs
 union all
 select name from cats
) a

/*
	App usage data are kept in the following table:
	TABLE sessions
	  id INTEGER PRIMARY KEY,
	  userId INTEGER NOT NULL,
	  duration DECIMAL NOT NULL

	  Write a query that selects userId and average session duration for each user who has more than one session.
*/

select 
	userid, 
	avg(duration) as avg
from sessions 
where 
	userid in (select userid from sessions group by userid having count(*) > 1)
group by 
	userid

/*
	The following data definition defines an organization's employee hierarchy.

	An employee is a manager if any other employee has their managerId set to the first employees id. 
	An employee who is a manager may or may not also have a manager.

	TABLE employees
	  id INTEGER NOT NULL PRIMARY KEY
	  managerId INTEGER REFERENCES employees(id)
	  name VARCHAR(30) NOT NULL

	  Write a query that selects the names of employees who are not managers.
*/

select name
from employees
where id NOT IN (
	select a.Id from employees a inner join employees b on a.id = b.managerid)

/*
	The following two tables are used to define users and their respective roles:
	TABLE users
	  id INTEGER NOT NULL PRIMARY KEY,
	  userName VARCHAR(50) NOT NULL

	TABLE roles
	  id INTEGER NOT NULL PRIMARY KEY,
	  role VARCHAR(20) NOT NULL
	  
	The users_roles table should contain the mapping between each user and their roles. 
	Each user can have many roles, and each role can have many users.

	Modify the provided SQLite create table statement so that:

	- Only users from the users table can exist within users_roles.
	- Only roles from the roles table can exist within users_roles.
	- A user can only have a specific role once.
*/

CREATE TABLE users_roles (
  userId INTEGER NOT NULL,
  roleId INTEGER NOT NULL,
  FOREIGN KEY(userId) REFERENCES users(id),
  FOREIGN KEY(roleId) REFERENCES roles(id),
  PRIMARY KEY (userId, roleId)
)
