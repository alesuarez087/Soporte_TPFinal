from Datos import UsuarioDB, TipoUsuario

class Usuario():
    def __init__(self):
        self.DataUsuario = UsuarioDB.DBUsuario()
        self.DataTipo = TipoUsuario.TipoUsuario()

    def GetAll(self):
        return self.DataUsuario.GetAll()

    def GetOne(self, idUsuario):
        return self.DataUsuario.GetOne(idUsuario)

    def GetDuplicidad(self, nombreUsuario):
        if self.DataUsuario.GetDuplicidad(nombreUsuario) == True:
            return None
        else:
            return True

    def Login(self, usuario, contr):
        return self.DataUsuario.Login(usuario, contr)

    def GetAllTipos(self):
        return self.DataTipo.GetAll()

    def Alta(self, usuario):
        return self.DataUsuario.Alta(usuario)

    def Modificar(self, usuario):
        return self.DataUsuario.Modificar(usuario)

    def Habilitar(self, idUsuario):
        return self.DataUsuario.Habilitar(idUsuario)

    def Deshabilitar(self, idUsuario):
        return self.DataUsuario.Deshabilitar(idUsuario)
