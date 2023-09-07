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

        // Enviar la firma al servidor
        fetch('/saveSignature', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ image: dataURL })
        }).then(response => response.json()).then(data => {
            if (data.success) {
                alert("Firma guardada con éxito!");
                $('#firmar').modal('hide');  // Cerrar el modal
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