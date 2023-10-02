import pandas
import configparser
import psycopg2

config = configparser.ConfigParser()
config.read('config.ini')

host = config['myaws']['host']
db = config['myaws']['db']
user = config['myaws']['user']
pwd = config['myaws']['pwd']

conn = psycopg2.connect(host = host,
                       user = user, 
                       password =pwd, 
                       dbname = db)


--Q1
sql = """ select * from student"""

df = pandas.read_sql_query(sql, conn)
df[:]

--Q2

  sql = """select professor.p_name, course.c_name
        from professor
        inner join course
        on professor.p_email = course.p_email"""
  
  df = pandas.read_sql_query(sql, conn)
  df[:10]
  
--Would the following code work as well?
sql = """select p_name, c_name
        from professor, course"""
  
df = pandas.read_sql_query(sql, conn)
df[:10]

--Q3

sql = """select c_number, count(*) as num_student
        from enroll
        group by c_number
        order by num_student desc"""
  
df = pandas.read_sql_query(sql, conn)
df.plot.bar(x='c_number',y='num_student')

--Q4

sql = """select professor.p_name, count(course.c_number) as num_courses
        from professor
        inner join course on professor.p_email = course.p_email
        group by professor.p_name
        order by num_courses desc"""

df = pandas.read_sql_query(sql, conn)
df.plot.bar(x='p_name',y='num_courses')

--Q5
cur = conn.cursor()
sql = """insert into professor(p_email,p_name,office)
        values('p4@jmu.edu','p4','o4')"""
cur.execute(sql)
cur.commit()
df = pandas.read_sql_query('select * from professor', conn)
df[:]

sql = """insert into course(c_number,c_name,room,p_email)
        values('c5','linkedin','r2','p4@jmu.edu')"""
cur.execute(sql)
cur.commit()
df = pandas.read_sql_query('select * from course', conn)
df[:]






