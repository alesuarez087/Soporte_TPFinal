from Datos import Conexion
from Datos.Tablas import Usuario, TipoUsuario
from sqlalchemy import func

class DBUsuario():

    def Login(self, user, passw):
        try:
            usuario = self.con.session.query(Usuario).filter(Usuario.nombre_usuario==user and Usuario.clave == passw).first()
            return usuario
        except:
            return None

        finally:
            self.con.session.close()

    def __init__(self):
        self.con = Conexion.conexion()

    def GetAll(self):
        try:
            usuarios = self.con.session.query(Usuario).order_by(Usuario.apellido, Usuario.nombre_usuario).all()

            if(len(usuarios)==0):
                return False
            else:
                return usuarios

        finally:
            self.con.session.close()

    def GetOne(self, idUsuario):
        try:
            usuario = self.con.session.query(Usuario).filter(Usuario.id_usuario == idUsuario).first()
            return usuario
        except:
            return None
        finally:
            self.con.session.close()

    def GetDuplicidad(self, nombreUsuario):
        try:
            artista = self.con.session.query(Usuario).filter(Usuario.nombre_usuario == nombreUsuario).first()
            if artista:
                return True
            else:
                return None
        except:
            return None
        finally:
            self.con.session.close()

    def Alta(self, usuario):
        try:
            self.con.session.add(usuario)
            self.con.session.commit()
            return True
        except Exception as e:
            print(e)
            self.con.session.rollback()
            return False
        finally:
            self.con.session.close()

    def Baja(self, usuario):
        try:
            sq = self.con.session.query(Usuario).filter(Usuario.id_usuario == usuario.id_usuario).first()
            self.con.session.delete(sq)
            self.con.session.commit()
            return True
        except Exception as e:
            self.con.session.rollback()
            print(e)
            return False
        finally:
            self.con.session.close()

    def Modificar(self, usuario):
        try:
            update = self.con.session.query(Usuario).filter(Usuario.id_usuario == usuario.id_usuario).first()

            update.nombre_usuario = usuario.nombre_usuario
            update.clave = usuario.nombre_usuario
            update.nombre = usuario.nombre
            update.apellido = usuario.apellido
            update.email = usuario.email
            update.dni = usuario.dni
            update.id_tipo_usuario = usuario.id_tipo_usuario

            self.con.session.add(update)
            self.con.session.commit()
            return True
        except Exception as e:
            print(e)
            self.con.session.rollback()
            return False
        finally:
            self.con.session.close()

    def Habilitar(self, idUsuario):
        try:
            update = self.con.session.query(Usuario).filter(Usuario.id_usuario == idUsuario).first()

            update.habilitado = True
            self.con.session.add(update)
            self.con.session.commit()

            return True
        except Exception as e:
            print(e)
            self.con.session.rollback()
            return False
        finally:
            self.con.session.close()

    def Deshabilitar(self, idUsuario):
        try:
            update = self.con.session.query(Usuario).filter(Usuario.id_usuario == idUsuario).first()

            update.habilitado = False
            self.con.session.add(update)
            self.con.session.commit()

            return True
        except Exception as e:
            print(e)
            self.con.session.rollback()
            return False
        finally:
            self.con.session.close()