import web
import config
import smtplib

def enviarCorreo(message,remitente):
    try:
        destinatario = '1717110752@utectulancingo.edu.mx'
        subject = "Correo desde formulario - Diggi Delivery "

        message = 'Subject: {}\n\n Mensaje: {} \n\n Remitente: {}\n\n Destinatario: {}'.format(subject,message,remitente,destinatario)

        server = smtplib.SMTP('smtp.gmail.com','587')
        server.starttls()

        server.login('may.patrics@gmail.com','Paydequeso16')

        server.sendmail('may.patrics@gmail.com','1717110752@utectulancingo.edu.mx',message)

        server.quit()
        print("#############################################")
        print("Esta cosa funciono :)")
        print("#############################################")
    except Exception as e:
        return "Error en model enviar correo: " + str(e.args)