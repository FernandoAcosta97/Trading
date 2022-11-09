
/*=============================================
TABLA CAMPAÑAS
=============================================*/
var doc_usuario = $("#doc_usuario").val();

$("#tablaCampanas").DataTable({
	"ajax":"ajax/tabla-campanas.ajax.php?doc_usuario="+doc_usuario,
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




/*=============================================
ACTIVA - INACTIVA - FINALIZADA CAMPAÑA
=============================================*/
$(".tablaCampanas tbody").on("change","select.selectActiva",function(){

	var idCampana = $(this).attr("idCampana");
	var seleccionado = $(this).val();

	var datos = new FormData();
 	datos.append("activarIdCampana", idCampana);
    datos.append("activarCampana", seleccionado);

  	$.ajax({

	  url:"ajax/campanas.ajax.php",
	  method: "POST",
	  data: datos,
	  cache: false,
      contentType: false,
      processData: false,
      success: function(respuesta){

      }

  	})


})




$(".tablaCampanas").on("click","button.btnInvertir",function(){

	 var idCampana = $(this).attr("idCampana");
	 $("#id_campana").val(idCampana);

});



//EDITAR CUENTA
$(".tablaCampanas").on("click","button.btnEditarCampana",function(){

	var idCampana = $(this).attr("idCampana");
  
	var datos = new FormData();
	datos.append("idCampanaEditar",idCampana);
  
	$.ajax({
  
	 url:"ajax/campanas.ajax.php",
	 method:"POST",
	 data:datos,
	 cache:false,
	 contentType:false,
	 processData:false,
	 dataType:"json",
	 success:function(respuesta){

	  $("#idCampana").val(idCampana);
      $("#editarNombre").val(respuesta["nombre"]);
	  $("#editarRetorno").val(respuesta["retorno"]);
	  $("#editarCupos").val(respuesta["cupos"]);
	  $("#editarFechaInicio").val(respuesta["fecha_inicio"]);
	  $("#editarFechaFinal").val(respuesta["fecha_fin"]);
	  $("#editarFechaRetorno").val(respuesta["fecha_retorno"]);
	  
	}
  
  });
  
  })


//ELIMINAR CAMPAÑA
 $("#tablaCampanas tbody").on("click", "button.btnEliminarCampana", function () {
	var idCampana = $(this).attr("idCampana");
	var datos = new FormData();
	datos.append("idCampanaEliminar", idCampana);
  
	swal({
	  title: "¿Está seguro de borrar la campaña?",
	  text: "¡Si no lo está puede cancelar la acción!",
	  type: "warning",
	  showCancelButton: true,
	  confirmButtonColor: "#3085d6",
	  cancelButtonColor: "#d33",
	  cancelButtonText: "Cancelar",
	  confirmButtonText: "Si, borrar campaña!",
	}).then((result) => {
	  if (result.value) {
		$.ajax({
		  url: "ajax/campanas.ajax.php",
		  method: "POST",
		  data: datos,
		  cache: false,
		  contentType: false,
		  processData: false,
		  success: function (respuesta) {
			if (respuesta == "ok") {

			  swal({
				type: "success",
				title: "¡OK!",
				text: "¡La campaña se ha eliminado correctamente!",
				showConfirmButton: true,
				confirmButtonText: "Cerrar",
			  }).then(function (result) {
				if (result.value) {
				  window.location = "campanas";
				}
			  });

			}else if(respuesta != "0"){

				swal({
					type: "warning",
					title: "¡ADVERTENCIA!",
					text: "¡La campaña no se puede eliminar porque tiene "+respuesta+" inversiones activas!",
					showConfirmButton: true,
					confirmButtonText: "Cerrar",
				  }).then(function (result) {
					if (result.value) {
					//   window.location = "campanas";s
					}
				  });

			}
		  },
		});
	  }
	});
  });


  $("#selectTipoCampana").change(function(){

   var seleccion = $(this).val();
   if(seleccion==2){
   $("#camposRegistrarCampana").html("<div class='form-group'><label for='registroRetorno' class='control-label'>Valor retorno</label><div><input type='number' class='form-control' id='registroRetorno' name='registroRetorno' placeholder='Retorno bono extra' required></div></div>");
   }else{
	$("#camposRegistrarCampana").html("<div class='form-group'><label for='registroNombre' class='control-label'>Nombre</label><div><input type='text' class='form-control' id='registroNombre' name='registroNombre' placeholder='Nombre Campaña' required></div></div><div class='form-group'><label for='registroRetorno' class='control-label'>Retorno</label><div><input type='number' class='form-control' id='registroRetorno' name='registroRetorno' placeholder='Retorno campaña ej: 20%' required></div></div><div class='form-group'><label for='registroCupos' class='control-label'>Cupos</label><div><input type='number' class='form-control' id='registroCupos' name='registroCupos' placeholder='Cupos campaña ej: 1000' required></div>");
   }

  });

