from abc import ABC, abstractmethod

class Generator(ABC):
    @abstractmethod
    def __init__(self, scheme: dict):
        self.scheme = scheme
        super().__init__()

    @abstractmethod
    def gen_init_statement(self, table: str, entities_type: str):
        pass

    @abstractmethod
    def gen_init_statement(self, table: str, entities_type: str, name: str, type: str):
        pass

    def attribute_type(self, table: str, entities_type: str, name: str, type: str):
        if type in self.scheme['Catalog']:
            return 'Catalog'
        elif type in self.scheme['Assets']:
            if entities_type == 'Catalog':
                raise Exception(f'Catalog entity {table} can not reference to Assets {name:type}')
            else:
                return 'Assets'
        elif type in self.scheme['Operations']:
            raise Exception(f'entity {table} can not reference to Operations {name:type}')