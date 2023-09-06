document.addEventListener('DOMContentLoaded', (event) => {var canvas = document.getElementById('signature-pad');
var signaturePad = new SignaturePad(canvas);

document.getElementById('clear').addEventListener('click', function () {
    signaturePad.clear();
});})

function imprimir() {
    window.print();
}