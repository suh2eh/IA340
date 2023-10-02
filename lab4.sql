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


#Q1
sql = """ select * from student"""

df = pandas.read_sql_query(sql, conn)
df[:]

#Q2

