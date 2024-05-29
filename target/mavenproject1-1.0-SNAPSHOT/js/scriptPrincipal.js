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
            initDatePicker(); // Inicializa el calendarios
            // Reasignar los eventos click a los nuevos enlaces cargados
            var contentLinks = document.querySelectorAll('#main a');
            contentLinks.forEach(function (link) {
                link.addEventListener('click', function (event) {
                    event.preventDefault();
                    var url = this.getAttribute('href');
                    loadContent(url);
                });
            });
            //// Cargar script específico para detallesCotizacion.jsp si es la página que se cargó
            if (url.includes("detallesCotizacion.jsp")) {
                loadScript('js/scriptDetallesCotizacion.js', function () {
                    console.log("Script de detallesCotizacion.js cargado.");
                });
            }
            if (url.includes("servicios.jsp")) {
                loadScript('js/scriptServicios.js', function () {
                    console.log("Script de detallesCotizacion.js cargado.");
                });
            }
        }
    };
    xhttp.open("GET", url, true);
    xhttp.send();
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

function initDatePicker() {
    var today = new Date();
    var next30days = new Date(today.getTime() + 8 * 24 * 60 * 60 * 1000);
    flatpickr("#fechaEvento", {
        enableTime: true, // Activa la selección de hora
        minDate: next30days, // Establece la seleccion de la fecha mínimo a 30 días adelante de la fecha actual
        dateFormat: "Y-m-d H:i", // Formato de la fecha
        appendTo: document.getElementById('date_container'), // Añade el calendario al contenedor
        inline: true // Muestra el calendario siempre visible
    });

    var toggleDateIcon = document.getElementById('toggle_date_icon');
    if (toggleDateIcon) {
        toggleDateIcon.addEventListener('click', function () {
            var dateContainer = document.getElementById('date_container');
            var icon = document.getElementById('toggle_date_icon');
            if (dateContainer.style.display === 'none') {
                dateContainer.style.display = 'block';
                icon.classList.remove('fa-calendar-alt');
                icon.classList.add('fa-calendar-times'); // Cambia el icono a un icono de cierre
            } else {
                dateContainer.style.display = 'none';
                icon.classList.remove('fa-calendar-times'); // Cambia el icono de nuevo al icono de calendario
                icon.classList.add('fa-calendar-alt');
            }
        });
    } else {
        console.error('El elemento con ID "toggle_date_icon" no se encontró en el DOM.');
    }
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
