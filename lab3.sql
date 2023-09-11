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











