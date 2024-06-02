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

$(document).ready(function () {
    // Inicializar DataTables en la carga inicial de la página
    initializePlugins();
});

function loadContent(url) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById('main').innerHTML = this.responseText;

            // Inicializa plugins y eventos después de cargar el contenido
            initializePlugins();

            // Reasignar los eventos click a los nuevos enlaces cargados
            var contentLinks = document.querySelectorAll('#main a');
            contentLinks.forEach(function (link) {
                link.addEventListener('click', function (event) {
                    event.preventDefault();
                    var url = this.getAttribute('href');
                    loadContent(url);
                });
            });

            // Cargar scripts específicos para páginas específicas
            if (url.includes("detallesCotizacion.jsp")) {
                loadScript('js/scriptDetallesCotizacion.js', function () {
                    console.log("Script de detallesCotizacion.js cargado.");
                });
            }
            if (url.includes("servicios.jsp")) {
                loadScript('js/scriptServicios.js', function () {
                    console.log("Script de scriptServicios.js cargado.");
                });
            }
            if (url.includes("cotizantes.jsp")) {
                loadScript('js/scriptCotizantes.js', function () {
                    console.log("Script de scriptCotizantes.js cargado.");
                });
            }
        }
    };
    xhttp.open("GET", url, true);
    xhttp.send();
}

function initializePlugins() {
    // Inicializar DataTables para todas las tablas
    if (typeof $.fn.DataTable !== 'undefined') {
        $('.table').each(function () {
            if (!$.fn.DataTable.isDataTable(this)) {
                $(this).DataTable();
            }
        });
    } else {
        console.error('DataTables no está definido.');
    }

    // Inicializa otros plugins como date pickers
    if (typeof initDatePicker === 'function') {
        initDatePicker();
    } else {
        console.error('initDatePicker no está definido.');
    }
}


function initializeDataTables() {
    $('#Table').DataTable();
}

function loadScript(url, callback) {
    var script = document.createElement("script");
    script.type = "text/javascript";
    script.src = url;

    script.onload = function () {
        if (callback)
            callback();
    };

    document.body.appendChild(script);
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
