from Datos.ConnectionMySQL import Connection
import Datos.DataCiudad


from Datos import Tables

class DataUsuario(Connection):


    def GetAll(self):
        cursor = self.Conn.cursor()
        sql = "select * from usuarios"
        cursor.execute(sql)

        rows = cursor.fetchall()
        cursor.close()
        self.CloseConnection()

        if (len(rows) == 0):
            return False
        else:
            usuarios = []
            for row in rows:
                usuario = Tables.Usuario()
                usuario.ID = row[0]
                usuario.Nombre = row[1]
                usuario.Apellido = row[2]
                usuario.FechaNacimiento = row[3]
                usuario.DNI = row[4]
                usuario.IdCiudad = row[5]
                usuario.IdPerfil = row[6]
                usuario.NombreUsuario = row[7]
                usuario.State = Tables.States.Read
                usuarios.append(usuario)

                cit = Datos.DataCiudad.DataCiudad()
                ciudad = cit.GetOne(usuario.IdCiudad)
                usuario.Ciudad = ciudad.Nombre
                pro = Datos.DataCiudad.DataProvincia()
                usuario.Provincia = pro.GetOne(ciudad.IdProvincia).Nombre
            return usuarios

    def GetOne(self, id):
        cursor = self.Conn.cursor()
        sql = "select * from usuarios where id_usuario = %s"
        data = (id)
        cursor.execute(sql, data)

        row = cursor.fetchone()
        cursor.close()
        self.CloseConnection()

        if (len(row) == 0):
            return False
        else:
            usuario = Tables.Usuario()
            usuario.ID = row[0]
            usuario.Nombre = row[1]
            usuario.Apellido = row[2]
            usuario.FechaNacimiento = row[3]
            usuario.DNI = row[4]
            usuario.IdCiudad = row[5]
            usuario.IdPerfil = row[6]
            usuario.NombreUsuario = row[7]

            usuario.State = Tables.States.Read
            return usuario

    def Loguin(self, user, passw):
        cursor = self.Conn.cursor()
        sql = "select * from usuarios where nombre_usuario = %s and contrasenia = %s"
        data = (user, passw)
        cursor.execute(sql, data)

        row = cursor.fetchone ()
        cursor.close()
        self.CloseConnection()

        if (len (row) == 0):
            return False
        else:
            usuario = Tables.Usuario ()
            usuario.ID = row[0]
            usuario.Nombre = row[1]
            usuario.Apellido = row[2]
            usuario.FechaNacimiento = row[3]
            usuario.DNI = row[4]
            usuario.IdCiudad = row[5]
            usuario.IdPerfil = row[6]
            usuario.NombreUsuario = row[7]

            usuario.State = Tables.States.Read
            return usuario

    def GetPerfil(self, idPerfil):
        cursor = self.Conn.cursor()
        sql = "select * from perfiles where id_perfil = %s"
        cursor.execute(sql, [idPerfil])

        row = cursor.fetchone()
        cursor.close()
        self.CloseConnection()

        if (len(row) == 0):
            return False
        else:
            perfil = Tables.Perfil()
            perfil.ID = row[0]
            perfil.Nombre = row[1]
            perfil.State = Tables.States.Read
            return perfil

class DataPerfil(Connection):
    def GetPerfiles(self):

        cursor = self.Conn.cursor()
        cursor.execute("select * from perfiles")

        rows = cursor.fetchall()
        cursor.close()
        self.CloseConnection()

        if (len(rows) == 0):
            return False
        else:
            perfiles = []
            for row in rows:
                perfil = Tables.Perfil()
                perfil.ID = row[0]
                perfil.Nombre = row[1]
                perfiles.append(perfil)
            return perfiles