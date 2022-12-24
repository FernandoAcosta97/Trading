<?php

// https://github.com/PHPMailer/PHPMailer
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

Class ControladorUsuarios{

	/*=============================================
	Registro de usuarios
	=============================================*/

	public function ctrRegistroUsuario(){

		if(isset($_POST["registroUsuario"])){

			$existe_usuario=ModeloUsuarios::mdlMostrarUsuarios("usuarios","usuario",$_POST["registroUsuario"]);

			if($existe_usuario==""){

			$ruta = ControladorRuta::ctrRuta();

			if(preg_match('/^[-_a-zA-ZñÑáéíóúÁÉÍÓÚ0-9._ ]+$/', $_POST["registroUsuario"]) && preg_match('/^[-_a-zA-ZñÑáéíóúÁÉÍÓÚ0-9 ]+$/', $_POST["registroNombre"]) &&
			   preg_match('/^[^0-9][a-zA-Z0-9_-]+([.][a-zA-Z0-9_]+)*[@][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,4}$/', $_POST["registroEmail"]) &&
			    preg_match('/^[a-zA-Z0-9-@.]+$/', $_POST["registroPassword"])){

				$encriptar = crypt($_POST["registroPassword"], '$2a$07$asxx54ahjppf45sd87a5a4dDDGsystemdev$');

				$encriptarEmail = md5($_POST["registroEmail"]);
				$aleatorio = mt_rand(2, 999999999999);

				$tabla = "usuarios";
				$datos = array("perfil" => "usuario",
				               "doc_usuario" => $aleatorio,
							   "usuario" => $_POST["registroUsuario"],
							   "nombre" => $_POST["registroNombre"],
							   "email" => $_POST["registroEmail"],
							   "password" => $encriptar,
							   "estado" => 1,
							   "verificacion" => 0,
							   "email_encriptado" => $encriptarEmail,
							   "patrocinador" => $_POST["patrocinador"]); 



				$respuesta = ModeloUsuarios::mdlRegistroUsuario($tabla, $datos);
				

				if($respuesta == "ok"){

					/*=============================================
					Verificación Correo Electrónico
					=============================================*/

					date_default_timezone_set("America/Bogota");

					$mail = new PHPMailer;

					$mail->Charset = "UTF-8";

					$mail->isMail();

					$mail->setFrom("admin@trading.com", "Admin Trading");

					$mail->addReplyTo("admin@trading.com", "Admin Trading");

					$mail->Subject  = "Por favor verifique su dirección de correo electrónico";

					$mail->addAddress($_POST["registroEmail"]);

					$mail->msgHTML('<div style="width:100%; background:#eee; position:relative; font-family:sans-serif; padding-bottom:40px">
	
						<center>
								
							<img style="padding:20px; width:10%" src="'.$ruta.'vistas/img/logo.png">

						</center>

						<div style="position:relative; margin:auto; width:600px; background:white; padding:20px">
							
							<center>

								<img style="padding:20px; width:15%" src="'.$ruta.'vistas/img/email.png">

								<h3 style="font-weight:100; color:#999">VERIFIQUE SU DIRECCIÓN DE CORREO ELECTRÓNICO</h3>

								<hr style="border:1px solid #ccc; width:80%">

								<h4 style="font-weight:100; color:#999; padding:0 20px">Para comenzar a usar su cuenta, debe confirmar su dirección de correo electrónico</h4>

								<a href="'.$ruta.$encriptarEmail.'" target="_blank" style="text-decoration:none">
									
									<div style="line-height:60px; background:#0aa; width:60%; color:white">Verifique su dirección de correo electrónico</div>

								</a>

								<br>

								<hr style="border:1px solid #ccc; width:80%">

								<h5 style="font-weight:100; color:#999">Si no se inscribió en esta cuenta, puede ignorar este correo electrónico.</h5>

							</center>	

						</div>

					</div>');
							
					$envio = $mail->Send();

					if(!$envio){

						echo '<script>

							swal({

								type:"error",
								title: "¡ERROR!",
								text: "¡¡Ha ocurrido un problema enviando verificación de correo electrónico a '.$_POST["registroEmail"].' '.$mail->ErrorInfo.', por favor inténtelo nuevamente",
								showConfirmButton: true,
								confirmButtonText: "Cerrar"

							}).then(function(result){

								if(result.value){

									history.back();

								}


							});	

						</script>';


					}else{


						echo '<script>

							swal({

								type:"success",
								title: "¡SU CUENTA HA SIDO CREADA CORRECTAMENTE!",
								text: "¡Por favor revise la bandeja de entrada o la carpeta SPAM de su correo electrónico para verificar la cuenta!",
								showConfirmButton: true,
								confirmButtonText: "Cerrar"

							}).then(function(result){

								if(result.value){

									window.location = "'.$ruta.'ingreso";

								}


							});	

						</script>';


					}
					
				}

			}else{

				echo '<script>

					swal({

						type:"error",
						title: "¡CORREGIR!",
						text: "¡No se permiten caracteres especiales en ninguno de los campos!",
						showConfirmButton: true,
						confirmButtonText: "Cerrar"

					}).then(function(result){

						if(result.value){

							history.back();

						}


					});	

				</script>';


			}

		}

		}

	}


	/*=============================================
	Registro de usuarios manual
	=============================================*/

	public function ctrRegistroUsuarioManual(){

		if(isset($_POST["registroUsuario"])){

			if(preg_match('/^[a-zA-ZñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["registroUsuario"]) && preg_match('/^[a-zA-ZñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["registroNombre"]) &&
			   preg_match('/^[^0-9][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[@][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,4}$/', $_POST["registroEmail"]) &&
			    preg_match('/^[a-zA-Z0-9]+$/', $_POST["registroPassword"]) &&
			    preg_match('/^[0-9]+$/', $_POST["registroDoc"])){

				$encriptar = crypt($_POST["registroPassword"], '$2a$07$asxx54ahjppf45sd87a5a4dDDGsystemdev$');

				$encriptarEmail = md5($_POST["registroEmail"]);
				$firma = "firma";
				$datos_pais = explode(",", $_POST["registroPais"]);
				$pais = $datos_pais[0];
				$codigo_pais = $datos_pais[1];
				$telefono_movil = $datos_pais[2]." ".$_POST["registroTelefono"];
				date_default_timezone_set("America/Bogota");
				$fecha  = getdate();
				$fecha_contrato = $fecha["year"] . "-" . $fecha["mon"] . "-" . $fecha["mday"];

				$tabla = "usuarios";
				$datos = array("perfil" => "usuario",
				               "doc_usuario" => $_POST["registroDoc"],
							   "usuario" => $_POST["registroUsuario"],
							   "nombre" => $_POST["registroNombre"],
							   "email" => $_POST["registroEmail"],
							   "password" => $encriptar,
							   "estado" => 1,
							   "verificacion" => 1,
							   "email_encriptado" => $encriptarEmail,
							   "pais" => $pais,
							   "telefono_movil" => $telefono_movil,
							   "codigo_pais" => $codigo_pais,
							   "patrocinador" => $_POST["registroPatrocinador"],
							   "fecha_contrato" => $fecha_contrato,
							   "firma" => $firma); 


			$respuesta = ModeloUsuarios::mdlRegistroUsuarioManual($tabla, $datos);	
			
			if($respuesta == "ok"){

				$usuario_registrado = ControladorUsuarios::ctrMostrarUsuarios("doc_usuario", $_POST["registroDoc"]);

				$enlace_afiliado = strtolower(str_replace(" ", "-", $_POST["registroNombre"])) . "-" . $usuario_registrado["id_usuario"];

				$actualizar_enlace_afiliado = ControladorUsuarios::ctrActualizarUsuario($usuario_registrado["id_usuario"],"enlace_afiliado",$enlace_afiliado);

				$datosUninivel = array("usuario_red" => $usuario_registrado["id_usuario"],
					"patrocinador_red" => $_POST["registroPatrocinador"],
					"periodo_venta" => 10);
		
				$datosArbol = array("usuario_red" => $usuario_registrado["id_usuario"],
					"patrocinador_red" => $_POST["registroPatrocinador"]);
		
				$registroUninivel = ControladorMultinivel::ctrRegistroUninivel($datosUninivel);
				$registroArbol = ControladorMultinivel::ctrRegistroBinaria($datosArbol);

				if($registroArbol == "ok" && $registroUninivel == "ok"){

					echo '<script>

						swal({

							type:"success",
							title: "¡LA CUENTA HA SIDO CREADA CORRECTAMENTE!",
							showConfirmButton: true,
							confirmButtonText: "Cerrar"

						}).then(function(result){

							if(result.value){

								window.location="uusarios";

							}


						});	

					</script>';

				}else{

					echo '<script>

					swal({

						type:"error",
						title: "¡ERROR!",
						text: "¡¡Ha ocurrido un problema, por favor inténtelo nuevamente",
						showConfirmButton: true,
						confirmButtonText: "Cerrar"

					}).then(function(result){

						if(result.value){

							history.back();

						}


					});	

				</script>';
			

				}
			}
				

			}else{

				echo '<script>

					swal({

						type:"error",
						title: "¡CORREGIR!",
						text: "¡No se permiten caracteres especiales en ninguno de los campos!",
						showConfirmButton: true,
						confirmButtonText: "Cerrar"

					}).then(function(result){

						if(result.value){

							history.back();

						}


					});	

				</script>';


			}

		}

	}


	/*=============================================
	Mostrar Usuarios
	=============================================*/

	static public function ctrMostrarUsuarios($item, $valor){
	
		$tabla = "usuarios";

		$respuesta = ModeloUsuarios::mdlMostrarUsuarios($tabla, $item, $valor);

		return $respuesta;

	}


	/*=============================================
	Mostrar Ultimos Usuarios Registrados con contrato
	=============================================*/

	static public function ctrMostrarUltimosUsuariosRegistrados(){
	
		$tabla = "usuarios";

		$respuesta = ModeloUsuarios::mdlMostrarMostrarUltimosUsuariosRegistrados($tabla);

		return $respuesta;

	}

	/*=============================================
	Buscar Usuarios
	=============================================*/

	static public function ctrBuscarUsuarios($valor){
	
		$tabla = "usuarios";

		$respuesta = ModeloUsuarios::mdlBuscarUsuarios($tabla, $valor);

		return $respuesta;

	}


	/*=============================================
	Mostrar Usuarios FetchAll
	=============================================*/

	static public function ctrMostrarUsuariosFetchAll($item, $valor){
	
		$tabla = "usuarios";

		$respuesta = ModeloUsuarios::mdlMostrarUsuariosFetchAll($tabla, $item, $valor);

		return $respuesta;

	}

	/*=============================================
	Total Usuarios
	=============================================*/

	static public function ctrTotalUsuarios(){
	
		$tabla = "usuarios";

		$respuesta = ModeloUsuarios::mdlTotalUsuarios($tabla);

		return $respuesta;

	}

	/*=============================================
	MOSTRAR USUARIOS X FILTRO O ACTIVIDAD ----- FUNCIONAL FERNANDO
	=============================================*/

	static public function ctrTotalUsuariosXfiltro($item, $valor){
	
		$tabla = "usuarios"; 

		$respuesta = ModeloUsuarios::mdlTotalUsuariosXfiltro($tabla, $item, $valor);

		return $respuesta;

	}


	/*=============================================
	Actualizar Usuario
	=============================================*/

	static public function ctrActualizarUsuario($id, $item, $valor){

		$tabla = "usuarios";

		$respuesta = ModeloUsuarios::mdlActualizarUsuario($tabla, $id, $item, $valor);

		return $respuesta;

	}


	/*=============================================
	EDITAR USUARIO
	=============================================*/

	static public function ctrEditarUsuario(){

		if(isset($_POST["editarUsuario"])){

			if(preg_match('/^[a-zA-ZñÑáéíóúÁÉÍÓÚ0-9._ ]+$/', $_POST["editarNombre"]) &&
			preg_match('/^[^0-9][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[@][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,4}$/', $_POST["editarEmail"])){

				$tabla = "usuarios";

				if($_POST["editarPassword"] != ""){

					if(preg_match('/^[a-zA-Z0-9]+$/', $_POST["editarPassword"])){

						$encriptar = crypt($_POST["editarPassword"], '$2a$07$asxx54ahjppf45sd87a5a4dDDGsystemdev$');

					}else{

						echo'<script>

								swal({
									  type: "error",
									  title: "¡La contraseña no puede ir vacía o llevar caracteres especiales!",
									  showConfirmButton: true,
									  confirmButtonText: "Cerrar"
									  }).then(function(result){
										if (result.value) {

										window.location = "usuarios";

										}
									})

						  	</script>';

					}

				}else{

					$encriptar = $_POST["passwordActual"];

				}

				$telefono = $_POST["indicativo"]." ".$_POST["editarMovil"];

				$datos = array("nombre" => $_POST["editarNombre"],
							   "email" => $_POST["editarEmail"],
							   "password" => $encriptar,
							   "telefono" => $telefono,
							   "perfil" => $_POST["editarPerfil"],
							   "id_usuario" => $_POST["editarUsuario"]);

				$respuesta = ModeloUsuarios::mdlEditarUsuario($tabla, $datos);

				if($respuesta == "ok"){

					echo'<script>

					swal({
						  type: "success",
						  title: "El usuario ha sido editado correctamente",
						  showConfirmButton: true,
						  confirmButtonText: "Cerrar"
						  }).then(function(result){
									if (result.value) {

									window.location = "usuarios";

									}
								})

					</script>';

				}


			}else{

				echo'<script>

					swal({
						  type: "error",
						  title: "¡El nombre no puede ir vacío o llevar caracteres especiales!",
						  showConfirmButton: true,
						  confirmButtonText: "Cerrar"
						  }).then(function(result){
							if (result.value) {

							window.location = "usuarios";

							}
						})

			  	</script>';

			}

		}

	}


	/*=============================================
	Eliminar Usuario
	=============================================*/

	static public function ctrEliminarUsuario($id){

		$tabla = "usuarios";

		$respuesta = ModeloUsuarios::mdlEliminarUsuario($tabla, $id);

		return $respuesta;

	}

	/*=============================================
	Ingreso Usuario
	=============================================*/

	public function ctrIngresoUsuario(){

		if(isset($_POST["ingresoEmail"])){

			 if(preg_match('/^[^0-9][a-zA-Z0-9_-]+([.][a-zA-Z0-9_]+)*[@][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,4}$/', $_POST["ingresoEmail"]) && preg_match('/^[a-zA-Z0-9-.]+$/', $_POST["ingresoPassword"])){

			 	$encriptar = crypt($_POST["ingresoPassword"], '$2a$07$asxx54ahjppf45sd87a5a4dDDGsystemdev$');

			 	$tabla = "usuarios";
			 	$item = "email";
			 	$valor = $_POST["ingresoEmail"];

			 	$respuesta = ModeloUsuarios::mdlMostrarUsuarios($tabla, $item, $valor);

			 	if($respuesta["email"] == $_POST["ingresoEmail"] && $respuesta["password"] == $encriptar){

			 		if($respuesta["verificacion"] == 0){

			 			echo'<script>

							swal({
									type:"error",
								  	title: "¡ERROR!",
								  	text: "¡El correo electrónico aún no ha sido verificado, por favor revise la bandeja de entrada o la carpeta SPAM de su correo electrónico para verificar la cuenta, o contáctese con nuestro soporte whatsapp: 3125698783 -  correo: admin@trading.com!",
								  	showConfirmButton: true,
									confirmButtonText: "Cerrar"
								  
							}).then(function(result){

									if(result.value){   
									    history.back();
									  } 
							});

						</script>';

						return;

			 		}else if($respuesta["estado"] == 0){

						echo'<script>

						   swal({
								   type:"warning",
									 title: "¡Advertencia!",
									 text: "¡Su cuenta se encuentra desactivada , contáctese con nuestro soporte whatsapp: 3125698783 -  correo: admin@trading.com!",
									 showConfirmButton: true,
								   confirmButtonText: "Cerrar"
								 
						   }).then(function(result){

								   if(result.value){   
									   history.back();
									 } 
						   });

					   </script>';

					   return;

					}else{

			 			$_SESSION["validarSesion"] = "ok";
			 			$_SESSION["id"] = $respuesta["id_usuario"];
						
			 			$ruta = ControladorRuta::ctrRuta();

			 			echo '<script>
					
							window.location = "'.$ruta.'backoffice";				

						</script>';

			 		}

			 	}else{

			 		echo'<script>

						swal({
								type:"error",
							  	title: "¡ERROR!",
							  	text: "¡El email o contraseña no coinciden!",
							  	showConfirmButton: true,
								confirmButtonText: "Cerrar"
							  
						}).then(function(result){

								if(result.value){   
								    history.back();
								  } 
						});

					</script>';

			 	}


			 }else{

			 	echo '<script>

					swal({

						type:"error",
						title: "¡CORREGIR!",
						text: "¡No se permiten caracteres especiales en ninguno de los campos!",
						showConfirmButton: true,
						confirmButtonText: "Cerrar"

					}).then(function(result){

						if(result.value){

							history.back();

						}

					});	

				</script>';

			 }

		}

	}

	/*=============================================
	Cambiar foto perfil
	=============================================*/

	public function ctrCambiarFotoPerfil(){

		if(isset($_POST["idUsuarioFoto"])){

			$ruta = $_POST["fotoActual"];

			if(isset($_FILES["cambiarImagen"]["tmp_name"]) && !empty($_FILES["cambiarImagen"]["tmp_name"])){

				list($ancho, $alto) = getimagesize($_FILES["cambiarImagen"]["tmp_name"]);

				$nuevoAncho = 500;
				$nuevoAlto = 500;

				/*=============================================
				CREAMOS EL DIRECTORIO DONDE VAMOS A GUARDAR LA FOTO DEL USUARIO
				=============================================*/

				$directorio = "vistas/img/usuarios/".$_POST["idUsuarioFoto"];

				/*=============================================
				PRIMERO PREGUNTAMOS SI EXISTE OTRA IMAGEN EN LA BD Y EL CARPETA
				=============================================*/

				if($ruta != ""){

					unlink($ruta);

				}else{

					if(!file_exists($directorio)){	

						mkdir($directorio, 0755);

					}

				}

				/*=============================================
				DE ACUERDO AL TIPO DE IMAGEN APLICAMOS LAS FUNCIONES POR DEFECTO DE PHP
				=============================================*/

				if($_FILES["cambiarImagen"]["type"] == "image/jpeg"){

					$aleatorio = mt_rand(100,999);

					$ruta = $directorio."/".$aleatorio.".jpg";

					$origen = imagecreatefromjpeg($_FILES["cambiarImagen"]["tmp_name"]);

					$destino = imagecreatetruecolor($nuevoAncho, $nuevoAlto);

					imagecopyresized($destino, $origen, 0, 0, 0, 0, $nuevoAncho, $nuevoAlto, $ancho, $alto);

					imagejpeg($destino, $ruta);	


				}else if($_FILES["cambiarImagen"]["type"] == "image/png"){

					$aleatorio = mt_rand(100,999);

					$ruta = $directorio."/".$aleatorio.".png";

					$origen = imagecreatefrompng($_FILES["cambiarImagen"]["tmp_name"]);	

					$destino = imagecreatetruecolor($nuevoAncho, $nuevoAlto);	

					imagealphablending($destino, FALSE);
		
					imagesavealpha($destino, TRUE);		

					imagecopyresized($destino, $origen, 0, 0, 0, 0, $nuevoAncho, $nuevoAlto, $ancho, $alto);		

					imagepng($destino, $ruta);

				}else{

					echo'<script>

						swal({
								type:"error",
							  	title: "¡CORREGIR!",
							  	text: "¡No se permiten formatos diferentes a JPG y/o PNG!",
							  	showConfirmButton: true,
								confirmButtonText: "Cerrar"
							  
						}).then(function(result){

								if(result.value){   
								    history.back();
								  } 
						});

					</script>';

				}
			
			}

			// final condicion

			$tabla = "usuarios";
			$id = $_POST["idUsuarioFoto"];
			$item = "foto";
			$valor = $ruta;

			$respuesta = ModeloUsuarios::mdlActualizarUsuario($tabla, $id, $item, $valor);

			if($respuesta == "ok"){

				echo '<script>

					swal({
						type:"success",
					  	title: "¡CORRECTO!",
					  	text: "¡La foto de perfil ha sido actualizada!",
					  	showConfirmButton: true,
						confirmButtonText: "Cerrar"
					  
					}).then(function(result){

							if(result.value){   
							    history.back();
							  } 
					});

				</script>';


			}

		}

	}

	/*=============================================
	Cambiar contraseña
	=============================================*/

	public function ctrCambiarPassword(){

		if(isset($_POST["idUsuarioPassword"])){	

			if(preg_match('/^[a-zA-Z0-9]+$/', $_POST["editarPassword"])){

				$encriptar = crypt($_POST["editarPassword"], '$2a$07$asxx54ahjppf45sd87a5a4dDDGsystemdev$');

				$tabla = "usuarios";
				$id = $_POST["idUsuarioPassword"];
				$item = "password";
				$valor = $encriptar;

				$respuesta = ModeloUsuarios::mdlActualizarUsuario($tabla, $id, $item, $valor);

				if($respuesta == "ok"){

					echo '<script>

						swal({
							type:"success",
						  	title: "¡CORRECTO!",
						  	text: "¡La contraseña ha sido actualizada!",
						  	showConfirmButton: true,
							confirmButtonText: "Cerrar"
						  
						}).then(function(result){

								if(result.value){   
								    history.back();
								  } 
						});

					</script>';


				}

			}else{

			 	echo '<script>

					swal({

						type:"error",
						title: "¡CORREGIR!",
						text: "¡No se permiten caracteres especiales en la contraseña!",
						showConfirmButton: true,
						confirmButtonText: "Cerrar"

					}).then(function(result){

						if(result.value){

							history.back();

						}

					});	

				</script>';

			 }


		}

	}

	/*=============================================
	Recuperar contraseña
	=============================================*/

	public function ctrRecuperarPassword(){

		if(isset($_POST["emailRecuperarPassword"])){

			if(preg_match('/^[^0-9][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[@][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,4}$/', $_POST["emailRecuperarPassword"])){

				/*=============================================
				GENERAR CONTRASEÑA ALEATORIA
				=============================================*/

				function generarPassword($longitud){

					$password = "";
					$patron = "1234567890abcdefghijklmnopqrstuvwxyz";

					$max = strlen($patron)-1;

					for($i = 0; $i < $longitud; $i++){

						$password .= $patron[mt_rand(0,$max)];

					}

					return $password;

				}

				$nuevoPassword = generarPassword(11);

				$encriptar = crypt($nuevoPassword, '$2a$07$asxx54ahjppf45sd87a5a4dDDGsystemdev$');

				$tabla = "usuarios";
				$item = "email";
				$valor = $_POST["emailRecuperarPassword"];

				$traerUsuario = ModeloUsuarios::mdlMostrarUsuarios($tabla, $item, $valor);

				if($traerUsuario){

					$id = $traerUsuario["id_usuario"];
					$item = "password";
					$valor = $encriptar;

					$actualizarPassword = ModeloUsuarios::mdlActualizarUsuario($tabla, $id, $item, $valor);

					if($actualizarPassword  == "ok"){

						/*=============================================
						Verificación Correo Electrónico
						=============================================*/

						$ruta = ControladorRuta::ctrRuta();

						date_default_timezone_set("America/Bogota");

						$mail = new PHPMailer;

						$mail->Charset = "UTF-8";

						$mail->isMail();

						$mail->setFrom("admin@trading.com", "Admin Trading");

						$mail->addReplyTo("admin@trading.com", "Admin Trading");

						$mail->Subject  = "Solicitud nueva contraseña";

						$mail->addAddress($traerUsuario["email"]);

						$mail->msgHTML('<div style="width:100%; background:#eee; position:relative; font-family:sans-serif; padding-bottom:40px">
	
							<center>
								
								<img style="padding:20px; width:10%" src="'.$ruta.'vistas/img/logo.png">

							</center>

							<div style="position:relative; margin:auto; width:600px; background:white; padding:20px">
							
								<center>
								
								<img style="padding:20px; width:15%" src="'.$ruta.'vistas/img/email.png">

								<h3 style="font-weight:100; color:#999">SOLICITUD DE NUEVA CONTRASEÑA</h3>

								<hr style="border:1px solid #ccc; width:80%">

								<h4 style="font-weight:100; color:#999; padding:0 20px"><strong>Su nueva contraseña: </strong>'.$nuevoPassword.'</h4>

								<a href="'.$ruta.'ingreso" target="_blank" style="text-decoration:none">

								<div style="line-height:30px; background:#0aa; width:60%; padding:20px; color:white">			
									Haz click aquí
								</div>

								</a>

								<h4 style="font-weight:100; color:#999; padding:0 20px">Ingrese nuevamente al sitio con esta contraseña y recuerde cambiarla en el panel de perfil de usuario</h4>

								<br>

								<hr style="border:1px solid #ccc; width:80%">

								<h5 style="font-weight:100; color:#999">Si no se inscribió en esta cuenta, puede ignorar este correo electrónico.</h5>

								</center>

							</div>

						</div>');
								
						$envio = $mail->Send();

						if(!$envio){

							echo '<script>

								swal({

									type:"error",
									title: "¡ERROR!",
									text: "¡¡Ha ocurrido un problema enviando verificación de correo electrónico a '.$traerUsuario["email"].' '.$mail->ErrorInfo.', por favor inténtelo nuevamente",
									showConfirmButton: true,
									confirmButtonText: "Cerrar"

								}).then(function(result){

									if(result.value){

										history.back();

									}


								});	

							</script>';


						}else{


							echo '<script>

								swal({

									type:"success",
									title: "¡SU NUEVA CONTRASEÑA HA SIDO ENVIADA!",
									text: "¡Por favor revise la bandeja de entrada o la carpeta SPAM de su correo electrónico para tomar la nueva contraseña!",
									showConfirmButton: true,
									confirmButtonText: "Cerrar"

								}).then(function(result){

									if(result.value){

										window.location = "'.$ruta.'ingreso";

									}


								});	

							</script>';


						}
					
					}


				}else{

					echo '<script>

						swal({
							type:"error",
						  	title: "¡ERROR!",
						  	text: "¡El correo no existe en el sistema, puede registrase nuevamente con ese correo!",
						  	showConfirmButton: true,
							confirmButtonText: "Cerrar"
						  
						}).then(function(result){

								if(result.value){   
								    history.back();
								  } 
						});

					</script>';

				}

			}else{


				echo '<script>

					swal({

						type:"error",
						title: "¡CORREGIR!",
						text: "¡Error al escribir el correo!",
						showConfirmButton: true,
						confirmButtonText: "Cerrar"

					}).then(function(result){

						if(result.value){

							history.back();

						}

					});	

				</script>';

			}


		}


	}


	/*=============================================
	Actualizar nombre y número de télefono usuario
	=============================================*/

	public function ctrActualizarDatos(){

		if(isset($_POST["editarNombre"])){	

			if(preg_match('/^[-_a-zA-ZñÑáéíóúÁÉÍÓÚ0-9. ]+$/', $_POST["editarNombre"]) && preg_match('/^[0-9-() ]+$/', $_POST["editarMovil"])){

				$telefono = $_POST["indicativo"]." ".$_POST["editarMovil"];

				$tabla = "usuarios";
				$id = $_POST["idUsuario"];
				$item = "telefono_movil";
				$valor = $telefono;
				$item2 = "nombre";
				$valor2 = $_POST["editarNombre"];

				$respuesta = ModeloUsuarios::mdlActualizarDatos($tabla, $id, $item, $valor, $item2, $valor2);

				if($respuesta == "ok"){

					echo '<script>

						swal({
							type:"success",
						  	title: "¡CORRECTO!",
						  	text: "¡Los datos han sido actualizados!",
						  	showConfirmButton: true,
							confirmButtonText: "Cerrar"
						  
						}).then(function(result){

								if(result.value){   
								    history.back();
								  } 
						});

					</script>';


				}

			}else{

			 	echo '<script>

					swal({

						type:"error",
						title: "¡CORREGIR!",
						text: "¡No se permiten caracteres especiales!",
						showConfirmButton: true,
						confirmButtonText: "Cerrar"

					}).then(function(result){

						if(result.value){

							history.back();

						}

					});	

				</script>';

			 }


		}

	}

	/*=============================================
	Iniciar Suscripción
	=============================================*/

	static public function ctrIniciarSuscripcion($datos){

		$tabla = "usuarios";

		$respuesta = ModeloUsuarios::mdlIniciarSuscripcion($tabla, $datos);

		return $respuesta;

	}

	/*=============================================
	Cancelar Suscripción
	=============================================*/

	static public function ctrCancelarSuscripcion($valor){

		$tabla = "usuarios";

		$datos = array(	"id_usuario" => $valor,
						"estado" => 0,
						"ciclo_pago" => null,
						"firma" => null,
						"fecha_contrato" => null);


		$respuesta = ModeloUsuarios::mdlCancelarSuscripcion($tabla, $datos);

		return $respuesta;

	}

	// /*=============================================
	// registrar cuenta bancaria
	// =============================================*/

	// public function ctrRegistrarCuentaBancaria(){

	// 	$tabla = "cuentas_bancarias";

	// 	if(isset($_POST["idUsuarioCuentaRegistrar"])){

	// 		if(preg_match('/^[0-9]+$/', $_POST["registrarNumeroCuenta"])&&
	// 		preg_match('/^[a-zA-ZñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["registrarNombreTitular"])
	// 		 && preg_match('/^[0-9]+$/', $_POST["registrarNumeroTitular"]) &&
	// 		preg_match('/^[a-zA-ZñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["registrarEntidadCuenta"]) ){

	// 			$datos = array(	"titular" => $_POST["registrarNumeroTitular"],
	// 			"nombreTitular" => $_POST["registrarNombreTitular"],
	// 			"usuario" => $_POST["idUsuarioCuentaRegistrar"],
	// 			"estado" => 1,
	// 			"tipo" => $_POST["registrarTipoCuenta"],
	// 			"entidad" => $_POST["registrarEntidadCuenta"],
	// 			"numero" => $_POST["registrarNumeroCuenta"]);
				
				
	// 	$respuesta = ModeloUsuarios::mdlRegistrarCuentaBancaria($tabla, $datos);

	// 	if($respuesta == "ok"){
	// 		echo '<script>

	// 						swal({

	// 							type:"success",
	// 							title: "REGISTRO EXITOSO",
	// 							text: "¡SU CUENTA BANCARIA HA SIDO CREADA CORRECTAMENTE!",
	// 							showConfirmButton: true,
	// 							confirmButtonText: "Cerrar"

	// 						}).then(function(result){

	// 							if(result.value){

	// 								window.location = "cuentas-bancarias";

	// 							}


	// 						});	

	// 					</script>';
	// 	}

	// 			}
	// 		}



	// }



	/*=============================================
	Cambiar Patrocinador
	=============================================*/

	static public function ctrCambiarPatrocinador(){

		if(isset($_POST["cambioPatrocinador"])){

			if($_POST["cambioPatrocinador"] ==  $_POST["nuevoPatrocinador"] || $_POST["cambioPatrocinador"]==1){
				echo '<script>

							swal({

								type:"warning",
								title: "Atención",
								text: "¡Ha seleccionado erroneamente, vuelve a intentarlo!",
								showConfirmButton: true,
								confirmButtonText: "Cerrar"

							}).then(function(result){

								if(result.value){

									window.location = "cambiar-patrocinador";

								}


							});	

						</script>';
			}else{

			// $pasar_comisiones_padre = ControladorPagos::ctrPasarComisionesPadreArbol($_POST["cambioPatrocinador"], $_POST["nuevoPatrocinador"], 5);

			// $pasar_comisiones_hijo = ControladorPagos::ctrPasarComisionesHijoArbol($_POST["cambioPatrocinador"], $_POST["nuevoPatrocinador"], 5);

			//Registrar Comisiones solo del hijo al nuevo padre(patrocinador).
			// $prueba_registrar = ControladorPagos::ctrPruebaComisionesRegistrar($_POST["cambioPatrocinador"], $_POST["nuevoPatrocinador"]);

			//Eliminar comisiones antiguos patrocinadores hacia arriba en el árbol de acruerdo a los niveles.
			//$prueba_eliminar = ControladorPagos::ctrPruebaComisiones($_POST["cambioPatrocinador"], $_POST["nuevoPatrocinador"], 5, false);

			$niveles_arbol=5;
			$n=1;
			$padre=ControladorUsuarios::ctrMostrarUsuarios("id_usuario",$_POST["cambioPatrocinador"]);

			$prueba_bonos = ControladorPagos::ctrPruebaBonos($_POST["cambioPatrocinador"], $_POST["nuevoPatrocinador"]);

			while($n <= $niveles_arbol &&  $padre!=""){
            
				$prueba_eliminar = ControladorPagos::ctrPruebaComisiones($padre["id_usuario"], $_POST["nuevoPatrocinador"], 5);

				$hijo = ControladorUsuarios::ctrMostrarUsuarios("patrocinador",$padre["enlace_afiliado"]);

				$padre=$hijo;
				$n=$n+1;

			}

			$cambiar_patrocinador_binaria = ControladorPagos::ctrCambiarPatrocinadorBinaria($_POST["cambioPatrocinador"], $_POST["nuevoPatrocinador"]);

			$padre=ControladorUsuarios::ctrMostrarUsuarios("id_usuario",$_POST["cambioPatrocinador"]);

			$n=1;

			while($n <= $niveles_arbol &&  $padre!=""){
                
				$prueba_registrar = ControladorPagos::ctrPruebaRegistrarDespues($padre["id_usuario"], $_POST["nuevoPatrocinador"], 5);

				$hijo = ControladorUsuarios::ctrMostrarUsuarios("patrocinador",$padre["enlace_afiliado"]);

				$padre=$hijo;
				$n=$n+1;

			}

			// $prueba_registrar_comisiones = ControladorPagos::ctrPruebaComisionesRegistrarNuevosPatrocinadores($_POST["cambioPatrocinador"], $_POST["nuevoPatrocinador"], 5);

			// $cambiar_patrocinador="ok";

			if($cambiar_patrocinador_binaria=="ok"){

				echo '<script>

							swal({

								type:"success",
								title: "CAMBIO EXITOSO",
								text: "¡EL PATROCINADOR SE HA CAMBIADO CORRECTAMENTE!",
								showConfirmButton: true,
								confirmButtonText: "Cerrar"

							}).then(function(result){

								if(result.value){

									window.location = "cambiar-patrocinador";

								}


							});	

						</script>';

			}
		}
	
		}

	}


	



}

