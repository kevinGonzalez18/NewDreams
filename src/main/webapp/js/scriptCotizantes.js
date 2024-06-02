function abrirModal(correo) {
    $('#correoClt').val(correo);
    var modal = document.getElementById("myModal");
    var bootstrapModal = new bootstrap.Modal(modal);
    bootstrapModal.show();
    // Cerrar el modal
    bootstrapModal.hide();
}

function crearCotizante (){
    $.ajax({
        url: 'PrincipalServlet?menu=Cotizantes&accion=Agregar',
        type: 'POST',
        data: $('#formulario-cotizante').serialize(),
        dataType: 'json',
        success: function (response) {
            alert(response.message);
            if (response.status === 'success') {
                // Cerrar el modal
                $('#myModal').modal('hide');

                // Esperar a que el modal se cierre completamente antes de recargar el contenido
                $('#myModal').on('hidden.bs.modal', function () {
                    loadContent('PrincipalServlet?menu=Cotizantes&accion=listar');
                });
            }
        },
        error: function (xhr, status, error) {
            alert('Error al realizar la solicitud: ' + error + '\nDetalles: ' + xhr.responseText);
        }
    });

    return false; // Previene el comportamiento predeterminado del formulario
}

function closeModal() {
    var modal = document.getElementById("myModal");
    var bootstrapModal = bootstrap.Modal.getInstance(modal);
    bootstrapModal.hide();
}


