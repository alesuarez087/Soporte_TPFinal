from Datos import VentaDB

class Venta():
    def __init__(self):
        self.DataVenta = VentaDB.DBVenta()

    def GetProvincias(self):
        return self.DataVenta.GetProvincias()

    def GetVentaItem(self):
        return self.DataVenta.GetVentaItem()

    def GetCompras(self, idUsuario):
        return self.DataVenta.GetCompras(idUsuario)

    def Alta(self, venta, carrito):
        return self.DataVenta.Alta(venta, carrito)
