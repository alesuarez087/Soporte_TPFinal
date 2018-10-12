from mysql import connector

class Connection():

    Conn = None

    def __init__(self):
        if self.Conn == None:
            self.Conn = connector.connect(user="root", password="ale087", host="127.0.0.1", database="entornos_final")

    def CloseConnection(self):
        if self.Conn != None:
            self.Conn.close()


