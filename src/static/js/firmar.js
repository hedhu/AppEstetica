// document.addEventListener('DOMContentLoaded', (event) => {var canvas = document.getElementById('signature-pad');
// var signaturePad = new SignaturePad(canvas);

// document.getElementById('clear').addEventListener('click', function () {
//     signaturePad.clear();
// });})

let canvas = document.getElementById("signature-pad");
let signaturePad = new SignaturePad(canvas);

document.getElementById("clearPad").addEventListener("click", function() {
    signaturePad.clear();
});

document.getElementById("saveSignature").addEventListener("click", function() {
    if (signaturePad.isEmpty()) {
        alert("Por favor, firma antes de guardar.");
    } else {
        let dataURL = signaturePad.toDataURL();
        let idfirmapaciente = document.getElementById('idfirmapaciente').value;  // Obtener el valor del campo idfirmapaciente
        let fechasesion = document.getElementById('fechasesion').value;  
        let observaciones = document.getElementById('observaciones').value;  
        
        // Enviar la firma al servidor
        fetch('/saveSignature', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ 
                image: dataURL,
                treatment_id: idfirmapaciente,
                fechasesion: fechasesion,
                observaciones: observaciones
            })
        }).then(response => response.json()).then(data => {
            if (data.success) {
                alert("Firma guardada con éxito!");
                $('#firmar').modal('hide');
                window.location.reload();  
                // Cerrar el modal
            } else {
                alert("Hubo un error al guardar la firma.");
            }
        });
    }
});

function download(dataURL, filename) {
    let blob = dataURLtoBlob(dataURL);
    let url = window.URL.createObjectURL(blob);
    let a = document.createElement("a");
    a.style = "display: none";
    a.href = url;
    a.download = filename;

    document.body.appendChild(a);
    a.click();

    window.URL.revokeObjectURL(url);
}

function dataURLtoBlob(dataURL) {
    let binary = atob(dataURL.split(',')[1]);
    let array = [];
    for(let i = 0; i < binary.length; i++) {
        array.push(binary.charCodeAt(i));
    }
    return new Blob([new Uint8Array(array)], {type: 'image/png'});
}

$(document).ready(function() {
    $('#habilitarObservaciones').click(function() {
        $('#observaciones').removeClass('d-none');
        $(this).addClass('d-none');
    });
});
