from Datos import Conexion
from Datos import Tablas

class DBGenero():
    def __init__(self):
        self.con = Conexion.conexion()

    def GetAll(self):
        try:
            generos = self.con.session.query(Tablas.Genero).order_by(Tablas.Genero.desc_genero).all()
            if(len(generos)==0):
                return False
            else:
                return generos
        finally:
            self.con.session.close()

    def GetHabilitados(self):
        try:
            generos = self.con.session.query(Tablas.Genero).filter(Tablas.Genero.habilitado==True).order_by(Tablas.Genero.desc_genero).all()
            if(len(generos)==0):
                return False
            else:
                return generos
        finally:
            self.con.session.close()

    def GetOne(self, idGenero):
        try:
            genero = self.con.session.query(Tablas.Genero).filter(Tablas.Genero.id_genero == idGenero).first()
            return genero
        except:
            return None
        finally:
            self.con.session.close()

    def Save(self, genero, state):
        if state=='Alta':
            return self.Alta(genero)
        elif state=='Baja':
            return self.Baja(genero)
        elif state=='Modificar':
            return self.Modificar(genero)

    def Alta(self, genero):
        try:
            self.con.session.add(genero)
            self.con.session.commit()
            return True
        except Exception as e:
            print(e)
            self.con.session.rollback()
            return False
        finally:
            self.con.session.close()

    def Baja(self, genero):
        try:
            sq = self.con.session.query(Tablas.Genero).filter(Tablas.Genero.id_genero == genero.id_genero).first()
            self.con.session.delete(sq)
            self.con.session.commit()
            return True
        except Exception as e:
            self.con.session.rollback()
            print(e)
            return False
        finally:
            self.con.session.close()

    def Modificar(self, genero):
        try:
            update = self.con.session.query(Tablas.Genero).filter(Tablas.Genero.id_genero == genero.id_genero).first()

            update.desc_genero = genero.desc_genero

            self.con.session.add(update)
            self.con.session.commit()
            return True
        except Exception as e:
            self.con.session.rollback()
            return False
        finally:
            self.con.session.close()

    def Habilitar(self, idGenero):
        try:
            update = self.con.session.query(Tablas.Genero).filter(Tablas.Genero.id_genero == idGenero).first()

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

    def Deshabilitar(self, idGenero):
        try:
            update = self.con.session.query(Tablas.Genero).filter(Tablas.Genero.id_genero == idGenero).first()

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