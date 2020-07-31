import web
import config

db = config.db


def get_productos():
    try:
        return db.select('productos')
    except Exception as e:
        print "Model get productos Error {}".format(e.args)
        print "Model get productos Message {}".format(e.message)
        return None
    


def get_all_compra_de_productos():
    try:
        return db.select('compra_de_productos')
    except Exception as e:
        print "Model get all Error {}".format(e.args)
        print "Model get all Message {}".format(e.message)
        return None


def get_compra_de_productos(ID_CDP):
    try:
        return db.select('compra_de_productos', where='ID_CDP=$ID_CDP', vars=locals())[0]
    except Exception as e:
        print "Model get Error {}".format(e.args)
        print "Model get Message {}".format(e.message)
        return None


def delete_compra_de_productos(ID_CDP):
    try:
        return db.delete('compra_de_productos', where='ID_CDP=$ID_CDP', vars=locals())
    except Exception as e:
        print "Model delete Error {}".format(e.args)
        print "Model delete Message {}".format(e.message)
        return None


def insert_compra_de_productos(ID_PROV,TOTAL_A_PAGAR_CDP,ESTADO_CDP):
    try:
        return db.insert('compra_de_productos',ID_PROV=ID_PROV,
TOTAL_A_PAGAR_CDP=TOTAL_A_PAGAR_CDP,
ESTADO_CDP=ESTADO_CDP)
    except Exception as e:
        print "Model insert Error {}".format(e.args)
        print "Model insert Message {}".format(e.message)
        return None


def edit_compra_de_productos(ID_CDP,ID_PROV,TOTAL_A_PAGAR_CDP,ESTADO_CDP):
    try:
        return db.update('compra_de_productos',ID_CDP=ID_CDP,
ID_PROV=ID_PROV,
TOTAL_A_PAGAR_CDP=TOTAL_A_PAGAR_CDP,
ESTADO_CDP=ESTADO_CDP,
                  where='ID_CDP=$ID_CDP',
                  vars=locals())
    except Exception as e:
        print "Model update Error {}".format(e.args)
        print "Model updateMessage {}".format(e.message)
        return None
