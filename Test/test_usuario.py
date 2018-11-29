import unittest
from Negocio.UsuarioLogic import Usuario

class TestUsuarios(unittest.TestCase):
    controlador = Usuario()

    def test_duplicidad_existe(self):
        self.assertIsNone(self.controlador.GetDuplicidad('suareza'))

    def test_duplicidad_no_existe(self):
        self.assertTrue(self.controlador.GetDuplicidad('alepersa087'))

if __name__ == "__main__":
    unittest.main()