<?php

require_once "../controladores/general.controlador.php";

require_once "../controladores/multinivel.controlador.php";
require_once "../modelos/multinivel.modelo.php";

require_once "../controladores/usuarios.controlador.php";
require_once "../modelos/usuarios.modelo.php";

class TablaPagos{

	/*=============================================
	ACTIVAR TABLA PAGOS
	=============================================*/ 

	public function mostrarTabla(){

		date_default_timezone_set('America/Bogota');

		$ruta = ControladorGeneral::ctrRuta();
		$patrocinador = ControladorGeneral::ctrPatrocinador();

			$red = ControladorMultinivel::ctrMostrarUsuarioRed("red_binaria", null, null);

			$pagos = ControladorMultinivel::ctrMostrarPagosRed("pagos_binaria", null, null);

		

		$periodo_comision = 0;
		$periodo_venta = 0;

 		$datosJson = '{

	 	"data": [ ';

	 	if(count($red) != 0){

 	
			  $periodo_venta =0; 
		
			$usuario = ControladorUsuarios::ctrMostrarUsuarios("id_usuario", "43");

			

				$fechaPago = date('Y-m-d');
			

			/*=============================================
			NOTAS
			=============================================*/			

			$notas = "<h5><a href='".$ruta."backoffice/binaria' class='btn btn-purple btn-sm'>Actualizar</a></h5>";		

			$datosJson	 .= '[
						
					"1",
					"En proceso...",
					"En proceso...",
					"En proceso...",
					"'.$periodo_comision.'",
					"$ '.number_format($periodo_comision, 2, ",", ".").'",
					"$ '.number_format($periodo_venta, 2, ",", ".").'",
					"'.$fechaPago.'",
					"'.$notas.'"

			],';

		}

		foreach ($pagos as $key => $value) {

			$periodo_comision = 0;
			$periodo_venta = 0;

			if($_GET["enlace_afiliado"] != $patrocinador || $value["usuario_pago"] == $_GET["id_usuario"]){

				$periodo_comision += $value["periodo_comision"];

			}else{

				$periodo_comision += $value["periodo_venta"]-$value["periodo_comision"];
			}
				
  			$periodo_venta += $value["periodo_venta"];  

  			$usuario = ControladorUsuarios::ctrMostrarUsuarios("id_usuario", $value["usuario_pago"]);
	
			/*=============================================
			NOTAS
			=============================================*/

			if($_GET["enlace_afiliado"] != $patrocinador){			

				$notas = "<h5><span class='badge badge-success'>Pagada</span></h5>";

			}else{

				$notas = "<h5><span class='badge badge-success'>Pagada $".number_format($value["periodo_comision"])."</span></h5>";
			}		

			$datosJson	 .= '[
						
					"'.($key+2).'",
					"'.$value["id_pago_paypal"].'",
					"'.$usuario["nombre"].'",
					"'.$usuario["paypal"].'",
					"'.$value["periodo"].'",
					"$ '.number_format($periodo_comision, 2, ",", ".").'",
					"$ '.number_format($periodo_venta, 2, ",", ".").'",
					"'.substr($value["fecha_pago"],0,-9).'",
					"'.$notas.'"

			],';

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


