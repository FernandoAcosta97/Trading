<div class="back">		
     	</div> 
		
<div class="ladoUsuarios">

	<div class="container-fluid">

	<!-- <div class="fotoIngreso text-center">		
     	</div> -->
			
			<div class="formulario">

				<figure class="p-2 p-sm-5 p-lg-4 p-xl-5 text-center">
				
					<!-- <a href="<?php echo $ruta; ?>inicio"><img src="img/logo-positivo.png" class="img-fluid"></a> -->
					<div class="d-flex justify-content-center">
					<h2>SPORT BIT</h2>
                    </div>

					<div class="d-flex justify-content-center">
						<h4>Ingreso al sistema</h4>
					</div>

					<form method="post" class="mt-5">

						<p class="text-center py-3">Sistema de inversiones Colombia</p>

						<input type="email" class="form-control my-3 py-3" placeholder="Correo Electrónico" name="ingresoEmail" required>

						<input type="password" class="form-control my-3 py-3" placeholder="Contraseña" name="ingresoPassword" required>

						<?php 

							$ingreso = new ControladorUsuarios();
							$ingreso -> ctrIngresoUsuario();

						?>

						<input type="submit" class="form-control my-3 py-3 btn btn-success" value="Ingresar">

						<p class="text-center pt-1">¿Aún no tienes una cuenta? | <a href="<?php echo $ruta; ?>registro">Regístrate</a></p>

						<p class="text-center pt-1"><a href="#modalRecuperarPassword" data-toggle="modal" data-dismiss="modal">¿Olvidó su contraseña?</a></p>

					</form>

				</figure>

			</div>

	</div>

</div>

<!--=====================================
VENTANA MODAL RECUPERAR CONTRASEÑA
======================================-->

<div class="modal" id="modalRecuperarPassword">
	
	<div class="modal-dialog">

	    <div class="modal-content">

	    	<div class="modal-header bg-info text-white">

		        <h4 class="modal-title">Recuperar contraseña</h4>

		        <button type="button" class="close text-white" data-dismiss="modal">&times;</button>

		    </div>

			 <div class="modal-body">
			 	
				<form method="post">

					<p class="text-muted">Escriba su correo electrónico con el que está registrado y allí le enviaremos una nueva contraseña:</p>

					<div class="input-group mb-3">
						
						<div class="input-group-prepend">

					      <span class="input-group-text">
					      	
					      	<i class="far fa-envelope"></i>

					      </span>

					    </div>

					    <input type="email" class="form-control" placeholder="Email" name="emailRecuperarPassword" required>

					</div>

					<input type="submit" class="btn btn-dark btn-block" value="Enviar">

					<?php

						$recuperarPassword = new ControladorUsuarios();
						$recuperarPassword -> ctrRecuperarPassword();

					?>

				</form>

			 </div>

	    </div>

    </div>

</div>