import unittest
from Negocio.GeneroLogic import Genero

class TestGeneros(unittest.TestCase):
    controlador = Genero()

    def test_duplicidad_existe(self):
        self.assertIsNone(self.controlador.GetDuplicidad('Rock'))

    def test_duplicidad_no_existe(self):
        self.assertTrue(self.controlador.GetDuplicidad('Cha cha cha'))

if __name__ == "__main__":
    unittest.main()