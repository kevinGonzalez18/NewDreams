function abrirModalCotizante(correo) {
    $('#correoClt').val(correo);
    var modal = document.getElementById("myModal");
    var bootstrapModal = new bootstrap.Modal(modal);
    bootstrapModal.show();
}

function crearCotizante() {
    $.ajax({
        url: 'PrincipalServlet?menu=Cotizantes&accion=Agregar',
        type: 'POST',
        data: $('#formulario-cotizante').serialize(),
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
                        loadContent('PrincipalServlet?menu=Cotizantes&accion=listar');
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

function eliminarCotizante(correo) {
    Swal.fire({
        title: '¿Estás seguro?',
        text: '¿Deseas eliminar el cotizante ' + correo + '?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Sí, eliminar',
        cancelButtonText: 'Cancelar'
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: 'PrincipalServlet?menu=Cotizantes&accion=eliminar',
                type: 'POST',
                data: {correoClt: correo},
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
                            // Recargar el contenido después de eliminar el servicio
                            loadContent('PrincipalServlet?menu=Cotizantes&accion=listar');
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

function generarContrasena() {
    var longitud = 12; // Longitud de la contraseña
    var caracteres = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    var contrasena = '';
    for (var i = 0; i < longitud; i++) {
        var caracterAleatorio = caracteres.charAt(Math.floor(Math.random() * caracteres.length));
        contrasena += caracterAleatorio;
    }
    document.getElementById('contrasenaClt').value = contrasena;
}

function closeModal() {
    var modal = document.getElementById("myModal");
    var bootstrapModal = bootstrap.Modal.getInstance(modal);
    bootstrapModal.hide();
}


