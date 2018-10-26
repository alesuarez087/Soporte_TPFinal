from Datos import ArtistaDB

class Artista():
    def __init__(self):
        self.DataArtista = ArtistaDB.DBArtista()

    def GetAll(self):
        return self.DataArtista.GetAll()

    def GetHabilitados(self):
        return  self.DataArtista.GetHabilitados()

    def GetOne(self, idArtista):
        return self.DataArtista.GetOne(idArtista)

    def GetDuplicidad(self, nombreArtista):
        if self.DataArtista.GetDuplicidad(nombreArtista) == True:
            return None
        else:
            return True

    def Alta(self, artista):
        return self.DataArtista.Alta(artista)

    def Modificar(self, artista):
        return self.DataArtista.Modificar(artista)

    def Habilitar(self, idArtista):
        return self.DataArtista.Habilitar(idArtista)

    def Deshabilitar(self, idArtista):
        return self.DataArtista.Deshabilitar(idArtista)