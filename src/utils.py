import json

def load_json(file):
    with open(file) as f:
        return json.load(f)

def write_file(file, text):
    with open(file, "w") as text_file:
        text_file.writelines(text)