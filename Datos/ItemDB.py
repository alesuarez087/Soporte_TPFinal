from sqlalchemy.sql.expression import func
from sqlalchemy import or_
from datetime import date
from Datos import Conexion
from Datos.Tablas import Item, Artista, Genero, TipoItem, Precio

class DBItem():
    def __init__(self):
        self.con = Conexion.conexion()

    def GetBuscador(self, texto):
        try:
            items = self.con.session.query(Item).join(Artista, Item.id_artista == Artista.id_artista).join(Genero, Item.id_genero == Genero.id_genero).join(TipoItem, Item.id_tipo_disco == TipoItem.id_tipo_item).filter(or_(Item.titulo.like("%"+texto+"%"), Artista.nombre_artista.like("%"+texto+"%")))
            if items.count() == 0:
                return False
            else:
                return items
        except Exception as e:
            print(e)
        finally:
            self.con.session.close()

    def GetAll(self):
        try:
            items = self.con.session.query(Item).join(Artista, Item.id_artista == Artista.id_artista).join(Genero, Item.id_genero == Genero.id_genero).join(TipoItem, Item.id_tipo_disco == TipoItem.id_tipo_item)
            if items.count() == 0:
                return False
            else:
                return items
        finally:
            self.con.session.close()

    def GetNovedades(self):
        try:
            items = self.con.session.query(Item).join(Artista, Item.id_artista == Artista.id_artista).join(Genero, Item.id_genero == Genero.id_genero).join(TipoItem, Item.id_tipo_disco == TipoItem.id_tipo_item).limit(8)
            if items.count() == 0:
                return False
            else:
                return items
        finally:
            self.con.session.close()

    def GetOne(self, idItem):
        try:
            item = self.con.session.query(Item).join(Artista, Item.id_artista == Artista.id_artista).join(Genero, Item.id_genero==Genero.id_genero).join(TipoItem, Item.id_tipo_disco==TipoItem.id_tipo_item).filter(Item.id_item==idItem).first()
            return item
        except:
            return None
        finally:
            self.con.session.close()

    def GetPrecios(self):
        actuales = self.con.session.query(Precio, Precio.id_item, func.max(Precio.fecha_desde).label("vigencia")).group_by(Precio.id_item)
        precios = self.con.session.query(Precio).all()

        valores_actuales = []

        for a in actuales:
            for p in precios:
                if a.id_item == p.id_item and a.vigencia == p.fecha_desde:
                    valores_actuales.append([a.id_item, a.vigencia, p.monto])

        return valores_actuales

    def GetPrecio(self, idItem):
        actuales = self.con.session.query(Precio, Precio.id_item, func.max(Precio.fecha_desde).label("vigencia")).filter(Precio.id_item == idItem).group_by(Precio.id_item)
        precios = self.con.session.query(Precio).filter(Precio.id_item == idItem).all()

        valores_actuales = []

        for a in actuales:
            for p in precios:
                if a.id_item == p.id_item and a.vigencia == p.fecha_desde:
                    valores_actuales.append([a.id_item, a.vigencia, p.monto])

        return valores_actuales

    def Alta(self, item, precio):
        try:
            self.con.session.add(item)
            self.con.session.commit()

            precio.id_item = item.id_item
            precio.fecha_desde = date.today()
            self.con.session.add(precio)
            self.con.session.commit()

            return True
        except Exception as e:
            print(e)
            self.con.session.rollback()
            return False
        finally:
            self.con.session.close()

    def Baja(self, item):
        try:
            sq = self.con.session.query(Item).filter(Item.id_item == item.id_item).first()
            self.con.session.delete(sq)
            self.con.session.commit()
            return True
        except Exception as e:
            self.con.session.rollback()
            print(e)
            return False
        finally:
            self.con.session.close()

    def Modificar(self, item, precio):
        try:
            update = self.con.session.query(Item).filter(Item.id_item == item.id_item).first()
            update.stock = item.stock
            update.titulo = item.titulo
            update.anio_lanzamiento = item.anio_lanzamiento
            update.id_tipo_disco = item.id_tipo_disco
            update.id_artista = item.id_artista
            update.id_genero = item.id_genero
            update.url_portada = item.url_portada

            self.con.session.add(update)
            self.con.session.commit()

            precio_vigente = self.GetPrecio(item.id_item)

            for pv in precio_vigente:
                if pv[2] != precio.monto:
                    precio.id_item = item.id_item
                    precio.fecha_desde = date.today()
                    self.con.session.add(precio)
                    self.con.session.commit()

            return True
        except Exception as e:
            self.con.session.rollback()
            return False
        finally:
            self.con.session.close()

    def Habilitar(self, idItem):
        try:
            update = self.con.session.query(Item).filter(Item.id_item == idItem).first()

            update.habilitado = True
            self.con.session.add(update)
            self.con.session.commit()

            return True
        except Exception as e:
            print(e)
            self.con.session.rollback()
            return False
        finally:
            self.con.session.close()

    def Deshabilitar(self, idItem):
        try:
            update = self.con.session.query(Item).filter(Item.id_item == idItem).first()

            update.habilitado = False
            self.con.session.add(update)
            self.con.session.commit()

            return True
        except Exception as e:
            print(e)
            self.con.session.rollback()
            return False
        finally:
            self.con.session.close()