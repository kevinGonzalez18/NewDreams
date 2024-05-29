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