import web
import config
import smtplib
import socket




def enviarMensaje(correo,mensaje):
    try:
        socket.getaddrinfo('localhost', 8080)
        server = 'mail.server.com'
        user = 'may.patrics@gmail.com'
        password = 'Paydequeso16'

        recipients = ['may.patrics@gmail.com', '1717110752@utectulancingo.edu.mx']
        sender = correo
        message = mensaje

        session = smtplib.SMTP(server)
        # if your SMTP server doesn't need authentications,
        # you don't need the following line:
        session.login(user, password)
        session.sendmail(sender, recipients, message)
        print("mensaje enviado")
    except Exception as e:
        print("Error model contactanos: " + str(e.args))
        return "Error model contactanos: " + str(e.args)