
<!-- if($usuario["perfil"] != "admin"){

  echo '<script>

  window.location = "'.$ruta.'backoffice/inicio";

  </script>';

  return;
}

$item = null;
$valor = null;
$comprobantes = ControladorComprobantes::ctrMostrarComprobantes($item, $valor); -->


<div class="content-wrapper" style="min-height: 1058.31px;">

  <!-- Content Header (Page header) -->
  <section class="content-header">

    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Comprobantes</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="inicio">Inicio</a></li>
            <li class="breadcrumb-item active">Comprobantes</li>
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

        <h3 class="card-title">Comprobantes registrados</h3>

        <div class="card-tools">
          <button type="button" class="btn btn-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
          <i class="fas fa-minus"></i></button>
          <button type="button" class="btn btn-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
          <i class="fas fa-times"></i></button>
        </div>

      </div>

      <div class="card-body">

        <table id="tablaComprobantes" class="table table-striped table-bordered dt-responsive tablaComprobantes" width="100%">

          <thead>
            <tr>
              <th style="width:10px">#</th>
              <th>Codigo</th>
              <th>Foto</th>
              <th>Estado</th>
              <th>Valor</th>
              <th>Usuario</th>
              <th>Fecha</th>
              <th>Campaña</th>
              <th>Acciones</th>
            </tr>
          </thead>
          <tbody>

          </tbody>
        </table>

        <input type="hidden" value="<?php echo $usuario["doc_usuario"]; ?>" id="doc_usuario">

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
EDITAR COMPROBANTE
======================================-->

<!-- The Modal -->
<div class="modal" id="modalEditarComprobante">
  <div class="modal-dialog">
    <div class="modal-content">

    	<form method="post" enctype="multipart/form-data">

	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">Editar comprobante</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>

	      <!-- Modal body -->
	      <div class="modal-body">

	      	<input type="hidden" id="editarComprobante" name="editarComprobante">
          <input type="hidden" id="editarCodigoActual" name="editarCodigoActual">

              <!-- ENTRADA PARA EL CODIGO -->
              <div class="form-group">

                <label for="editarCodigo" class="control-label">Código</label>

                <div>

                  <input type="text" class="form-control" id="editarCodigo" name="editarCodigo" required>

                </div>

              </div>

              <div class="form-group">

                  <label for="editarValor" class="control-label">Valor</label>

                <div>

                  <input type="number" class="form-control" id="editarValor" name="editarValor" required>

                </div>

              </div>

              <div class="form-group">

                  <label for="editarFecha" class="control-label">Fecha</label>

                <div class="input-group">

                    <input type="date" name="editarFecha" class="form-control" id="editarFecha">

                </div>

              </div>

              <!-- <div class="form-group">

                <label for="editarPerfil" class="control-label">Perfil</label>

                <div>
                  <select class="form-control" id="editarPerfil" name="editarPerfil" readonly>

                      <option value="usuario">Usuario</option>

                  </select>

                </div>

              </div> -->

      <!-- ENTRADA PARA LA FOTO DEL COMPROBANTE -->
      <div class="form-group">

				<input id="editarFotoComprobante" type="file" class="form-control-file border editarFotoComprobante" name="editarFotoComprobante">

        <img id="previsualizarEditar" src="vistas/img/comprobantes/default/default.jpg" class="img-thumbnail previsualizarEditar" width="100px">

        <input type="hidden" id="fotoActualComprobante" name="fotoActualComprobante">

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

    $editarComprobantes = new ControladorComprobantes();
    $editarComprobantes->ctrEditarComprobantes();

    ?>


      </form>

    </div>
  </div>
</div>
