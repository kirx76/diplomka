# -*- coding: utf-8 -*-
import os

import tornado.ioloop
import tornado.web
import connections

settings = {
    "cookie_secret": "61oETzKXQAGaYdk333EmGeJfdfdh12345ddsa2JFuYh7EQnp2XdTP1o/Vo=",
    "login_url": "/login",
}


# class BaseHandler(tornado.web.RequestHandler):
#     def get_current_user(self):
#         connect = connections.getConnection()
#         cursor = connect.cursor()
#         cursor.execute("select * from users")
#         users = cursor.fetchall()
#         connect.commit()
#         cursor.close()
#         connect.close()
#         if self.get_secure_cookie("login") is not None:
#             cookier = self.get_secure_cookie("login").decode('utf-8')
#             for user in users:
#                 if user['login'] == cookier:
#                     return self.get_secure_cookie("login")
#         return None


class MainHandler(tornado.web.RequestHandler):
    def get(self):
        connect = connections.getConnection()
        cursor = connect.cursor()
        cursor.execute("select * from dish")
        dishs = cursor.fetchall()
        self.render("index.html", dishs=dishs)

def make_app():
    return tornado.web.Application([
        (r"/", MainHandler),
        # (r"/post/([0-9]+)", ViewPostHandler),
    ], **settings,
        template_path=os.path.join(os.path.dirname(__file__), "templates"),
        static_path=os.path.join(os.path.dirname(__file__), "static"), debug=True)


if __name__ == "__main__":
    app = make_app()
    app.listen(8080)
    tornado.ioloop.IOLoop.current().start()
