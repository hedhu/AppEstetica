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
                    print('LOGEADO CORRECTAMENTE')
                    return redirect(url_for('buscador'))
                else:
                    print('CONTRASEÑA INCORRECTA...')
                    cursor.close()
                    return render_template('login.html')
        else:
            print('USUARIO NO ENCONTRADO...')
            cursor.close()
            return render_template('login.html')
        cursor.close()
    else: 
        return render_template('login.html')

@app.route('/buscador')
def buscador():
    conn = mysql.connection
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM pacientes')
    pacientes = cursor.fetchall()
    npacientes = len(pacientes)
    return render_template('buscador.html', npacientes=npacientes, pacientes=pacientes)

@app.route('/agregarPaciente', methods = ['POST'])
def agregarPaciente():
    if request.method == 'POST':
        nombrePaciente = request.form['nombrePaciente']
        edadPaciente = request.form['edadPaciente']
        fechaNac = request.form['fechaNac']
        telPaciente = request.form['telPaciente']
        conn = mysql.connection
        cursor = conn.cursor()
        cursor.execute('INSERT INTO pacientes (nombrePaciente, edadPaciente, fechaNacimiento, Telefono) VALUES (%s, %s, %s, %s)', (nombrePaciente, edadPaciente, fechaNac, telPaciente))
        mysql.connection.commit()
        cursor.close()
        return redirect(url_for('buscador'))

@app.route('/detallesPaciente/<string:id>')
def detallesPaciente(id):
    conn = mysql.connection
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM pacientes WHERE idPacientes = %s', (id,))
    paciente = cursor.fetchone()
    
    cursor.execute('SELECT idTratamientos FROM tratamientospacientes WHERE idPaciente = %s', (id,))
    id_tratamientos = [row[0] for row in cursor.fetchall()]
    
    tratamientos = []
    for id_tratamiento in id_tratamientos:
        cursor.execute('SELECT * FROM tratamientos WHERE idTratamiento = %s', (id_tratamiento,))
        tratamiento = cursor.fetchone()
        tratamientos.append(tratamiento)
    print(tratamientos)
        
    cursor.close()
    return render_template('detallesPaciente.html', paciente=paciente, tratamientos=tratamientos)



if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)

