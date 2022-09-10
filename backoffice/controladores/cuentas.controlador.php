<?php


Class ControladorCuentas{
	
	/*=============================================
	Mostrar Cuentas
	=============================================*/

	static public function ctrMostrarCuentas($item, $valor){
	
		$tabla = "cuentas_bancarias";

		$respuesta = ModeloCuentas::mdlMostrarCuentas($tabla, $item, $valor);

		return $respuesta;

	}


	


}

