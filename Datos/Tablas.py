from enum import Enum
from Datos import ArtistaDB, ItemDB


class States (Enum):
    Alta = 'Alta'
    Baja = 'Baja'
    Modificacion = 'Modificacion'
    Consulta = 'Consulta'


class Entidad():
    ID = None
    Estado = None
    Habilitado = None

class Artista(Entidad):
    Nombre = None

class Clasificacion(Entidad):
    Valor = None
    Detalles = None
    IdUsuario = None
    IdItem = None

class Genero(Entidad):
    Descripcion = None

class Item(Entidad):
    class TiposDisco(Enum):
        CD = 'CD'
        DVD = 'DVD'
        Vinilo = 'Vinilo'
        Pasta = 'Pasta'
        BlueRay = 'BlueRay'

    Stock = None
    Titulo = None
    AnioLanzamiento = None
    TipoDisco = None
    IdArtista = None
    IdGenero = None
    Portada = None

    def GetArtista(self):
        art = ArtistaDB.DBArtista()
        return art.GetArtista(self.IdArtista).Nombre

    def GetPrecio(self):
        pre = ItemDB.DBItem()
        return pre.GetPrecio(self.ID).Valor

class Precio():
    VigenciaDesde = None
    Valor = None
    IdItem = None

class Provincia(Entidad):
    Descripcion = None

class TipoItem(Entidad):
    Descripcion = None

class TipoUsuario(Entidad):
    Descripcion = None

class Usuario(Entidad):
    class TiposUsuario(Enum):
        Administrador ='Administrador'
        Usuario = 'Usuario'
        Empleado = 'Empleado'

    NombreUsuario = None
    Clave = None
    Nombre = None
    Apellido = None
    Email = None
    DNI = None
    TipoUsuario = None

class Venta(Entidad):
    TitularTarjeta = None
    NroTarjeta = None
    IdUsuario = None
    Fecha = None
    IdProvincia = None
    Localidad = None
    Calle = None
    NroCalle = None
    Piso = None
    NroDpto = None

class VentaItem(Entidad):
    IdVenta = None
    IdItem = None
    Cantidad = None

