#!/usr/bin/env python

from distutils.core import setup

setup(name='my_flask_app',
      version='1.0',
      description='Nardo API',
      author='Matthew Flood',
      author_email='matthew.data.flood@gmail.com',
      url='https://www.github.com/mflood/',
      packages=['my_flask_app'],
      install_requires=[
          'html2text',
          'requests',
          'redis',
      ],
     )
