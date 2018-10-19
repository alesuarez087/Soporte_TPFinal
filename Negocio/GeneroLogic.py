from Datos import GeneroDB

class Genero:

    def __init__(self):
        self.DataGenero = GeneroDB.DBGenero()

    def GetAll(self):
        return self.DataGenero.GetAll()

    def GetHabilitados(self):
        return self.DataGenero.GetHabilitados()

    def GetOne(self, idGenero):
        return self.DataGenero.GetOne(idGenero)

    def Alta(self, genero):
        return self.DataGenero.Alta(genero)

    def Modificar(self, genero):
        return self.DataGenero.Modificar(genero)

    def Habilitar(self, idGenero):
        return self.DataGenero.Habilitar(idGenero)

    def Deshabilitar(self, idGenero):
        return self.DataGenero.Deshabilitar(idGenero)