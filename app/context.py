import os
import sys

if os.path.basename(os.getcwd()) != 'agroserver':
    os.chdir('../')

sys.path.insert(0, os.path.abspath(
    os.path.join(os.path.dirname(__file__), '..')))
