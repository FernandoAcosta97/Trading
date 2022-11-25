<?php

require_once "../controladores/general.controlador.php";

require_once "../controladores/multinivel.controlador.php";
require_once "../modelos/multinivel.modelo.php";

require_once "../controladores/usuarios.controlador.php";
require_once "../modelos/usuarios.modelo.php";

require_once "../controladores/pagos.controlador.php";
require_once "../modelos/pagos.modelo.php";

require_once "../controladores/comprobantes.controlador.php";
require_once "../modelos/comprobantes.modelo.php";

require_once "../controladores/cuentas.controlador.php";
require_once "../modelos/cuentas.modelo.php";

require_once "../controladores/campanas.controlador.php";
require_once "../modelos/campanas.modelo.php";

class TablaPagos{

	/*=============================================
	ACTIVAR TABLA PAGOS
	=============================================*/ 

	public function mostrarTabla(){

		date_default_timezone_set('America/Bogota');

		$ruta = ControladorGeneral::ctrRuta();
		$patrocinador = ControladorGeneral::ctrPatrocinador();

		$red = ControladorMultinivel::ctrMostrarUsuarioRed("red_binaria", null, null);

		$pagos = ControladorPagos::ctrMostrarPagosAll("estado","0");

		$periodo_comision = 0;
		$periodo_venta = 0;
		$totalAfiliadosActivos=0;

		if(count($pagos) < 1 ){

			echo '{ "data":[]}';

			return;

		}

 		$datosJson = '{

	 	"data": [ ';

	 	// if(count($red) != 0){

 	
		// 	$periodo_venta =0; 
		
		// 	$usuario = ControladorUsuarios::ctrMostrarUsuarios("id_usuario", "43");

			

		// 		$fechaPago = date('Y-m-d');
			

		// 	/*=============================================
		// 	NOTAS
		// 	=============================================*/			

		// 	$notas = "<h5><a href='".$ruta."backoffice/binaria' class='btn btn-purple btn-sm'>Actualizar</a></h5>";		

		// 	$datosJson	 .= '[
						
		// 			"1",
		// 			"En proceso...",
		// 			"En proceso...",
		// 			"En proceso...",
		// 			"'.$periodo_comision.'",
		// 			"$ '.number_format($periodo_comision, 2, ",", ".").'",
		// 			"$ '.number_format($periodo_venta, 2, ",", ".").'",
		// 			"'.$fechaPago.'",
		// 			"'.$notas.'"

		// 	],';

		// }

		foreach ($pagos as $key => $value) {
			
			$comprobante=ControladorComprobantes::ctrMostrarComprobantes("id",$value["id_comprobante"]);

			$campana=ControladorCampanas::ctrMostrarCampanas("id",$comprobante[0]["campana"]);

  			$usuario = ControladorUsuarios::ctrMostrarUsuarios("doc_usuario", $comprobante[0] ["doc_usuario"]);

			$cuentaBancaria = ControladorCuentas::ctrMostrarCuentas("usuario",$usuario["id_usuario"]);

			$red = ControladorMultinivel::ctrMostrarRedUninivel("red_uninivel", "patrocinador_red", $usuario["enlace_afiliado"]);

			if(count($red)>0){
				foreach ($red as $key2 => $value2){
					$usuarioRedOperando = ControladorUsuarios::ctrMostrarUsuarios("id_usuario", $value2["usuario_red"]);
	
					if($usuarioRedOperando["operando"]==1){
						++$totalAfiliadosActivos;
					}
	
				}
			}
	
			/*=============================================
			NOTAS
			=============================================*/

			// if($_GET["enlace_afiliado"] != $patrocinador){			

			// 	$notas = "<h5><span class='badge badge-success'>Pagada</span></h5>";

			// }else{

			// 	$notas = "<h5><span class='badge badge-success'>Pagada $".number_format($value["periodo_comision"])."</span></h5>";
			// }	
			
            $ganancia = ($comprobante[0]['valor']*$campana['retorno'])/100;
            $total = $comprobante[0]['valor']+$ganancia;

			if($cuentaBancaria==""){
                $numero_cuenta = "X";
				$entidad_cuenta = "X";
				$tipo_cuenta = "X";

				$acciones = "<button class='btn btn-info' disabled>PAGAR</button>";
            }else{
				$numero_cuenta = $cuentaBancaria["numero"];
				$entidad_cuenta = $cuentaBancaria["entidad"];
				$tipo_cuenta = $cuentaBancaria["tipo"];

				$acciones = "<button class='btn btn-info btnPagarInversion' idPagoInversion='".$value["id"]."'>PAGAR</button>";
			}

			$seleccionar = "<center><input type='checkbox' class='seleccionarPago' idPago='".$value["id"]."'></input></center>";

			$datosJson	 .= '[
				    "'.($key+1).'",
					"'.$seleccionar.'",
				    "'.$acciones.'",
					"'.$value["id"].'",
					"'.$usuario["doc_usuario"].'",
					"'.$usuario["nombre"].'",
					"'.$usuario["pais"].'",
					"'.$usuario["telefono_movil"].'",
					"'.$totalAfiliadosActivos.'",
					"'.$entidad_cuenta.'",
					"'.$numero_cuenta.'",
					"'.$tipo_cuenta.'",
					"'.$campana["nombre"].'",
					"'.$comprobante[0]["fecha"].'",
					"'.$campana["fecha_retorno"].'",
					"$ '.number_format($comprobante[0]["valor"]).'",
					"'.$campana["retorno"].' %",
					"$ '.number_format($ganancia).'",
					"$ '.number_format($total).'"

			],';

			$totalAfiliadosActivos=0;

		}


		$datosJson = substr($datosJson, 0, -1);

		$datosJson.=  ']

		}';

		echo $datosJson;
	}

}

/*=============================================
ACTIVAR TABLA PAGOS
=============================================*/ 

$activar = new TablaPagos();
$activar -> mostrarTabla();


