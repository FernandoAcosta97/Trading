<?php

if ($usuario["perfil"] != "admin") {

    echo '<script>

  window.location = "inicio";

  </script>';

    return;
}

if(!isset($_GET["id"])){

  echo '<script>
  
  window.location = "usuarios";
  
  </script>';
  
    return;
  
  }
  
  $usuario = ControladorUsuarios::ctrMostrarUsuarios("id_usuario",$_GET["id"]);


?>
<div class="content-wrapper" style="min-height: 1058.31px;">
  
  <!-- Content Header (Page header) -->
  <section class="content-header">
    
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Detalles de Usuario</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="inicio">Inicio</a></li>
            <li class="breadcrumb-item active">Detalles</li>
          </ol>
        </div>
      </div>
    </div><!-- /.container-fluid -->

  </section>

  <!-- Main content -->
  <section class="content">

    <div class="container-fluid">

      <div class="row">
        
        <?php

          include "modulos/detalles-usuario/info-usuario.php";

          include "modulos/detalles-usuario/tabla-cuentas-detalles.php";

          //  include "modulos/perfil/formulario-suscripcion.php";

           #include "modulos/perfil/material-promocion.php";

         ?>

     </div>

    </div>

  </section>
  <!-- /.content -->

</div>




<!--=====================================
Registar Cuenta
======================================-->

<!-- The Modal -->
<div class="modal" id="registrarCuenta">
  <div class="modal-dialog">
    <div class="modal-content">

    	<form method="post">

	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">Registrar cuenta</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>

	      <!-- Modal body -->
	      <div class="modal-body">

	      	<input type="hidden" name="idUsuarioCuentaRegistrar" value="<?php echo $usuario["id_usuario"] ?>">

			<div class="form-group">

      <label for="entidad">Número cuenta bancaria:</label>

				<input type="number" class="form-control" placeholder="Número cuenta" name="registrarNumeroCuenta" required>

			</div>

      <div class="form-group">

        <label for="nombreTitular">Nombre Titular:</label>

          <input type="text" class="form-control" id="nombreTitular" placeholder="Nombre titular" name="registrarNombreTitular" required>

        </div>

				<div class="form-group">

				<label for="titular">Documento Titular:</label>

				<input type="number" class="form-control" id="titular" placeholder="Número documento titular" name="registrarNumeroTitular" required>

			</div>

			<div class="form-group">

			<label for="entidad">Entidad:</label>

				<input type="text" class="form-control" id="entidad" placeholder="Entidad bancaria" name="registrarEntidadCuenta" required>

			</div>

			<div class="form-group">

				<label for="tipoCuenta">Tipo de Cuenta:</label>

				<select class="form-control" id="tipoCuenta" name="registrarTipoCuenta">

					<option value="">Seleccione tipo de cuenta</option>
					<option value="ahorros">Ahorros</option>
					<option value="corriente">Corriente</option>
					<option value="otro">Otro</option>

				</select>

			</div>

	      </div>

	      <!-- Modal footer -->
	      <div class="modal-footer d-flex justify-content-between">

	      	<div>

	        	<button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>

	        </div>

        	<div>

	        	<button type="submit" class="btn btn-primary">Enviar</button>

	        </div>

	      </div>

		<?php

			$registrarCuenta = new ControladorCuentas();
			$registrarCuenta->ctrRegistrarCuentaBancaria();

		?>


      </form>

    </div>
  </div>
</div>