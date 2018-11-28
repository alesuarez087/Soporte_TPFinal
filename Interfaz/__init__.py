from flask import Flask, render_template, request, session, json, flash, url_for
from werkzeug.utils import redirect

from Negocio import ArtistaLogic, ItemLogic, UsuarioLogic, GeneroLogic, TipoItemLogic, VentaLogic
from Datos import Tablas

app = Flask(__name__)
app.secret_key = "super secret key"

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

@app.route('/index',methods=["GET","POST"])
def login():
    contU = UsuarioLogic.Usuario()
    contI = ItemLogic.Item()
    it = contI.GetAll()
    if request.method=='POST':
        username = request.form['userLogin']
        password = request.form['passLogin']

        user = contU.Login(username, password)
        if user != None:
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
            flash('Usuario y/o contraseña incorrectos')
            return render_template('logup.html', usuario=user, items=it, carrito=0)
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
        elif 'Usuario' in session:
            session.pop('Usuario', None)
        else:
            session.pop('Empleado', None)
        if 'Carrito' in session:
            session.pop('Carrito', None)
        cont = ItemLogic.Item()
        it = cont.GetAll()
        return render_template('index.html', items=it)
    except Exception as e:
        txt = format(e)
        return render_template('error.html', texto = txt)

@app.route('/buscador', methods=["GET", "POST"])
def buscador():
    if request.method == 'POST':
        contIT = ItemLogic.Item()
        texto = request.form['search']
        its = contIT.GetBuscador(texto)
        prs = contIT.GetPrecios()
        if 'usuario' in session:
            contUS = UsuarioLogic.Usuario()
            id = session['usuario']
            user = contUS.GetOne(id)
            if 'Carrito' in session:
                car = session['Carrito']
                return render_template('resultados.html', usuario=user, items=its, carrito=len(car), precios=prs)
            else:
                return render_template('resultados.html', usuario=user, items=its, precios=prs)
        else:
            return render_template('resultados.html', items=its, precios=prs)

@app.route('/verProducto', methods=["GET", "POST"])
def verProducto():
    if request.method == 'POST':
       contIT = ItemLogic.Item()
       cod = request.form['idSelect']
       it = contIT.GetOne(cod)
       pr = contIT.GetPrecio(cod)
       if 'usuario' in session:
           contUS = UsuarioLogic.Usuario()
           id = session['usuario']
           user = contUS.GetOne(id)
           if 'Carrito' in session:
               car = session['Carrito']
               return render_template('verProducto.html', usuario=user, item=it, carrito=len(car), precio=pr)
           else:
               return render_template('verProducto.html', usuario=user, item=it, precio=pr)
       else:
           return render_template('verProducto.html', item=it, precio=pr)

@app.route('/agregarCarrito', methods=["GET", "POST"])
def agregarCarrito():
    if request.method == 'POST':
        cod = int(request.form['idSelect'])
        cant = int(request.form['cantidad'])
        if 'Carrito' in session:
            car = session['Carrito']
        else:
            car = []
        car.append([cod, cant])

        for c in car:
            print(c)

        session['Carrito'] = car
        contUS = UsuarioLogic.Usuario()
        id = session['usuario']
        user = contUS.GetOne(id)

        return render_template('index.html', usuario=user, carrito=len(car))

    else:
        return render_template('index.html')

@app.route('/quitarCarrito', methods=["GET", "POST"])
def quitarCarrito():
    if request.method == 'POST':
        cod = int(request.form['idSelect'])
        car = session['Carrito']

        i = 0
        for c in car:
            if c[0] != cod:
                i=+1
            else:
                break

        if i <= len(car):
            car.pop(i)

        session['Carrito'] = car
        contIT = ItemLogic.Item()
        contUS = UsuarioLogic.Usuario()
        id = session['usuario']
        user = contUS.GetOne(id)
        prs = contIT.GetPrecios()
        its = []
        for c in car:
            it = Tablas.Item()
            it = contIT.GetOne(c[0])
            its.append(it)

        subtotal = []
        for c in car:
            for p in prs:
                if c[0] == p[0]:
                    sub = p[2]*c[1]
                    subtotal.append((c[0], sub))
        total = 0
        for sub in subtotal:
            total = total + sub[1]

        contVE = VentaLogic.Venta()
        prov = contVE.GetProvincias()

        return render_template('carrito.html', usuario=user, carrito=len(car), cantidades=car, items=its, precios=prs, subtotal=subtotal, total=total, provincias=prov)

    else:
        return render_template('index.html')

@app.route('/carrito', methods=["GET", "POST"])
def carrito():
    car = session['Carrito']
    cantIT = ItemLogic.Item()
    its = []
    for c in car:
        it = Tablas.Item()
        it = cantIT.GetOne(c[0])
        its.append(it)

    contUS = UsuarioLogic.Usuario()
    id = session['usuario']
    user = contUS.GetOne(id)
    prs = cantIT.GetPrecios()

    subtotal = []
    for c in car:
        for p in prs:
            if c[0] == p[0]:
                sub = p[2]*c[1]
                subtotal.append((c[0], sub))
    total = 0
    for sub in subtotal:
        total = total + sub[1]

    contVE = VentaLogic.Venta()
    prov = contVE.GetProvincias()

    return render_template('carrito.html', usuario=user, carrito=len(car), cantidades=car, items=its, precios=prs, subtotal=subtotal, total=total, provincias=prov)

@app.route('/artistas')
def artistas():
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
            return render_template('index.html', usuario=user)
    else:
        return render_template('index.html')

@app.route('/mapArtista', methods=['GET', 'POST'])
def mapArtista():
    if request.method == 'POST':
        contAR = ArtistaLogic.Artista()

        if 'Modificar' in session:
            txt = 'Artista modificado con éxito.'
            id = session['Modificar']
            artista = contAR.GetOne(id)
        else:
            artista = Tablas.Artista()
            txt = 'Artista agregado con éxito.'

        artista.nombre_artista = request.form['nombreArtista']
        artista.habilitado = True

        if contAR.GetDuplicidad(artista.nombre_artista) is None:
            flash('Ese artista ya fue ingresado en la Base de Datos')
        else:
            if 'Modificar' in session:
                session.pop('Modificar', None)
                ejec = contAR.Modificar(artista)
            else:
                ejec=contAR.Alta(artista)

            if ejec:
                flash(txt)
            else:
                flash('Error al ejecutar la petición')

        return redirect(url_for('artistas'))


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
                txt = art.nombre_artista +' habilitado correctamente'
                ejec = contAR.Habilitar(cod)
            elif request.form['event'] == 'Deshabilitar':
                txt = art.nombre_artista +' deshabilitado correctamente'
                ejec = contAR.Deshabilitar(cod)

            if ejec:
                flash(txt)
            else:
                flash('Error al ejecutar la petición')
            return redirect(url_for('artistas'))


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
                txt = gen.desc_genero +' habilitado correctamente'
                ejec = contGE.Habilitar(cod)
            elif request.form['event'] == 'Deshabilitar':
                txt = gen.desc_genero +' deshabilitado correctamente'
                ejec = contGE.Deshabilitar(cod)

            if ejec:
                flash(txt)
            else:
                flash('Error al ejecutar la petición')
            return redirect(url_for('generos'))

@app.route('/mapGenero', methods=['GET', 'POST'])
def mapGenero():
    if request.method == 'POST':
        contGE = GeneroLogic.Genero()
        if 'Modificar' in session:
            txt = 'modificado'
            id = session['Modificar']
            genero = contGE.GetOne(id)
        else:
            genero = Tablas.Genero()

        genero.desc_genero = request.form['nombreGenero']
        genero.habilitado = True

        if contGE.GetDuplicidad(genero.desc_genero) is None:
            flash('Este género ya fue ingresado en la Base de Datos')
        else:
            if 'Modificar' in session:
                ejec = contGE.Modificar(genero)
                session.pop('Modificar', None)
                txt = 'Género modificado correctamente'
            else:
                ejec=contGE.Alta(genero)
                txt = 'Género agregado correctamente'

            if ejec:
                flash(txt)
            else:
                flash('Error al ejecutar la petición')

        return redirect(url_for('generos'))


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
        id = session['usuario']
        us = contUS.GetOne(id)
        if request.form['event'] == 'Modificar':
            session['Modificar'] = cod
            users= contUS.GetAll()
            tu = contUS.GetAllTipos()

            return render_template('usuarios.html', usuarios=users, usu=user, usuario=us, tipos=tu)
        else:
            if request.form['event'] == 'Habilitar':
                txt = user.nombre_usuario +' habilitado correctamente'
                ejec = contUS.Habilitar(cod)
            elif request.form['event'] == 'Deshabilitar':
                txt = user.nombre_usuario +' deshabilitado correctamente'
                ejec = contUS.Deshabilitar(cod)

            if ejec:
                flash(txt)
            else:
                flash('Error al ejecutar la petición')
            return redirect(url_for('usuarios'))

@app.route('/mapUsuario', methods=['GET', 'POST'])
def mapUsuario():
    if request.method == 'POST':
        contUS = UsuarioLogic.Usuario()
        if 'Modificar' in session:
            txt = 'Usuario modificado correctamente'
            id = session['Modificar']
            user = contUS.GetOne(id)
        else:
            if contUS.GetDuplicidad(request.form["nombreUsuario"]) is None:
                flash('Este Nombre de Usuario ya fue registrado. Debe cambiarlo')
                return redirect(url_for('usuarios'))
            else:
                user = Tablas.Usuario()
                user.nombre_usuario = request.form["nombreUsuario"]
                txt = 'Usuario agregado correctamente'

        user.nombre  = request.form["nombre"]
        user.apellido = request.form["apellido"]
        user.email = request.form["email"]
        user.dni = request.form["dni"]
        user.clave = request.form["clave"]
        user.id_tipo_usuario = request.form['tipoUsuario']
        user.habilitado = True

        if 'Modificar' in session:
            ejec = contUS.Modificar(user)
            session.pop('Modificar', None)
        else:
            ejec=contUS.Alta(user)

        if ejec:
            flash(txt)
        else:
            flash('Error al ejecutar la petición')

        return redirect(url_for('usuarios'))

@app.route('/editarDatos')
def editarDatos():
    if 'usuario' in session:
        contUS = UsuarioLogic.Usuario()
        id = session['usuario']
        user = contUS.GetOne(id)

        return render_template('editarDatos.html', usuario=user)
    else:
        return render_template('index.html')

@app.route('/guardarDatos', methods=['GET', 'POST'])
def guardarDatos():
    if request.method == 'POST':
        contUS = UsuarioLogic.Usuario()
        txt = 'Usuario modificado correctamente'
        id = session['usuario']
        user = contUS.GetOne(id)
        user.nombre  = request.form["nombre"]
        user.apellido = request.form["apellido"]
        user.email = request.form["email"]
        user.dni = request.form["dni"]
        user.clave = request.form["clave"]

        ejec = contUS.Modificar(user)

        if ejec:
            flash(txt)
        else:
            flash('Error al ejecutar la petición')

        return redirect(url_for('editarDatos'))

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
            return render_template('index.html', usuario=user)
    else:
        return render_template('index.html')

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
                if it.stock < 1:
                    flash('No puede habilitar el item seleccionado, no posee stock disponible. Modifique la cantidad de Stock para poder realizar la habilitación solicitada')
                    return redirect(url_for('items'))
                else:
                    txt = it.titulo +' habilitado correctamente'
                    ejec = contIT.Habilitar(cod)
            elif request.form['event'] == 'Deshabilitar':
                txt = it.titulo +' deshabilitado correctamente'
                ejec = contIT.Deshabilitar(cod)

            if ejec:
                flash(txt)
            else:
                flash('Error al ejecutar la petición')
            return redirect(url_for('items'))


@app.route('/mapItem', methods=['GET', 'POST'])
def mapItem():
    if request.method == 'POST':
        contIT = ItemLogic.Item()
        if 'Modificar' in session:
            txt = 'Item modificado correctamente'
            id = session['Modificar']

            item = contIT.GetOne(id)
        else:
            if contIT.GetDuplicidad(request.form['titulo'], request.form['artista'], request.form['tipoItem']) is None:
                flash('Este item ya fue registrado')
                return redirect(url_for('items'))
            else:
                item = Tablas.Item()
                txt = 'Item agregado correctamente'

        item.id_genero = request.form['genero']
        item.url_portada = request.form['url']
        item.titulo = request.form['titulo']
        item.id_artista = request.form['artista']
        item.id_tipo_disco = request.form['tipoItem']
        item.anio_lanzamiento = request.form['anioLanzamiento']
        item.stock = request.form['stock']
        item.habilitado = True

        precio = Tablas.Precio()

        precio.monto = request.form['precio']

        if 'Modificar' in session:
            print('entré a modificar')
            ejec = contIT.Modificar(item, precio)
            session.pop('Modificar', None)
        else:
            print('entrré al alta')
            ejec=contIT.Alta(item, precio)

        if ejec:
            flash(txt)
        else:
            flash('Error al ejecutar la petición')

        return redirect(url_for('items'))

@app.route('/remarcar')
def remarcar():
    contIT = ItemLogic.Item()
    it = contIT.GetAll()
    if 'usuario' in session:
        if 'Modificar' in session:
            session.pop('Modificar', None)
        contUS = UsuarioLogic.Usuario()
        id = session['usuario']
        user = contUS.GetOne(id)

        if 'Usuario' in session:
            return render_template('index.html', usuario=user)
        else:
            contGE = GeneroLogic.Genero()
            contAR = ArtistaLogic.Artista()
            contTI = TipoItemLogic.TipoItem()
            return render_template('remarcar.html', usuario=user, items=it, artistas=contAR.GetHabilitados(),
                                   generos=contGE.GetHabilitados(), tipos=contTI.GetHabilitados(),
                                   precios=contIT.GetPrecios())

    else:
        return render_template('index.html')

@app.route('/recuperaItemRemarcar', methods=['GET', 'POST'])
def recuperaItemRemarcar():
    if request.method == 'POST':
        contGE = GeneroLogic.Genero()
        contIT = ItemLogic.Item()
        conUS = UsuarioLogic.Usuario()
        cod = request.form['idSelect']
        it = contIT.GetOne(cod)

        if request.form['event'] == 'Remarcar':
            session['Modificar'] = cod

            id = session['usuario']
            user = conUS.GetOne(id)

            contAR = ArtistaLogic.Artista()
            contTI = TipoItemLogic.TipoItem()
            its = contIT.GetAll()

            return render_template('remarcar.html', generos=contGE.GetHabilitados(), items=its, item=it, usuario=user, artistas=contAR.GetHabilitados(),  tipos=contTI.GetHabilitados(), precios=contIT.GetPrecios(), precio=contIT.GetPrecio(cod))


@app.route('/mapRemarcar', methods=['GET', 'POST'])
def mapRemarcar():
    if request.method == 'POST':
        contIT = ItemLogic.Item()

        txt = 'Item modificado correctamente'
        id = session['Modificar']
        session.pop('Modificar', None)
        item = contIT.GetOne(id)

        item.stock = request.form['stock']
        item.habilitado = True

        precio = Tablas.Precio()

        precio.id_item = item.id_item
        precio.monto = request.form['precio']

        ejec = contIT.Modificar(item, precio)

        if ejec:
            flash(txt)
        else:
            flash('Error al ejecutar la petición')

        return redirect(url_for('remarcar'))

@app.route('/tiposItem')
def tiposItem():
    if 'usuario' in session:
        contUS = UsuarioLogic.Usuario()
        id = session['usuario']
        user = contUS.GetOne(id)
        if 'Admin' in session:
            contTI = TipoItemLogic.TipoItem()
            tsi = contTI.GetAll()
            if 'Modificar' in session:
                session.pop('Modificar', None)
            return render_template('tiposItem.html', usuario=user, tipos=tsi)
        else:
            return render_template('index.html', usuario=user)
    else:
        return render_template('index.html')

@app.route('/recuperaTipoItem', methods=['GET', 'POST'])
def recuperaTipoItem():
    if request.method == 'POST':
        contTI = TipoItemLogic.TipoItem()
        conUS = UsuarioLogic.Usuario()
        cod = request.form['idSelect']
        ti = contTI.GetOne(cod)

        if request.form['event'] == 'Modificar':
            session['Modificar'] = cod
            id = session['usuario']
            user = conUS.GetOne(id)
            tsi= contTI.GetAll()
            return render_template('tiposItem.html', tipos=tsi, tipo=ti, usuario=user)
        elif request.form['event'] == 'Habilitar':
            txt = ti.desc_tipo_item +' habilitado correctamente'
            ejec = contTI.Habilitar(cod)
        elif request.form['event'] == 'Deshabilitar':
            txt = ti.desc_tipo_item +' deshabilitado correctamente'
            ejec = contTI.Deshabilitar(cod)

        if ejec:
            flash(txt)
        else:
            flash('Error al ejecutar la petición')
        return redirect(url_for('tiposItem'))

@app.route('/mapTipoItem', methods=['GET', 'POST'])
def mapTipoItem():
    if request.method == 'POST':
        contTI = TipoItemLogic.TipoItem()
        if 'Modificar' in session:
            txt = 'Tipo de Item modificado correctamente'
            id = session['Modificar']
            session.pop('Modificar', None)
            tipoItem = contTI.GetOne(id)
        else:
            if contTI.GetDuplicidad(request.form['nombreTipoItem']) is None:
                flash('Este Tipo de Item ya fue registrado')
                return redirect(url_for('tiposItem'))
            else:
                tipoItem = Tablas.TipoItem()
                txt = 'Tipo de item agregado correctamente'

        tipoItem.desc_tipo_item = request.form['nombreTipoItem']
        tipoItem.habilitado = True

        if tipoItem.id_tipo_item:
            ejec = contTI.Modificar(tipoItem)
        else:
            ejec=contTI.Alta(tipoItem)

        if(ejec):
            flash(txt)
        else:
            flash('Error al ejecutar la petición')

        return redirect(url_for('tiposItem'))

@app.route('/confirmaVenta', methods=['GET', 'POST'])
def confirmaVenta():
    if request.method == 'POST':
        contUS = UsuarioLogic.Usuario()
        contVE = VentaLogic.Venta()
        id = session['usuario']
        user = contUS.GetOne(id)

        venta = Tablas.Venta()
        venta.id_usuario = id
        venta.calle = request.form['calle']
        venta.id_provincia = request.form['provincia']
        venta.localidad = request.form['localidad']
        venta.numero = request.form['nroCalle']
        venta.nro_tarjeta = request.form['nroTarjeta']
        venta.titular_tarjeta = request.form['titularTarjeta']
        if request.form['piso']:
            venta.piso = request.form['piso']
        if request.form['dpto']:
            venta.dpto = request.form['dpto']

        carrito = session['Carrito']

        ejec = contVE.Alta(venta, carrito)

        if ejec:
            session.pop('Carrito', None)
            flash('Venta realizada con exito')
            return redirect(url_for('resumenCompras'))
        else:
            flash('Error al procesar la venta')
            return redirect(url_for('carrito'))

@app.route('/resumenCompras')
def resumenCompras():
    contUS = UsuarioLogic.Usuario()
    contVE = VentaLogic.Venta()
    contIT = ItemLogic.Item()
    id = session['usuario']
    user = contUS.GetOne(id)
    venIt = contVE.GetVentaItem()
    its = contIT.GetAll()
    cms = contVE.GetCompras(id)
    


    return render_template('resumenCompras.html', compras=cms, items=its, venta_item=venIt, usuario=user)

if __name__ == '__main__':
    app.run(debug=True)
