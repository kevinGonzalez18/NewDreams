/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

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
        document.getElementById('service_total_' + index).value = total;
        // Actualizar el precio total del pedido
        updateTotalOrderPrice();
    } else {
        // Si no es un número válido, establecer el precio total en 0
        document.getElementById('service_total_' + index).value = 0;
    }
}

// Función para actualizar el precio total del pedido
// Function to update the total order price
function updateTotalOrderPrice() {
    var totalOrderPrice = 0;
    // Get all the input elements with ID starting with "service_total_price_"
    var totalInputs = document.querySelectorAll('[id^="service_total_"]');

    // Iterate over the input elements and sum their values
    totalInputs.forEach(function (input) {
        var value = parseFloat(input.value);
        // If the value is a valid number, add it to the total
        if (!isNaN(value)) {
            totalOrderPrice += value;
        }
    });

    // Display the total order price
    document.getElementById('valor-evento').value = totalOrderPrice;
}


function autoResizeTextarea(textarea) {
    textarea.style.height = 'auto';
    textarea.style.height = textarea.scrollHeight + 'px';
}

// Selecciona el textarea y ajusta su altura inicial
document.addEventListener('DOMContentLoaded', function () {
    const textarea = document.getElementById('descripcion-evento');
    autoResizeTextarea(textarea);

    // Ajusta la altura cada vez que se cambia el contenido del textarea
    textarea.addEventListener('input', function () {
        autoResizeTextarea(textarea);
    });
});


function actualizarEvento() {
    $.ajax({
        url: 'EventoServlet?menu=detalleEvento&action=actualizarEvento',
        type: 'POST',
        data: $('#formulario_evento').serialize(),
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
                    // Esperar a que el modal se cierre completamente antes de recargar el contenido
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

function eliminarServicioEvento() {
    $.ajax({
        url: 'EventoServlet?menu=detalleEvento&action=eliminarServicio',
        type: 'POST',
        data: $('#formularioEliminarServicioEvento').serialize(),
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
                    // Esperar a que el modal se cierre completamente antes de recargar el contenido
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

