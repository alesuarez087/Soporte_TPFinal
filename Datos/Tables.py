import Datos.DataCiudad
import Datos.DataUsuario
from enum import Enum


class States (Enum):
    Create = 'Create'
    Read = 'Read'
    Update = 'Update'
    Delete = 'Delete'


class Entidades ():
    ID = None
    State = None


class Usuario (Entidades):

    Nombre = None
    Apellido = None
    NombreUsuario = None
    Contrasenia = None
    Email = None
    FechaNacimiento = None
    DNI = None
    IdPerfil = None

    """"
    IdCiudad = None
    Provincia = None
    Ciudad = None

    def GetCiudad(self):
        return self.Ciudad.GetOne (self.IdCiudad).Nombre

    def GetProvincia(self):
        cod = self.Ciudad.GetOne(self.IdCiudad).IdProvincia
        return self.Provincia.GetOne(cod).Nombre
    """
    def GetPerfil(self):
        User = Datos.DataUsuario.DataUsuario ()
        return User.GetPerfil (self.IdPerfil).Nombre


class Perfil(Entidades):
    Nombre = None


class Ciudad (Entidades):
    Nombre = None
    IdProvincia = None


class Provincia (Entidades):
    Nombre = None
