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

//Crear cliente
$(document).ready(function() {
    $('.crear-cliente-btn').click(function() {
        $('#formulario-crear').modal('show');
    });

    $('#btn-guardar').click(function() {
    });
});

