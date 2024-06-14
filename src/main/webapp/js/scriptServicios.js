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
            console.log(response); // Para depuración
            if (response.status === 'success') {
                Swal.fire({
                    icon: 'success',
                    title: 'Éxito',
                    text: response.message,
                    showConfirmButton: true,
                    timer: 3000
                }).then(() => {
                    // Cerrar el modal
                    $('#myModal').modal('hide');

                    // Esperar a que el modal se cierre completamente antes de recargar el contenido
                    $('#myModal').on('hidden.bs.modal', function () {
                        loadContent('PrincipalServlet?menu=Servicios&accion=listar');
                    });
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
            console.log(response); // Para depuración
            if (response.status === 'success') {
                Swal.fire({
                    icon: 'success',
                    title: 'Éxito',
                    text: response.message,
                    showConfirmButton: true,
                    timer: 3000
                }).then(() => {
                    // Cerrar el modal
                    $('#myModal2').modal('hide');

                    // Esperar a que el modal se cierre completamente antes de recargar el contenido
                    $('#myModal2').on('hidden.bs.modal', function () {
                        loadContent('PrincipalServlet?menu=Servicios&accion=listar');
                    });
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

function eliminarServicio(idServicio) {
    Swal.fire({
        title: '¿Estás seguro?',
        text: '¿Deseas eliminar el servicio ' + idServicio + '?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Sí, eliminar',
        cancelButtonText: 'Cancelar'
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: 'PrincipalServlet?menu=Servicios&accion=eliminar',
                type: 'POST',
                data: {idServicio: idServicio},
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
                            loadContent('PrincipalServlet?menu=Servicios&accion=listar');
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

