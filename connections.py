import pymysql.cursors


# Функция возвращает connection.

def getConnection():
    # Вы можете изменить параметры соединения.
    connection = pymysql.connect(host='localhost',
                                 user='root',
                                 password='',
                                 db='diplomka',
                                 charset='utf8mb4',
                                 cursorclass=pymysql.cursors.DictCursor)
    return connection
