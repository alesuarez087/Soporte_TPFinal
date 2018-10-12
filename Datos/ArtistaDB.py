from mysql import connector
from Datos import ConnectionMySQL
from Datos import Tablas


class DBArtista(ConnectionMySQL.Connection):

    def GetAll(self):
        cursor = self.Conn.cursor()
        try:
            cursor.callproc('ArtistasGetAll')
            for result in cursor.stored_results():
                rows = result.fetchall()
                if len(rows) > 0:
                    artistas = []
                    for row in rows:
                        artista = Tablas.Artista()
                        artista.ID = row[0]
                        artista.Nombre = row[1]
                        artista.Habilitado = row[2]
                        artistas.append(artista)
                    return artistas
                else:
                    return False
        except Exception as e:
            return  'Error al recuperar los datos '.format(e)
        finally:
            cursor.close()
            self.CloseConnection()

    def GetArtista(self, idArtista):
        cursor = self.Conn.cursor()
        try:
            cursor.callproc('ArtistasGetOneForID', [idArtista])
            for result in cursor.stored_results():
                row = result.fetchone()
                artista = Tablas.Artista()

                artista.ID = row[0]
                artista.Nombre = row[1]
                return artista

        except Exception as e:
            return 'Error al recuperar los datos'.format(e)

        finally:
            cursor.close()
            self.CloseConnection()



    def Guardar(self,artista):
        if artista.State == Tablas.States.Alta:
            return self.Alta(artista)
        elif artista.State == Tablas.States.Baja:
            return self.Baja(artista)
        elif artista.State == Tablas.States.Modificacion:
            return self.Modificacion(artista)

    def Alta(self, artista):
        cursor = self.Conn.cursor()
        try:
            sql = "INSERT INTO artistas(nombre_artista, habilitado) VALUES (%s, %s)"
            data = [artista.Nombre, artista.Habilitado]
            cursor.execute(sql, data)

            self.Conn.commit()
            return True
        except Exception as e:
            return False
        finally:
            cursor.close()
            self.CloseConnection()


    def Modificacion(self, artista):
        cursor = self.Conn.cursor()
        try:

            data = [artista.Nombre, artista.Habilitado, artista.ID]
            cursor.execute(sql, data)

            self.Conn.commit()
            return True
        except Exception as e:
            return False
        finally:
            cursor.close()
            self.CloseConnection()

    def Baja(self, artista):
        con = connector.connect(user="root", password="ale087", host="127.0.0.1", database="entornos_final")
        cursor = con.cursor()
        try:
            cursor.callproc('ArtistasDelete', [artista.ID])
            if cursor.stored_results():

                return True

        except Exception as e:
            return False
        finally:
            cursor.close()
            self.CloseConnection()


