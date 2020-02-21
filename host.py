# -*- coding: utf-8 -*-
import os
import re
import tornado.ioloop
import tornado.web
import connections
import datetime

settings = {
    "cookie_secret": "61oETzKXQAGaYdk333EmGeJfdfdh12345ddsa2JFuYh7EQnp2XdTP1o/Vo=",
    "login_url": "/",
}

def timed():
    return datetime.datetime.today().strftime("%Y")

def get_user_info(self):
    if self.current_user is not None:
        name = tornado.escape.xhtml_escape(self.current_user)
        connect = connections.getConnection()
        cursor = connect.cursor()
        count = cursor.execute(f"select * from users where phone = {name}")
        # if count == 1:
        user_info = cursor.fetchone()
        connect.commit()
        cursor.close()
        connect.close()
        return user_info
    else:
        return None

class BaseHandler(tornado.web.RequestHandler):
    def get_current_user(self):
        connect = connections.getConnection()
        cursor = connect.cursor()
        cursor.execute("select * from users")
        users = cursor.fetchall()
        connect.commit()
        cursor.close()
        connect.close()
        if self.get_secure_cookie("phone") is not None:
            cookier = self.get_secure_cookie("phone").decode('utf-8')
            for user in users:
                if user['phone'] == cookier:
                    return self.get_secure_cookie("phone")
        return None


class MainHandler(BaseHandler):
    def get(self):
        connect = connections.getConnection()
        cursor = connect.cursor()
        cursor.execute("select * from dishes")
        dishes = cursor.fetchall()
        cursor.close()
        connect.close()
        self.render("index.html", dishes=dishes, timed=timed(), user=get_user_info(self))

class viewDishInfoHandler(BaseHandler):
    def get(self, args):
        connect = connections.getConnection()
        cursor = connect.cursor()
        cursor.execute(f"SELECT * FROM `dishes` INNER JOIN `dishes_ingredients` ON `dishes_ingredients`.`dish_id` = `dishes`.`id` LEFT JOIN `ingredients` ON `dishes_ingredients`.`ingredient_id` = `ingredients`.`id` WHERE `dishes`.`id` = {args}")
        dishes = cursor.fetchone()
        cursor.execute(f"SELECT ingredients.name, ingredients.description, ingredients.calories, ingredients.id FROM `dishes` INNER JOIN `dishes_ingredients` ON `dishes_ingredients`.`dish_id` = `dishes`.`id` LEFT JOIN `ingredients` ON `dishes_ingredients`.`ingredient_id` = `ingredients`.`id` WHERE `dishes`.`id` = {args}")
        ingredients = cursor.fetchall()
        cursor.close()
        connect.close()
        self.render("dishinfo.html", dishes=dishes, ingredients=ingredients, timed=timed(), user=get_user_info(self))

class testHandler(BaseHandler):
    @tornado.web.authenticated
    def get(self):
        name = tornado.escape.xhtml_escape(self.current_user)
        self.write(f'Hi, {name}')

class LoginHandler(BaseHandler):
    def post(self): 
        phone = re.sub('[^0-9]','', self.get_argument("phone"))
        password = self.get_argument("password")
        connect = connections.getConnection()
        cursor = connect.cursor()
        cursor.execute("select * from users")
        users = cursor.fetchall()
        connect.commit()
        cursor.close()
        connect.close()
        for user in users:
            if user['phone'] == phone and user['password'] == password:
                self.set_secure_cookie("phone", user['phone'])
                # connect = connections.getConnection()
                # cursor = connect.cursor()
                # cursor.execute("update users set last_cookie = %s where login = %s", (user['login'], user['login']))
                # connect.commit()
                # cursor.close()
                # connect.close()
                self.redirect("/")
                break
        else:
            self.clear_all_cookies(path="/")
            self.write("u need to be logined")

class deauthHandler(BaseHandler):
    def get(self):
        self.clear_all_cookies(path="/")
        self.redirect("/")

class viewUserHandler(BaseHandler):
    @tornado.web.authenticated
    def get(self, args):
        connect = connections.getConnection()
        cursor = connect.cursor()
        cursor.execute(f"select * from users where id={args}")
        userinfo = cursor.fetchone()
        cursor.execute(f"SELECT * FROM `users` \
            INNER JOIN `users_orders`\
            ON `users_orders`.`user_id` = `users`.`id`\
            LEFT JOIN `orders`\
            ON `users_orders`.`order_id` = `orders`.`id`\
            WHERE `users`.`id` = {args}")
        orders = cursor.fetchall()
        cursor.close()
        connect.close()
        self.render("userinfo.html", timed=timed(), user=get_user_info(self), userinfo=userinfo, orders=orders)


def make_app():
    return tornado.web.Application([
        (r"/", MainHandler),
        (r"/dish/([0-9]+)", viewDishInfoHandler),
        (r"/test/", testHandler),
        (r"/login", LoginHandler),
        (r"/deauth", deauthHandler),
        (r"/user/([0-9]+)", viewUserHandler),
        # (r"/post/([0-9]+)", ViewPostHandler),
    ], **settings,
        template_path=os.path.join(os.path.dirname(__file__), "templates"),
        static_path=os.path.join(os.path.dirname(__file__), "static"), debug=True)


if __name__ == "__main__":
    app = make_app()
    app.listen(8080)
    tornado.ioloop.IOLoop.current().start()
