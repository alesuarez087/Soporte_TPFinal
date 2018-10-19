from flask import Flask, render_template, request, session, Response
import json
from wtforms import Form, TextField
from Datos import UsuarioDB, TipoUsuario
from Negocio import UsuarioLogic, ArtistaLogic

from Datos import Tablas

app = Flask(__name__)
app.secret_key = "super secret key"


contAR = ArtistaLogic.Artista()
artistas = []
for art in contAR.GetAll():
    artistas.append(art.nombre_artista)

cities = ["Bratislava",
          "Banská Bystrica",
          "Prešov",
          "Považská Bystrica",
          "Žilina",
          "Košice",
          "Ružomberok",
          "Zvolen",
          "Poprad"]


class SearchForm(Form):
    autocomp = TextField('Insert City', id='city_autocomplete')


@app.route('/_autocomplete', methods=['GET'])
def autocomplete():
    return Response(json.dumps(artistas), mimetype='application/json')


@app.route('/', methods=['GET', 'POST'])
def index():
    form = SearchForm(request.form)
    return render_template("reviews.html", form=form)
"""
@app.route('/', methods=['GET', 'POST'])
def inicio():
    contAR = UsuarioDB.DBUsuario()
    conTU = TipoUsuario.TipoUsuario()
    art=contAR.GetAll()
    t = conTU.GetAll()
    if art:
        cant = len(art)
    else:
        cant = 0
    return render_template('reviews.html', artistas=art, cantidad=cant, tipos=t)

@app.route('/mapArtista', methods=['GET', 'POST'])
def mapArtista():
    if request.method == 'POST':
        contAR = UsuarioDB.DBUsuario()
        artista = UsuarioLogic.Usuario()
        txt = 'agregado'
        artista.tipo_usuario  = request.form['tipoUsuario']
        artista.nombre_usuario = request.form['nombreUsuario']
        artista.clave = request.form['clave']
        artista.nombre = request.form['nombre']
        artista.apellido = request.form['apellido']
        artista.email = request.form['email']
        artista.dni = request.form['dni']

        ejec = contAR.Save(artista, 'Alta')

        return render_template('confirmar.html', result=ejec, texto = txt)
"""
if __name__ == '__main__':
    app.run(debug=True)
