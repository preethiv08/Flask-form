from flask import Flask,render_template, request, redirect, url_for
from flask_sqlalchemy import SQLAlchemy
import bcrypt 
from sqlalchemy import exc

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres:preethi2002@localhost/User'
db = SQLAlchemy(app)


class User(db.Model):
    __tablename__="User"
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), unique=True)
    email = db.Column(db.String(80), unique=True)
    password = db.Column(db.LargeBinary)


    def __init__(self,username, email, password):
        self.username=username
        self.email=email
        self.password=password

@app.route("/thankyou")
def index():
    return render_template("index.html")

@app.route("/",methods=["GET", "POST"])
def login():
    if request.method == "POST":
        username = request.form.get("username")
        password = request.form.get("password")      
        user= User.query.filter_by(username=username).first()
        if not user:
            return 'User Not Found!', 404
    
        if bcrypt.checkpw(password.encode('utf-8'), user.password):
             return redirect(url_for('index'))
        else:
            return 'Invalid Login Info!', 400
        
    return render_template("form.html")

@app.route("/signup", methods=["GET", "POST"])
def signup():
    try:
        if request.method == "POST":
            username = request.form.get("username")
            email = request.form.get("email")
            password = request.form.get("password")
            hashed = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt())
            user = User(username = username, email = email, password = hashed)
            db.session.add(user)
            db.session.flush()
            db.session.commit()
    
            return redirect(url_for('login'))
    except exc.IntegrityError:
        db.session.rollback()
        return 'User Already Exists', 400

    return render_template("signup.html")

if __name__ == "__main__":
    app.run(debug=True)
