from flask import Flask, render_template, request, redirect, url_for
from flask_mysqldb import MySQL

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

@app.route('/buscador')
def buscador():
    conn = mysql.connection
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM pacientes')
    pacientes = cursor.fetchall()
    npacientes = len(pacientes)
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
    
    cursor.close()
    return render_template('detallesPaciente.html', data=data, paciente=paciente, tratamientosT=tratamientosT, esteticistas=esteticistas)

@app.route('/agregarTratamiento', methods = ['POST', 'GET'])
def agregarTratamiento():
    if request.method == 'POST':
        nombreTratamiento = request.form['nombreTratamiento']
        idPaciente = request.form['idPaciente']
        fechaTrat = request.form['fechaTrat']
        numSesiones = request.form['numSesiones']
        esteticista = request.form['esteticista']
        observaciones = request.form['observaciones']
        conn = mysql.connection
        cursor = conn.cursor()
        cursor.execute('INSERT INTO tratamientospacientes (idTratamientos, idPaciente, idEsteticista, fechaTratamiento, numSesiones, observaciones) VALUES (%s, %s, %s, %s, %s, %s)', (nombreTratamiento, idPaciente, esteticista, fechaTrat, numSesiones, observaciones))
        mysql.connection.commit()
        cursor.close()
        return redirect(url_for('detallesPaciente', id=idPaciente))
    else:
        return redirect(url_for('detallesPaciente', id=idPaciente))

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

@app.route('/borrarTratamientoPaciente/<string:idTratamiento>/<string:idPaciente>')
def borrarTratamientoP(idTratamiento, idPaciente):
    conn = mysql.connection
    cursor = conn.cursor()
    cursor.execute('DELETE FROM tratamientospacientes WHERE idTratamientos = (%s) AND idPaciente = (%s)', (idTratamiento, idPaciente))
    mysql.connection.commit()
    cursor.close()
    return redirect(url_for('detallesPaciente', id=idPaciente))

@app.route('/detallesTratamiento/<string:idTratamiento>/<string:idPaciente>')
def detallesTratamiento(idTratamiento, idPaciente):
    conn = mysql.connection
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM tratamientospacientesc WHERE idTratamientos = %s AND idPaciente = %s', (idTratamiento, idPaciente))
    tratamientoSeleccionado = cursor.fetchone()
    print(tratamientoSeleccionado)
    cursor.execute('SELECT nombreEsteticista FROM esteticistas WHERE idEsteticistas = %s', (str(tratamientoSeleccionado[3])))
    esteticista = cursor.fetchone()
    print(esteticista)
    try:
        cursor.execute('SELECT * FROM firmaspaciente WHERE idTratamientosPaciente = %s', (str(tratamientoSeleccionado[0])))
        firmasPacientes = cursor.fetchone()
        print(firmasPacientes)
    except:
        firmasPacientes = [None, None, None, None]
    cursor.close()
    return render_template('detallesTratamiento.html', tratamientoSeleccionado=tratamientoSeleccionado, esteticista=esteticista, firmasPacientes=firmasPacientes)

@app.route('/agregarFirma', methods=['POST', 'GET'])
def agregarFirma():
    if request.method == 'POST':
        firma = request.form['signaturePad']
        print(firma)
        return 'recivido'

# @app.route('/agregarTratamientos', methods = ['POST', 'GET'])
# def agregarTratamientos():
#     if request.method == 'POST':
#         nombreTratamiento = request.form['nombreTratamiento']
#         conn = mysql.connection
#         cursor = conn.cursor()
#         cursor.execute('INSERT INTO tratamientos (nombreTratamiento) VALUES (%s)', (nombreTratamiento,))
#         mysql.connection.commit()
#         cursor.close()
#         return redirect(url_for('tratamientos'))


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)

