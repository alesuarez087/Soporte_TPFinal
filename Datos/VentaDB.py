from sqlalchemy.sql.expression import func
from datetime import date
from Datos import Conexion, ItemDB
from Datos.Tablas import Provincia, Item, Venta, VentaItem, Precio


class DBVenta():

    def __init__(self):
        self.con = Conexion.conexion()

    def GetProvincias(self):
        try:
            provincias = self.con.session.query(Provincia).order_by(Provincia.desc_provincia).all()
            if(len(provincias)==0):
                return False
            else:
                return provincias
        finally:
            self.con.session.close()

    def GetCompras(self, idUsuario):
        try:
            compras = self.con.session.query(Venta).filter(Venta.id_usuario == idUsuario).all()
            if len(compras)==0:
                return False
            else:
                return compras
        except:
            return None
        finally:
            self.con.session.close()

    def GetVentaItem(self):
        try:
            venIt = self.con.session.query(VentaItem).all()
            if len(venIt)==0:
                return False
            else:
                return venIt
        except:
            return None
        finally:
            self.con.session.close()


    def Alta(self, venta, carrito):
        try:
            venta.fecha = date.today()
            venta.habilitado = True
            self.con.session.add(venta)
            self.con.session.commit()

            for c in carrito:
                venIt = VentaItem()
                venIt.id_item = c[0]
                venIt.cantidad = c[1]
                venIt.id_venta = venta.id_venta
                self.con.session.add(venIt)
                self.con.session.commit()

            aux = ItemDB.DBItem()
            aux.ActualizarStock(carrito)

            return True
        except Exception as e:
            print(e)
            self.con.session.rollback()
            return False
        finally:
            self.con.session.close()

