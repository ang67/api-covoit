import sqlite3
con = sqlite3.connect('covoit".db')

cur = con.cursor()
with open('schema.sql', 'r') as fp:
    cur.executescript(fp.read())


cur.execute("SELECT id , id from employees")
print(cur.fetchone())
