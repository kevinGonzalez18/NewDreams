var currentEventId = null;

function openModal(eventId) {
    currentEventId = eventId;
    var modal = document.getElementById("myModal");

    // Llamada AJAX para obtener los servicios
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "CotizacionServlet?action=listar", true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var services = JSON.parse(xhr.responseText);
            var servicesList = document.getElementById("servicesList");
            if (servicesList) {
                servicesList.innerHTML = ""; // Limpiar contenido anterior

                // Crear elementos de lista para cada servicio
                services.forEach(function (service) {
                    var li = document.createElement("div");
                    li.classList.add("list-group-item", "d-flex", "justify-content-between", "align-items-center");
                    li.innerHTML = `
                        <input type="checkbox" id="service_${service.servicioId}" value="${service.servicioId}" class="form-check-input">
                        <label for="service_${service.servicioId}">${service.servicioNombre} - ${service.servicioTipo}</label>
                    `;
                    servicesList.appendChild(li);
                });
            } else {
                console.error("Elemento servicesList no encontrado en el DOM");
            }
        }
    };
    xhr.send();

    var bootstrapModal = new bootstrap.Modal(modal);
    bootstrapModal.show();
}

function closeModal() {
    var modal = document.getElementById("myModal");
    var bootstrapModal = bootstrap.Modal.getInstance(modal);
    bootstrapModal.hide();
}

function filterServices() {
    var input = document.getElementById("searchInput");
    var filter = input.value.toLowerCase();
    var servicesList = document.getElementById("servicesList");
    var li = servicesList.getElementsByTagName("li");

    for (var i = 0; i < li.length; i++) {
        var label = li[i].getElementsByTagName("label")[0];
        if (label.innerHTML.toLowerCase().indexOf(filter) > -1) {
            li[i].style.display = "";
        } else {
            li[i].style.display = "none";
        }
    }
}


function addSelectedServices() {
    var servicesList = document.getElementById("servicesList");
    var checkboxes = servicesList.querySelectorAll("input[type='checkbox']:checked");
    var selectedServices = [];

    checkboxes.forEach(function (checkbox) {
        selectedServices.push(checkbox.value);
    });

    // Llamada AJAX para agregar los servicios seleccionados a la cotización
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "CotizacionServlet?action=addServices", true);
    xhr.setRequestHeader("Content-Type", "application/json");
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
            alert("Servicios agregados correctamente");
            closeModal();
            location.reload();
        }
    };
    xhr.send(JSON.stringify({eventId: currentEventId, services: selectedServices}));
}

// Función para calcular el precio total de un servicio
function calculateTotalDetail(index) {
    // Obtener la cantidad y el precio unitario del servicio
    var quantity = parseFloat(document.getElementById('service_quantity_' + index).value);
    var price = parseFloat(document.getElementById('service_price_' + index).value);
    // Calcular el precio total
    var total = quantity * price;
    // Si el resultado es un número válido
    if (!isNaN(total)) {
        // Mostrar el precio total en el campo correspondiente
        document.getElementById('service_total_price_' + index).value = total;
        // Actualizar el precio total del pedido
        updateTotalOrderPrice();
    } else {
        // Si no es un número válido, establecer el precio total en 0
        document.getElementById('service_total_price_' + index).value = 0;
    }
}

// Función para actualizar el precio total del pedido
// Function to update the total order price
function updateTotalOrderPrice() {
    var totalOrderPrice = 0;
    // Get all the input elements with ID starting with "service_total_price_"
    var totalInputs = document.querySelectorAll('[id^="service_total_price_"]');

    // Iterate over the input elements and sum their values
    totalInputs.forEach(function (input) {
        var value = parseFloat(input.value);
        // If the value is a valid number, add it to the total
        if (!isNaN(value)) {
            totalOrderPrice += value;
        }
    });

    // Display the total order price
    document.getElementById('valorCotizacion').value = totalOrderPrice;
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

function validarCliente() {
    const correo = document.getElementById('correoCotizacion').value;

    fetch(`CotizacionServlet?action=checkCliente&correo=${correo}`)
            .then(response => response.json())
            .then(data => {
                if (data.exists) {
                    // Si el cliente existe, proceder a crear el evento
                    crearEvento();
                } else {
                    // Si el cliente no existe, mostrar un mensaje de alerta
                    Swal.fire({
                        title: "Advertencia",
                        text: "El cliente no está registrado. Por favor, registre al cliente antes de crear el evento.",
                        icon: "warning"
                    }).then(() => {
                        loadContent('PrincipalServlet?menu=Cotizantes&accion=listar');
                    });
                }
            })
            .catch(error => console.error('Error:', error));
}



function actualizarCotizacion() {
    $.ajax({
        url: 'CotizacionServlet?action=updateCotizacion',
        type: 'POST',
        data: $('#cotizacionForm').serialize(),
        dataType: 'json',
        success: function (response) {
            console.log(response); // Para depuración
            if (response.status === 'success') {
                Swal.fire({
                    icon: 'success',
                    title: 'Éxito',
                    text: response.message,
                    showConfirmButton: true,
                    timer: 3000
                }).then(() => {
                    loadContent('PrincipalServlet?menu=Cotizaciones&accion=listar');
                });
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: response.message,
                    showConfirmButton: true,
                    timer: 3000
                });
            }
        },
        error: function (xhr, status, error) {
            console.error('Error:', error);
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: 'Error al realizar la solicitud: ' + error + '\nDetalles: ' + xhr.responseText,
                showConfirmButton: true,
                timer: 3000
            });
        }
    });
    return false; // Previene el comportamiento predeterminado del formulario
}

function crearEvento() {
    $.ajax({
        url: 'CotizacionServlet?action=crearEvento',
        type: 'POST',
        data: $('#cotizacionForm').serialize(),
        dataType: 'json',
        success: function (response) {
            console.log(response); // Para depuración
            if (response.status === 'success') {
                Swal.fire({
                    icon: 'success',
                    title: 'Éxito',
                    text: response.message,
                    showConfirmButton: true,
                    timer: 3000
                }).then(() => {
                    loadContent('PrincipalServlet?menu=Eventos&accion=listar');
                });
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: response.message,
                    showConfirmButton: true,
                    timer: 3000
                });
            }
        },
        error: function (xhr, status, error) {
            console.error('Error:', error);
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: 'Error al realizar la solicitud: ' + error + '\nDetalles: ' + xhr.responseText,
                showConfirmButton: true,
                timer: 3000
            });
        }
    });

    return false; // Previene el comportamiento predeterminado del formulario
}

function eliminarCotizacion(idCotizacion) {
    Swal.fire({
        title: '¿Estás seguro?',
        text: '¿Deseas eliminar la cotizacion ' + idCotizacion + '?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Sí, eliminar',
        cancelButtonText: 'Cancelar'
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: 'CotizacionServlet?menu=deletedCotizacion',
                type: 'POST',
                data: {idCotizacion: idCotizacion},
                dataType: 'json',
                success: function (response) {
                    console.log(response); // Para depuración
                    if (response.status === 'success') {
                        Swal.fire({
                            icon: 'success',
                            title: 'Éxito',
                            text: response.message,
                            showConfirmButton: true,
                            timer: 3000
                        }).then(() => {
                            loadContent('PrincipalServlet?menu=Cotizaciones&accion=listar');
                        });
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Error',
                            text: response.message,
                            showConfirmButton: true,
                            timer: 3000
                        });
                    }
                },
                error: function (xhr, status, error) {
                    console.error('Error:', error);
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: 'Error al realizar la solicitud: ' + error + '\nDetalles: ' + xhr.responseText,
                        showConfirmButton: true,
                        timer: 3000
                    });
                }
            });
        }
    });
}

