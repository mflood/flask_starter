import logging
import my_flask_app.mylogging as mylogging

def test_global_init():
    mylogging.init(logging.DEBUG)
    logging.getLogger(mylogging.LOGNAME).info("worked")

