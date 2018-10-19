import unittest
from Datos.Conexion import Connection
from Datos.ItemDB import DBItem
from Datos.UsuarioDB import DBUsuario

class TestPerfiles(unittest.TestCase):

	def test_existencia(self):
		self.assertNotEqual(Connection(), None)

	def testRetorno(self):
		retorno = DBUsuario()
		self.assertNotEqual(retorno.Login('suareza', 'fer12345'), None)

if __name__ == "__main__":
	unittest.main()
