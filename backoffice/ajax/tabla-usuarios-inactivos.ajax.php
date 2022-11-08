<?php 

require_once "../controladores/general.controlador.php";
require_once "../controladores/usuarios.controlador.php";
require_once "../modelos/usuarios.modelo.php";
require_once "../controladores/multinivel.controlador.php";
require_once "../modelos/multinivel.modelo.php";

class TablaUsuarios{

	public function mostrarTabla(){

		$ruta = ControladorGeneral::ctrRuta();

		$item = "estado";
		$valor = 0;
		$usuarios = ControladorUsuarios::ctrMostrarusuariosFetchAll($item, $valor);
		$totalAfiliadosActivos=0;

		if(count($usuarios) < 1 ){

			echo '{ "data":[]}';

			return;
		}

		$datosJson = '{"data":[';

		foreach ($usuarios as $key => $value) {

			if($value["perfil"] != "admin"){
				
				$red = ControladorMultinivel::ctrMostrarRedUninivel("red_uninivel", "patrocinador_red", $value["enlace_afiliado"]);
				// print_r($red);
	
				if(count($red)>0){
				foreach ($red as $key2 => $value2){
					$usuarioRedOperando = ControladorUsuarios::ctrMostrarUsuarios("id_usuario", $value2["usuario_red"]);
	
					if($usuarioRedOperando["operando"]==1){
						++$totalAfiliadosActivos;
					}
	
				}
			}

				/*=============================================
				ESTADO Y OPERANDO
				=============================================*/	

				if($value["estado"] == 0){

					$estado = "<button type='button' class='btn btn-danger btn-sm btnActivar' idUsuario='".$value["id_usuario"]."' estadoUsuario='1'>Desactivado</button>";

				}else{

					$estado = "<button type='button' class='btn btn-success btn-sm btnActivar' idUsuario='".$value["id_usuario"]."' estadoUsuario='0'>Activado</button>";
				}

				if($value["firma"]!=NULL){

                $operando = "<button type='button' class='btn btn-success btn-sm btnOperar' idUsuario='".$value["id_usuario"]."' estadoUsuario='0'>Si</button>";
				
			}else{
				$operando = "<button type='button' disabled class='btn btn-danger btn-sm'>No</button>";
			}

				$acciones = "<div class='btn-group'><button class='btn btn-warning btn-xs btnEditarUsuario' idUsuario='".$value["id_usuario"]."' data-toggle='modal' data-target='#modalEditarUsuario'><i class='fa fa-pen' style='color:white'></i></button><button type='button' class='btn btn-primary btn-xs btnSoporte' idUsuario='".$value["id_usuario"]."'><i class='fa fa-envelope'></i></button></div>";

				$docUsuario = "n/a";
				if($value["firma"]!=""){

					$docUsuario = $value["doc_usuario"];

				}

				$pais = "n/a";
				if($value["pais"]!=""){

					$pais = $value["pais"];

				}
				
				$datosJson .= '[

					   "'.$acciones.'",
					   "'.$docUsuario.'",
				       "'.$value["nombre"].'",
				       "'.$value["email"].'",
				       "'.$pais.'",
				       "'.$estado.'",
				       "'.$operando.'",
                       "'.$totalAfiliadosActivos.'", 
					   "'.$value["patrocinador"].'", 
					   "'.$ruta.$value["enlace_afiliado"].'",   
					   "'.$value["telefono_movil"].'",
					   "'.$value["fecha"].'"

				],';

			}

			$totalAfiliadosActivos=0;

		}

		$datosJson = substr($datosJson, 0, -1);

		$datosJson .= ']}';

		echo $datosJson;

	}
	// cierre metodo


}
// cierre clase

$activarTabla = new TablaUsuarios();
$activarTabla -> mostrarTabla();
