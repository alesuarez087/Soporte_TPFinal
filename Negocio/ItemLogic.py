from Datos.ItemDB import DBItem


class Item:
    def __init__(self):
        self.DataItem = DBItem()

    def ListarItem(self):
        return self.DataItem.ListarItem()