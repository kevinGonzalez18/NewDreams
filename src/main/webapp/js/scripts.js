/*!
 * Start Bootstrap - Heroic Features v5.0.6 (https://startbootstrap.com/template/heroic-features)
 * Copyright 2013-2023 Start Bootstrap
 * Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-heroic-features/blob/master/LICENSE)
 */
// This file is intentionally blank
// Use this file to add JavaScript to your project
document.addEventListener("DOMContentLoaded", function (event) {

    const showNavbar = (toggleId, navId, bodyId, headerId) => {
        const toggle = document.getElementById(toggleId),
                nav = document.getElementById(navId),
                bodypd = document.getElementById(bodyId),
                headerpd = document.getElementById(headerId)

        // Validate that all variables exist
        if (toggle && nav && bodypd && headerpd) {
            toggle.addEventListener('click', () => {
// show navbar
                nav.classList.toggle('show')
                // change icon
                toggle.classList.toggle('bx-x')
                // add padding to body
                bodypd.classList.toggle('body-pd')
                // add padding to header
                headerpd.classList.toggle('body-pd')
            })
        }
    }

    showNavbar('header-toggle', 'nav-bar', 'body-pd', 'header')

    /*===== LINK ACTIVE =====*/
    const linkColor = document.querySelectorAll('.nav_link')

    function colorLink() {
        if (linkColor) {
            linkColor.forEach(l => l.classList.remove('active'))
            this.classList.add('active')
        }
    }
    linkColor.forEach(l => l.addEventListener('click', colorLink))

    // Your code to run since DOM is loaded and ready
});
// Obtener el elemento select
var select = document.getElementById('event_location');
// Obtener el div del segundo formulario
var tengoLugarForm = document.getElementById('tengo_lugar_form');
// Agregar un event listener al cambio de selección en el select
select.addEventListener('change', function () {
    // Si el usuario selecciona "Tengo el lugar del evento"
    if (this.value === 'tengo') {
        // Mostrar el segundo formulario
        tengoLugarForm.style.display = 'block';
    } else {
        // Ocultar el segundo formulario si selecciona otra opción
        tengoLugarForm.style.display = 'none';
    }
});
//Mostrar calendario
var today = new Date();
var next30days = new Date(today.getTime() + 30 * 24 * 60 * 60 * 1000);
flatpickr("#event_date", {
    enableTime: false, // Desactiva la selección de hora
    minDate: next30days, // Establece la seleccion de la fecha minimo a 30 dias adelante de la fecha actual
    defaultDate: "+1m", // Establece la fecha predeterminada como un mes a partir de hoy
    dateFormat: "Y-m-d", // Formato de la fecha
    inline: true // Muestra el calendario siempre visible
});
document.getElementById('toggle_date_icon').addEventListener('click', function () {
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
// Función para calcular el precio total de un servicio
function calculateTotal(index, type) {
    // Obtener la cantidad y el precio unitario del servicio
    var quantity = parseFloat(document.getElementById('service_quantity_' + type + '_' + index).value);
    var price = parseFloat(document.getElementById('service_price_' + type + '_' + index).value);
    // Calcular el precio total
    var total = quantity * price;
    // Si el resultado es un número válido
    if (!isNaN(total)) {
        // Mostrar el precio total en el campo correspondiente
        document.getElementById('service_total_price_' + type + '_' + index).value = total;
        // Actualizar el precio total del pedido
        updateTotalOrderPrice();
    } else {
        // Si no es un número válido, establecer el precio total en 0
        document.getElementById('service_total_price_' + type + '_' + index).value = 0;
    }
}

// Función para actualizar el precio total del pedido
function updateTotalOrderPrice() {
    var totalOrderPrice = 0;
    // Obtener todos los campos de precio total de los servicios
    var types = ['manteleria', 'mesasSillas', 'decoracion'];
    types.forEach(function (type) {
        var totalInputs = document.querySelectorAll('[id^="service_total_price_' + type + '_"]');
        // Iterar sobre los campos y sumar sus valores
        totalInputs.forEach(function (input) {
            var value = parseFloat(input.value);
            // Si el valor es un número válido, sumarlo al total
            if (!isNaN(value)) {
                totalOrderPrice += value;
            }
        });
    });
    // Mostrar el precio total del pedido
    document.getElementById('total_order_price').value = totalOrderPrice;
}

// Función para evitar que se borre el cero inicial en el campo service_quantity
function preventDeletingZero(event) {
// Si se presiona la tecla "Backspace" y el valor es "0", prevenir la acción
    if (event.key === 'Backspace' && event.target.value === '0') {
        event.preventDefault();
    }
}

// Función para permitir solo dígitos numéricos en el campo service_quantity
function onlyNumberKey(event) {
// Obtener el código de la tecla presionada
    var charCode = (event.which) ? event.which : event.keyCode;
    // Permitir solo dígitos numéricos (códigos ASCII del 48 al 57)
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}

// Inicializar el campo de total de la orden en cero al cargar la página
window.onload = function () {
    document.getElementById('total_order_price').value = 0;
};
// Obtener referencia al botón de envío del segundo formulario
var submitBtn = document.querySelector('#form2 .submit-btn');
// Agregar un evento de clic al botón de envío del segundo formulario
submitBtn.addEventListener('click', function (event) {
    // Evitar el comportamiento predeterminado del botón de envío
    event.preventDefault();
    // Enviar el primer formulario
    document.querySelector('#form1').submit();
    // Enviar el segundo formulario
    document.querySelector('#form2').submit();
});
// Obtener la fecha actual
var currentDate = new Date().toISOString().slice(0, 10);
// Establecer el valor del input hidden con la fecha actual
document.getElementById('current_date').value = currentDate;

