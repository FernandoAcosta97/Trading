
/*=============================================
TABLA COMPROBANTES
=============================================*/

var doc_usuario = $("#doc_usuario").val();
seleccion = $("#selectFiltro").val();

$(".tablaComprobantes").DataTable({
	"ajax":"ajax/tabla-comprobantes.ajax.php?doc_usuario="+doc_usuario+"&estado="+seleccion,
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
TABLA COMPROBANTES APROBADOS
=============================================*/

$(".tablaComprobantesAprobados").DataTable({
	"ajax":"ajax/tabla-inversiones.ajax.php?doc_usuario="+doc_usuario,
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



$("#selectFiltro").on("change", function (){

	seleccionarFiltro(null,null);
	    
});

function filtroFechaInversiones(fechaInicial, fechaFinal){

	tabla = $(".tablaComprobantesAprobados");
	tbody = $(".tablaComprobantesAprobados tbody");
	tbody.empty();
	tabla = tabla.dataTable().fnDestroy();

	if(fechaInicial != null || fechaFinal != null){

		tabla = $(".tablaComprobantesAprobados").DataTable({
			ajax: "ajax/tabla-inversiones.ajax.php?doc_usuario="+doc_usuario+"&inicio="+fechaInicial+"&fin="+fechaFinal,
			deferRender: true,
			retrieve: true,
			processing: true,
			language: {
			  sProcessing: "Procesando...",
			  sLengthMenu: "Mostrar _MENU_ registros",
			  sZeroRecords: "No se encontraron resultados",
			  sEmptyTable: "Ningún dato disponible en esta tabla",
			  sInfo: "Mostrando registros del _START_ al _END_ de un total de _TOTAL_",
			  sInfoEmpty: "Mostrando registros del 0 al 0 de un total de 0",
			  sInfoFiltered: "(filtrado de un total de _MAX_ registros)",
			  sInfoPostFix: "",
			  sSearch: "Buscar:",
			  sUrl: "",
			  sInfoThousands: ",",
			  sLoadingRecords: "Cargando...",
			  oPaginate: {
				sFirst: "Primero",
				sLast: "Último",
				sNext: "Siguiente",
				sPrevious: "Anterior",
			  },
			  oAria: {
				sSortAscending: ": Activar para ordenar la columna de manera ascendente",
				sSortDescending:
				  ": Activar para ordenar la columna de manera descendente",
			  },
			},
		  });

	}else{

		tabla = $(".tablaComprobantes").DataTable({
			ajax: "ajax/tabla-comprobantes.ajax.php?doc_usuario="+doc_usuario,
			deferRender: true,
			retrieve: true,
			processing: true,
			language: {
			  sProcessing: "Procesando...",
			  sLengthMenu: "Mostrar _MENU_ registros",
			  sZeroRecords: "No se encontraron resultados",
			  sEmptyTable: "Ningún dato disponible en esta tabla",
			  sInfo: "Mostrando registros del _START_ al _END_ de un total de _TOTAL_",
			  sInfoEmpty: "Mostrando registros del 0 al 0 de un total de 0",
			  sInfoFiltered: "(filtrado de un total de _MAX_ registros)",
			  sInfoPostFix: "",
			  sSearch: "Buscar:",
			  sUrl: "",
			  sInfoThousands: ",",
			  sLoadingRecords: "Cargando...",
			  oPaginate: {
				sFirst: "Primero",
				sLast: "Último",
				sNext: "Siguiente",
				sPrevious: "Anterior",
			  },
			  oAria: {
				sSortAscending: ": Activar para ordenar la columna de manera ascendente",
				sSortDescending:
				  ": Activar para ordenar la columna de manera descendente",
			  },
			},
		  });

	}

}



function seleccionarFiltro(fechaInicial, fechaFinal){

	seleccion = $("#selectFiltro").val();

	tabla = $(".tablaComprobantes");
	tbody = $(".tablaComprobantes tbody");
	tbody.empty();
	tabla = tabla.dataTable().fnDestroy();

		tabla = $(".tablaComprobantes").DataTable({
			ajax: "ajax/tabla-comprobantes.ajax.php?doc_usuario="+doc_usuario+"&estado="+seleccion+"&inicio="+fechaInicial+"&fin="+fechaFinal,
			deferRender: true,
			retrieve: true,
			processing: true,
			language: {
			  sProcessing: "Procesando...",
			  sLengthMenu: "Mostrar _MENU_ registros",
			  sZeroRecords: "No se encontraron resultados",
			  sEmptyTable: "Ningún dato disponible en esta tabla",
			  sInfo: "Mostrando registros del _START_ al _END_ de un total de _TOTAL_",
			  sInfoEmpty: "Mostrando registros del 0 al 0 de un total de 0",
			  sInfoFiltered: "(filtrado de un total de _MAX_ registros)",
			  sInfoPostFix: "",
			  sSearch: "Buscar:",
			  sUrl: "",
			  sInfoThousands: ",",
			  sLoadingRecords: "Cargando...",
			  oPaginate: {
				sFirst: "Primero",
				sLast: "Último",
				sNext: "Siguiente",
				sPrevious: "Anterior",
			  },
			  oAria: {
				sSortAscending: ": Activar para ordenar la columna de manera ascendente",
				sSortDescending:
				  ": Activar para ordenar la columna de manera descendente",
			  },
			},
		  });



	  
}


function seleccionarFiltroInversiones(fechaInicial, fechaFinal){

	seleccion = $("#selectFiltro").val();

	tabla = $(".tablaComprobantesAprobados");
	tbody = $(".tablaComprobantesAprobados tbody");
	tbody.empty();
	tabla = tabla.dataTable().fnDestroy();

	if(fechaInicial!=null && fechaFinal!=null){

		tabla = $(".tablaComprobantesAprobados").DataTable({
			ajax: "ajax/tabla-inversiones.ajax.php?doc_usuario="+doc_usuario+"&inicio="+fechaInicial+"&fin="+fechaFinal,
			deferRender: true,
			retrieve: true,
			processing: true,
			language: {
			  sProcessing: "Procesando...",
			  sLengthMenu: "Mostrar _MENU_ registros",
			  sZeroRecords: "No se encontraron resultados",
			  sEmptyTable: "Ningún dato disponible en esta tabla",
			  sInfo: "Mostrando registros del _START_ al _END_ de un total de _TOTAL_",
			  sInfoEmpty: "Mostrando registros del 0 al 0 de un total de 0",
			  sInfoFiltered: "(filtrado de un total de _MAX_ registros)",
			  sInfoPostFix: "",
			  sSearch: "Buscar:",
			  sUrl: "",
			  sInfoThousands: ",",
			  sLoadingRecords: "Cargando...",
			  oPaginate: {
				sFirst: "Primero",
				sLast: "Último",
				sNext: "Siguiente",
				sPrevious: "Anterior",
			  },
			  oAria: {
				sSortAscending: ": Activar para ordenar la columna de manera ascendente",
				sSortDescending:
				  ": Activar para ordenar la columna de manera descendente",
			  },
			},
		  });

		}else{
			tabla = $(".tablaComprobantesAprobados").DataTable({
				ajax: "ajax/tabla-inversiones.ajax.php?doc_usuario="+doc_usuario,
				deferRender: true,
				retrieve: true,
				processing: true,
				language: {
				  sProcessing: "Procesando...",
				  sLengthMenu: "Mostrar _MENU_ registros",
				  sZeroRecords: "No se encontraron resultados",
				  sEmptyTable: "Ningún dato disponible en esta tabla",
				  sInfo: "Mostrando registros del _START_ al _END_ de un total de _TOTAL_",
				  sInfoEmpty: "Mostrando registros del 0 al 0 de un total de 0",
				  sInfoFiltered: "(filtrado de un total de _MAX_ registros)",
				  sInfoPostFix: "",
				  sSearch: "Buscar:",
				  sUrl: "",
				  sInfoThousands: ",",
				  sLoadingRecords: "Cargando...",
				  oPaginate: {
					sFirst: "Primero",
					sLast: "Último",
					sNext: "Siguiente",
					sPrevious: "Anterior",
				  },
				  oAria: {
					sSortAscending: ": Activar para ordenar la columna de manera ascendente",
					sSortDescending:
					  ": Activar para ordenar la columna de manera descendente",
				  },
				},
			  });
		}

	  
}




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
	  $("#docUsuario").val(respuesta[0]["doc_usuario"]);
	  $("#editarValor").val(respuesta[0]["valor"]);
      $("#fotoActualComprobante").val(respuesta[0]["foto"]);
	  $("#previsualizarEditar").attr("src", respuesta[0]["foto"]);

  
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



  $(".tablaComprobantes tbody").on("click", "img.fotoComprobante", function () {
  
	foto = $(this).attr("src");
	$(".previsualizarFotoComprobante").attr("src", foto);
  });

  $(".tablaComprobantes tbody").on("click", "button.btnSoporte", function () {
  
	window.location = "soporte";
  });



  $(".tablaComprobantesAprobados tbody").on("click", "img.fotoComprobante", function () {
  
	foto = $(this).attr("src");
	$(".previsualizarFotoComprobante").attr("src", foto);
  });


  $(".tablaComprobantesAprobados tbody").on("click", "button.btnSoporte", function () {
  
	window.location = "soporte";
  });





  /*=============================================
VARIABLE LOCAL STORAGE
=============================================*/

// if(localStorage.getItem("capturarRango") != null){

// 	$("#daterange-btn span").html(localStorage.getItem("capturarRango"));
  
  
//   }else{
  
$("#daterange-btn span").html('<i class="fa fa-calendar"></i> Rango de fecha')
  
//   }

/*=============================================
RANGO DE FECHAS
=============================================*/
function rangoFecha(){
	$('#daterange-btn').daterangepicker(
		{
		  ranges   : {
			'Hoy'       : [moment(), moment()],
			'Ayer'   : [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
			'Últimos 7 días' : [moment().subtract(6, 'days'), moment()],
			'Últimos 30 días': [moment().subtract(29, 'days'), moment()],
			'Este mes'  : [moment().startOf('month'), moment().endOf('month')],
			'Último mes'  : [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
		  },
		  startDate: moment(),
		  endDate  : moment()
		},
		function (start, end) {
		  $('#daterange-btn span').html(start.format('MMMM DD, YYYY') + ' - ' + end.format('MMMM DD, YYYY'));
	  
		  fechaInicial = start.format('YYYY-MM-DD');
	  
		  fechaFinal = end.format('YYYY-MM-DD');
	  
		  var capturarRango = $("#daterange-btn span").html();
		 
		//   localStorage.setItem("capturarRango", capturarRango);
	
		//   seleccionarFiltro(fechaInicial, fechaFinal);
		//   filtroFechaInversiones(fechaInicial, fechaFinal)
	  
		//   window.location = "index.php?pagina=comprobantes&fechaInicial="+fechaInicial+"&fechaFinal="+fechaFinal;

		}
		
	  
	  )

	}



		$('#daterange-btn').daterangepicker(
			{
			  ranges   : {
				'Hoy'       : [moment(), moment()],
				'Ayer'   : [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
				'Últimos 7 días' : [moment().subtract(6, 'days'), moment()],
				'Últimos 30 días': [moment().subtract(29, 'days'), moment()],
				'Este mes'  : [moment().startOf('month'), moment().endOf('month')],
				'Último mes'  : [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
			  },
			  startDate: moment(),
			  endDate  : moment()
			},
			function (start, end) {
			  $('#daterange-btn span').html(start.format('MMMM DD, YYYY') + ' - ' + end.format('MMMM DD, YYYY'));
		  
			  fechaInicial = start.format('YYYY-MM-DD');
		  
			  fechaFinal = end.format('YYYY-MM-DD');
		  
			  var capturarRango = $("#daterange-btn span").html();
			 
			//   localStorage.setItem("capturarRango", capturarRango);
		
			//   seleccionarFiltro(fechaInicial, fechaFinal);
			//   filtroFechaInversiones(fechaInicial, fechaFinal)
		  
			//   window.location = "index.php?pagina=comprobantes&fechaInicial="+fechaInicial+"&fechaFinal="+fechaFinal;
			seleccionarFiltroInversiones(fechaInicial, fechaFinal);
	
			}
			
		  
		  )
	
		



  /*=============================================
CANCELAR RANGO DE FECHAS
=============================================*/



$(".daterangepicker.opensright .range_inputs .cancelBtn").on("click", function(){

	// localStorage.removeItem("capturarRango");
	// localStorage.clear();
	$('#daterange-btn span').html("Rango de fecha");
	// seleccionarFiltro(null,null);
	// window.location = "comprobantes";
	//filtros();
	seleccionarFiltroInversiones(null, null);

  })





  /*=============================================
CAPTURAR HOY
=============================================*/


$(".daterangepicker.opensright .ranges li").on("click", function(){

	$('#daterange-btn span').html("Hoy");
    var textoHoy = $(this).attr("data-range-key");

  if(textoHoy == "Hoy"){

    var d = new Date();
    
    var dia = d.getDate();
    var mes = d.getMonth()+1;
    var año = d.getFullYear();

    if(mes < 10){

     var fechaInicial = año+"-0"+mes+"-"+dia;
     var fechaFinal = año+"-0"+mes+"-"+dia;

    }else if(dia < 10){

     var fechaInicial = año+"-"+mes+"-0"+dia;
     var fechaFinal = año+"-"+mes+"-0"+dia;

    }else if(mes < 10 && dia < 10){

     var fechaInicial = año+"-0"+mes+"-0"+dia;
     var fechaFinal = año+"-0"+mes+"-0"+dia;

    }else{

     var fechaInicial = año+"-"+mes+"-"+dia;
       var fechaFinal = año+"-"+mes+"-"+dia;

    }

    dia = ("0"+dia).slice(-2);
    mes = ("0"+mes).slice(-2);
	// seleccionarFiltro(fechaInicial, fechaFinal);

    // var fechaInicial = año+"-"+mes+"-"+dia;
    // var fechaFinal = año+"-"+mes+"-"+dia; 

    //   localStorage.setItem("capturarRango", "Hoy");
	//   seleccionarFiltro(fechaInicial, fechaFinal);

    //   window.location = "index.php?pagina=comprobantes&fechaInicial="+fechaInicial+"&fechaFinal="+fechaFinal;
	// seleccionarFiltroInversiones(fechaInicial, fechaFinal);

  }


});


