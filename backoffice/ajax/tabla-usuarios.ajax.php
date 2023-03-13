<?php 

require_once "../controladores/general.controlador.php";
require_once "../controladores/usuarios.controlador.php";
require_once "../modelos/usuarios.modelo.php";
require_once "../controladores/multinivel.controlador.php";
require_once "../modelos/multinivel.modelo.php";

class TablaUsuarios{

	public function mostrarTabla(){

		$ruta = ControladorGeneral::ctrRuta();

		$item = null;
		$valor = null;
		$totalAfiliadosActivos=0;
		$valido = true;
		

		if(isset($_GET["filtro"])){

            if($_GET["filtro"]=="todos"){

				$usuarios = ControladorUsuarios::ctrMostrarUsuarios($item, $valor);
                
            }
			if($_GET["filtro"]=="operando"){
                
            $item2="operando";
            $valor2="1";
			$usuarios = ControladorUsuarios::ctrMostrarUsuariosFetchAll($item2, $valor2);

            }

			if($_GET["filtro"]=="activos"){
                
				$item2="estado";
				$valor2="1";
				$usuarios = ControladorUsuarios::ctrMostrarUsuariosFetchAll($item2, $valor2);
	
			}

			if($_GET["filtro"]=="inactivos"){
                
				$item2="estado";
				$valor2="0";
				$usuarios = ControladorUsuarios::ctrMostrarUsuariosFetchAll($item2, $valor2);
		
			}
			

			if($_GET["filtro"]=="sin-operar"){
                
				$item2="operando";
				$valor2="0";
				$usuarios = ControladorUsuarios::ctrMostrarUsuariosFetchAll($item2, $valor2);
	
			}

			if($_GET["filtro"]=="referidos" || $_GET["filtro"]=="sin-referidos"){
                
				$usuarios = ControladorUsuarios::ctrMostrarUsuarios($item, $valor);
	
			}



        }else{
			$usuarios = ControladorUsuarios::ctrMostrarUsuarios($item, $valor);
        }



		if(count($usuarios) <= 1){

			echo '{ "data":[]}';

			return;

		}

		$datosJson = '{"data":[';

		foreach ($usuarios as $key => $value) {
			$valido = true;

			if($value["perfil"] != "admin"){

				$red = ControladorMultinivel::ctrMostrarRedUninivel("red_uninivel", "patrocinador_red", $value["enlace_afiliado"]);
	
				if(count($red)>0){
				foreach ($red as $key2 => $value2){
					$usuarioRedOperando = ControladorUsuarios::ctrMostrarUsuarios("id_usuario", $value2["usuario_red"]);
	
					if($usuarioRedOperando["operando"]==1){
						++$totalAfiliadosActivos;
					}
	
				}
			}

			if($_GET["filtro"]=="referidos" && $totalAfiliadosActivos==0){

                    $valido = false;
			
			}else if($_GET["filtro"]=="sin-referidos" && $totalAfiliadosActivos>0){
				$valido = false;
			}

			if($valido){
				/*=============================================
				ESTADO Y OPERANDO
				=============================================*/	

				if($value["estado"] == 0){

					$estado = "<button type='button' class='btn btn-danger btn-sm btnActivar' idUsuario='".$value["id_usuario"]."' estadoUsuario='1'>Desactivado</button>";

				}else{

					$estado = "<button type='button' class='btn btn-success btn-sm btnActivar' idUsuario='".$value["id_usuario"]."' estadoUsuario='0'>Activado</button>";
				}


				/*=============================================
				VERIFICACION CORREO
				=============================================*/	

				if($value["verificacion"] == 0){

					$verificacion = "<button type='button' class='btn btn-danger btn-sm btnVerificar' idUsuario='".$value["id_usuario"]."' verificacionUsuario='1'>No</button>";

				}else{

					$verificacion = "<button type='button' class='btn btn-success btn-sm btnVerificar' idUsuario='".$value["id_usuario"]."' verificacionUsuario='0'>Si</button>";
				}

				if($value["operando"] == 0){

					$operando = "<button type='button' class='btn btn-danger btn-sm btnOperar' idUsuario='".$value["id_usuario"]."' estadoUsuario='1'>No</button>";

				}else{

					$operando = "<button type='button' class='btn btn-success btn-sm btnOperar' idUsuario='".$value["id_usuario"]."' estadoUsuario='0'>Si</button>";
				}

				$acciones = "<div class='btn-group'><button type='button' class='btn btn-primary btn-xs btnSoporte' idUsuario='".$value["id_usuario"]."'><i class='fa fa-envelope'></i></button><button class='btn btn-warning btn-xs btnEditarUsuario' idUsuario='".$value["id_usuario"]."' data-toggle='modal' data-target='#modalEditarUsuario'><i class='fa fa-pen' style='color:white'></i></button><button type='button' class='btn btn-info btn-xs btnVerUsuario' idUsuario='".$value["id_usuario"]."'><i class='fa fa-eye'></i></button><button type='button' class='btn btn-danger btn-xs btnEliminarUsuario' idUsuario='".$value["id_usuario"]."'><i class='fa fa-times'></i></button></div>";

				$docUsuario = "n/a";
				if($value["fecha_contrato"]!=null){

					$docUsuario = $value["doc_usuario"];

				}

				$pais = "n/a";
				if($value["pais"]!=""){

					$pais = $value["pais"];

				}
				
				$datosJson .= '[

					   "'.$acciones.'",
					   "'.$docUsuario.'",
					   "'.$value["usuario"].'",
				       "'.$value["nombre"].'",
				       "'.$value["email"].'",
					   "'.$verificacion.'",
				       "'.$pais.'",
				       "'.$estado.'",
				       "'.$operando.'",
                       "'.$totalAfiliadosActivos.'", 
					   "'.$value["patrocinador"].'", 
					   "'.$value["enlace_afiliado"].'", 
					   "'.$value["telefono_movil"].'",
					   "'.$value["fecha"].'"

				],';

			}
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
