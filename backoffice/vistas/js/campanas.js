
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


  $(".tablaCampanas").on("click","button.btnEditarCampana",function(){

	var idCampana = $(this).attr("idCampana");
  
	var datos = new FormData();
	datos.append("idCampanaEditar",idCampana);
  
	$.ajax({
  
	 url:"ajax/comprobantes.ajax.php",
	 method:"POST",
	 data:datos,
	 cache:false,
	 contentType:false,
	 processData:false,
	 dataType:"json",
	 success:function(respuesta){

      $("#editarComprobante").val(respuesta[0]["id"]);
	  $("#editarCodigo").val(respuesta[0]["codigo"]);
	  $("#editarCodigoActual").val(respuesta[0]["codigo"]);
	  $("#fotoActualComprobante").val(respuesta[0]["foto"]); 
	  $("#editarValor").val(respuesta[0]["valor"]);
	  $("#editarFecha").val(respuesta[0]["fecha"]);
	  if(respuesta[0]["foto"]!=""){
		$("#fotoActualComprobante").attr("src", respuesta[0]["foto"]);
		$("#previsualizarEditar").attr("src", respuesta[0]["foto"]);
	  }
  
	}
  
  });
  
  })



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
	  
	}
  
  });
  
  })