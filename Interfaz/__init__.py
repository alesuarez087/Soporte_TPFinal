from flask import Flask, render_template
from Negocio.CRUDUsuario import Ciudades, Usuarios

app = Flask(__name__)

@app.route('/', methods = ['GET', 'POST'])
def index():
    controlador = Ciudades()
    usuario = Usuarios()
    city = controlador.GetCiudades()
    provs = controlador.GetProvincias()
    users = usuario.GetUsuarios()
    perf = usuario.GetPerfiles()
    return render_template('crudUsuarios.html', cities=city, provincias=provs, usuarios=users, perfiles=perf)


if __name__ == '__main__':
    app.run(debug=True)
