// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.
function agregarFila() {


    var tableBody = document.getElementById("tableProducto");

    var newRow = tableBody.insertRow(tableBody.rows.length);

    var cell1 = newRow.insertCell(0);
    var cell2 = newRow.insertCell(1);
    var cell3 = newRow.insertCell(2);

    cell1.innerHTML = '<select class="form-select"><option value="-1">elige un producto</option><option value="1">opcion 1</option><option value="2">opcion 2</option><option value="3">opcion 3</option></select>';

    cell2.innerHTML = '<input class="form-control" type="text" />';
    cell3.innerHTML = '<input class="form-control" type="text" />';

    guardarInfomacionForm();
}

function guardarInfomacionForm() {

    var idReceta = document.getElementById("idreceta").value;
    var nombre = document.getElementById("idreceta").value;
    var imagen = document.getElementById("idreceta").value;
    var preparacion = document.getElementById("idreceta".value);

    document.getElementById("idreceta").value = idReceta;
    document.getElementById("idreceta").value = nombre;
    document.getElementById("idreceta").value = imagen;
    document.getElementById("idreceta").value = preparacion;

}