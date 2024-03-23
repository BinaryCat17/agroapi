import generators.context as _
import src.utils as utils
import src.generate_postgres as gp

scheme = utils.load_json('scheme.json')

catalog = scheme['Catalog']
assets = scheme['Assets']
operations = scheme['Operations']

postgres_catalog = gp.generate_catalog(catalog)
utils.write_file('sql/postgres/generated/catalog.sql', postgres_catalog)