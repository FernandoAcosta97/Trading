
/*=============================================
TABLA CUENTAS
=============================================*/

var id_usuario = $("#id_usuario").val();

$(".tablaCuentas").DataTable({
	"ajax":"ajax/tabla-cuentas.ajax.php?id="+id_usuario,
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

$(".tablaCuentasDetalles").DataTable({
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


/*=============================================
APROBADO O RECHAZADO CUENTA
=============================================*/
$(".tablaCuentasDetalles tbody").on("change","select.selectAprobado",function(){

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



  //EDITAR CUENTA
$(".tablaCuentasDetalles").on("click","button.btnEditarCuenta",function(){

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



  /*=============================================
OTRA ENTIDAD CUENTA
=============================================*/
$("#entidad").on("change",function () {
	var seleccionado = $(this).val();
  
	if(seleccionado==0 && seleccionado!=""){
	$("#divCuentaCampo").html('<input type="text" class="form-control" id="entidad_campo" placeholder="Entidad bancaria" required name="registrarEntidadCuentaCampo">');
	}else{
	  $("#divCuentaCampo").html("");
	}
  
	if(seleccionado=="efecty"){
	  $("#labelNumero").html("Número de documento:");
	}else{
	  $("#labelNumero").html("Número cuenta bancaria:");
	}
  
  })




//ELIMINAR CUENTA BANCARIA
$(".tablaCuentasDetalles tbody").on("click", "button.btnEliminarCuenta", function () {
	var idCuenta = $(this).attr("idCuenta");
	var datos = new FormData();
	datos.append("idCuentaEliminar", idCuenta);
  
	swal({
	  title: "¿Está seguro de borrar la ceunta bancaria?",
	  text: "¡Si no lo está puede cancelar la acción!",
	  type: "warning",
	  showCancelButton: true,
	  confirmButtonColor: "#3085d6",
	  cancelButtonColor: "#d33",
	  cancelButtonText: "Cancelar",
	  confirmButtonText: "Si, borrar cuenta!",
	}).then((result) => {
	  if (result.value) {
		$.ajax({
		  url: "ajax/cuentas.ajax.php",
		  method: "POST",
		  data: datos,
		  cache: false,
		  contentType: false,
		  processData: false,
		  success: function (respuesta) {
			if (respuesta == 1) {

				swal({
					type: "warning",
					title: "¡ADVERTENCIA!",
					text: "¡La cuenta bancaria no se puede eliminar porque tiene pagos registrados!",
					showConfirmButton: true,
					confirmButtonText: "Cerrar",
				  }).then(function (result) {
					if (result.value) {
					//   window.location = "campanas";s
					}
				  });

			}else if(respuesta != "error"){

				swal({
					type: "success",
					title: "¡OK!",
					text: "¡La cuenta bancaria se ha eliminado correctamente!",
					showConfirmButton: true,
					confirmButtonText: "Cerrar",
				  }).then(function (result) {
					if (result.value) {
					  window.location = "index.php?pagina=usuario&id="+respuesta;
					}
				  });

			}
		  },
		});
	  }
	});
  });



  //ELIMINAR CUENTA BANCARIA
$(".tablaCuentas tbody").on("click", "button.btnEliminarCuenta", function () {
	var idCuenta = $(this).attr("idCuenta");
	var datos = new FormData();
	datos.append("idCuentaEliminar", idCuenta);
  
	swal({
	  title: "¿Está seguro de borrar la ceunta bancaria?",
	  text: "¡Si no lo está puede cancelar la acción!",
	  type: "warning",
	  showCancelButton: true,
	  confirmButtonColor: "#3085d6",
	  cancelButtonColor: "#d33",
	  cancelButtonText: "Cancelar",
	  confirmButtonText: "Si, borrar cuenta!",
	}).then((result) => {
	  if (result.value) {
		$.ajax({
		  url: "ajax/cuentas.ajax.php",
		  method: "POST",
		  data: datos,
		  cache: false,
		  contentType: false,
		  processData: false,
		  success: function (respuesta) {
			if (respuesta == 1) {

				swal({
					type: "warning",
					title: "¡ADVERTENCIA!",
					text: "¡La cuenta bancaria no se puede eliminar porque tiene pagos registrados!",
					showConfirmButton: true,
					confirmButtonText: "Cerrar",
				  }).then(function (result) {
					if (result.value) {
					//   window.location = "campanas";s
					}
				  });

			}else if(respuesta != "error"){

				swal({
					type: "success",
					title: "¡OK!",
					text: "¡La cuenta bancaria se ha eliminado correctamente!",
					showConfirmButton: true,
					confirmButtonText: "Cerrar",
				  }).then(function (result) {
					if (result.value) {
					  window.location = "index.php?pagina=usuario&id="+respuesta;
					}
				  });

			}
		  },
		});
	  }
	});
  });



  
