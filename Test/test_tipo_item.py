import unittest
from Negocio.TipoItemLogic import TipoItem

class TestUsuarios(unittest.TestCase):
    controlador = TipoItem()

    def test_duplicidad_existe(self):
        self.assertIsNone(self.controlador.GetDuplicidad('CD'))

    def test_duplicidad_no_existe(self):
        self.assertTrue(self.controlador.GetDuplicidad('Remera'))

if __name__ == "__main__":
    unittest.main()