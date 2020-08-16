#!/bin/sh
source venv/bin/activate
pip install -e .
coverage run --source my_flask_app -m pytest
coverage report -m
