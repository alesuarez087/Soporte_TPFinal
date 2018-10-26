from Datos import TipoItemDB

class TipoItem():
    def __init__(self):
        self.DataTipoItem = TipoItemDB.DBTipoItem()

    def GetAll(self):
        return self.DataTipoItem.GetAll()

    def GetHabilitados(self):
        return self.DataTipoItem.GetHabilitado()

    def GetOne(self, idTipoItem):
        return self.DataTipoItem.GetOne(idTipoItem)

    def GetDuplicidad(self, nombre):
        if self.DataTipoItem.GetDuplicidad(nombre) == True:
            return None
        else:
            return True

    def Alta(self, tipoItem):
        return self.DataTipoItem.Alta(tipoItem)

    def Modificar(self, tipoItem):
        return self.DataTipoItem.Modificar(tipoItem)

    def Habilitar(self, idTipoItem):
        return self.DataTipoItem.Habilitar(idTipoItem)

    def Deshabilitar(self, idTipoItem):
        return self.DataTipoItem.Deshabilitar(idTipoItem)
