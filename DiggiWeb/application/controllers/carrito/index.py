import web
import config
import hashlib
import app
import application.models.model_compra_de_productos
model = application.models.model_compra_de_productos

class Index:
    
    def __init__(self):
        pass
    '''
    def GET(self):
        if app.session.loggedin is True: # validate if the user is logged
            # session_username = app.session.username
            session_privilege = app.session.privilege # get the session_privilege 
            if session_privilege == 0: # admin user
                return self.GET_INDEX() # call GET_INDEX() function
            elif session_privilege == 1: # guess user
                raise config.web.seeother('/guess') # rendner guess.html
        else: # the user dont have logged
            raise config.web.seeother('/login') # render login.html

    @staticmethod
    def GET_INDEX():
    '''

    
    def GET(self):
        # result = config.model.get_all_compra_de_productos().list() # get compra_de_productos table list
        result = config.model.get_productos()
        print result
        # for row in result:
        #    row.ID_CDP = config.make_secure_val(str(row.ID_CDP)) # apply HMAC to ID_CDP (primary key)
        return config.render.index(result) # render compra_de_productos index.html
