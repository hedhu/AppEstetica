function activar() {
    document.getElementById('nombrePaciente').disabled=false
    document.getElementById('edadPaciente').disabled=false
    document.getElementById('fechaNac').disabled=false
    document.getElementById('telPaciente').disabled=false
    document.getElementById('ocupacion').disabled=false
    document.getElementById('enfermedades').disabled=false
    document.getElementById('enfermedadesCro').disabled=false
    document.getElementById('medicamentos').disabled=false
    document.getElementById('alergias').disabled=false
    document.getElementById('implatesDispositivos').disabled=false

    document.getElementById('guardar').classList.remove('d-none');
    document.getElementById('guardar').classList.add('d-block');
    document.getElementById('activar').classList.add('mx-2');

}

function imprimir() {
    window.print();
}