from mysql import connector

class Connection():

    def __init__(self):
        self.Conn = connector.connect(user="root", password="ale087", host="127.0.0.1", database="tp_soporte")

    def CloseConnection(self):
        self.Conn.close()
