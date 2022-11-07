<?php


Class ControladorCuentas{


	/*=============================================
	registrar cuenta bancaria
	=============================================*/

	public function ctrRegistrarCuentaBancaria(){

		$tabla = "cuentas_bancarias";

		if(isset($_POST["idUsuarioCuentaRegistrar"])){

			if(preg_match('/^[0-9]+$/', $_POST["registrarNumeroCuenta"]) && preg_match('/^[0-9]+$/', $_POST["registrarNumeroTitular"]) &&
			preg_match('/^[a-zA-ZñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["registrarEntidadCuenta"]) ){

				$datos = array(	"titular" => $_POST["registrarNumeroTitular"],
				"usuario" => $_POST["idUsuarioCuentaRegistrar"],
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

									window.location = "cuentas-bancarias";

								}


							});	

						</script>';
		}

				}
			}



	}



	
	/*=============================================
	Mostrar Cuentas
	=============================================*/

	static public function ctrMostrarCuentas($item, $valor){
	
		$tabla = "cuentas_bancarias";

		$respuesta = ModeloCuentas::mdlMostrarCuentas($tabla, $item, $valor);

		return $respuesta;

	}



	/*=============================================
	editar cuenta bancaria
	=============================================*/

	public function ctrEditarCuenta(){

		$tabla = "cuentas_bancarias";

		if(isset($_POST["editarNumero"])){

			if(preg_match('/^[0-9]+$/', $_POST["editarNumero"]) &&
			preg_match('/^[a-zA-ZñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["editarEntidad"]) ){

				$datos = array(	"numero" => $_POST["editarNumero"],
				"entidad" => $_POST["editarEntidad"],
				"tipo" => $_POST["editarTipo"],
				"id" => $_POST["idCuenta"]);

				
		$respuesta = ModeloCuentas::mdlEditarCuenta($tabla, $datos);

		if($respuesta == "ok"){
			echo '<script>

							swal({

								type:"success",
								title: "ACTUALIZACIÓN EXITOSA",
								text: "¡LA CUENTA BANCARIA HA SIDO ACTUALIZADA CORRECTAMENTE!",
								showConfirmButton: true,
								confirmButtonText: "Cerrar"

							}).then(function(result){

								if(result.value){

									window.location = "cuentas-bancarias";

								}


							});	

						</script>';
		}

				}
			}



	}


	


}

