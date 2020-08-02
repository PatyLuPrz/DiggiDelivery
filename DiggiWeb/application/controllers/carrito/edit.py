import config
import hashlib
import app

class Edit:
    
    def __init__(self):
        pass

    '''
    def GET(self, ID_CDP, **k):
        if app.session.loggedin is True: # validate if the user is logged
            # session_username = app.session.username
            session_privilege = app.session.privilege # get the session_privilege
            if session_privilege == 0: # admin user
                return self.GET_EDIT(ID_CDP) # call GET_EDIT function
            elif session_privilege == 1: # guess user
                raise config.web.seeother('/guess') # render guess.html
        else: # the user dont have logged
            raise config.web.seeother('/login') # render login.html

    def POST(self, ID_CDP, **k):
        if app.session.loggedin is True: # validate if the user is logged
            # session_username = app.session.username
            session_privilege = app.session.privilege # get the session_privilege
            if session_privilege == 0: # admin user
                return self.POST_EDIT(ID_CDP) # call POST_EDIT function
            elif session_privilege == 1: # guess user
                raise config.web.seeother('/guess') # render guess.html
        else: # the user dont have logged
            raise config.web.seeother('/login') # render login.html

    @staticmethod
    def GET_EDIT(ID_CDP, **k):

    @staticmethod
    def POST_EDIT(ID_CDP, **k):
        
    '''

    def GET(self, ID_CDP, **k):
        message = None # Error message
        ID_CDP = config.check_secure_val(str(ID_CDP)) # HMAC ID_CDP validate
        result = config.model.get_compra_de_productos(int(ID_CDP)) # search for the ID_CDP
        result.ID_CDP = config.make_secure_val(str(result.ID_CDP)) # apply HMAC for ID_CDP
        return config.render.edit(result, message) # render compra_de_productos edit.html

    def POST(self, ID_CDP, **k):
        form = config.web.input()  # get form data
        form['ID_CDP'] = config.check_secure_val(str(form['ID_CDP'])) # HMAC ID_CDP validate
        # edit user with new data
        result = config.model.edit_compra_de_productos(
            form['ID_CDP'],form['ID_PROV'],form['TOTAL_A_PAGAR_CDP'],form['ESTADO_CDP'],
        )
        if result == None: # Error on udpate data
            ID_CDP = config.check_secure_val(str(ID_CDP)) # validate HMAC ID_CDP
            result = config.model.get_compra_de_productos(int(ID_CDP)) # search for ID_CDP data
            result.ID_CDP = config.make_secure_val(str(result.ID_CDP)) # apply HMAC to ID_CDP
            message = "Error al editar el registro" # Error message
            return config.render.edit(result, message) # render edit.html again
        else: # update user data succefully
            raise config.web.seeother('/compra_de_productos') # render compra_de_productos index.html
