<?php

$item = "usuario";
$valor = $usuario["id_usuario"];
$cuentas = ControladorCuentas::ctrMostrarCuentasAll($item, $valor);

?>
<div class="content-wrapper" style="min-height: 1058.31px;">

  <!-- Content Header (Page header) -->
  <section class="content-header">

    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Cuentas</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="inicio">Inicio</a></li>
            <li class="breadcrumb-item active">Cuentas</li>
          </ol>
        </div>
      </div>
    </div><!-- /.container-fluid -->

    <?php
    if(count($cuentas)==0){
    echo '<div class="alert alert-warning alert-dismissible">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
    <h5><i class="icon fas fa-exclamation-triangle"></i> Atención!</h5>
    Recuerda que para recibir tu rendimiento necesitas tener registrada una cuenta bancaria, porfavor registre una en el boton registrar cuenta.
    </div>';
    }
    ?>

  </section>

  <!-- Main content -->
  <section class="content">

    <!-- Default box -->
    <div class="card">

      <div class="card-header">

        <h3 class="card-title">Cuentas bancarias registradas</h3>

        <?php if($usuario["perfil"]!="admin" && !$cuentas):?>

        <div style="margin:1em auto auto auto">

            <button class="btn btn-primary" data-toggle="modal" data-target="#registrarCuenta">Registrar Cuenta</button>

        </div>

        <?php endif ?>

        <div class="card-tools">
          <button type="button" class="btn btn-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
            <i class="fas fa-minus"></i></button>
          <button type="button" class="btn btn-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
            <i class="fas fa-times"></i></button>
        </div>

      </div>

      <div class="card-body">

        <table class="table table-striped table-bordered dt-responsive tablaCuentas" width="100%">

          <thead>
            <tr>
              <th>Acciones</th>
              <th>Número</th>
              <th>Usuario</th>
              <th>C.C.</th>
              <th>Titular</th>
              <th>Estado</th>
              <th>Entidad</th>
              <th>Tipo</th>
              <th>Fecha</th>
            </tr>
          </thead>
          <tbody>


          </tbody>
        </table>

        <input type="hidden" value="<?php echo $usuario["id_usuario"]; ?>" id="id_usuario">

      </div>
      <!-- /.card-body -->

      <div class="card-footer">
   
      </div>
      <!-- /.card-footer-->

    </div>
    <!-- /.card -->

  </section>
  <!-- /.content -->

</div>



<!--=====================================
EDITAR CUENTA
======================================-->

<!-- The Modal -->
<div class="modal" id="modalEditarCuenta">
  <div class="modal-dialog">
    <div class="modal-content">

    	<form method="post">

	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">Editar cuenta</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>

	      <!-- Modal body -->
	      <div class="modal-body">

              <!-- ENTRADA PARA EL NUMERO -->
              <div class="form-group">

                <label for="editarNumero" class="control-label">Número</label>

                <div>
  
                  <input type="text" class="form-control" id="editarNumero" name="editarNumero" required>

                  <input type="hidden" id="idCuenta" name="idCuenta">

                </div>

              </div>

          <div class="form-group">

          <label for="editarEntidad">Entidad:</label>

				    <input type="text" class="form-control" id="editarEntidad" name="editarEntidad" required>

			    </div>

			    <div class="form-group">

              <label for="editarTipo">Tipo de Cuenta:</label>

              <select class="form-control" id="editarTipo" name="editarTipo">

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

			$editarCuenta = new ControladorCuentas();
			$editarCuenta -> ctrEditarCuenta();

		?>


      </form>

    </div>
  </div>
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