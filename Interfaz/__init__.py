from flask import Flask, render_template, request, session
from Negocio import ArtistaLogic, ItemLogic, UsuarioLogic, GeneroLogic, TipoItemLogic
from Datos import Tablas

app = Flask(__name__)
app.secret_key = "super secret key"
"""
        CONTROLAR BIEN EL ERROR DE USUARIO Y CONTRASEÑA
"""



@app.route('/', methods=["GET", "POST"])
def inicio():
    if 'usuario' in session:
        contUS = UsuarioLogic.Usuario()
        id = session['usuario']
        user = contUS.GetOne(id)
        if 'Carrito' in session:
            car = session['Carrito']
            return render_template('index.html', usuario=user, carrito=len(car))
        else:
            return render_template('index.html', usuario=user)
    else:
        return render_template('index.html')

@app.route('/buscador', methods=["GET", "POST"])
def buscador():
    if request.method == 'POST':
        contIT = ItemLogic.Item()
        texto = request.form['search']
        its = contIT.GetBuscador(texto)
        if 'usuario' in session:
            contUS = UsuarioLogic.Usuario()
            id = session['usuario']
            user = contUS.GetOne(id)
            if 'Carrito' in session:
                car = session['Carrito']
                return render_template('resultados.html', usuario=user, items=its, carrito=len(car))
            else:
                return render_template('resultados.html', usuario=user, items=its)
        else:
            return render_template('resultados.html', items=its)

@app.route('/verProducto', methods=["GET", "POST"])
def verProducto():
    if request.method == 'POST':
       contIT = ItemLogic.Item()
       cod = request.form['idSelect']
       it = contIT.GetOne(cod)
       if 'usuario' in session:
           contUS = UsuarioLogic.Usuario()
           id = session['usuario']
           user = contUS.GetOne(id)
           if 'Carrito' in session:
               car = session['Carrito']
               return render_template('verProducto.html', usuario=user, item=it, carrito=len(car))
           else:
               return render_template('verProducto.html', usuario=user, item=it)
       else:
           return render_template('verProducto.html', item=it)

@app.route('/agregarCarrito', methods=["GET", "POST"])
def agregarCarrito():
    if request.method == 'POST':
        cod = request.form['idSelect']
        car = session['Carrito']
        car.append(cod)

        for c in car:
            print(c)

        session['Carrito'] = car
        contUS = UsuarioLogic.Usuario()
        id = session['usuario']
        user = contUS.GetOne(id)

        return render_template('index.html', usuario=user, carrito=len(car))

    else:
        return render_template('index.html')

@app.route('/carrito', methods=["GET", "POST"])
def carrito():
    car = session['Carrito']
    cantIT = ItemLogic.Item()
    its = list()
    for c in car:
        it = Tablas.Item()
        it = cantIT.GetOne(c)
        its.append(it)

    contUS = UsuarioLogic.Usuario()
    id = session['usuario']
    user = contUS.GetOne(id)

    print(its)
    print(car)

    return render_template('carrito.html', usuario=user, carrito=len(car), items=its)

@app.route('/index',methods=["GET","POST"])
def login():
    contU = UsuarioLogic.Usuario()
    contI = ItemLogic.Item()
    it = contI.GetAll()
    if request.method=='POST':
        try:
            username = request.form['userLogin']
            password = request.form['passLogin']

            user = contU.Login(username, password)
            if (user):
                session['usuario'] = user.id_usuario
                if user.id_tipo_usuario == 1:
                    session['Admin'] = 'Admin'
                elif user.id_tipo_usuario == 2:
                    session['Empleado'] = 'Empleado'
                else:
                    session['Usuario'] = 'Usuario'
                    session['Carrito'] = list()
                return render_template('index.html', usuario=user, items=it, carrito=0)
            else:
                return print("<script>alert:'Usuario o Contraseña incorrecto'</script>")
        except Exception as e:
            txt = format(e)
            return render_template('error.html', texto = txt)
    else:
        if 'usuario' in session:
            id = session['usuario']
            user = contU.GetOne(id)
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
        it = cont.GetAll()
        return render_template('index.html', items=it)
    except Exception as e:
        txt = format(e)
        return render_template('error.html', texto = txt)

@app.route('/artistas')
def artistas():
    contIT = ItemLogic.Item()
    it = contIT.GetAll()
    if 'usuario' in session:
        if 'Modificar' in session:
            session.pop('Modificar', None)
        contUS = UsuarioLogic.Usuario()
        id = session['usuario']
        user = contUS.GetOne(id)
        if 'Admin' in session:
            contAR = ArtistaLogic.Artista()
            art=contAR.GetAll()
            return render_template('artistas.html', usuario=user, artistas=art)
        else:
            return render_template('index.html', usuario=user, items=it)
    else:
        return render_template('index.html', items=it)

@app.route('/mapArtista', methods=['GET', 'POST'])
def mapArtista():
    if request.method == 'POST':
        contAR = ArtistaLogic.Artista()
        if 'Modificar' in session:
            txt = 'modificado'
            id = session['Modificar']
            session.pop('Modificar', None)
            artista = contAR.GetOne(id)
        else:
            artista = Tablas.Artista()
            txt = 'agregado'

        artista.nombre_artista = request.form['nombreArtista']
        artista.habilitado = True

        if txt=='modificado':
            ejec = contAR.Modificar(artista)
        else:
            ejec=contAR.Alta(artista)

        return render_template('confirmar.html', result=ejec, texto = txt)

@app.route('/recupera', methods=['GET', 'POST'])
def recupera():
    if request.method == 'POST':
        contAR = ArtistaLogic.Artista()
        conUS = UsuarioLogic.Usuario()
        cod = request.form['idSelect']
        art = contAR.GetOne(cod)

        if request.form['event'] == 'Modificar':
            session['Modificar'] = cod
            id = session['usuario']
            user = conUS.GetOne(id)
            arts= contAR.GetAll()
            return render_template('artistas.html', arti=art, artistas=arts, usuario=user)

        else:
            if request.form['event'] == 'Habilitar':
                txt = 'habilitado'
                ejec=contAR.Habilitar(cod)

            elif request.form['event'] == 'Deshabilitar':
                txt = 'deshabilitado'
                ejec=contAR.Deshabilitar(cod)
            return render_template('confirmar.html', result=ejec, texto = txt)


@app.route('/generos')
def generos():
    contIT = ItemLogic.Item()
    it = contIT.GetAll()
    if 'usuario' in session:
        if 'Modificar' in session:
            session.pop('Modificar', None)
        contUS = UsuarioLogic.Usuario()
        id = session['usuario']
        user = contUS.GetOne(id)

        if 'Admin' in session:
            contGE = GeneroLogic.Genero()
            gen = contGE.GetAll()
            return render_template('generos.html', usuario=user, generos=gen)
        else:
            return render_template('index.html', usuario=user, items=it)
    else:
        return render_template('index.html', items=it)

@app.route('/recuperaGenero', methods=['GET', 'POST'])
def recuperaGenero():
    if request.method == 'POST':
        contGE = GeneroLogic.Genero()
        conUS = UsuarioLogic.Usuario()
        cod = request.form['idSelect']
        gen = contGE.GetOne(cod)

        if request.form['event'] == 'Modificar':
            session['Modificar'] = cod
            id = session['usuario']
            user = conUS.GetOne(id)
            gens= contGE.GetAll()
            return render_template('generos.html', generos=gens, genero=gen, usuario=user)

        else:
            if request.form['event'] == 'Habilitar':
                txt = 'habilitado'
                ejec=contGE.Habilitar(cod)

            elif request.form['event'] == 'Deshabilitar':
                txt = 'deshabilitado'
                ejec=contGE.Deshabilitar(cod)
            return render_template('confirmar.html', resultGE=ejec, texto = txt)

@app.route('/mapGenero', methods=['GET', 'POST'])
def mapGenero():
    if request.method == 'POST':
        contGE = GeneroLogic.Genero()
        if 'Modificar' in session:
            txt = 'modificado'
            id = session['Modificar']
            session.pop('Modificar', None)
            genero = contGE.GetOne(id)
        else:
            genero = Tablas.Genero()
            txt = 'agregado'

        genero.desc_genero = request.form['nombreGenero']
        genero.habilitado = True

        if txt=='modificado':
            ejec = contGE.Modificar(genero)
        else:
            ejec = contGE.Alta(genero)

        return render_template('confirmar.html', resultGE=ejec, texto = txt)


@app.route('/usuarios')
def usuarios():
    contIT = ItemLogic.Item()
    it = contIT.GetAll()
    if 'usuario' in session:
        if 'Modificar' in session:
            session.pop('Modificar', None)
        contUS = UsuarioLogic.Usuario()
        id = session['usuario']
        user = contUS.GetOne(id)

        if 'Admin' in session:
            us = contUS.GetAll()
            tu = contUS.GetAllTipos()
            return render_template('usuarios.html', usuario=user, usuarios=us, tipos=tu)
        else:
            return render_template('index.html', usuario=user, items=it)
    else:
        return render_template('index.html', items=it)

@app.route('/recuperaUsuario', methods=['GET', 'POST'])
def recuperaUsuario():
    if request.method == 'POST':
        contUS = UsuarioLogic.Usuario()
        cod = request.form['idSelect']
        user = contUS.GetOne(cod)

        if request.form['event'] == 'Modificar':
            session['Modificar'] = cod
            users= contUS.GetAll()
            id = session['usuario']
            us = contUS.GetOne(id)
            tu = contUS.GetAllTipos()

            return render_template('usuarios.html', usuarios=users, usu=user, usuario=us, tipos=tu)
        else:
            if request.form['event'] == 'Habilitar':
                txt = 'habilitado'
                ejec=contUS.Habilitar(cod)

            elif request.form['event'] == 'Deshabilitar':
                txt = 'deshabilitado'
                ejec=contUS.Deshabilitar(cod)
            return render_template('confirmar.html', resultUS=ejec, texto = txt)

@app.route('/mapUsuario', methods=['GET', 'POST'])
def mapUsuario():
    if request.method == 'POST':
        contUS = UsuarioLogic.Usuario()
        if 'Modificar' in session:
            txt = 'modificado'
            id = session['Modificar']
            session.pop('Modificar', None)
            user = contUS.GetOne(id)
        else:
            user = Tablas.Usuario()
            txt = 'agregado'

        user.nombre  = request.form["nombre"]
        user.apellido = request.form["apellido"]
        user.email = request.form["email"]
        user.dni = request.form["dni"]
        user.nombre_usuario = request.form["nombreUsuario"]
        user.clave = request.form["clave"]
        user.id_tipo_usuario = request.form['tipoUsuario']
        user.habilitado = True

        if txt=='modificado':
            ejec = contUS.Modificar(user)
        else:
            ejec = contUS.Alta(user)

        return render_template('confirmar.html', resultUS=ejec, texto = txt)


@app.route('/items')
def items():
    contIT = ItemLogic.Item()
    it = contIT.GetAll()
    if 'usuario' in session:
        if 'Modificar' in session:
            session.pop('Modificar', None)
        contUS = UsuarioLogic.Usuario()
        id = session['usuario']
        user = contUS.GetOne(id)

        if 'Admin' in session:
            contGE = GeneroLogic.Genero()
            contAR = ArtistaLogic.Artista()
            contTI = TipoItemLogic.TipoItem()
            return render_template('items.html', usuario=user, items=it, artistas=contAR.GetHabilitados(), generos=contGE.GetHabilitados(), tipos=contTI.GetHabilitados(), precios=contIT.GetPrecios())
        else:
            return render_template('index.html', usuario=user, items=it)
    else:
        return render_template('index.html', items=it)

@app.route('/recuperaItem', methods=['GET', 'POST'])
def recuperaItem():
    if request.method == 'POST':
        contGE = GeneroLogic.Genero()
        contIT = ItemLogic.Item()
        conUS = UsuarioLogic.Usuario()
        cod = request.form['idSelect']
        it = contIT.GetOne(cod)

        if request.form['event'] == 'Modificar':
            session['Modificar'] = cod

            id = session['usuario']
            user = conUS.GetOne(id)

            contAR = ArtistaLogic.Artista()
            contTI = TipoItemLogic.TipoItem()
            its = contIT.GetAll()

            return render_template('items.html', generos=contGE.GetHabilitados(), items=its, item=it, usuario=user, artistas=contAR.GetHabilitados(),  tipos=contTI.GetHabilitados(), precios=contIT.GetPrecios(), precio=contIT.GetPrecio(cod))
        else:
            if request.form['event'] == 'Habilitar':
                txt = 'habilitado'
                ejec=contIT.Habilitar(cod)

            elif request.form['event'] == 'Deshabilitar':
                txt = 'deshabilitado'
                ejec=contIT.Deshabilitar(cod)
            return render_template('confirmar.html', resultIT=ejec, texto = txt)

@app.route('/mapItem', methods=['GET', 'POST'])
def mapItem():
    if request.method == 'POST':
        contIT = ItemLogic.Item()
        if 'Modificar' in session:
            txt = 'modificado'
            id = session['Modificar']
            session.pop('Modificar', None)
            item = contIT.GetOne(id)
        else:
            item = Tablas.Item()
            txt = 'agregado'

        item.id_genero = request.form['genero']
        item.url_portada = request.form['url']
        item.id_artista = request.form['artista']
        item.id_tipo_disco = request.form['tipoItem']
        item.id_genero = request.form['genero']
        item.anio_lanzamiento = request.form['anioLanzamiento']
        item.titulo = request.form['titulo']
        item.stock = request.form['stock']
        item.habilitado = True

        precio = Tablas.Precio()

        precio.monto = request.form['precio']

        if txt=='modificado':
            ejec = contIT.Modificar(item, precio)
        else:
            ejec = contIT.Alta(item, precio)

        return render_template('confirmar.html', resultIT=ejec, texto = txt)


@app.route('/tiposItem')
def tiposItem():
    contIT = ItemLogic.Item()
    it = contIT.GetAll()
    if 'usuario' in session:
        if 'Modificar' in session:
            session.pop('Modificar', None)
        contUS = UsuarioLogic.Usuario()
        id = session['usuario']
        user = contUS.GetOne(id)
        if 'Admin' in session:
            contTI = TipoItemLogic.TipoItem()
            tsi = contTI.GetAll()
            return render_template('tiposItem.html', usuario=user, tipos=tsi)
        else:
            return render_template('index.html', usuario=user, items=it)
    else:
        return render_template('index.html', items=it)

@app.route('/recuperaTipoItem', methods=['GET', 'POST'])
def recuperaTipoItem():
    if request.method == 'POST':
        contTI = TipoItemLogic.TipoItem()
        conUS = UsuarioLogic.Usuario()
        cod = request.form['idSelect']

        if request.form['event'] == 'Modificar':
            session['Modificar'] = cod
            ti = contTI.GetOne(cod)
            id = session['usuario']
            user = conUS.GetOne(id)
            tsi= contTI.GetAll()
            return render_template('tiposItem.html', tipos=tsi, tipo=ti, usuario=user)
        else:
            if request.form['event'] == 'Habilitar':
                txt = 'habilitado'
                ejec = contTI.Habilitar(cod)

            elif request.form['event'] == 'Deshabilitar':
                txt = 'deshabilitado'
                ejec = contTI.Deshabilitar(cod)
            return render_template('confirmar.html', resultTI = ejec, texto = txt)

@app.route('/mapTipoItem', methods=['GET', 'POST'])
def mapTipoItem():
    if request.method == 'POST':
        contTI = TipoItemLogic.TipoItem()
        if 'Modificar' in session:
            txt = 'modificado'
            id = session['Modificar']
            session.pop('Modificar', None)
            tipoItem = contTI.GetOne(id)
        else:
            tipoItem = Tablas.TipoItem()
            txt = 'agregado'

        tipoItem.desc_tipo_item = request.form['nombreTipoItem']
        tipoItem.habilitado = True

        if txt=='modificado':
            ejec = contTI.Modificar(tipoItem)
        else:
            ejec=contTI.Alta(tipoItem)

        return render_template('confirmar.html', resultTI=ejec, texto = txt)


if __name__ == '__main__':
    app.run(debug=True)
