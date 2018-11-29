import unittest
from Negocio.ArtistaLogic import Artista

class TestArtistas(unittest.TestCase):
    controlador = Artista()

    def test_duplicidad_existe(self):
        self.assertIsNone(self.controlador.GetDuplicidad('Los Piojos'))

    def test_duplicidad_no_existe(self):
        self.assertTrue(self.controlador.GetDuplicidad('Los Pericos'))

if __name__ == "__main__":
    unittest.main()