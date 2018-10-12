from mysql import connector

from Datos import ConnectionMySQL
from Datos import Tablas

class DBUsuario(ConnectionMySQL.Connection):

    def Login(self, user, passw):
        try:
            cursor = self.Conn.cursor()
            cursor.callproc('UsuariosLogin', [user, passw])
            for result in cursor.stored_results():
                row = result.fetchone()
                usuario = Tablas.Usuario()
                usuario.ID = row[0]
                usuario.Nombre = row[1]
                usuario.Apellido = row[2]
                usuario.Habilitado = row[3]
                usuario.IdPerfil = row[4]
                usuario.DNI = row[6]
                usuario.NombreUsuario = row[7]
                usuario.Email = row[8]
                usuario.State = Tablas.States.Consulta
                return usuario
        except Exception as e:
            return 'Error al recuperar los datos'.format(e)

        finally:
            cursor.close()
            self.CloseConnection()

    def GetUsuario(self, idUsuario):
        try:
            cursor = self.Conn.cursor()
            cursor.callproc('UsuariosGetOneForId', [idUsuario])
            for result in cursor.stored_results():
                row = result.fetchone()
                usuario = Tablas.Usuario()
                usuario.ID = row[0]
                usuario.Nombre = row[1]
                usuario.Apellido = row[2]
                usuario.Habilitado = row[3]
                usuario.IdPerfil = row[4]
                usuario.DNI = row[6]
                usuario.NombreUsuario = row[7]
                usuario.Email = row[8]
                usuario.State = Tablas.States.Consulta
                return usuario
        except Exception as e:
            return 'Error al recuperar los datos'.format(e)

        finally:
            cursor.close()
            self.CloseConnection()