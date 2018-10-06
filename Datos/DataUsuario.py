"""
    def alta(self, per):
        try:
            # con = connector.connect(user="root", password="ale087", host="127.0.0.1", database="python_practica")

            cursor = self.Conn.cursor()
            caux = "INSERT INTO persona (nombre, fecha_nacimiento, dni, altura) VALUES (%s,%s,%s,%s)"
            tdatos = (per.nombre, per.fecha, per.dni, per.altura)
            cursor.execute (caux, tdatos)
            self.Conn.commit ()
            cursor.close ()
            self.CloseConnection ()
            # self.con.session.add(per)
            return True
        except Exception as e:
            print ("Error al insertar")
            self.Conn.rollback ()
            return False
"""

from Datos.ConnectionMySQL import Connection
import Datos.DataCiudad
from datetime import datetime

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