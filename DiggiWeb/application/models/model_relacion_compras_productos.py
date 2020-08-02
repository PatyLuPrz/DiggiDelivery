import web
import config

db = config.db


def get_all_relacion_compras_productos():
    try:
        return db.select('relacion_compras_productos')
    except Exception as e:
        print "Model get all Error {}".format(e.args)
        print "Model get all Message {}".format(e.message)
        return None


def get_relacion_compras_productos(ID_RCP):
    try:
        return db.select('relacion_compras_productos', where='ID_RCP=$ID_RCP', vars=locals())[0]
    except Exception as e:
        print "Model get Error {}".format(e.args)
        print "Model get Message {}".format(e.message)
        return None


def delete_relacion_compras_productos(ID_RCP):
    try:
        return db.delete('relacion_compras_productos', where='ID_RCP=$ID_RCP', vars=locals())
    except Exception as e:
        print "Model delete Error {}".format(e.args)
        print "Model delete Message {}".format(e.message)
        return None


def insert_relacion_compras_productos(ID_CDP,ID_PROD,CANTIDAD_RCP,IMPORTE_RCP):
    try:
        return db.insert('relacion_compras_productos',ID_CDP=ID_CDP,
ID_PROD=ID_PROD,
CANTIDAD_RCP=CANTIDAD_RCP,
IMPORTE_RCP=IMPORTE_RCP)
    except Exception as e:
        print "Model insert Error {}".format(e.args)
        print "Model insert Message {}".format(e.message)
        return None


def edit_relacion_compras_productos(ID_RCP,ID_CDP,ID_PROD,CANTIDAD_RCP,IMPORTE_RCP):
    try:
        return db.update('relacion_compras_productos',ID_RCP=ID_RCP,
ID_CDP=ID_CDP,
ID_PROD=ID_PROD,
CANTIDAD_RCP=CANTIDAD_RCP,
IMPORTE_RCP=IMPORTE_RCP,
                  where='ID_RCP=$ID_RCP',
                  vars=locals())
    except Exception as e:
        print "Model update Error {}".format(e.args)
        print "Model updateMessage {}".format(e.message)
        return None
