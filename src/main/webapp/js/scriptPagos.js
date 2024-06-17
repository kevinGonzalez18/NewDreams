function abrirModalPagos() {
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

function agregarPago() {
    $.ajax({
        url: 'PagoServlet?action=insertarPago',
        type: 'POST',
        data: $('#paymentForm').serialize(),
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
                        loadContent('PrincipalServlet?menu=Eventos&accion=listar');
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