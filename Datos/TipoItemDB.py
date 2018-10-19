from Datos import Conexion
from Datos import Tablas

class DBTipoItem():
    def __init__(self):
        self.con = Conexion.conexion()

    def GetAll(self):
        try:
            tip = self.con.session.query(Tablas.TipoItem).order_by(Tablas.TipoItem.desc_tipo_item).all()
            if(len(tip)==0):
                return False
            else:
                return tip
        finally:
            self.con.session.close()

    def GetHabilitado(self):
        try:
            tip = self.con.session.query(Tablas.TipoItem).filter(Tablas.TipoItem.habilitado == True).order_by(Tablas.TipoItem.desc_tipo_item).all()
            if(len(tip)==0):
                return False
            else:
                return tip
        finally:
            self.con.session.close()

    def GetOne(self, idTipoItem):
        try:
            item = self.con.session.query(Tablas.TipoItem).filter(Tablas.TipoItem.id_tipo_item == idTipoItem).first()
            return item
        except:
            return None
        finally:
            self.con.session.close()

    def Alta(self, item):
        try:
            self.con.session.add(item)
            self.con.session.commit()
            return True
        except Exception as e:
            print('Error '+e)
            self.con.session.rollback()
            return False
        finally:
            self.con.session.close()

    def Baja(self, tipoItem):
        try:
            sq = self.con.session.query(Tablas.TipoItem).filter(Tablas.TipoItem.id_tipo_item == tipoItem.id_tipo_item).first()
            self.con.session.delete(sq)
            self.con.session.commit()
            return True
        except Exception as e:
            self.con.session.rollback()
            print(e)
            return False
        finally:
            self.con.session.close()

    def Modificar(self, tipoItem):
        try:
            update = self.con.session.query(Tablas.TipoItem).filter(Tablas.TipoItem.id_tipo_item == tipoItem.id_tipo_item).first()
            update.desc_tipo_item = tipoItem.desc_tipo_item

            self.con.session.add(update)
            self.con.session.commit()
            return True
        except Exception as e:
            self.con.session.rollback()
            return False
        finally:
            self.con.session.close()

    def Habilitar(self, idTipoItem):
        try:
            update = self.con.session.query(Tablas.TipoItem).filter(Tablas.TipoItem.id_tipo_item == idTipoItem).first()

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

    def Deshabilitar(self, idTipoItem):
        try:
            update = self.con.session.query(Tablas.TipoItem).filter(Tablas.TipoItem.id_tipo_item == idTipoItem).first()

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