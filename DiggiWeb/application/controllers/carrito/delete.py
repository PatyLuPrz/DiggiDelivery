import config
import hashlib
import app

class Delete:
    
    def __init__(self):
        pass

    '''
    def GET(self, ID_CDP, **k):
        if app.session.loggedin is True: # validate if the user is logged
            # session_username = app.session.username
            session_privilege = app.session.privilege # get the session_privilege
            if session_privilege == 0: # admin user
                return self.GET_DELETE(ID_CDP) # call GET_DELETE function
            elif privsession_privilegeilege == 1: # guess user
                raise config.web.seeother('/guess') # render guess.html
        else: # the user dont have logged
            raise config.web.seeother('/login') # render login.html

    def POST(self, ID_CDP, **k):
        if app.session.loggedin is True: # validate if the user is logged
            # session_username = app.session.username
            session_privilege = app.session.privilege
            if session_privilege == 0: # admin user
                return self.POST_DELETE(ID_CDP) # call POST_DELETE function
            elif session_privilege == 1: # guess user
                raise config.web.seeother('/guess') # render guess.html
        else: # the user dont have logged
            raise config.web.seeother('/login') # render login.html

    @staticmethod
    def GET_DELETE(ID_CDP, **k):

    @staticmethod
    def POST_DELETE(ID_CDP, **k):
    '''

    def GET(self, ID_CDP, **k):
        message = None # Error message
        ID_CDP = config.check_secure_val(str(ID_CDP)) # HMAC ID_CDP validate
        result = config.model.get_compra_de_productos(int(ID_CDP)) # search  ID_CDP
        result.ID_CDP = config.make_secure_val(str(result.ID_CDP)) # apply HMAC for ID_CDP
        return config.render.delete(result, message) # render delete.html with user data

    def POST(self, ID_CDP, **k):
        form = config.web.input() # get form data
        form['ID_CDP'] = config.check_secure_val(str(form['ID_CDP'])) # HMAC ID_CDP validate
        result = config.model.delete_compra_de_productos(form['ID_CDP']) # get compra_de_productos data
        if result is None: # delete error
            message = "El registro no se puede borrar" # Error messate
            ID_CDP = config.check_secure_val(str(ID_CDP))  # HMAC user validate
            ID_CDP = config.check_secure_val(str(ID_CDP))  # HMAC user validate
            result = config.model.get_compra_de_productos(int(ID_CDP)) # get ID_CDP data
            result.ID_CDP = config.make_secure_val(str(result.ID_CDP)) # apply HMAC to ID_CDP
            return config.render.delete(result, message) # render delete.html again
        else:
            raise config.web.seeother('/compra_de_productos') # render compra_de_productos delete.html 
