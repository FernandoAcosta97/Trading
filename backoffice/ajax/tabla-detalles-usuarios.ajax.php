<?php 

require_once "../controladores/general.controlador.php";
require_once "../controladores/usuarios.controlador.php";
require_once "../modelos/usuarios.modelo.php";
require_once "../controladores/comprobantes.controlador.php";
require_once "../modelos/comprobantes.modelo.php";
require_once "../controladores/multinivel.controlador.php";
require_once "../modelos/multinivel.modelo.php";

class TablaUsuarios{

	public function mostrarTabla(){

		$ruta = ControladorGeneral::ctrRuta();

		$item = null;
		$valor = null;
		$totalAfiliadosActivos=0;
		$valido = true;
		//REQ01 - SE INICIALIZA VARIABLE EN 0 PARA ALMACENAR LOS REFERIDOS INACTIVOS
		$totalAfiliadosInactivos=0;
		//REQ01 - FIN
		$totalC=0;
		$afiliadosNecesarios = 0;
		$contador=0;
		
		if(isset($_GET["id"]) && isset($_GET["tipo"])){


			$item="id_usuario";
			$valor=$_GET["id"];
			$usuario = ControladorUsuarios::ctrMostrarUsuarios($item, $valor);
                

		}else{
			$usuario = null;
        }



		if($usuario == null){

			echo '{ "data":[]}';

			return;

		}

		$datosJson = '{"data":[';


			if($usuario["perfil"] != "admin"){

				$red = ControladorMultinivel::ctrMostrarRedUninivel("red_uninivel", "patrocinador_red", $usuario["enlace_afiliado"]);
	
				if(count($red)>0){
				foreach ($red as $key2 => $value2){

					$usuarioRedOperando = ControladorUsuarios::ctrMostrarUsuarios("id_usuario", $value2["usuario_red"]);

					$docUsuario = "n/a";
					if($usuarioRedOperando["fecha_contrato"]!=null){
	
						$docUsuario = $usuarioRedOperando["doc_usuario"];
	
					}
	
					$pais = "n/a";
					if($usuarioRedOperando["pais"]!=""){
	
						$pais = $usuarioRedOperando["pais"];
	
					}
	
					if($_GET["tipo"]=="activos" && $usuarioRedOperando["operando"]==1){

						$contador=$contador+1;

						$datosJson .= '[

							"'.($key2+1).'",
							"'.$docUsuario.'",
							"'.$usuarioRedOperando["nombre"].'",
							"'.$pais.'",
							"'.$usuarioRedOperando["telefono_movil"].'",
							"'.$usuarioRedOperando["email"].'"
	 
					 ],';
						

					}else if($_GET["tipo"]=="inactivos" && $usuarioRedOperando["operando"]==0){

						$contador=$contador+1;
						
						$datosJson .= '[

							"'.($key2+1).'",
							"'.$docUsuario.'",
							"'.$usuarioRedOperando["nombre"].'",
							"'.$pais.'",
							"'.$usuarioRedOperando["telefono_movil"].'",
							"'.$usuarioRedOperando["email"].'"
	 
					 ],';
					}
			

				}
			}



			
		}

		

		if($contador==0){

			echo '{ "data":[]}';

			return;

		}else{

			$datosJson = substr($datosJson, 0, -1);

			$datosJson .= ']}';
	
			echo $datosJson;

		}

		


	}
	// cierre metodo


}
// cierre clase

$activarTabla = new TablaUsuarios();
$activarTabla -> mostrarTabla();
