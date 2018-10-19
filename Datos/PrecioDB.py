from Datos import Conexion
from Datos import Tablas

class DBItem():
    def __init__(self):
        self.con = Conexion.conexion()

    def GetAll(self):
        try:
            items = self.con.session.query(Tablas.Item).all()
            if(len(items)==0):
                return False
            else:
                return items
        finally:
            self.con.session.close()

    def GetOne(self, idItem):
        try:
            item = self.con.session.query(Tablas.Item).filter(Tablas.Item.id_item == idItem).first()
            return item
        except:
            return None
        finally:
            self.con.session.close()

    def Save(self, item, state):
        if state=='Alta':
            return self.Alta(item)
        elif state=='Baja':
            return self.Baja(item)
        elif state=='Modificar':
            return self.Modificar(item)

    def Alta(self, item):
        try:
            self.con.session.add(item)
            self.con.session.commit()
            return True
        except Exception as e:
            print('Error '+e)
            self.con.session.rollback()
            return False
        finally:
            self.con.session.close()

    def Baja(self, item):
        try:
            sq = self.con.session.query(Tablas.Item).filter(Tablas.Item.id_item == item.id_item).first()
            self.con.session.delete(sq)
            self.con.session.commit()
            return True
        except Exception as e:
            self.con.session.rollback()
            print(e)
            return False
        finally:
            self.con.session.close()

    def Modificar(self, item):
        try:
            update = self.con.session.query(Tablas.Item).filter(Tablas.Item.id_item == item.id_item).first()
            update.stock = item.stock
            update.titulo = item.titulo
            update.anio_lanzamiento = item.anio_lanzamiento
            update.tipo_item = item.tipo_item
            update.id_artista = item.id_artista
            update.id_genero = item.id_genero
            update.url_portada = item.url_portada

            self.con.session.add(update)
            self.con.session.commit()
            return True
        except Exception as e:
            self.con.session.rollback()
            return False
        finally:
            self.con.session.close()