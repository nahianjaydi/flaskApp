from flask import Flask, render_template, flash, redirect, url_for, session, request
from flask_mysqldb import MySQL
from wtforms import Form, StringField, TextAreaField, PasswordField, validators
from passlib.hash import sha256_crypt
from functools import wraps

app = Flask(__name__)

app.config["MYSQL_HOST"] = "localhost"
app.config["MYSQL_USER"] = "root"
app.config["MYSQL_PASSWORD"] = "123456"
app.config["MYSQL_DB"] = "myflaskapp"
app.config["MYSQL_CURSORCLASS"] = "DictCursor"

mysql = MySQL(app)


@app.route("/")
def index():
    return render_template("home.html")


@app.route("/about")
def about():
    return render_template("about.html")


@app.route("/articles")
def articles():
    cur = mysql.connection.cursor()

    result = cur.execute("SELECT * FROM articles")
    articles = cur.fetchall()

    if result > 0:
        return render_template("articles.html", articles=articles)
    else:
        msg = "No Articles Found!"
        return render_template("articles.html", msg=msg)

    cur.close()


@app.route("/article/<string:id>/")
def article(id):
    cur = mysql.connection.cursor()

    result = cur.execute("SELECT * FROM articles WHERE id = %s", [id])
    article = cur.fetchone()

    if result > 0:
        return render_template("article.html", article=article)
    else:
        msg = "No Articles Found!"
        return render_template("article.html", msg=msg)

    cur.close()


class RegisterForm(Form):
    name = StringField('Name', [validators.input_required(), validators.length(min=1, max=50)])
    username = StringField('Username', [validators.input_required(), validators.length(min=4, max=25)])
    email = StringField('Email', [validators.input_required(), validators.length(min=6, max=50)])
    password = PasswordField('Password', [
        validators.InputRequired(),
        validators.equal_to('confirm', message='passwords do not match')
    ])
    confirm = PasswordField('Confirm Password')


@app.route("/register", methods=["GET", "POST"])
def register():
    form = RegisterForm(request.form)
    if request.method == 'POST' and form.validate():
        name = form.name.data
        email = form.email.data
        username = form.username.data
        password = sha256_crypt.hash(str(form.password.data))

        cur = mysql.connection.cursor()
        result = cur.execute("SELECT * FROM users WHERE username = %s", [username])
        if result > 0:
            flash("This username is already exist!", "danger")
        else:
            query = "INSERT INTO users(name, email, username, password) VALUES(%s, %s, %s, %s)"
            cur.execute(query, (name, email, username, password))

            mysql.connection.commit()

            cur.close()

            flash("Thanks for registering, you can log in now!", "success")
            return redirect(url_for("login"))
    return render_template("register.html", form=form)


@app.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        username = request.form["username"]
        password_candidate = request.form["password"]

        cur = mysql.connection.cursor()
        result = cur.execute("SELECT * FROM users WHERE username = %s", [username])

        if result > 0:
            data = cur.fetchone()
            password = data["password"]

            if sha256_crypt.verify(password_candidate, password):
                session["logged_in"] = True
                session["username"] = username

                flash("You are now logged in", "success")
                return redirect(url_for("dashboard"))
            else:
                error = "Invalid password!"
                return render_template("login.html", error=error)
            cur.close()
        else:
            error = "Username not found!"
            return render_template("login.html", error=error)
    return render_template("login.html")


def is_logged_in(f):
    @wraps(f)
    def wrap(*args, **kwargs):
        if "logged_in" in session:
            return f(*args, **kwargs)
        else:
            flash("Unauthorized, Please log in!!", "danger")
            return redirect(url_for("login"))

    return wrap


@app.route("/logout")
@is_logged_in
def logout():
    session.clear()
    flash("You successfully logged out!", "success")
    return redirect(url_for("login"))


@app.route("/dashboard")
@is_logged_in
def dashboard():
    if "username" in session:
        author = session["username"]
    cur = mysql.connection.cursor()

    result = cur.execute("SELECT * FROM articles where author = %s", [author])
    articles = cur.fetchall()

    if result > 0:
        return render_template("dashboard.html", articles=articles)
    else:
        msg = "No Articles Found!"
        return render_template("dashboard.html", msg=msg)

    cur.close()


class ArticleForm(Form):
    title = StringField('Title', [validators.input_required(), validators.length(min=1, max=200)])
    body = TextAreaField('Body', [validators.input_required(), validators.length(min=20)])


@app.route("/add_article", methods=["GET", "POST"])
@is_logged_in
def add_article():
    form = ArticleForm(request.form)
    if request.method == "POST" and form.validate():
        title = form.title.data
        body = form.body.data
        author = session["username"]

        cur = mysql.connection.cursor()
        query = "INSERT INTO articles(title, body, author) VALUES(%s, %s, %s)"
        cur.execute(query, (title, body, author))

        mysql.connection.commit()

        cur.close()

        flash("Article created", "success")
        return redirect(url_for("dashboard"))
    return render_template("add_article.html", form=form)


@app.route("/edit_article/<string:id>", methods=["GET", "POST"])
@is_logged_in
def edit_article(id):
    cur = mysql.connection.cursor()
    result = cur.execute("SELECT * FROM articles WHERE id = %s", [id])

    article = cur.fetchone()

    form = ArticleForm(request.form)

    form.title.data = article["title"]
    form.body.data = article["body"]

    if request.method == "POST" and form.validate():
        title = request.form["title"]
        body = request.form["body"]

        cur = mysql.connection.cursor()
        query = "UPDATE articles SET title=%s, body=%s WHERE id = %s"
        cur.execute(query, (title, body, id))

        mysql.connection.commit()

        cur.close()

        flash("Article Updated", "success")
        return redirect(url_for("dashboard"))
    return render_template("edit_article.html", form=form)


@app.route("/delete_article/<string:id>", methods=["POST"])
@is_logged_in
def delete_article(id):
    cur = mysql.connection.cursor()

    cur.execute("DELETE FROM articles WHERE id = %s", [id])

    mysql.connection.commit()

    cur.close()

    flash("Article Deleted", "success")
    return redirect(url_for("dashboard"))


if __name__ == "__main__":
    app.secret_key = "secret123"
    app.run(debug=True)
