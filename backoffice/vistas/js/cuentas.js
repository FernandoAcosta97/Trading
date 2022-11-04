
/*=============================================
TABLA CUENTAS
=============================================*/

var id_usuario = $("#id_usuario").val();

$(".tablaCuentas").DataTable({
	"ajax":"ajax/tabla-cuentas.ajax.php?usuario="+id_usuario,
 	"deferRender": true,
  	"retrieve": true,
  	"processing": true,
	"language": {

	    "sProcessing":     "Procesando...",
	    "sLengthMenu":     "Mostrar _MENU_ registros",
	    "sZeroRecords":    "No se encontraron resultados",
	    "sEmptyTable":     "Ningún dato disponible en esta tabla",
	    "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_",
	    "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0",
	    "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
	    "sInfoPostFix":    "",
	    "sSearch":         "Buscar:",
	    "sUrl":            "",
	    "sInfoThousands":  ",",
	    "sLoadingRecords": "Cargando...",
	    "oPaginate": {
	      "sFirst":    "Primero",
	      "sLast":     "Último",
	      "sNext":     "Siguiente",
	      "sPrevious": "Anterior"
	    },
	    "oAria": {
	        "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
	        "sSortDescending": ": Activar para ordenar la columna de manera descendente"
	    }

   }

});



$(".tablaCuentas tbody").on("click", "button.btnSoporte", function () {
  
	window.location = "soporte";
  });



/*=============================================
APROBADO O RECHAZADO CUENTA
=============================================*/
$(".tablaCuentas tbody").on("change","select.selectAprobado",function(){

	var idCuenta = $(this).attr("idCuenta");
	var seleccionado = $(this).val();

	var datos = new FormData();
 	datos.append("aprobadoIdCuenta", idCuenta);
    datos.append("aprobadoCuenta", seleccionado);

  	$.ajax({

	  url:"ajax/cuentas.ajax.php",
	  method: "POST",
	  data: datos,
	  cache: false,
      contentType: false,
      processData: false,
      success: function(respuesta){

      }

  	})


})


//EDITAR CUENTA
$(".tablaCuentas").on("click","button.btnEditarCuenta",function(){

	var idCuenta = $(this).attr("idCuenta");
  
	var datos = new FormData();
	datos.append("idCuentaEditar",idCuenta);
  
	$.ajax({
  
	 url:"ajax/cuentas.ajax.php",
	 method:"POST",
	 data:datos,
	 cache:false,
	 contentType:false,
	 processData:false,
	 dataType:"json",
	 success:function(respuesta){

	  $("#idCuenta").val(idCuenta);
      $("#editarNumero").val(respuesta["numero"]);
	  $("#editarEntidad").val(respuesta["entidad"]);
	  $('#editarTipo option[value="'+respuesta["tipo"]+'"]').attr('selected', 'selected');
	  
	}
  
  });
  
  })
