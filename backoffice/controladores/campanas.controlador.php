<?php

// https://github.com/PHPMailer/PHPMailer
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

Class ControladorCampanas{

	/*=============================================
	Registro de campanas
	=============================================*/

	public function ctrRegistroCampana(){

		if(isset($_POST["selectTipoCampana"])){
			if($_POST["selectTipoCampana"]==1){

			if(preg_match('/^[a-zA-ZñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["registroNombre"]) &&
			    preg_match('/^[0-9]+$/', $_POST["registroCupos"]) &&
			    preg_match('/^[0-9.]+$/', $_POST["registroRetorno"])){

				$tabla = "campanas";
				$datos = array("nombre" => $_POST["registroNombre"],
				               "retorno" => $_POST["registroRetorno"],
							   "cupos" => $_POST["registroCupos"],
							   "fecha_inicio" => $_POST["registroFechaInicio"],
							   "fecha_fin" => $_POST["registroFechaFinal"],
							   "fecha_retorno" => $_POST["registroFechaRetorno"],
							   "estado" => 0); 


				$respuesta = ModeloCampanas::mdlRegistroCampana($tabla, $datos);
				

				if($respuesta == "ok"){


					echo '<script>

							swal({

								type:"success",
								title: "¡CAMPAÑA CREADA CORRECTAMENTE!",
								showConfirmButton: true,
								confirmButtonText: "Cerrar"

							}).then(function(result){

								if(result.value){

									window.location = "campanas";

								}


							});	

						</script>';

					
				}else{
					echo '<script>

							swal({

								type:"error",
								title: "¡ERROR!",
								text: "¡¡Ha ocurrido un problema, por favor inténtelo nuevamente",
								showConfirmButton: true,
								confirmButtonText: "Cerrar"

							}).then(function(result){

								if(result.value){

									history.back();

								}


							});	

						</script>';

				}

			}else{

				echo '<script>

					swal({

						type:"error",
						title: "¡CORREGIR!",
						text: "¡No se permiten caracteres especiales en ninguno de los campos!",
						showConfirmButton: true,
						confirmButtonText: "Cerrar"

					}).then(function(result){

						if(result.value){

							history.back();

						}


					});	

				</script>';


			}

		}else if($_POST["selectTipoCampana"]==2){

			if(preg_match('/^[0-9.]+$/', $_POST["registroRetorno"])){

				$tabla = "campanas";
				$datos = array("nombre" => "Bono Extra",
				               "retorno" => $_POST["registroRetorno"],
							   "cupos" => "0",
							   "fecha_inicio" => $_POST["registroFechaInicio"],
							   "fecha_fin" => $_POST["registroFechaFinal"],
							   "fecha_retorno" => $_POST["registroFechaRetorno"],
							   "estado" => 0); 


				$respuesta = ModeloCampanas::mdlRegistroCampana($tabla, $datos);
				

				if($respuesta == "ok"){


					echo '<script>

							swal({

								type:"success",
								title: "¡BONO EXTRA CREADO CORRECTAMENTE!",
								showConfirmButton: true,
								confirmButtonText: "Cerrar"

							}).then(function(result){

								if(result.value){

									window.location = "campanas";

								}


							});	

						</script>';

					
				}else{
					echo '<script>

							swal({

								type:"error",
								title: "¡ERROR!",
								text: "¡¡Ha ocurrido un problema, por favor inténtelo nuevamente",
								showConfirmButton: true,
								confirmButtonText: "Cerrar"

							}).then(function(result){

								if(result.value){

									history.back();

								}


							});	

						</script>';

				}

			}else{

				echo '<script>

					swal({

						type:"error",
						title: "¡CORREGIR!",
						text: "¡No se permiten caracteres especiales en ninguno de los campos!",
						showConfirmButton: true,
						confirmButtonText: "Cerrar"

					}).then(function(result){

						if(result.value){

							history.back();

						}


					});	

				</script>';


			}


		}
	}

	}



	/*=============================================
	Mostrar Campanas
	=============================================*/

	static public function ctrMostrarCampanas($item, $valor){
	
		$tabla = "campanas";

		$respuesta = ModeloCampanas::mdlMostrarCampanas($tabla, $item, $valor);

		return $respuesta;

	}


	/*=============================================
	Mostrar Usuarios FetchAll
	=============================================*/

	static public function ctrMostrarUsuariosFetchAll($item, $valor){
	
		$tabla = "usuarios";

		$respuesta = ModeloUsuarios::mdlMostrarUsuariosFetchAll($tabla, $item, $valor);

		return $respuesta;

	}

	/*=============================================
	Total Usuarios
	=============================================*/

	static public function ctrTotalUsuarios(){
	
		$tabla = "usuarios";

		$respuesta = ModeloUsuarios::mdlTotalUsuarios($tabla);

		return $respuesta;

	}

	/*=============================================
	MOSTRAR USUARIOS X FILTRO O ACTIVIDAD ----- FUNCIONAL FERNANDO
	=============================================*/

	static public function ctrTotalUsuariosXfiltro($item, $valor){
	
		$tabla = "usuarios"; 

		$respuesta = ModeloUsuarios::mdlTotalUsuariosXfiltro($tabla, $item, $valor);

		return $respuesta;

	}


	/*=============================================
	Actualizar Usuario
	=============================================*/

	static public function ctrActualizarUsuario($id, $item, $valor){

		$tabla = "usuarios";

		$respuesta = ModeloUsuarios::mdlActualizarUsuario($tabla, $id, $item, $valor);

		return $respuesta;

	}


	/*=============================================
	editar campaña
	=============================================*/

	public function ctrEditarCampana(){

		$tabla = "campanas";

		if(isset($_POST["editarNombre"])){

			if(preg_match('/^[0-9]+$/', $_POST["editarCupos"]) &&
			preg_match('/^[0-9a-zA-ZñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["editarNombre"]) &&
			preg_match('/^[0-9.]+$/', $_POST["editarRetorno"])){

				$datos = array(	"nombre" => $_POST["editarNombre"],
				"retorno" => $_POST["editarRetorno"],
				"cupos" => $_POST["editarCupos"],
				"fecha_inicio" => $_POST["editarFechaInicio"],
				"fecha_fin" => $_POST["editarFechaFinal"],
				"fecha_retorno" => $_POST["editarFechaRetorno"],
				"id" => $_POST["idCampana"]);

				
		$respuesta = ModeloCampanas::mdlEditarCampana($tabla, $datos);

		if($respuesta == "ok"){
			echo '<script>

							swal({

								type:"success",
								title: "ACTUALIZACIÓN EXITOSA",
								text: "¡LA CAMPAÑA HA SIDO ACTUALIZADA CORRECTAMENTE!",
								showConfirmButton: true,
								confirmButtonText: "Cerrar"

							}).then(function(result){

								if(result.value){

									window.location = "campanas";

								}


							});	

						</script>';
		}

				}else{

					echo '<script>
	
						swal({
	
							type:"error",
							title: "¡CORREGIR!",
							text: "¡No se permiten caracteres especiales en ninguno de los campos!",
							showConfirmButton: true,
							confirmButtonText: "Cerrar"
	
						}).then(function(result){
	
							if(result.value){
	
								history.back();
	
							}
	
	
						});	
	
					</script>';
	
	
				}
			}



	}


	/*=============================================
	Tolta comprobantes campaña
	=============================================*/

	static public function ctrTotalComprobantesxCampana($id){

		$tabla = "campanas";
		$tabla2 = "comprobantes";

		$respuesta = ModeloCampanas::mdlTotalComprobantesxCampana($tabla, $tabla2, $id);

		return $respuesta;

	}


	/*=============================================
	Eliminar Campana
	=============================================*/

	static public function ctrEliminarCampana($id){

		$tabla = "campanas";
		$tabla2 = "comprobantes";

		$totalComprobantes = ModeloCampanas::mdlTotalComprobantesxCampana($tabla, $tabla2, $id);

		if($totalComprobantes["total"] > 0) return $totalComprobantes["total"];

		$respuesta = ModeloCampanas::mdlEliminarCampana($tabla, $id);

		return $respuesta;

	}



	/*=============================================
	registrar cuenta bancaria
	=============================================*/

	public function ctrRegistrarCuentaBancaria(){

		$tabla = "cuentas_bancarias";

		if(isset($_POST["idUsuarioCuentaRegistrar"])){

			if(preg_match('/^[0-9]+$/', $_POST["registrarNumeroCuenta"]) &&
			preg_match('/^[a-zA-ZñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["registrarEntidadCuenta"]) ){

				$datos = array(	"titular" => $_POST["idUsuarioCuentaRegistrar"],
				"estado" => 1,
				"tipo" => $_POST["registrarTipoCuenta"],
				"entidad" => $_POST["registrarEntidadCuenta"],
				"numero" => $_POST["registrarNumeroCuenta"]);

				
		$respuesta = ModeloUsuarios::mdlRegistrarCuentaBancaria($tabla, $datos);

		if($respuesta == "ok"){
			echo '<script>

							swal({

								type:"success",
								title: "REGISTRO EXITOSO",
								text: "¡SU CUENTA BANCARIA HA SIDO CREADA CORRECTAMENTE!",
								showConfirmButton: true,
								confirmButtonText: "Cerrar"

							}).then(function(result){

								if(result.value){

									window.location = "perfil";

								}


							});	

						</script>';
		}

				}
			}



	}


	



}

