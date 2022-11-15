
$(".tabla-pagar-comisiones").DataTable({
    "ajax":"ajax/tabla-pagos-comisiones.ajax.php",
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


  $(".tabla-pagar-inversiones").DataTable({
    "ajax":"ajax/tabla-pagos-inversiones.ajax.php",
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


  $(".tabla-inversiones-pagadas").DataTable({
    "ajax":"ajax/tabla-pagos-inversiones-pagadas.ajax.php",
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

  
 $(".tabla-pagar-inversiones tbody").on("click", "button.btnPagarInversion", function () {

	var idPagoInversion= $(this).attr("idPagoInversion");

	var datos = new FormData();
	datos.append("idPagoInversion", idPagoInversion);

  	$.ajax({

	  url:"ajax/pagos.ajax.php",
	  method: "POST",
	  data: datos,
	  cache: false,
    contentType: false,
    processData: false,
    success: function(respuesta){

        if (respuesta == "ok") {
			
          swal({
            type: "success",
            title: "¡El pago se ha realizado correctamente!",
			      allowOutsideClick: false,
            showConfirmButton: true,
            confirmButtonText: "Cerrar",
          }).then(function (result) {
            if (result.value) {
              window.location = "pagos-inversiones";
            }
          });
		  
        }else{

          swal({
            type: "error",
            title: "¡Ha ocurrido un error!",
            text: "¡Contacte con el administrador o vuelve a intentarlo mas tarde!",
            showConfirmButton: true,
            confirmButtonText: "Cerrar",
          }).then(function (result) {
            if (result.value) {
              // window.location = "pagos-inversiones";
              
            }
          });
		  

        }

      }

  	})
  
    });