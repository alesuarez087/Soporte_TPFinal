import unittest
from Negocio.ItemLogic import Item

class TestUsuarios(unittest.TestCase):
    controlador = Item()

    def test_duplicidad_existe(self):
        self.assertIsNone(self.controlador.GetDuplicidad('Naranja Persa I', 1, 2 ))

    def test_duplicidad_no_existe_titulo(self):
        self.assertTrue(self.controlador.GetDuplicidad('Naranja Persa', 1, 2))

    def test_duplicidad_no_existe_artista(self):
        self.assertTrue(self.controlador.GetDuplicidad('Naranja Persa I', 2, 2))

    def test_duplicidad_no_existe_tipo(self):
        self.assertTrue(self.controlador.GetDuplicidad('Naranja Persa I', 1, 1))

    def test_buscador_titulo(self):
        self.assertTrue(self.controlador.GetBuscador('Después de ver'))

    def test_buscador_artista(self):
        self.assertTrue(self.controlador.GetBuscador('ciro'))

    def test_habilitar_falso(self):
        self.assertFalse(self.controlador.Habilitar(8))


if __name__ == "__main__":
    unittest.main()