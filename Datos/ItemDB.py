from Datos import ConnectionMySQL
from Datos.Tablas import Item, Precio

class DBItem(ConnectionMySQL.Connection):

    def ListarItem(self):
        conn = None
        cursor = None

        try:
            #con =  mysql.connector.connect(user="root", password="ale087", host="127.0.0.1", database="entornos_final")
            #con = self.OpenConnection()
            cursor = self.Conn.cursor()
            cursor.callproc('ItemsGetTop8')
            for result in cursor.stored_results():
                rows = result.fetchall()
                if len(rows) > 0:
                    items = []
                    for row in rows:
                        item = Item()
                        item.ID = row[0]
                        item.Titulo = row[1]
                        item.AnioLanzamiento = row[2]
                        item.Stock = row[3]
                        item.Habilitado = row[4]
                        item.IdArtista = row[5]
                        item.IdGenero = row[6]
                        item.TipoDisco = row[7]
                        item.Portada = row[8]
                        items.append(item)
                    return items
                else:
                    return False
        except Exception as e:
            return  'Erro al recuperar los datos '.format(e)
        finally:
            cursor.close()
            self.CloseConnection()

    def GetPrecio(self, idItem):
        cursor = self.Conn.cursor()
        cursor.callproc('PrecioGetToday', [idItem])
        for result in cursor.stored_results():
            row = result.fetchone()
            precio = Precio()
            precio.Valor = row[1]
            return precio

