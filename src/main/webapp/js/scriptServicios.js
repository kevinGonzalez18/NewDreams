function abrirModal() {
    var modal = document.getElementById("myModal");

    var bootstrapModal = new bootstrap.Modal(modal);
    bootstrapModal.show();

    // Cerrar el modal
    bootstrapModal.hide();
}

function closeModal() {
    var modal = document.getElementById("myModal");
    var bootstrapModal = bootstrap.Modal.getInstance(modal);
    bootstrapModal.hide();
}

function agregarServicio() {
    $.ajax({
        url: 'PrincipalServlet?menu=Servicios&accion=agregar',
        type: 'POST',
        data: $('#formulario-servicio').serialize(),
        dataType: 'json',
        success: function (response) {
            alert(response.message);
            if (response.status === 'success') {
                // Cerrar el modal
                $('#myModal').modal('hide');

                // Esperar a que el modal se cierre completamente antes de recargar el contenido
                $('#myModal').on('hidden.bs.modal', function () {
                    loadContent('PrincipalServlet?menu=Servicios&accion=listar');
                });
            }
        },
        error: function (xhr, status, error) {
            alert('Error al realizar la solicitud: ' + error + '\nDetalles: ' + xhr.responseText);
        }
    });

    return false; // Previene el comportamiento predeterminado del formulario
}

function abrirModal2(id, nombre, valor, tipo) {
    $('#idServicioActualizar').val(id);
    $('#nombreServicioActualizar').val(nombre);
    $('#valorServicioActualizar').val(valor);
    $('#tipoServicioActualizar').val(tipo);
    var modal = document.getElementById("myModal2");

    var bootstrapModal = new bootstrap.Modal(modal);
    bootstrapModal.show();

    // Cerrar el modal
    bootstrapModal.hide();
}

function closeModal2() {
    var modal = document.getElementById("myModal2");
    var bootstrapModal = bootstrap.Modal.getInstance(modal);
    bootstrapModal.hide();
}

function actualizarServicio() {
    $.ajax({
        url: 'PrincipalServlet?menu=Servicios&accion=actualizar',
        type: 'POST',
        data: $('#formulario-servicio-actualizar').serialize(),
        dataType: 'json',
        success: function (response) {
            alert(response.message);
            if (response.status === 'success') {
                // Cerrar el modal
                $('#myModal2').modal('hide');

                // Esperar a que el modal se cierre completamente antes de recargar el contenido
                $('#myModal2').on('hidden.bs.modal', function () {
                    loadContent('PrincipalServlet?menu=Servicios&accion=listar');
                });
            }
        },
        error: function (xhr, status, error) {
            alert('Error al realizar la solicitud: ' + error + '\nDetalles: ' + xhr.responseText);
        }
    });

    return false; // Previene el comportamiento predeterminado del formulario
}
