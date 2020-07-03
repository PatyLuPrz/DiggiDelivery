import smtplib

subject = "Prueba de correo"
message = "Hola, esta es una prueba"

message = 'Subject: {}\n\n{}'.format(subject,message)

server = smtplib.SMTP('smtp.gmail.com','587')
server.starttls()

server.login('may.patrics@gmail.com','Paydequeso16')

server.sendmail('may.patrics@gmail.com','1717110752@utectulancingo.edu.mx',message)

server.quit()

print("Esta cosa funciono :)")
