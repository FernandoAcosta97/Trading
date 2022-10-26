<?php

// https://github.com/PHPMailer/PHPMailer
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

Class ControladorCampanas{

	/*=============================================
	Registro de campanas
	=============================================*/

	public function ctrRegistroCampana(){

		if(isset($_POST["registroNombre"])){

			if(preg_match('/^[a-zA-ZñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["registroNombre"]) &&
			    preg_match('/^[0-9]+$/', $_POST["registroCupos"]) &&
			    preg_match('/^[0-9.]+$/', $_POST["registroRetorno"])){

				$tabla = "campanas";
				$datos = array("nombre" => $_POST["registroNombre"],
				               "retorno" => $_POST["registroRetorno"],
							   "cupos" => $_POST["registroCupos"],
							   "fecha_inicio" => $_POST["registroFechaInicio"],
							   "fecha_fin" => $_POST["registroFechaFinal"],
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

