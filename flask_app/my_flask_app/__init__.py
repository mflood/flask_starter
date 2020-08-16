"""
    Flask App for my_flask_app
"""
import logging
from flask import Flask
from flask import render_template

import my_flask_app.mylogging as mylogging

# lowercase app is standard name for flask app
# pylint: disable=invalid-name
app = Flask(__name__)

# setup logging
mylogging.init(logging.DEBUG)
logger = logging.getLogger(mylogging.LOGNAME)

@app.route("/")
def index():
    """
        endpoint for app main page
    """
    logger.debug("Rendering index.html")
    return render_template('index.html')

