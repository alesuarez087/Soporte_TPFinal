from Datos import ItemDB

class Item():
    def __init__(self):
        self.DataItem = ItemDB.DBItem()

    def GetBuscador(self, texto):
        return  self.DataItem.GetBuscador(texto)

    def GetAll(self):
        return self.DataItem.GetAll()

    def GetNovedades(self):
        return  self.DataItem.GetNovedades()

    def GetPrecios(self):
        return self.DataItem.GetPrecios()

    def GetOne(self, idItem):
        return self.DataItem.GetOne(idItem)

    def GetDuplicidad(self, titulo, artista, tipo):
        if self.DataItem.GetDuplicidad(titulo, artista, tipo) == True:
            return None
        else:
            return True

    def GetPrecio(self, idItem):
        return self.DataItem.GetPrecio(idItem)

    def Alta(self, item, precio):
        return self.DataItem.Alta(item, precio)

    def Modificar(self, item, precio):
        return self.DataItem.Modificar(item, precio)

    def Habilitar(self, idItem):
        return self.DataItem.Habilitar(idItem)

    def Deshabilitar(self, idItem):
        return self.DataItem.Deshabilitar(idItem)
