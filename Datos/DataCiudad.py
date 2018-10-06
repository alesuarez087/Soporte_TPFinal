from Datos.ConnectionMySQL import Connection
from Datos import Tables



class DataCiudad(Connection):

    def GetAll(self):
        cursor = self.Conn.cursor ()
        sql = "select * from ciudades"
        cursor.execute (sql)

        rows = cursor.fetchall ()
        cursor.close ()
        self.CloseConnection ()

        if (len (rows) == 0):
            return False
        else:
            ciudades = []
            for row in rows:
                ciudad = Tables.Ciudad ()
                ciudad.ID = row[0]
                ciudad.Nombre = row[1]
                ciudad.IdProvincia = row[2]
                ciudad.State = Tables.States.Read
                ciudades.append (ciudad)
            return ciudades

    def GetAllForProvincia(self, idProvincia):
        cursor = self.Conn.cursor ()
        sql = "select * from ciudades where id_provincia = %s"
        data = (idProvincia)
        cursor.execute (sql, data)

        rows = cursor.fetchall ()
        cursor.close ()
        self.CloseConnection ()

        if (len (rows) == 0):
            return False
        else:
            ciudades = []
            for row in rows:
                ciudad = Tables.Ciudad ()
                ciudad.ID = row[0]
                ciudad.Nombre = row[1]
                ciudad.IdProvincia = row[2]
                ciudad.State = Tables.States.Read
                ciudades.append (ciudad)
            return ciudades

    def GetOne(self, id_ciudad):
        cursor = self.Conn.cursor()
        sql = "select * from ciudades where id_ciudad = %s"
        cursor.execute(sql, [id_ciudad])

        row = cursor.fetchone()
        cursor.close()
        self.CloseConnection()

        if (len (row) == 0):
            return False
        else:
            ciudad = Tables.Ciudad()
            ciudad.ID = row[0]
            ciudad.Nombre = row[1]
            ciudad.IdProvincia = row[2]
            return ciudad



class DataProvincia(Connection):

    def GetAll(self):
        cursor = self.Conn.cursor ()
        sql = "select * from provincias"
        cursor.execute (sql)

        rows = cursor.fetchall ()
        cursor.close ()
        self.CloseConnection ()

        if (len (rows) == 0):
            return False
        else:
            provincias = []
            for row in rows:
                provincia = Tables.Provincia()
                provincia.ID = row[0]
                provincia.Nombre = row[1]
                provincia.State = Tables.States.Read
                provincias.append (provincia)
            return provincias

    def GetOne(self, id_provincia):
        cursor = self.Conn.cursor()
        sql = "SELECT * FROM provincias where id_provincia=%s"
        cursor.execute(sql, [id_provincia])

        row = cursor.fetchone()
        cursor.close()
        self.CloseConnection ()

        provincia = Tables.Provincia()
        provincia.ID = row[0]
        provincia.Nombre = row[1]
        provincia.State = Tables.States.Read
        return provincia
