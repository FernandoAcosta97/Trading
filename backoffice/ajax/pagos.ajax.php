<?php

require_once "../controladores/comprobantes.controlador.php";
require_once "../modelos/comprobantes.modelo.php";
require_once "../controladores/pagos.controlador.php";
require_once "../modelos/pagos.modelo.php";
require_once "../controladores/usuarios.controlador.php";
require_once "../modelos/usuarios.modelo.php";
require_once "../controladores/cuentas.controlador.php";
require_once "../modelos/cuentas.modelo.php";
require_once "../controladores/pagos.controlador.php";
require_once "../modelos/pagos.modelo.php";

class AjaxPagos{

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
	Cambiar estado pago inversion
	=============================================*/	

	public $idPagoInversion;

	public function ajaxEstadoPagoInversion(){

		$item = "estado";
		$valor = 1;

		$id = $this->idPagoInversion;

		$pago = ControladorPagos::ctrMostrarPagos("id", $id);

		$comprobante = ControladorComprobantes::ctrMostrarComprobantes("id", $pago["id_comprobante"]);

		$usuario = ControladorUsuarios::ctrMostrarUsuarios("doc_usuario", $comprobante[0]["doc_usuario"]);

		$cuenta = ControladorCuentas::ctrMostrarCuentasxEstado("usuario",$usuario["id_usuario"],"estado",1);

		$item2 = "id_cuenta";
		$valor2 = $cuenta["id"];

		return $respuesta = ControladorPagos::ctrActualizarPagoInversionCuenta($id, $item, $valor, $item2, $valor2);

	}


	/*=============================================
	Cambiar estado pago Comision
	=============================================*/	

	public $idPagoComision;
	public $totalComision;

	public function ajaxEstadoPagoComision(){

		$item = "estado";
		$valor = 1;

		$id = $this->idPagoComision;
		$item2 = "valor";
		$valor2 = $this->totalComision;

		return $respuesta = ControladorPagos::ctrActualizarPagoComision($id, $item, $valor, $item2, $valor2);

	}


	/*=============================================
	Cambiar estado varios pagos
	=============================================*/	

	public $idsPagos;
	public $tipoPago;

	public function ajaxEstadoPagos(){

		$item = "estado";
		$valor = 1;
		$item2 = "valor";
		$tipoPago=$this->tipoPago;

		$arrayPagos = explode(",", $this->idsPagos);

		for($i=0; $i<count($arrayPagos); $i++){

			$respuesta = ControladorPagos::ctrActualizarPagos($arrayPagos[$i], $item, $valor, $tipoPago);
		}

		return $respuesta;

	}



	/*=============================================
	Cambiar estado pago Extra
	=============================================*/	

	public $idPagoExtra;

	public function ajaxEstadoPagoExtra(){

		$item = "estado";
		$valor = 1;

		$id = $this->idPagoExtra;

		return $respuesta = ControladorPagos::ctrActualizarPagoExtra($id, $item, $valor);

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




}



/*=============================================
Cambiar estado pago inversion
=============================================*/	

if(isset($_POST["idPagoInversion"])){

	$pagoInversion = new AjaxPagos();
	$pagoInversion -> idPagoInversion = $_POST["idPagoInversion"];
	$pagoInversion -> ajaxEstadoPagoInversion();

}


/*=============================================
Cambiar estado pago Comision
=============================================*/	

if(isset($_POST["idPagoComision"])){

	$pagoComision = new AjaxPagos();
	$pagoComision -> idPagoComision = $_POST["idPagoComision"];
	$pagoComision -> totalComision = $_POST["totalComision"];
	$pagoComision -> ajaxEstadoPagoComision();

}



/*=============================================
Cambiar estado de varios pagos
=============================================*/	

if(isset($_POST["idsPagos"])){

	$pago = new AjaxPagos();
	$pago -> idsPagos = $_POST["idsPagos"];
	$pago -> tipoPago = $_POST["tipoPago"];
	$pago -> ajaxEstadoPagos();

}


/*=============================================
Cambiar estado pago Extra
=============================================*/	

if(isset($_POST["idPagoExtra"])){

	$pagoExtra = new AjaxPagos();
	$pagoExtra -> idPagoExtra = $_POST["idPagoExtra"];
	$pagoExtra -> ajaxEstadoPagoExtra();

}


/*=============================================
CAMBIAR CAMPAÑA COMPROBANTE SELECT
=============================================*/	

if(isset($_POST["cambiarCampanaComprobante"])){

	$cambiarCampanaComprobante = new AjaxComprobantes();
	$cambiarCampanaComprobante -> idComprobateCampana = $_POST["cambiarCampanaComprobante"];
	$cambiarCampanaComprobante -> idCampana = $_POST["idCampana"];
	$cambiarCampanaComprobante -> ajaxCambiarCampanaComprobante();

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


