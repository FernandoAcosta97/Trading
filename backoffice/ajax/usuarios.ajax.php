<?php

require_once "../controladores/general.controlador.php";
require_once "../controladores/usuarios.controlador.php";
require_once "../modelos/usuarios.modelo.php";

class AjaxUsuarios{

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
	Suscripción con Paypal
	=============================================*/	
	public $suscripcion;
	public $nombre;
	public $email;

	public function ajaxSuscripcion(){

		$ruta = ControladorGeneral::ctrRuta();
		$valorSuscripcion = ControladorGeneral::ctrValorSuscripcion();
		$fecha = substr(date("c"), 0, -6)."Z";
		$urlPaypal = "http://localhost/www/trading/backoffice/index.php?pagina=perfil&subscription_id=I-9885416";
		

		echo $urlPaypal;

	}

	/*=============================================
	Cancelar Suscrpción
	=============================================*/	
	public $idUsuario;

	public function ajaxCancelarSuscripcion(){

		$valor = $this->idUsuario;

		$respuesta = ControladorUsuarios::ctrCancelarSuscripcion($valor);

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
Suscripción con Paypal
=============================================*/	

if(isset($_POST["suscripcion"]) && $_POST["suscripcion"] == "ok"){

	$paypal = new AjaxUsuarios();
	$paypal -> nombre = $_POST["nombre"];
	$paypal -> email = $_POST["email"];
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


