function verificarContraseñaE() {
    let contraseña = prompt("Introduce la contraseña:");

    if (contraseña === "12345") {
        window.location.href = "esteticistas";
    } else {
        alert("Contraseña incorrecta");
    }
}

function verificarContraseñaT() {
    let contraseña = prompt("Introduce la contraseña:");

    if (contraseña === "12345") {
        window.location.href = "tratamientos";
    } else {
        alert("Contraseña incorrecta");
    }
}