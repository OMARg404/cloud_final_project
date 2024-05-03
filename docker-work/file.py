from flask import Flask, render_template, request
from flask_mysqldb import MySQL

app = Flask(__name__)

app.config['MYSQL_HOST'] = '127.0.0.1'
app.config['MYSQL_USER'] = 'cloud'
app.config['MYSQL_PASSWORD'] = '1234'
app.config['MYSQL_DB'] = 'students_db'

mysql = MySQL(app)

cursor = mysql.connection.cursor()

@app.route('/')
def index():
    cursor.execute(''' SELECT * FROM students; ''')

    return 'Home page'

@app.route('/student')
def hello():
    return 'Hello, World'


if(__name__ == "__main__"):
    app.run()