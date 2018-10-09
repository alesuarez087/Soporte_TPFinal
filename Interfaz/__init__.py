from flask import Flask, render_template, request, session
from Negocio.CRUDUsuario import Ciudades, Usuarios, Perfiles

app = Flask(__name__)
app.secret_key = "super secret key"

@app.route('/persona', methods = ['GET', 'POST'])
def index():
    controlador = Ciudades()
    usuario = Usuarios()
    perfiles = Perfiles()
    city = controlador.GetCiudades()
    provs = controlador.GetProvincias()
    users = usuario.GetUsuarios()
    perf = perfiles.GetPerfiles()

    return render_template('crudUsuarios.html',usuarios=users, profiles=perf, provincias=provs)

@app.route('/', methods=["GET", "POST"])
def inicio():
    return render_template('index.html')

@app.route('/logout')
def logout():
    session.pop('usuario', None)
    session.pop('id_perfil', None)
    return render_template('index.html')

@app.route('/index',methods=["GET","POST"])
def loguin():
    if request.method=='POST':
        username = request.form['userLogin']
        password = request.form['passLogin']
        contro = Usuarios()
        user = contro.Loguin(username, password)

        if (user != None):
            session['usuario'] = user.ID
            session['id_perfil'] = user.IdPerfil
            return render_template('index.html')
        else:
            return print("alert:'Usuario o COntraseña incorrecto' ")
    return render_template('loguin.html')


if __name__ == '__main__':
    app.run(debug=True)
