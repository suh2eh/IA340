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

