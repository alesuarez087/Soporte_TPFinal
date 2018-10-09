from Datos.ConnectionMySQL import Connection
from mysql import connector

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
                usuario.IdPerfil = row[5]
                usuario.NombreUsuario = row[6]
                usuario.Email = row[8]
                usuario.State = Tables.States.Read
                usuarios.append(usuario)
            return usuarios

    def GetOne(self, id):
        cursor = self.Conn.cursor()
        sql = "select * from usuarios where id_usuario = %s"
        cursor.execute(sql, [id])

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
            usuario.IdPerfil = row[5]
            usuario.NombreUsuario = row[6]
            usuario.Email = row[8]

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
            usuario.IdPerfil = row[5]
            usuario.NombreUsuario = row[6]
            usuario.Email = row[8]

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


    def Save(self, user):
        if user.State == Tables.States.Create:
            return self.Create(user)
        if user.State == Tables.States.Update:
            return self.Update(user)
        if user.State == Tables.States.Delete:
            return self.Delete(user)

    def Create(self, user):
        cursor = self.Conn.cursor()
        try:
            sql = "INSERT INTO usuarios(nombre, apellido, fecha_naciemiento, dni, id_perfil, nombre_usuario, contrasenia, email) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"
            data = [user.Nombre, user.Apellido, user.FechaNacimiento, user.DNI, user.IdPerfil, user.NombreUsuario, user.Contrasenia, user.Email]
            cursor.execute(sql, data)

            self.Conn.commit()
            return True
        except Exception as e:
            return False
        finally:
            cursor.close()
            self.CloseConnection()


    def Update(self, user):
        cursor = self.Conn.cursor()
        try:
            sql = "update usuarios SET nombre=%s, apellido=%s, fecha_naciemiento=%s, dni=%s, id_perfil=%s, nombre_usuario=%s, contrasenia=%s, email=%s where id_usuario=%s"
            data = [user.Nombre, user.Apellido, user.FechaNacimiento, user.DNI, user.IdPerfil, user.NombreUsuario, user.Contrasenia, user.Email, user.ID]
            cursor.execute(sql, data)

            self.Conn.commit()
            return True
        except Exception as e:
            return False
        finally:
            cursor.close()
            self.CloseConnection()

    def Delete(self, user):
        cursor = self.Conn.cursor()
        try:
            sql = "delete from usuarios where id_usuario = %s"
            data = [user.ID]
            cursor.execute(sql, data)

            self.Conn.commit()
            return True
        except Exception as e:
            return False
        finally:
            cursor.close()
            self.CloseConnection()

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