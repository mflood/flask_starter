"""
    tests for mylogging
"""
import logging
import my_flask_app.mylogging as mylog

def test_global_init():
    """
        Test init() method
    """
    mylog.init(logging.DEBUG)
    logging.getLogger(mylog.LOGNAME).info("worked")

# end
