from Datos.ArtistaDB import DBArtista

class Artista():
    def __init__(self):
        self.DataArtista = DBArtista()

    def GetAll(self):
        return self.DataArtista.GetAll()

    def GetOne(self, idArtista):
        return self.DataArtista.GetArtista(idArtista)

    def Save(self, artista):
        return self.DataArtista.Guardar(artista)