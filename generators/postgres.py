import context as _
from src.generator import Generator

class PostgresGenerator(Generator):
    def __init__(self, scheme: dict):
        super().__init__(scheme)


    def gen_init_statement(self, table: str, entities_type: str):
        statement = f'''
            CREATE TABLE {table} (
                id UUID PRIMARY KEY REFERENCES {entities_type}(id)'''

        if entities_type == 'Operations':
            statement += f',\n    al_id UUID REFERENCES AssetList(al_id) NOT NULL,\n    '
        
        return statement


    def gen_attribute(self, table: str, entities_type: str, name: str, type: str):
        if type[0].isupper():
            attr_type = self.attribute_type(table, entities_type, name, type)
            return f'{name}_id UUID REFERENCES {type}(id)'
        else:
            if type == 'str':
                return f'{name} TEXT'
            elif type == 'geo_poly':
                return f'{name} geography(POLYGON)'
            else:
                raise Exception(f'Unexepted attribute {table} {name}:{type}')

    
    def gen_query(self, table, query):
        FieldYears = {
            "params": {
                "name": "field.name",
                "poly": "field.poly",
                "sort": "sort.name"
            },
            "filters": {
                "year": "workYear.name" 
            }
        }

        s = f'''
            SELECT
                Fields.name as name,
                Fields.poly as poly,
                Sorts.name as sort,
            FROM FieldYears 
                JOIN Sorts on FieldYears.cultivate = CultivatedCrops.id
                JOIN Fields on FieldYears.field = Fields.id
                JOIN WorkYears on FieldYears.workYear = WorkYears.id
            WHERE
                WorkYears.name = '2022-2023'
        '''
