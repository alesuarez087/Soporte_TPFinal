from Datos.DataCiudad import DataCiudad, DataProvincia
from Datos.DataUsuario import DataUsuario

class Ciudades:
    def __init__(self):
        self.DataCiudad = DataCiudad()
        self.DataProvincia = DataProvincia()

    def GetCiudades(self):
        return self.DataCiudad.GetAll()

    def GetCiudadesForProvincias(self, idProvincia):
        return self.DataCiudad.GetAll(idProvincia)

    def GetProvincias(self):
        return self.DataProvincia.GetAll()

class Usuarios:
    def __init__(self):
        self.DataUsuario = DataUsuario()

    def GetUsuarios(self):
        return self.DataUsuario.GetAll()

    def GetPerfiles(self):
        return self.DataUsuario.GetPerfiles
