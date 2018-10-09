import unittest
from Datos.DataUsuario import DataUsuario

class TestPerfiles(unittest.TestCase):

	def test_existencia(self):
		self.assertEqual(len(DataUsuario().GetPerfiles()), 2)

	def test_existe_admin(self):
		self.assertEqual(DataUsuario().GetPerfiles()[0].Nombre, 'Administrador')
		self.assertEqual(DataUsuario ().GetPerfiles ()[0].ID, 1)

if __name__ == "__main__":
	unittest.main()
