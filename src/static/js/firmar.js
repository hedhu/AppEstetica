// document.addEventListener('DOMContentLoaded', (event) => {var canvas = document.getElementById('signature-pad');
// var signaturePad = new SignaturePad(canvas);

// document.getElementById('clear').addEventListener('click', function () {
//     signaturePad.clear();
// });})

$(document).ready(function() {
    $('button[id^="habilitarObservaciones"]').click(function() {
        var numSesion = $(this).attr('id').replace('habilitarObservaciones', '');
        $('#observaciones' + numSesion).removeClass('d-none');
        $(this).addClass('d-none');
        $('#agregarO' + numSesion).removeClass('d-none');
        $(this).addClass('d-none');
    });

    let selectNumSesiones = $('#numSesiones');
    let inputFechaSesion = $('#fechasesion');

    // Escuchar el evento change del select
    selectNumSesiones.on('change', function() {
        let selectedOption = selectNumSesiones.find(':selected');
        let fechaSesion = selectedOption.data('fecha');

        if (selectedOption.val() !== '1') {
            inputFechaSesion.prop('disabled', false);
            inputFechaSesion.val(fechaSesion);
        } else {
            inputFechaSesion.prop('disabled', true);
            inputFechaSesion.val('');
        }
    });
    // $('a[id^="agregarO"]').click(function(event) {
    //     event.preventDefault(); // Evitar que el enlace redireccione

    //     var numSesion = $(this).attr('id').replace('agregarO', '');
    //     var observacion = $('#observaciones' + numSesion).val();
    //     console.log(numSesion);
    //     console.log(observacion);

    //     $.ajax({
    //         type: 'POST',
    //         url: '/agregarObservacion', // La URL de tu ruta en Flask
    //         data: {
    //             treatment_id: numSesion,
    //             observacion: observacion
    //         },
    //         success: function(response) {
    //             if (response.success) {
    //                 alert("Observación agregada con éxito.");
    //                 // Actualiza la página o realiza las acciones necesarias
    //             } else {
    //                 alert("Hubo un error al agregar la observación.");
    //             }
    //         },
    //         error: function() {
    //             alert("Hubo un error en la solicitud.");
    //         }
    //     });
    // });
});

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
        let idfirmapaciente = document.getElementById('idfirmapaciente').value;
            

        // Enviar la firma al servidor
        fetch('/saveSignature', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ 
                image: dataURL,
                treatment_id: idfirmapaciente,
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

document.getElementById('btnimprimir').addEventListener('click', function () {
    window.print(); 
});
