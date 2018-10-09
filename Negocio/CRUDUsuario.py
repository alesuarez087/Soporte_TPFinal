from Datos.DataCiudad import DataCiudad, DataProvincia
from Datos.DataUsuario import DataUsuario, DataPerfil
from Datos import Tables

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

    def GetOne(self, idUsuario):
        return self.DataUsuario.GetOne(idUsuario)

    def Loguin(self, user, passw):
        return self.DataUsuario.Loguin(user, passw)

    def Save(self, user):
        return self.DataUsuario.Save(user)

class Perfiles:

    def __init__(self):
        self.DataPerfil = DataPerfil()
    def GetPerfiles(self):
        return self.DataPerfil.GetPerfiles()
