<?php

$item = "titular";
$valor = $usuario["doc_usuario"];
$cuentas = ControladorCuentas::ctrMostrarCuentas($item, $valor);

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

  </section>

  <!-- Main content -->
  <section class="content">

    <!-- Default box -->
    <div class="card">

      <div class="card-header">

        <h3 class="card-title">Cuentas bancarias registradas</h3>

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
              <th width="10px">#</th>
              <th>Número</th>
              <th>Entidad</th>
              <th>Tipo</th>
              <th>Estado</th>
              <th>Fecha</th>
              <th>Acciones</th>
            </tr>
          </thead>
          <tbody>


          </tbody>
        </table>

        <input type="hidden" value="<?php echo $usuario["doc_usuario"]; ?>" id="titular">

      </div>
      <!-- /.card-body -->

      <div class="card-footer">
        Footer
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