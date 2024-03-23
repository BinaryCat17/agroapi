def generate_entities(entities, entities_type):
    result = []
    
    for table in entities:
        attributes = entities[table]
        for attr in attributes:
            statement += ',\n    ' + generate_attribute(table, attr, attributes[attr])
        
        statement += '\n);\n';
        result.append(statement)
    
    return result
