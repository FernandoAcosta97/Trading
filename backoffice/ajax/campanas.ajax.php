<?php

require_once "../controladores/campanas.controlador.php";
require_once "../modelos/campanas.modelo.php";

class AjaxCampanas{

	/*=============================================
	Validar email existente
	=============================================*/

	public $validarEmail;
	
	public function ajaxValidarEmail(){

		$item = "email";
		$valor = $this->validarEmail;

		$respuesta = ControladorUsuarios::ctrMostrarUsuarios($item, $valor);

		echo json_encode($respuesta);

	}

	/*=============================================
	CAMBIAR ESTADO CAMPAÑA
	=============================================*/	

	public $activarIdCampana;
	public $activarCampana;

	public function ajaxActivarCampana(){

		$tabla = "campanas";

		$item = "estado";
		$valor = $this->activarCampana;

		$id = $this->activarIdCampana;

		$respuesta = ModeloCampanas::mdlActualizarCampana($tabla, $id, $item, $valor);

	}

	/*=============================================
	OPERAR USUARIO
	=============================================*/	

	public $operarUsuario;
	public $operarId;


	public function ajaxOperarUsuario(){

		$tabla = "usuarios";

		$item = "operando";
		$valor = $this->operarUsuario;

		$id = $this->operarId;

		$respuesta = ModeloUsuarios::mdlActualizarUsuario($tabla, $id, $item, $valor);

	}



	/*=============================================
	Cancelar Suscripción
	=============================================*/	
	public $idUsuario;

	public function ajaxCancelarSuscripcion(){

		$valor = $this->idUsuario;

		$respuesta = ControladorUsuarios::ctrCancelarSuscripcion($valor);

		echo $respuesta;

	}

	/*=============================================
	EDITAR CAMPAÑA
	=============================================*/	

	public $idCampanaEditar;

	public function ajaxEditarCampana(){

		$item = "id";
		$valor = $this->idCampanaEditar;

		$respuesta = ControladorCampanas::ctrMostrarCampanas($item, $valor);

		echo json_encode($respuesta);

	}


	/*=============================================
    Eliminar Usuario
    =============================================*/	

	public $idUsuarioEliminar;

	public function ajaxEliminarUsuario(){

		$valor = $this->idUsuarioEliminar;

		$respuesta = ControladorUsuarios::ctrEliminarUsuario($valor);

		echo $respuesta;

	}

}

/*=============================================
Validar email existente
=============================================*/

if(isset($_POST["validarEmail"])){

	$valEmail = new AjaxUsuarios();
	$valEmail -> validarEmail = $_POST["validarEmail"];
	$valEmail -> ajaxValidarEmail();

}

/*=============================================
ACTIVAR CAMPAÑA
=============================================*/	

if(isset($_POST["activarIdCampana"])){

	$activarIdCampana = new AjaxCampanas();
	$activarIdCampana -> activarIdCampana = $_POST["activarIdCampana"];
	$activarIdCampana -> activarCampana = $_POST["activarCampana"];
	$activarIdCampana -> ajaxActivarCampana();

}


/*=============================================
OPERAR USUARIO
=============================================*/	

if(isset($_POST["operarUsuario"])){

	$operarUsuario = new AjaxUsuarios();
	$operarUsuario -> operarUsuario = $_POST["operarUsuario"];
	$operarUsuario -> operarId = $_POST["operarId"];
	$operarUsuario -> ajaxOperarUsuario();

}

/*=============================================
Suscripción con Paypal
=============================================*/	

if(isset($_POST["suscripcion"]) && $_POST["suscripcion"] == "ok"){

	$paypal = new AjaxUsuarios();
	$paypal -> nombre = $_POST["nombre"];
	$paypal -> email = $_POST["email"];
	$paypal -> documento = $_POST["documento"];
	$paypal -> ajaxSuscripcion();

}

/*=============================================
Cancelar Suscrpción
=============================================*/	

if(isset($_POST["idUsuario"])){

	$cancelarSuscripcion = new AjaxUsuarios();
	$cancelarSuscripcion -> idUsuario = $_POST["idUsuario"];
	$cancelarSuscripcion -> ajaxCancelarSuscripcion();

}

/*=============================================
EDITAR CAMPANA
=============================================*/
if(isset($_POST["idCampanaEditar"])){

	$editar = new AjaxCampanas();
	$editar -> idCampanaEditar = $_POST["idCampanaEditar"];
	$editar -> ajaxEditarCampana();

}

/*=============================================
Eliminar Usuario
=============================================*/	

if(isset($_POST["idUsuarioEliminar"])){

	$eliminarUsuario = new AjaxUsuarios();
	$eliminarUsuario -> idUsuarioEliminar = $_POST["idUsuarioEliminar"];
	$eliminarUsuario -> ajaxEliminarUsuario();

}


