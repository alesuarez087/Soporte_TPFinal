from Datos.UsuarioDB import DBUsuario

class Usuarios:
    def __init__(self):
        self.DataUsuario = DBUsuario()

    def Login(self, usuario, contr):
        return self.DataUsuario.Login(usuario, contr)

    def GetUsuario(self, idUsuario):
        return self.DataUsuario.GetUsuario(idUsuario)