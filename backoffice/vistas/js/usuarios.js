/*=============================================
LISTADO DE PAISES
=============================================*/

$.ajax({
  url: "vistas/js/plugins/paises.json",
  type: "GET",
  success: function (respuesta) {
    respuesta.forEach(seleccionarPais);

    function seleccionarPais(item, index) {
      var pais = item.name;
      var codPais = item.code;
      var dial = item.dial_code;

      $("#inputPais").append(
        `<option value="` +
          pais +
          `,` +
          codPais +
          `,` +
          dial +
          `">` +
          pais +
          `</option>`
      );
    }
  },
});



/*=============================================
PLUGIN SELECT 2
=============================================*/

$(".select2").select2();


/*=============================================
PLUGIN SELECT 2 BUSCAR USUARIO POR NOMBRE O NÚMERO DE DOCUMENTO
=============================================*/

$(".selectBuscar").select2({
  placeholder: "Ingrese el nombre o número de documento del usuario a buscar",
  minimumInputLength: 3,
  ajax:{
    url: "ajax/buscarUsuario.ajax.php",
    type: "POST",
    dataType: "json",
    delay: 250,
    data: function(params){
      return {
        buscarUsuario: params.term
      }
    },
    processResults: function (response) {
      return {
      results: response.items
      };
      },
      cache: true
  }
});



/*=============================================
AGREGAR DIAL CODE DEL PAIS
=============================================*/

$("#inputPais").change(function () {
  $(".dialCode").html($(this).val().split(",")[2]);
});

/*=============================================
INPUT MASK
=============================================*/

$("[data-mask]").inputmask();

/*=============================================
FIRMA VIRTUAL
=============================================*/
$("#signatureparent").jSignature({
  color: "#333", // line color
  lineWidth: 1, // Grosor de línea
  // Ancho y alto área de la firma
  idth: 320,
  height: 100,
});

$(".repetirFirma").click(function () {
  $("#signatureparent").jSignature("reset");
});

/*=============================================
FUNCIÓN PARA GENERAR COOKIES
=============================================*/

function crearCookie(nombre, valor, diasExpiracion) {
  var hoy = new Date();

  hoy.setTime(hoy.getTime() + diasExpiracion * 24 * 60 * 60 * 1000);

  var fechaExpiracion = "expires=" + hoy.toUTCString();

  document.cookie = nombre + "=" + valor + "; " + fechaExpiracion;
}

$(".btnCuentas").click(function () {
  window.location = "cuentas-bancarias";
});

/*=============================================
VALIDAR FORMULARIO REGISTRO CONTRATO
=============================================*/

$(".suscribirse").click(function () {
  $(".alert").remove();

  var id_usuario = $("#inputId").val();
  var doc_usuario = $("#inputDoc").val();
  var nombre = $("#inputName").val();
  var email = $("#inputEmail").val();
  var patrocinador = $("#inputPatrocinador").val();
  var enlace_afiliado = $("#inputAfiliado").val();
  var pais = $("#inputPais").val().split(",")[0];
  var codigo_pais = $("#inputPais").val().split(",")[1];
  var telefono_movil =
    $("#inputPais").val().split(",")[2] + " " + $("#inputMovil").val();
  var aceptarTerminos = $("#aceptarTerminos:checked").val();

  if ($("#signatureparent").jSignature("isModified")) {
    var firma = $("#signatureparent").jSignature("getData", "image/svg+xml");
  }

  /*=============================================
   VALIDAR
   =============================================*/
  if (
    doc_usuario == "" ||
    nombre == "" ||
    email == "" ||
    patrocinador == "" ||
    enlace_afiliado == "" ||
    pais == "" ||
    codigo_pais == "" ||
    telefono_movil == "" ||
    aceptarTerminos != "on" ||
    !$("#signatureparent").jSignature("isModified")
  ) {
    $(".suscribirse").before(`

			   <div class="alert alert-danger">Faltan datos, no ha aceptado o no ha firmado los términos y condiciones</div>


		   `);

    return;
  } else {
    // crearCookie("doc_usuario", documento, 1);
    //    crearCookie("enlace_afiliado", enlace_afiliado, 1);
    //    crearCookie("patrocinador", patrocinador, 1);
    //    crearCookie("pais", pais, 1);
    //    crearCookie("codigo_pais", codigo_pais, 1);
    //    crearCookie("telefono_movil", telefono_movil, 1);
    //crearCookie("red", red, 1);
    //    crearCookie("firma", firma[1], 1);

    //    var data = {"id_usuario": id_usuario,
    //                "doc_usuario": documento,
    //                "nombre": nombre,
    // 			   "email": email,
    // 			   "pais": pais,
    // 			   "codigo_pais": codigo_pais,
    // 			   "telefono_movil": telefono_movil,
    // 			   "firma": firma[1],
    // 			   "enlace_afiliado": enlace_afiliado};

    var datos = new FormData();
    datos.append("aceptar", "ok");
    //    datos.append("nombre", nombre);
    //    datos.append("email", email);
    datos.append("doc_usuario", doc_usuario);
    datos.append("id_usuario", id_usuario);
    datos.append("pais", pais);
    datos.append("codigo_pais", codigo_pais);
    datos.append("telefono_movil", telefono_movil);
    datos.append("firma", firma[1]);
    datos.append("enlace_afiliado", enlace_afiliado);
    datos.append("patrocinador", patrocinador);

    $.ajax({
      url: "ajax/usuarios.ajax.php",
      method: "POST",
      data: datos,
      cache: false,
      contentType: false,
      processData: false,
      //    dataType:"json",
      beforeSend: function () {
        $(".suscribirse").after(`

				   <img src="vistas/img/plantilla/status.gif" class="ml-3" style="width:30px; height:30px" />
				   <span class="alert alert-warning ml-3">Procesando el contrato, no cerrar esta página</span>

			   `);
      },
      success: function (respuesta) {

        console.log(respuesta);

        if (respuesta == "ok") {
			
          swal({
            type: "success",
            title: "¡Se ha registrado correctamente!",
            text: "¡Bienvenido a nuestro programa de afiliados, ahora puede comenzar a ganar dinero con nosotros, visite nuestro plan de compensación!",
			      allowOutsideClick: false,
            showConfirmButton: true,
            confirmButtonText: "Cerrar",
          }).then(function (result) {
            if (result.value) {
              window.location = "perfil";
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
              //window.location = "perfil";
            }
          });
		  

        }
        //    window.location = respuesta;
      },
    });
  }
});



// /*=============================================
// VALIDAR FORMULARIO REGISTRO MANUAL
// =============================================*/

// $(".registroManual").click(function () {
//   $(".alert").remove();

//   var doc_usuario = $("#inputDoc").val();
//   var nombre = $("#inputName").val();
//   var email = $("#inputEmail").val();
//   var password = $("#inputPassword").val();
//   var patrocinador = $("#inputPatrocinador").val();
//   var enlace_afiliado = $("#inputAfiliado").val();
//   var pais = $("#inputPais").val().split(",")[0];
//   var codigo_pais = $("#inputPais").val().split(",")[1];
//   var telefono_movil =
//     $("#inputPais").val().split(",")[2] + " " + $("#inputMovil").val();


//   /*=============================================
//    VALIDAR
//    =============================================*/
//   if (
//     doc_usuario == "" ||
//     nombre == "" ||
//     email == "" ||
//     patrocinador == "" ||
//     enlace_afiliado == "" ||
//     pais == "" ||
//     codigo_pais == "" ||
//     telefono_movil == "" ||
//     password == ""
//   ) {
//     $(".registroManual").before(`

// 			   <div class="alert alert-danger">Faltan datos, los campos no pueden ir vacíos</div>

// 		   `);

//     return;
//   } else {

//     var datos = new FormData();
//     datos.append("aceptarRegistroManual", "ok");
//     datos.append("nombre", nombre);
//     datos.append("email", email);
//     datos.append("doc_usuario", doc_usuario);
//     datos.append("password", password);
//     datos.append("pais", pais);
//     datos.append("codigo_pais", codigo_pais);
//     datos.append("telefono_movil", telefono_movil);
//     datos.append("patrocinador", patrocinador);

//     $.ajax({
//       url: "ajax/usuarios.ajax.php",
//       method: "POST",
//       data: datos,
//       cache: false,
//       contentType: false,
//       processData: false,
//       //    dataType:"json",
//       beforeSend: function () {
//         $(".registroManual").after(`

// 				   <img src="vistas/img/plantilla/status.gif" class="ml-3" style="width:30px; height:30px" />
// 				   <span class="alert alert-warning ml-3">Procesando el registro, no cerrar esta página</span>

// 			   `);
//       },
//       success: function (respuesta) {

//         if (respuesta == "ok") {
			
//           swal({
//             type: "success",
//             title: "¡Se ha registrado correctamente!",
// 			      allowOutsideClick: false,
//             showConfirmButton: true,
//             confirmButtonText: "Cerrar",
//           }).then(function (result) {
//             if (result.value) {
//               window.location = "usuarios";
//             }
//           });
		  
//         }else{

//           $(".alert").remove();

//           swal({
//             type: "error",
//             title: "¡Ha ocurrido un error!",
//             allowOutsideClick: false,
//             showConfirmButton: true,
//             confirmButtonText: "Cerrar",
//           }).then(function (result) {
//             if (result.value) {
//               window.location = "usuarios";
//             }
//           });
		  

//         }
//         //    window.location = respuesta;
//       },
//     });
//   }
// });




$("#selectFiltro").on("change", function (){

  seleccion = $(this).val();

  tabla = $(".tablaUsuarios");
  tbody = $(".tablaUsuarios tbody");
  tbody.empty();
  tabla = tabla.dataTable().fnDestroy();

  tabla = $(".tablaUsuarios").DataTable({
    ajax: "ajax/tabla-usuarios.ajax.php?filtro="+seleccion,
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


});

seleccion = $("#selectFiltro").val();

$(".tablaUsuarios").DataTable({
  ajax: "ajax/tabla-usuarios.ajax.php?filtro="+seleccion,
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



$(".tablaUltimosUsuarios").DataTable({
  ajax: "ajax/tabla-ultimos-usuarios.ajax.php",
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



/*=============================================
BORRAR ALERTAS
=============================================*/

$("input[id='inputDoc'], input[id='inputPatrocinador'], input[name='registroUsuario'], input[name='registroEmail']").change(function(){

	$(".alert").remove();

})

$("input[id='inputDoc'], input[id='inputPatrocinador'], input[name='registroUsuario'], input[name='registroEmail']").click(function(){

	$(".alert").remove();

})
// $("input[id='inputDoc']", "input[id='inputPatrocinador']").click(function(){
// 	$(".alert").remove();
// });

/*=============================================
VALIDAR NÚMERO DOCUMENTO REPETIDO
=============================================*/

var ruta = $("#inputRuta").val();

$("#inputDoc").change(function(){

	var documento = $(this).val();
	
	var datos = new FormData();
	datos.append("validarDocumento", documento);

	$.ajax({

		url: "ajax/usuarios.ajax.php",
		method: "POST",
		data: datos,
		cache: false,
		contentType: false,
		processData: false,
		dataType:"json",
		success:function(respuesta){
			
			if(respuesta){

				$("#inputDoc").val("");

				$("#inputDoc").after(`

						<div class="alert alert-warning">
							<strong>ERROR:</strong>
							El número de documento ya existe en la base de datos, por favor ingrese otro diferente

						</div>
				`)

				return;

			}

		}

	})

})


/*=============================================
VALIDAR USUARIO REPETIDO
=============================================*/

$("input[name='registroUsuario']").change(function(){

	var usuario = $(this).val();
	
	var datos = new FormData();
	datos.append("validarUsuario", usuario);

	$.ajax({

		url: "ajax/usuarios.ajax.php",
		method: "POST",
		data: datos,
		cache: false,
		contentType: false,
		processData: false,
		dataType:"json",
		success:function(respuesta){
			
			if(respuesta){

				$("input[name='registroUsuario']").val("");

				$("input[name='registroUsuario']").after(`

						<div class="alert alert-warning">
							<strong>ERROR:</strong>
							El nombre de usuario ya existe en la base de datos, por favor ingrese otro diferente

						</div>
				`)

				return;

			}

		}

	})

})


/*=============================================
VALIDAR EMAIL REPETIDO
=============================================*/

$("input[name='registroEmail']").change(function(){

	var email = $(this).val();
	
	var datos = new FormData();
	datos.append("validarEmail", email);

	$.ajax({

		url: "ajax/usuarios.ajax.php",
		method: "POST",
		data: datos,
		cache: false,
		contentType: false,
		processData: false,
		dataType:"json",
		success:function(respuesta){
			
			if(respuesta){

				$("input[name='registroEmail']").val("");

				$("input[name='registroEmail']").after(`

						<div class="alert alert-warning">
							<strong>ERROR:</strong>
							El correo electrónico ya existe en la base de datos, por favor ingrese otro diferente

						</div>
				`)

				return;

			}

		}

	})

})



/*=============================================
VALIDAR REPETIR CONTRASEÑA
=============================================*/
$("input[id='registroPassword2']").click(function(){
	$(".alert").remove();
});

function validarRepetirPassword(){

	var password = $("input[name='registroPassword']").val();	
	var password2 = $("input[id='registroPassword2']").val();

	if(password2 != ""){
	
			if(password != password2){
	
					$("input[id='registroPassword2']").val("");
	
					$("input[id='registroPassword2']").after(`
	
							<div class="alert alert-warning">
								<strong>ERROR:</strong>
								Las contraseñas no coinciden.
	
							</div>
					`)
	
					return;
	
			}

		}

}

$("input[id='registroPassword2']").change(function(){
         validarRepetirPassword();
})

$("input[name='registroPassword']").change(function(){
	validarRepetirPassword();
})




/*=============================================
VALIDAR QUEL CODIGO DEL PATROCINADOR EXISTA
=============================================*/

$("#inputPatrocinador").change(function(){

	var patrocinador = $(this).val();
	
	var datos = new FormData();
	datos.append("validarPatrocinador", patrocinador);

	$.ajax({

		url: "ajax/usuarios.ajax.php",
		method: "POST",
		data: datos,
		cache: false,
		contentType: false,
		processData: false,
		dataType:"json",
		success:function(respuesta){
			
			if(!respuesta){

				$("#inputPatrocinador").val("");

				$("#inputPatrocinador").after(`

						<div class="alert alert-warning">
							<strong>ERROR:</strong>
							El código del patrocinador ingresado no existe en la base de datos.

						</div>
				`)

				return;

			}

		}

	})

})





/*=============================================
ACTIVAR USUARIO
=============================================*/
$(".tablaUsuarios tbody").on("click", "button.btnActivar", function () {
  var idUsuario = $(this).attr("idUsuario");
  var estadoUsuario = $(this).attr("estadoUsuario");

  var datos = new FormData();
  datos.append("activarId", idUsuario);
  datos.append("activarUsuario", estadoUsuario);

  $.ajax({
    url: "ajax/usuarios.ajax.php",
    method: "POST",
    data: datos,
    cache: false,
    contentType: false,
    processData: false,
    success: function (respuesta) {},
  });

  if (estadoUsuario == 0) {
    $(this).removeClass("btn-success");
    $(this).addClass("btn-danger");
    $(this).html("Desactivado");
    $(this).attr("estadoUsuario", 1);
  } else {
    $(this).addClass("btn-success");
    $(this).removeClass("btn-danger");
    $(this).html("Activado");
    $(this).attr("estadoUsuario", 0);
  }
});

/*=============================================
OPERAR USUARIO
=============================================*/
$(".tablaUsuarios tbody").on("click", "button.btnOperar", function () {
  var idUsuario = $(this).attr("idUsuario");
  var estadoUsuario = $(this).attr("estadoUsuario");

  var datos = new FormData();
  datos.append("operarId", idUsuario);
  datos.append("operarUsuario", estadoUsuario);

  $.ajax({
    url: "ajax/usuarios.ajax.php",
    method: "POST",
    data: datos,
    cache: false,
    contentType: false,
    processData: false,
    success: function (respuesta) {},
  });

  if (estadoUsuario == 0) {
    $(this).removeClass("btn-success");
    $(this).addClass("btn-danger");
    $(this).html("No");
    $(this).attr("estadoUsuario", 1);
  } else {
    $(this).addClass("btn-success");
    $(this).removeClass("btn-danger");
    $(this).html("Si");
    $(this).attr("estadoUsuario", 0);
  }
});

/*=============================================
EDITAR USUARIO
=============================================*/
$(".tablaUsuarios tbody").on("click", "button.btnEditarUsuario", function () {
  var idUsuario = $(this).attr("idUsuario");

  var datos = new FormData();
  datos.append("idUsuarioEditar", idUsuario);

  $.ajax({
    url: "ajax/usuarios.ajax.php",
    method: "POST",
    data: datos,
    cache: false,
    contentType: false,
    processData: false,
    dataType: "json",
    success: function (respuesta) {
      $("#editarUsuario").val(respuesta["id_usuario"]);
      $("#editarNombre").val(respuesta["nombre"]);
      $("#editarEmail").val(respuesta["email"]);
      $("#editarPerfil").val(respuesta["perfil"]);
      $("#editarMovil").val(respuesta["telefono_movil"]);
      $("#passwordActual").val(respuesta["password"]);
    },
  });
});


$(".tablaUsuarios tbody").on("click", "button.btnEliminarUsuario", function () {
  var idUsuario = $(this).attr("idUsuario");
  var datos = new FormData();
  datos.append("idUsuarioEliminar", idUsuario);

  swal({
    title: "¿Está seguro de borrar el usuario?",
    text: "¡Si no lo está puede cancelar la acción!",
    type: "warning",
    showCancelButton: true,
    confirmButtonColor: "#3085d6",
    cancelButtonColor: "#d33",
    cancelButtonText: "Cancelar",
    confirmButtonText: "Si, borrar usuario!",
  }).then((result) => {
    if (result.value) {
      $.ajax({
        url: "ajax/usuarios.ajax.php",
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
              text: "¡El usuario se ha eliminado correctamente!",
              showConfirmButton: true,
              confirmButtonText: "Cerrar",
            }).then(function (result) {
              if (result.value) {
                window.location = "usuarios";
              }
            });
          }
        },
      });
    }
  });
});

/*=============================================
EDITAR TELEFONO
=============================================*/
$("#cambiarTelefono").click(function () {
  var idUsuario = $(this).attr("idUsuario");

  var datos = new FormData();
  datos.append("idUsuarioEditar", idUsuario);

  $.ajax({
    url: "ajax/usuarios.ajax.php",
    method: "POST",
    data: datos,
    cache: false,
    contentType: false,
    processData: false,
    dataType: "json",
    success: function (respuesta) {
      $("#editarMovil").val(respuesta["telefono_movil"]);
    },
  });
});

/*=============================================
COPIAR EN EL CLIPBOARD
=============================================*/

$(".copiarLink").click(function () {
  var temporal = $("<input>");

  $("body").append(temporal);

  temporal.val($("#linkAfiliado").val()).select();

  document.execCommand("copy");

  temporal.remove();

  $(this).parent().parent().after(`
		
		<div class="text-muted copiado">Enlace copiado en el portapapeles</div>

	`);

  setTimeout(function () {
    $(".copiado").remove();
  }, 2000);
});


/*=============================================
COPIAR EN EL CLIPBOARD INICIO
=============================================*/

$(".copiarLinkInicio").click(function () {
  var temporal = $("<input>");

  $("body").append(temporal);

  temporal.val($("#linkAfiliado").val()).select();

  document.execCommand("copy");

  temporal.remove();

  swal({
    type: "success",
    title: "¡Enlace Copiado Correctamente!",
    position: "top-right",
    toast : "true",
    showConfirmButton: false,
    timer: 3000
  });

});


/*=============================================
COPIAR CODIGO EN EL CLIPBOARD INICIO
=============================================*/

$(".copiarCodigoInicio").click(function () {
  var temporal = $("<input>");

  $("body").append(temporal);

  temporal.val($("#codigoAfiliado").val()).select();

  document.execCommand("copy");

  temporal.remove();

  swal({
    type: "success",
    title: "¡Código Copiado Correctamente!",
    position: "top-right",
    toast : "true",
    showConfirmButton: false,
    timer: 3000
  });

});


$(".tablaUsuarios tbody").on("click", "button.btnSoporte", function () {
  var idUsuario = $(this).attr("idUsuario");

  window.location = "index.php?pagina=soporte&id=" + idUsuario;
});


$(".tablaUsuarios tbody").on("click", "button.btnVerUsuario", function () {
  var idUsuario = $(this).attr("idUsuario");

  window.location = "index.php?pagina=usuario&id=" + idUsuario;
});


/*=============================================
PINTEREST GRID
=============================================*/

$(".grid").pinterest_grid({
  no_columns: 3,
  padding_x: 10,
  padding_y: 10,
  margin_bottom: 50,
  single_column_breakpoint: 700,
});

