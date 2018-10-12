from os import abort

from flask import Flask, render_template, session, request
from Negocio import ItemLogic, UsuarioLogic, ArtistaLogic
from Datos import Tablas
app = Flask(__name__)
app.secret_key = "super secret key"


"""
        CONTROLAR BIEN EL ERROR DE USUARIO Y CONTRASEÑA
"""

@app.route('/', methods=["GET", "POST"])
def inicio():
    try:
        cont = ItemLogic.Item()
        it = cont.ListarItem()
        if 'usuario' in session:
            contUS = UsuarioLogic.Usuarios()
            id = session['usuario']
            user = contUS.GetUsuario(id)
            return render_template('index.html', usuario=user, items=it)
        else:
            return render_template('index.html', items=it)
    except Exception as e:
        txt = format(e)
        return render_template('error.html', texto = txt)

@app.route('/index',methods=["GET","POST"])
def login():
    controlador = UsuarioLogic.Usuarios()
    cont = ItemLogic.Item()
    it = cont.ListarItem()
    if request.method=='POST':
        try:
            username = request.form['userLogin']
            password = request.form['passLogin']

            user = controlador.Login(username, password)
            if (user):
                session['usuario'] = user.ID
                if user.IdPerfil == 1:
                    session['Admin'] = 'Admin'
                elif user.IdPerfil == 2:
                    session['Empleado'] = 'Empleado'
                else:
                    session['usuario'] = 'Usuario'
                return render_template('index.html', usuario=user, items=it)
            else:
                return print("<script>alert:'Usuario o Contraseña incorrecto'</script>")
        except Exception as e:
            txt = format(e)
            return render_template('error.html', texto = txt)
    else:
        if 'usuario' in session:
            id = session['usuario']
            user = controlador.GetUsuario(id)
            return render_template('index.html', usuario=user, items=it)
        else:
            return render_template('index.html', items=it)

@app.route('/logout')
def logout():
    try:
        session.pop('usuario', None)
        session.pop('id_perfil', None)
        if 'Admin' in session:
            session.pop('Admin', None)
        elif 'User' in session:
            session.pop('Usuario', None)
        else:
            session.pop('Empleado', None)
        cont = ItemLogic.Item()
        it = cont.ListarItem()
        return render_template('index.html', items=it)
    except Exception as e:
        txt = format(e)
        return render_template('error.html', texto = txt)

@app.route('/artistas')
def artistas():
    if 'Eliminar' in session:
        session.pop('Eliminar', None)
    if 'Modificar' in session:
        session.pop('Modificar', None)
    contIT = ItemLogic.Item()
    it = contIT.ListarItem()
    if 'usuario' in session:
        contUS = UsuarioLogic.Usuarios()
        id = session['usuario']
        user = contUS.GetUsuario(id)

        if 'Admin' in session:

            contAR = ArtistaLogic.Artista()
            art=contAR.GetAll()
            return render_template('artistas.html', usuario=user, items=it, artistas=art)
        else:
            return render_template('index.html', usuario=user, items=it)

    else:
        return render_template('index.html', items=it)

@app.route('/mapArtista', methods=['GET', 'POST'])
def mapArtista():
    if request.method == 'POST':
        contAR = ArtistaLogic.Artista()
        if 'Eliminar' in session:
            txt = 'eliminado'
            id = session['Eliminar']
            session.pop('Eliminar', None)
            artista = contAR.GetOne(id)
            artista.State = Tablas.States.Baja
        elif 'Modificar' in session:
            txt = 'modificado'
            id = session['Modificar']
            session.pop('Modificar', None)
            artista = contAR.GetOne(id)
            artista.State = Tablas.States.Modificacion
        else:
            artista = Tablas.Artista()
            artista.State = Tablas.States.Alta
            txt = 'agregado'

            artista.Nombre = request.form['nombreArtista']

            try:
                if request.form['habilitado']:
                    artista.Habilitado = True
            except:
                artista.Habilitado = False

        ejec = contAR.Save(artista)
        return render_template('confirmar.html', result=ejec, texto = txt)

@app.route('/recupera', methods=['GET', 'POST'])
def recupera():
    if request.method == 'POST':
        contAR = ArtistaLogic.Artista()
        cod = request.form['idSelect']
        art = contAR.GetOne(cod)

        if request.form['event'] == 'Modificar':
            session['Modificar'] = cod
        elif request.form['event'] == 'Eliminar':
            session['Eliminar'] = cod


        arts=ArtistaLogic.Artista().GetAll()

        return render_template('artistas.html', arti=art, artistas=arts)

if __name__ == '__main__':
    app.run(debug=True)
