
/*=============================================
TABLA COMPROBANTES
=============================================*/

var doc_usuario = $("#doc_usuario").val();

$(".tablaComprobantes").DataTable({
	"ajax":"ajax/tabla-comprobantes.ajax.php?doc_usuario="+doc_usuario,
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
SUBIENDO LA FOTO DEL COMPROBANTE A REGISTRAR
=============================================*/
$(".registrarFotoComprobante").change(function(){

	var imagen = this.files[0];
	
	/*=============================================
	  VALIDAMOS EL FORMATO DE LA IMAGEN SEA JPG O PNG
	  =============================================*/
  
	  if(imagen["type"] != "image/jpeg" && imagen["type"] != "image/png"){
  
		$(".registrarFotoComprobante").val("");
  
		 swal({
			title: "Error al subir la imagen",
			text: "¡La imagen debe estar en formato JPG o PNG!",
			type: "error",
			confirmButtonText: "¡Cerrar!"
		  });
  
	  }else if(imagen["size"] > 2000000){
  
		$(".registrarFotoComprobante").val("");
  
		 swal({
			title: "Error al subir la imagen",
			text: "¡La imagen no debe pesar más de 2MB!",
			type: "error",
			confirmButtonText: "¡Cerrar!"
		  });
  
	  }else{
  
		var datosImagen = new FileReader;
		datosImagen.readAsDataURL(imagen);
  
		$(datosImagen).on("load", function(event){
  
		  var rutaImagen = event.target.result;
  
		  $(".previsualizarRegistrar").attr("src", rutaImagen);
  
		})
  
	  }
  })


/*=============================================
SUBIENDO LA FOTO DEL COMPROBANTE A EDITAR
=============================================*/
$(".editarFotoComprobante").change(function(){

	var imagen = this.files[0];
	
	/*=============================================
	  VALIDAMOS EL FORMATO DE LA IMAGEN SEA JPG O PNG
	  =============================================*/
  
	  if(imagen["type"] != "image/jpeg" && imagen["type"] != "image/png"){
  
		$(".editarFotoComprobante").val("");
  
		 swal({
			title: "Error al subir la imagen",
			text: "¡La imagen debe estar en formato JPG o PNG!",
			type: "error",
			confirmButtonText: "¡Cerrar!"
		  });
  
	  }else if(imagen["size"] > 2000000){
  
		$(".editarFotoComprobante").val("");
  
		 swal({
			title: "Error al subir la imagen",
			text: "¡La imagen no debe pesar más de 2MB!",
			type: "error",
			confirmButtonText: "¡Cerrar!"
		  });
  
	  }else{
  
		var datosImagen = new FileReader;
		datosImagen.readAsDataURL(imagen);
  
		$(datosImagen).on("load", function(event){
  
		  var rutaImagen = event.target.result;
  
		  $(".previsualizarEditar").attr("src", rutaImagen);
  
		})
  
	  }
  })



  $(".tablaComprobantes").on("click","button.btnEditarComprobante",function(){

	var idComprobante = $(this).attr("idComprobante");
  
	var datos = new FormData();
	datos.append("idComprobanteEditar",idComprobante);
  
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
APROBADO O RECHAZADO COMPROBANTE
=============================================*/
$(".tablaComprobantes tbody").on("change","select.selectAprobado",function(){

	var idComprobante = $(this).attr("idComprobante");
	var seleccionado = $(this).val();

	var datos = new FormData();
 	datos.append("aprobadoIdComprobante", idComprobante);
    datos.append("aprobadoComprobante", seleccionado);

  	$.ajax({

	  url:"ajax/comprobantes.ajax.php",
	  method: "POST",
	  data: datos,
	  cache: false,
      contentType: false,
      processData: false,
      success: function(respuesta){

      }

  	})


})



$(".tablaComprobantes tbody").on("click", "button.btnSoporte", function () {
  
	window.location = "soporte";
  });


