from Datos import Conexion
from Datos import Tablas


class DBArtista():

    def __init__(self):
        self.con = Conexion.conexion()

    def GetAll(self):
        try:
            artistas = self.con.session.query(Tablas.Artista).order_by(Tablas.Artista.nombre_artista).all()
            if(len(artistas)==0):
                return None
            else:
                return artistas
        finally:
            self.con.session.close()

    def GetHabilitados(self):
        try:
            artistas = self.con.session.query(Tablas.Artista).filter(Tablas.Artista.habilitado == True).order_by(Tablas.Artista.nombre_artista).all()
            if(len(artistas)==0):
                return None
            else:
                return artistas
        finally:
            self.con.session.close()

    def GetOne(self, idArtista):
        try:
            artista = self.con.session.query(Tablas.Artista).filter(Tablas.Artista.id_artista == idArtista).first()
            return artista
        except:
            return None
        finally:
            self.con.session.close()

    def GetDuplicidad(self, nombreArtista):
        try:
            artista = self.con.session.query(Tablas.Artista).filter(Tablas.Artista.nombre_artista == nombreArtista).first()
            if artista:
                return True
            else:
                return None
        except:
            return None
        finally:
            self.con.session.close()

    def Alta(self, artista):
        try:
            self.con.session.add(artista)
            self.con.session.commit()
            return True
        except Exception as e:
            print(e)
            self.con.session.rollback()
            return False
        finally:
            self.con.session.close()

    def Baja(self, artista):
        try:
            update = self.con.session.query(Tablas.Artista).filter(Tablas.Artista.id_artista == artista.id_artista).first()

            update.habilitado = False

            self.con.session.add(update)
            self.con.session.commit()
            return True
        except Exception as e:
            self.con.session.rollback()
            return None
        finally:
            self.con.session.close()

    def Modificar(self, artista):
        try:
            update = self.con.session.query(Tablas.Artista).filter(Tablas.Artista.id_artista == artista.id_artista).first()

            update.nombre_artista = artista.nombre_artista
            update.habilitado = artista.habilitado
            self.con.session.add(update)
            self.con.session.commit()

            return True
        except Exception as e:
            self.con.session.rollback()
            return None
        finally:
            self.con.session.close()

    def Habilitar(self, idArtista):
        try:
            update = self.con.session.query(Tablas.Artista).filter(Tablas.Artista.id_artista == idArtista).first()

            update.habilitado = True
            self.con.session.add(update)
            self.con.session.commit()

            return True
        except Exception as e:
            print(e)
            self.con.session.rollback()
            return None
        finally:
            self.con.session.close()

    def Deshabilitar(self, idArtista):
        try:
            update = self.con.session.query(Tablas.Artista).filter(Tablas.Artista.id_artista == idArtista).first()

            update.habilitado = False
            self.con.session.add(update)
            self.con.session.commit()

            return True
        except Exception as e:
            self.con.session.rollback()
            return None
        finally:
            self.con.session.close()