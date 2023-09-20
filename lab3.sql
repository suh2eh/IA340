--Q2.1

insert into student(s_email,s_name,major)

values('s1@jmu.edu','s1','IA'),
	('s2@jmu.edu','s2','IA'),
	('s3@jmu.edu','s3','ISAT'),
	('s4@jmu.edu','s4','ISAT')

--Q2.2

 insert into professor(p_email,p_name,office)
 
 values('p1@jmu.edu','p1','o1'),
 	   ('p2@jmu.edu','p2','o2')

--Q2.3

insert into course(c_number,c_name,room,p_email)

values('c1','postgresql','r1','p1@jmu.edu'),
	  ('c2','mongodb','r2','p2@jmu.edu'),
	  ('c3','twitter','r1','p1@jmu.edu')

--Q2.4

insert into enroll(s_email,c_number)

values('s1@jmu.edu','c1'),
	  ('s2@jmu.edu','c1'),
	  ('s3@jmu.edu','c1'),
	  ('s4@jmu.edu','c2'),
	  ('s2@jmu.edu','c3'),
	  ('s3@jmu.edu','c3')

--Q2.5
--You need to modify the professor table first, as inputing the new professor's email into the course before adding the professor's email to the professor table will result in an error. 

insert into professor(p_email,p_name,office)
values('p3@jmu.edu','p3','o3')

insert into course(c_number,c_name,room,p_email)
values('c4','facebook','r1','p3@jmu.edu')

--Q2.6
--You need to update the professor from the course table first, as a constraint prevents one from deleting the professor directly from the professor table as long as that professor is referenced in another table.  

update course
set p_email = 'p3@jmu.edu'
where p_email = 'p1@jmu.edu'

delete from professor
where p_email ='p1@jmu.edu'

--Q2.7
select * from enroll
--Q2.8
	
select c_number ,count(*) as num_student
from enroll
group by c_number
order by num_student desc
limit 1
	
--Q2.9
select professor.p_name,
		course.c_name
from professor
inner join course
on professor.p_email = course.p_email 









