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