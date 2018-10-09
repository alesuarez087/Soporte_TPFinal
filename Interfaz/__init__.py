from flask import Flask, render_template, request, session
from Negocio.CRUDUsuario import Ciudades, Usuarios, Perfiles
from Datos import Tables

app = Flask(__name__)
app.secret_key = "super secret key"

@app.route('/crudUsuarios', methods = ['GET', 'POST'])
def crudUsuarios():
    if 'id_delete' in session:
        session.pop('id_delete', None)
    if 'id_update' in session:
        session.pop('id_update', None)
    controlador = Ciudades()
    usuario = Usuarios()
    perfiles = Perfiles()
    city = controlador.GetCiudades()
    provs = controlador.GetProvincias()
    users = usuario.GetUsuarios()
    perf = perfiles.GetPerfiles()

    return render_template('crudUsuarios.html', usuarios=users, profiles=perf, provincias=provs)

@app.route('/mapUser', methods=['GET', 'POST'])
def mapUser():
    if request.method == 'POST':
        if 'id_delete' in session:
            txt = 'eliminado'
            id = session['id_delete']
            session.pop('id_delete', None)
            user = Usuarios().GetOne(id)
            user.State = Tables.States.Delete
        else:
            if 'id_update' in session:
                txt = 'modificado'
                id = session['id_update']
                session.pop('id_update', None)
                user = Usuarios().GetOne(id)
                user.State = Tables.States.Update
            else:
                user = Tables.Usuario()
                user.State = Tables.States.Create
                txt = 'agregado'

            user.Nombre = request.form['nombre']
            user.Apellido = request.form['apellido']
            user.IdPerfil = request.form['perfil']
            user.NombreUsuario = request.form['user']
            user.Contrasenia = request.form['pass']
            user.FechaNacimiento = request.form['fecha']
            user.DNI = request.form['dni']
            user.Email = request.form['email']

        ejec = Usuarios().Save(user)
        return render_template('confirmar.html', result=ejec, texto = txt)

@app.route('/recupera', methods=['GET', 'POST'])
def recupera():
    if request.method == 'POST':
        perfiles = Perfiles()
        users = Usuarios().GetUsuarios()
        perf = perfiles.GetPerfiles()
        cod = request.form['idSelect']
        usr = Usuarios().GetOne(cod)

        if request.form['event'] == 'Modificar':
            session['id_update'] = cod
        elif request.form['event'] == 'Eliminar':
            session['id_delete'] = cod

        return render_template('crudUsuarios.html', usuarios=users, profiles=perf, usu=usr)

@app.route('/', methods=["GET", "POST"])
def inicio():
    return render_template('index.html')

@app.route('/logout')
def logout():
    session.pop('usuario', None)
    session.pop('id_perfil', None)
    if 'Admin' in session:
        session.pop('Admin', None)
    elif 'User' in session:
        session.pop('User', None)
    return render_template('index.html')

@app.route('/index',methods=["GET","POST"])
def loguin():
    if request.method=='POST':
        username = request.form['userLogin']
        password = request.form['passLogin']
        controlador = Usuarios()
        user = controlador.Loguin(username, password)

        if (user != None):
            session['usuario'] = user.ID
            if user.IdPerfil == 1:
                session['Admin'] = 'Admin'
            else:
                session['User'] = 'User'

            return render_template('index.html')
        else:
            return print("alert:'Usuario o Contraseña incorrecto' ")
    return render_template('index.html')


if __name__ == '__main__':
    app.run(debug=True)
