from flask import Flask, render_template, request, redirect, url_for,jsonify
from flask_mysqldb import MySQL
import os
import base64
app = Flask(__name__)

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'abc.123'
app.config['MYSQL_DB'] = 'pruebas'

mysql = MySQL(app)

app.secret_key = "CRkETIkXn0fAU:"

@app.route('/')
def index():
    return redirect(url_for('login'))

@app.route('/login', methods = ['GET', 'POST'])
def login():
    if request.method == 'POST':
        nombre = request.form['usuario']
        contraseña = request.form['contraseña']
        conn = mysql.connection
        cursor = conn.cursor()
        cursor.execute('SELECT * FROM usuarios WHERE nombreUsuario = %s', (nombre,))
        usuarios = cursor.fetchall()

        if usuarios:
            for usuario in usuarios:
                if usuario[2] == contraseña:
                    # print('LOGEADO CORRECTAMENTE')
                    return redirect(url_for('buscador'))
                else:
                    # print('CONTRASEÑA INCORRECTA...')
                    cursor.close()
                    return render_template('login.html')
        else:
            # print('USUARIO NO ENCONTRADO...')
            cursor.close()
            return render_template('login.html')
        cursor.close()
    else: 
        return render_template('login.html')
    
@app.route('/tratamientos', methods = ['POST', 'GET'])
def tratamientos():
    conn = mysql.connection
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM tratamientos')
    tratamientos = cursor.fetchall()
    cursor.close()
    ntratamientos = len(tratamientos)
    return render_template('tratamientos.html', ntratamientos=ntratamientos, tratamientos=tratamientos)

@app.route('/agregarTratamientos', methods = ['POST', 'GET'])
def agregarTratamientos():
    if request.method == 'POST':
        nombreTratamiento = request.form['nombreTratamiento']
        conn = mysql.connection
        cursor = conn.cursor()
        cursor.execute('INSERT INTO tratamientos (nombreTratamiento) VALUES (%s)', (nombreTratamiento,))
        mysql.connection.commit()
        cursor.close()
        return redirect(url_for('tratamientos'))

@app.route('/borrarTratamiento/<string:idTratamiento>')
def borrarTratamiento(idTratamiento):
    conn = mysql.connection
    cursor = conn.cursor()
    cursor.execute('DELETE FROM tratamientos WHERE idTratamiento = (%s)', (idTratamiento,))
    mysql.connection.commit()
    cursor.close()
    return redirect(url_for('tratamientos'))

@app.route('/esteticistas', methods = ['POST', 'GET'])
def esteticistas():
    conn = mysql.connection
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM esteticistas')
    esteticistas = cursor.fetchall()
    cursor.close()
    nesteticistas = len(esteticistas)
    return render_template('esteticistas.html', nesteticistas=nesteticistas, esteticistas=esteticistas)

@app.route('/agregarEsteticistas', methods = ['POST', 'GET'])
def agregarEsteticistas():
    if request.method == 'POST':
        nombreEsteticista = request.form['nombreEsteticista']
        correoEsteticista = request.form['correoEsteticista']
        telEsteticista = request.form['telEsteticista']
        conn = mysql.connection
        cursor = conn.cursor()
        cursor.execute('INSERT INTO esteticistas (nombreEsteticista, correoEsteticista, telefonoEsteticista) VALUES (%s, %s, %s)', (nombreEsteticista, correoEsteticista, telEsteticista))
        mysql.connection.commit()
        cursor.close()
        return redirect(url_for('esteticistas'))

@app.route('/buscador', methods=['GET'])
def buscador():
    conn = mysql.connection
    cursor = conn.cursor()
    
    search_query = request.args.get('buscador')
    if search_query:
        # Use the LIKE keyword to search for patients
        cursor.execute('SELECT * FROM pacientes WHERE nombrePaciente LIKE %s', ('%' + search_query + '%',))
    else:
        cursor.execute('SELECT * FROM pacientes')
        
    pacientes = cursor.fetchall()
    npacientes = len(pacientes)
    cursor.close()
    return render_template('buscador.html', npacientes=npacientes, pacientes=pacientes)


@app.route('/agregarPaciente', methods = ['POST', 'GET'])
def agregarPaciente():
    if request.method == 'POST':
        nombrePaciente = request.form['nombrePaciente']
        edadPaciente = request.form['edadPaciente']
        fechaNac = request.form['fechaNac']
        telPaciente = request.form['telPaciente']
        ocupacion = request.form['ocupacion']
        enfermedades = request.form['enfermedades']
        enfermedadesCro = request.form['enfermedadesCro']
        medicamentos = request.form['medicamentos']
        alergias = request.form['alergias']
        implatesDispositivos = request.form['implatesDispositivos']
        conn = mysql.connection
        cursor = conn.cursor()
        cursor.execute('INSERT INTO pacientes (nombrePaciente, edadPaciente, fechaNacimiento, Telefono, Ocupacion, Enfermedades, EnfermedadesCronicas, Medicamentos, Alergias, Implantes_Dispositivos) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)', (nombrePaciente, edadPaciente, fechaNac, telPaciente, ocupacion, enfermedades, enfermedadesCro, medicamentos, alergias, implatesDispositivos))
        mysql.connection.commit()
        cursor.close()
        return redirect(url_for('buscador'))
    else:
        return redirect(url_for('buscador'))

@app.route('/detallesPaciente/<string:id>')
def detallesPaciente(id):
    conn = mysql.connection
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM pacientes WHERE idPacientes = %s', (id,))
    paciente = cursor.fetchone()
    
    cursor.execute('SELECT * FROM tratamientospacientes WHERE idPaciente = %s', (id,))
    tratamientosP = cursor.fetchall()
    
    tratamientos = []    
    if tratamientosP:
        for tratamientoP in tratamientosP:
            cursor.execute('SELECT * FROM tratamientos WHERE idTratamiento = %s', (tratamientoP[1],))
            tratamiento = cursor.fetchone()
            tratamientos.append(tratamiento)
    
    data = [(tratamientoP, tratamiento) for tratamientoP, tratamiento in zip(tratamientosP, tratamientos)]

    cursor.execute('SELECT * FROM tratamientos')
    tratamientosT = cursor.fetchall()
    
    cursor.execute('SELECT * FROM esteticistas')
    esteticistas = cursor.fetchall()
    
    paciente = list(paciente) 

    for i in range(1, len(paciente)):
        if paciente[i] is None:
            paciente[i] = ''
        else:
            pass

    paciente = tuple(paciente)  

    cursor.close()
    return render_template('detallesPaciente.html', data=data, paciente=paciente, tratamientosT=tratamientosT, esteticistas=esteticistas)

@app.route('/actualizarPaciente/<string:idPaciente>', methods = ['POST', 'GET', 'PUT'])
def actualizarPaciente(idPaciente):
    if request.method == 'POST':
        nombrePaciente = request.form['nombrePaciente']
        edadPaciente = request.form['edadPaciente']
        fechaNac = request.form['fechaNac']
        telPaciente = request.form['telPaciente']
        ocupacion = request.form['ocupacion']
        enfermedades = request.form['enfermedades']
        enfermedadesCro = request.form['enfermedadesCro']
        medicamentos = request.form['medicamentos']
        alergias = request.form['alergias']
        implatesDispositivos = request.form['implatesDispositivos']
        conn = mysql.connection
        cursor = conn.cursor()
        p = cursor.execute('UPDATE pacientes SET nombrePaciente = %s, edadPaciente = %s, fechaNacimiento = %s, Telefono = %s, Ocupacion = %s, Enfermedades = %s, EnfermedadesCronicas = %s, Medicamentos = %s, Alergias = %s, Implantes_Dispositivos = %s WHERE idPacientes = %s', (nombrePaciente, edadPaciente, fechaNac, telPaciente, ocupacion, enfermedades, enfermedadesCro, medicamentos, alergias, implatesDispositivos, idPaciente))
        print(p)
        mysql.connection.commit()
        cursor.close()
        return redirect(url_for('detallesPaciente', id=idPaciente))
    else:
        return redirect(url_for('detallesPaciente', id=idPaciente))

@app.route('/agregarTratamiento', methods = ['POST', 'GET'])
def agregarTratamiento():
    if request.method == 'POST':
        nombreTratamiento = request.form['nombreTratamiento']
        idPaciente = request.form['idPaciente']
        fechaTrat = request.form['fechaTrat']
        numSesiones = request.form['numSesiones']
        esteticista = request.form['esteticista']
        conn = mysql.connection
        cursor = conn.cursor()
        cursor.execute('INSERT INTO tratamientospacientes (idTratamientos, idPaciente, idEsteticista, fechaTratamiento, numSesiones) VALUES (%s, %s, %s, %s, %s)', (nombreTratamiento, idPaciente, esteticista, fechaTrat, numSesiones))
        mysql.connection.commit()
        cursor.close()
        return redirect(url_for('detallesPaciente', id=idPaciente))
    else:
        return redirect(url_for('detallesPaciente', id=idPaciente))

@app.route('/borrarTratamientoPaciente/<string:idTratamiento>/<string:idPaciente>')
def borrarTratamientoP(idTratamiento, idPaciente):
    conn = mysql.connection
    cursor = conn.cursor()
    cursor.execute('DELETE FROM tratamientospacientes WHERE idTratamientos = (%s) AND idPaciente = (%s)', (idTratamiento, idPaciente))
    mysql.connection.commit()
    cursor.close()
    return redirect(url_for('detallesPaciente', id=idPaciente))

@app.route('/detallesTratamiento/<string:idTratamiento>/<string:idPaciente>', methods=['GET', 'POST'])
def detallesTratamiento(idTratamiento, idPaciente):
    idTP = request.args.get('idTP')
    sesiones = request.args.get('sesiones')
    fecha = request.args.get('fecha')
    print(idTP, sesiones, fecha)
    
    conn = mysql.connection
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM firmaspaciente WHERE idTratamientosPaciente = %s', (idTP,))
    x = cursor.fetchall()
    if len(x) <= 0:
        for i in  range(1, int(sesiones)+1):
            if i == 1:
                cursor.execute('INSERT INTO firmaspaciente (idTratamientosPaciente, idPaciente, numeroSesion, fechaSesion) VALUES (%s, %s, %s, %s)',(idTP, idPaciente, i, fecha))
                conn.commit()
            else:
                cursor.execute('INSERT INTO firmaspaciente (idTratamientosPaciente, idPaciente, numeroSesion) VALUES (%s, %s, %s)',(idTP, idPaciente, i))
                conn.commit()
    else:
        pass
    cursor.close()
    conn = mysql.connection
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM tratamientospacientesc WHERE idTratamientos = %s AND idPaciente = %s', (idTratamiento, idPaciente))
    tratamientoSeleccionado = cursor.fetchone()
    print(tratamientoSeleccionado)
    cursor.execute('SELECT nombreEsteticista FROM esteticistas WHERE idEsteticistas = %s', (str(tratamientoSeleccionado[3])))
    esteticista = cursor.fetchone()
    print(esteticista)
    cursor.execute('SELECT * FROM firmaspaciente WHERE idTratamientosPaciente = %s', (str(tratamientoSeleccionado[0]),))
    firmasPacientes = cursor.fetchall()
    print(firmasPacientes)
    cursor.close()
    return render_template('detallesTratamiento.html', tratamientoSeleccionado=tratamientoSeleccionado, esteticista=esteticista, firmasPacientes=firmasPacientes)

@app.route('/agregarFirma', methods=['POST', 'GET'])
def agregarFirma():
    if request.method == 'POST':
        firma = request.form['signaturePad']
        print(firma)
        return 'recivido'


@app.route('/saveSignature', methods=['POST'])
def save_signature():
    try:
        data = request.json
        image_data = data["image"].split(';base64,').pop()
        
        # Verificar si 'treatment_id' está en los datos recibidos
        if "treatment_id" not in data:
            print("treatment_id not provided in the request data")
            return jsonify(success=False, message="treatment_id not provided")

        treatment_id = data["treatment_id"]  # Recuperar el valor de treatment_id
        fechasesion = data["fechasesion"]  
        obsevaciones = data["observaciones"]
        
        print(data)
        
        # Crear las carpetas si no existen
        if not os.path.exists('src/static/img/firmas'):
            os.makedirs('src/static/img/firmas')
        
        file_path = os.path.join( 'src','static','img','firmas', f'firma_{os.urandom(8).hex()}.png')
        urlimg=os.path.basename(file_path)

        print(urlimg)
        
        with open(file_path, "wb") as f:
            f.write(base64.b64decode(image_data))
        
        conn = mysql.connection
        cursor = conn.cursor()
        cursor.execute('UPDATE firmasPaciente SET rutaFirma = %s, firmas = %s WHERE idFirmasPaciente = %s', (urlimg, str(1), treatment_id))
        conn.commit()
        cursor.close()

        return jsonify(success=True)
    except Exception as e:
        print(e)
        return jsonify(success=False, message=str(e))


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)

