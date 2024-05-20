const toggler = document.querySelector(".btn");
toggler.addEventListener("click", function () {
    document.querySelector("#sidebar").classList.toggle("collapsed");
});

window.onload = function () {
    // Cargar el dashboard al inicio
    loadContent('dashboard.jsp');

    // Obtener todos los enlaces de la barra lateral y del contenido cargado
    var sidebarLinks = document.querySelectorAll('.sidebar-link');
    var contentLinks = document.querySelectorAll('#main a');

    // Agregar un evento click a cada enlace de la barra lateral
    sidebarLinks.forEach(function (link) {
        link.addEventListener('click', function (event) {
            event.preventDefault();
            var url = this.getAttribute('href');
            loadContent(url);
        });
    });

    // Agregar un evento click a cada enlace dentro del contenido cargado
    contentLinks.forEach(function (link) {
        link.addEventListener('click', function (event) {
            event.preventDefault();
            var url = this.getAttribute('href');
            loadContent(url);
        });
    });
};

function loadContent(url) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById('main').innerHTML = this.responseText;
            initializeDataTables();  // Inicializa DataTables después de cargar el contenido
            // Reasignar los eventos click a los nuevos enlaces cargados
            var contentLinks = document.querySelectorAll('#main a');
            contentLinks.forEach(function (link) {
                link.addEventListener('click', function (event) {
                    event.preventDefault();
                    var url = this.getAttribute('href');
                    loadContent(url);
                });
            });
        }
    };
    xhttp.open("GET", url, true);
    xhttp.send();
}

function initializeDataTables() {
    $('#Table').DataTable();
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
