from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship, backref
from sqlalchemy import Column, Integer, String, ForeignKey, Float, Date, Boolean


Base = declarative_base()

class Artista(Base):
    __tablename__ = 'artistas'
    id_artista = Column(Integer, primary_key=True, autoincrement=True)
    nombre_artista = Column(String)
    habilitado = Column(Boolean)



class Clasificacion(Base):
    __tablename__ = 'clasificaciones'
    id_usuario = Column(Integer, ForeignKey('usuarios.id_usuario'), primary_key=True)
    id_item = Column(Integer, ForeignKey('items.id_item'), primary_key=True)
    valor = Column(Float)
    detalles = Column(String)

class Genero(Base):
    __tablename__ = 'generos'
    id_genero = Column(Integer, primary_key=True, autoincrement=True)
    desc_genero = Column(String)
    habilitado = Column(Boolean)

class Precio(Base):
    __tablename__ = 'precios'
    fecha_desde = Column(Date, primary_key=True)
    monto = Column(Float)
    id_item = Column(Integer, ForeignKey('items.id_item'), primary_key=True)

class Provincia(Base):
    __tablename__ = 'provincias'
    id_provincia = Column(Integer, primary_key=True, autoincrement=True)
    desc_provincia = Column(String)

class TipoItem(Base):
    __tablename__ = 'tipos_item'
    id_tipo_item = Column(Integer, primary_key=True, autoincrement=True)
    desc_tipo_item = Column(String)
    habilitado = Column(Boolean)

class Item(Base):
    __tablename__ = 'items'
    id_item = Column(Integer, primary_key=True, autoincrement=True)
    stock = Column(Integer)
    titulo = Column(String)
    anio_lanzamiento = Column(Integer)
    id_tipo_disco = Column(Integer, ForeignKey('tipos_item.id_tipo_item'))
    id_artista = Column(Integer, ForeignKey('artistas.id_artista'))
    id_genero = Column(Integer, ForeignKey('generos.id_genero'))
    url_portada = Column(String)
    habilitado = Column(Boolean)

    artista = relationship(Artista, backref=backref('items', uselist=True))
    genero = relationship(Genero, backref=backref('items', uselist=True))
    tipo = relationship(TipoItem, backref=backref('items', uselist=True))
    precio = relationship(Precio, backref=backref('items', uselist=True))

class TipoUsuario(Base):
    __tablename__ = 'tipos_usuario'
    id_tipo_usuario = Column(Integer, primary_key=True, autoincrement=True)
    desc_tipo_usuario = Column(String)

class Usuario(Base):
    __tablename__ = 'usuarios'
    id_usuario = Column(Integer, primary_key=True, autoincrement=True)
    nombre_usuario = Column(String)
    clave = Column(String)
    nombre = Column(String)
    apellido = Column(String)
    email = Column(String)
    dni = Column(Integer)
    id_tipo_usuario = Column(Integer, ForeignKey('tipos_usuario.id_tipo_usuario'))
    habilitado = Column(Boolean)

class VentaItem(Base):
    __tablename__ = 'venta_item'
    id_venta = Column(Integer, ForeignKey('ventas.id_venta'), primary_key=True)
    id_item = Column(Integer, ForeignKey('items.id_item'), primary_key=True)
    cantidad = Column(Integer)

    item = relationship(Item, backref=backref('items', uselist=True))

class Venta(Base):
    __tablename__ = 'ventas'
    id_venta = Column(Integer, primary_key=True, autoincrement=True)
    titular_tarjeta = Column(String)
    nro_tarjeta = Column(Integer)
    id_usuario = Column(Integer, ForeignKey('usuarios.id_usuario'))
    fecha = Column(Date)
    id_provincia = Column(Integer, ForeignKey('provincias.id_provincia'))
    localidad = Column(String)
    calle = Column(String)
    numero = Column(Integer)
    piso = Column(String)
    dpto = Column(String)
    habilitado = Column(Boolean)

    venta_item = relationship(VentaItem, backref=backref('venta_item', uselist=True))



