<?php

require_once "../controladores/comprobantes.controlador.php";
require_once "../modelos/comprobantes.modelo.php";

class AjaxComprobantes{

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
	ACTIVAR COMPROBANTES
	=============================================*/	

	public $aprobadoIdComprobante;
	public $aprobadoComprobante;

	public function ajaxAprobadoComprobante(){

		$tabla = "comprobantes";

		$item = "estado";
		$valor = $this->aprobadoComprobante;

		$id = $this->aprobadoIdComprobante;

		$respuesta = ModeloComprobantes::mdlActualizarComprobante($tabla, $id, $item, $valor);

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
	Suscripción con Paypal
	=============================================*/	
	public $suscripcion;
	public $nombre;
	public $email;
	public $documento;

	public function ajaxSuscripcion(){

		$ruta = ControladorGeneral::ctrRuta();
		//$valorSuscripcion = ControladorGeneral::ctrValorSuscripcion();
		$fecha = substr(date("c"), 0, -6)."Z";
		$valor = $this->documento;
		$url = "http://localhost/www/trading/backoffice/index.php?pagina=perfil&id=".urlencode($valor);

		echo $url;

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
	EDITAR COMPROBANTE
	=============================================*/	

	public $idComprobanteEditar;

	public function ajaxEditarComprobante(){

		$item = "id";
		$valor = $this->idComprobanteEditar;

		$respuesta = ControladorComprobantes::ctrMostrarComprobantes($item, $valor);

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
ACTIVAR COMPROBANTE
=============================================*/	

if(isset($_POST["aprobadoIdComprobante"])){

	$aprobadoIdComprobante = new AjaxComprobantes();
	$aprobadoIdComprobante -> aprobadoIdComprobante = $_POST["aprobadoIdComprobante"];
	$aprobadoIdComprobante -> aprobadoComprobante = $_POST["aprobadoComprobante"];
	$aprobadoIdComprobante -> ajaxAprobadoComprobante();

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
EDITAR COMPROBANTE
=============================================*/
if(isset($_POST["idComprobanteEditar"])){

	$editar = new AjaxComprobantes();
	$editar -> idComprobanteEditar = $_POST["idComprobanteEditar"];
	$editar -> ajaxEditarComprobante();

}

/*=============================================
Eliminar Usuario
=============================================*/	

if(isset($_POST["idUsuarioEliminar"])){

	$eliminarUsuario = new AjaxUsuarios();
	$eliminarUsuario -> idUsuarioEliminar = $_POST["idUsuarioEliminar"];
	$eliminarUsuario -> ajaxEliminarUsuario();

}


