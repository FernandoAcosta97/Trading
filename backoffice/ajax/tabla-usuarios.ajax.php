<?php 

require_once "../controladores/general.controlador.php";
require_once "../controladores/usuarios.controlador.php";
require_once "../modelos/usuarios.modelo.php";

class TablaUsuarios{

	public function mostrarTabla(){

		$ruta = ControladorGeneral::ctrRuta();

		$item = null;
		$valor = null;
		$usuarios = ControladorUsuarios::ctrMostrarusuarios($item, $valor);

		if(count($usuarios) < 2 ){

			echo '{ "data":[]}';

			return;

		}

		$datosJson = '{"data":[';

		foreach ($usuarios as $key => $value) {

			if($value["perfil"] != "admin"){

				/*=============================================
				FOTO USUARIOS
				=============================================*/	

				// if($value["foto"] == ""){

				// 	$foto = "<img src='vistas/img/usuarios/default/default.png' class='img-fluid rounded-circle' width='30px'>";

				// }else{

				// 	$foto = "<img src='".$value["foto"]."' class='img-fluid rounded-circle' width='30px'>";

				// }

				/*=============================================
				ESTADO Y OPERANDO
				=============================================*/	

				if($value["estado"] == 0){

					$estado = "<button type='button' class='btn btn-danger btn-sm btnActivar' idUsuario='".$value["id_usuario"]."' estadoUsuario='1'>Desactivado</button>";

				}else{

					$estado = "<button type='button' class='btn btn-success btn-sm btnActivar' idUsuario='".$value["id_usuario"]."' estadoUsuario='0'>Activado</button>";
				}

				if($value["firma"]!=NULL){

				if($value["operando"] == 0){

					$operando = "<button type='button' class='btn btn-danger btn-sm btnOperar' idUsuario='".$value["id_usuario"]."' estadoUsuario='1'>No</button>";

				}else{

					$operando = "<button type='button' class='btn btn-success btn-sm btnOperar' idUsuario='".$value["id_usuario"]."' estadoUsuario='0'>Si</button>";
				}
			}else{
				$operando = "<button type='button' disabled class='btn btn-danger btn-sm'>No</button>";
			}

				$acciones = "<div class='btn-group'><button class='btn btn-warning btn-xs btnEditarUsuario' idUsuario='".$value["id_usuario"]."' data-toggle='modal' data-target='#modalEditarUsuario'><i class='fa fa-pen' style='color:white'></i></button><button type='button' class='btn btn-primary btn-xs btnSoporte' idUsuario='".$value["id_usuario"]."'><i class='fa fa-envelope'></i></button></div>";
				
				$datosJson .= '[

					   "'.($key+1).'",
					   "'.$value["doc_usuario"].'",
				       "'.$value["nombre"].'",
				       "'.$value["email"].'",
				       "'.$value["pais"].'",
				       "'.$estado.'",
				       "'.$operando.'",
					   "'.$value["patrocinador"].'",
					   "'.$ruta.$value["enlace_afiliado"].'",   
					   "'.$acciones.'",
					   "'.$value["telefono_movil"].'",
					   "'.$value["fecha"].'"

				],';

			}

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
