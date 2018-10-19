from Datos import Tablas, Conexion

class TipoUsuario():
    def __init__(self):
        self.con = Conexion.conexion()

    def GetAll(self):
        try:
            tipos_usuario = self.con.session.query(Tablas.TipoUsuario).all()
            if(len(tipos_usuario)==0):
                return False
            else:
                return tipos_usuario
        finally:
            self.con.session.close()

    def GetOne(self, idTipoUsuario):
        try:
            tipo = self.con.session.query(Tablas.Genero).filter(Tablas.TipoUsuario.id_tipo_usuario == idTipoUsuario).first()
            return tipo
        except:
            return None
        finally:
            self.con.session.close()

    def Alta(self, genero):
        try:
            self.con.session.add(genero)
            self.con.session.commit()
            return True
        except Exception as e:
            print('Error '+e)
            self.con.session.rollback()
            return False
        finally:
            self.con.session.close()
