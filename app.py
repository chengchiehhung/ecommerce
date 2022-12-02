from flask import Flask, request, json
from flask import redirect
from flask import session
from flask import render_template
from flask import jsonify
import mysql.connector

app = Flask(__name__)
app.config["JSON_AS_ASCII"] = False
app.secret_key = b'\xe0\xab/0\xd04\xa7l\xf95\xd0\xdc="\x14\xa7'

sysdb = mysql.connector.connect(
    host = "pitt-dbms-course.mysql.database.azure.com", 
    user = "AJSuser@pitt-dbms-course", 
    password = "AJS666!!"
)

mycursor = sysdb.cursor()

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/signup/", methods=["POST"])
def signup():
    first_name = request.form["first_name"]
    last_name = request.form["last_name"]
    account = request.form["account"]
    password = request.form["password"]

    query_get_userinfo = "SELECT * FROM ecommerce.customers WHERE username = (%s);"
    mycursor.execute(query_get_userinfo, (account,))
    user_info = mycursor.fetchall()

    if user_info != []:
        return redirect("/error/?message=Account already registered, please try again!")
    else:
        query_create_user = "INSERT INTO ecommerce.customers (username, password, first_name, last_name) VALUES (%s, %s, %s, %s);"
        mycursor.execute(query_create_user, (account, password, first_name, last_name))
        sysdb.commit()
        return redirect("/")

@app.route("/signin/", methods=["POST"])
def signin():
    account = request.form["account"]
    password = request.form["password"]

    query_get_userinfo = "SELECT username,password FROM ecommerce.customers WHERE username=(%s) AND password=(%s);"
    mycursor.execute(query_get_userinfo, (account, password))
    user_info = mycursor.fetchall()

    if user_info != []:
        session["account"] = account
        return redirect(f"/member/?name={user_info[0][0]}")
    return redirect("/error/?message=Account or password Error!")

@app.route("/signout")
def signout():
    session.pop("account", None)
    return redirect("/")

@app.route("/member/")
def member_info():
    if 'account' in session:
        name = request.args.get("name", None)
        return render_template("member.html", name=name)
    else:
        return redirect("/")

@app.route("/error/")
def error():
    message = request.args.get("message", None)
    return render_template("error.html", message=message)




# APis
@app.route("/get_customers")
def get_customers():
    query = '''
        SELECT *
        FROM ecommerce.customers;
    '''
    mycursor.execute(query) #執行sql命令
    data = mycursor.fetchall()
    data = {}
    data["data"] = [d[1] for d in data]
    # print(dic)
    return data

@app.route("/get_orders", methods = ["GET"]) #Get request
def orders():
    name = request.args.get("name", None) #因為get是一個方法，所以要用(), 而不是[]
    password = request.args.get("pawd", None)
    id = request.args.get("user_id", None)

    query = f"SELECT * FROM users WHERE id = {id}"
    return query

@app.route("/get_store", methods = ["GET"]) #Get request
def store():
    address = request.args.get("address", None) #因為get是一個方法，所以要用(), 而不是[]
    city = request.args.get("city", None)
    id = request.args.get("store_id", None)

    query = f"SELECT * FROM users WHERE id = {id}"
    return query

@app.route("/get_product", methods = ["GET"]) #Get request
def product():
    name = request.args.get("name", None) #因為get是一個方法，所以要用(), 而不是[]
    price = request.args.get("price", None)
    id = request.args.get("product_id", None)

    query = f"SELECT * FROM users WHERE id = {id}"
    return query

app.run(port = 3000)
