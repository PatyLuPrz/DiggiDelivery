import web
import config
import hashlib
import app


class View:

    def __init__(self):
        pass

    '''
    def GET(self, ID_CDP):
        if app.session.loggedin is True: # validate if the user is logged
            # session_username = app.session.username
            session_privilege = app.session.privilege # get the session_privilege
            if session_privilege == 0: # admin user
                return self.GET_VIEW(ID_CDP) # call GET_VIEW() function
            elif session_privilege == 1: # guess user
                raise config.web.seeother('/guess') # render guess.html
        else: # the user dont have logged
            raise config.web.seeother('/login') # render login.html

    @staticmethod
    def GET_VIEW(ID_CDP):
    '''

    def GET(self, ID_CDP):
        ID_CDP = config.check_secure_val(str(ID_CDP)) # HMAC ID_CDP validate
        result = config.model.get_compra_de_productos(ID_CDP) # search for the ID_CDP data
        return config.render.view(result) # render view.html with ID_CDP data
