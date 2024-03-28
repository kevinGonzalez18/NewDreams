const toggler = document.querySelector(".btn");
toggler.addEventListener("click", function () {
    document.querySelector("#sidebar").classList.toggle("collapsed");
});

window.onload = function () {
    // Cargar el dashboard al inicio
    loadContent('dashboard.jsp');

    // Obtener todos los enlaces de la barra lateral
    var sidebarLinks = document.querySelectorAll('.sidebar-link');

    // Agregar un evento click a cada enlace
    sidebarLinks.forEach(function (link) {
        link.addEventListener('click', function (event) {
            // Prevenir la acción predeterminada del enlace
            event.preventDefault();
            // Obtener la URL del enlace
            var url = this.getAttribute('href');
            // Cargar el contenido correspondiente
            loadContent(url);
        });
    });
};

function loadContent(url) {
    // Crear una solicitud XMLHttpRequest
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            // Actualizar el contenido del main con la respuesta recibida
            document.getElementById('main').innerHTML = this.responseText;
        }
    };
    xhttp.open("GET", url, true);
    xhttp.send();
}

document.getElementById('logoutButton').addEventListener('click', function (event) {
    event.preventDefault(); // Evitar que el enlace realice la acción predeterminada (navegar a una URL)

    // Enviar una solicitud al servidor para cerrar la sesión
    fetch('Controlador/LogoutServlet', {
        method: 'POST'
    }).then(function (response) {
        // Redireccionar a la página de inicio de sesión después de cerrar sesión
        window.location.href = 'login.jsp';
    }).catch(function (error) {
        console.error('Error al cerrar sesión:', error);
    });
});
