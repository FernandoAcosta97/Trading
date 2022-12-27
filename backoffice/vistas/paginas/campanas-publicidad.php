
<div class="content-wrapper" style="min-height: 1058.31px;">

  <!-- Content Header (Page header) -->
  <section class="content-header">

    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Campañas publicidad</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="inicio">Inicio</a></li>
            <li class="breadcrumb-item active">Campañas publicidad</li>
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

        <h3 class="card-title">Campañas publicidad registradas</h3>

        <?php if ($usuario["perfil"] == "admin"): ?>

        <div style="margin:1em auto auto auto">

            <button class="btn btn-primary" data-toggle="modal" data-target="#modalRegistrarCampana">Registrar Campaña</button>

        </div>

        <?php endif ?>

        <div class="card-tools">
          <button type="button" class="btn btn-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
          <i class="fas fa-minus"></i></button>
        </div>

      </div>

      <div class="card-body">


        <table id="tablaCampanasPublicidad" class="table table-striped table-bordered dt-responsive tablaCampanasPublicidad" width="100%">

          <thead>
            <tr>
              <th>Acciones</th>
              <th>Nombre</th>
              <th>Retorno</th>
              <th>Estado</th>
              <th>Cupos Disponibles</th>
              <th>Fecha Inicio</th>
              <th>Fecha Fin</th>
              <th>Fecha Retorno</th>
            </tr>
          </thead>
          <tbody>

          </tbody>
        </table>

        <input type="hidden" value="<?php echo $usuario["doc_usuario"]; ?>" id="doc_usuario">

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
EDITAR CAMPAÑA
======================================-->

<!-- The Modal -->
<div class="modal" id="modalEditarCampana">
  <div class="modal-dialog">
    <div class="modal-content">

    	<form method="post">

	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">Editar campaña publicitaria</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>

	      <!-- Modal body -->
	      <div class="modal-body">

        <input type="hidden" name="tipoCampanaEditar" value="3"></input>

	      	<input type="hidden" id="idCampana" name="idCampanaEditar">

          <!-- ENTRADA PARA EL NOMBRE-->
          <div class="form-group">

          <label for="editarNombre" class="control-label">Nombre</label>

          <div>

            <input type="text" class="form-control" id="editarNombre" name="editarNombre" required>

          </div>

          </div>

          
          <div class="form-group">

          <label for="editarRetorno" class="control-label">Retorno</label>

          <div>

          <input type="number" class="form-control" id="editarRetorno" name="editarRetorno" required>

          </div>

          </div>

          <div class="form-group">

            <label for="editarCupos" class="control-label">Cupos</label>

          <div>

            <input type="number" class="form-control" id="editarCupos" name="editarCupos" placeholder="Cupos campaña" required>

          </div>

          </div>

            <div class="form-group">

              <label for="editarFechaInicio" class="control-label">Fecha Inicio</label>

            <div class="input-group">

                <input type="datetime-local" name="editarFechaInicio" class="form-control" id="editarFechaInicio" required>

            </div>

            </div>


        <div class="form-group">

          <label for="editarFechaFinal" class="control-label">Fecha Final</label>

        <div class="input-group">

            <input type="datetime-local" name="editarFechaFinal" class="form-control" id="editarFechaFinal" required>

        </div>

        </div>

        <div class="form-group">

          <label for="editarFechaRetorno" class="control-label">Fecha Retorno</label>

          <div class="input-group">

            <input type="date" name="editarFechaRetorno" class="form-control" id="editarFechaRetorno" required>

          </div>

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

    $editarCampana = new ControladorCampanas();
    $editarCampana->ctrEditarCampana();

    ?>


      </form>

    </div>
  </div>
</div>





<!--=====================================
REGISTRAR CAMPAÑA
======================================-->

<!-- The Modal -->
<div class="modal" id="modalRegistrarCampana">
  <div class="modal-dialog">
    <div class="modal-content">

    	<form method="post">

	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">Registrar Campaña Publicitaria</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>

	      <!-- Modal body -->
	      <div class="modal-body">

        <div class="form-group">

        <input type="hidden" name="tipoCampana" value="3"></input>

              <!-- ENTRADA PARA EL NOMBRE-->
              <div class="form-group">

                <label for="registroNombreCampana" class="control-label">Nombre</label>

                <div>

                  <input type="text" class="form-control" id="registroNombreCampana" name="registroNombreCampana" placeholder="Nombre Campaña" required>

                </div>

              </div>


            <div class="form-group">

              <label for="registroRetorno" class="control-label">Retorno</label>

              <div>

              <input type="number" class="form-control" id="registroRetorno" name="registroRetorno" placeholder="Retorno publicidad" required>

              </div>

            </div>

              <div class="form-group">

                  <label for="registroCupos" class="control-label">Cupos</label>

                <div>

                  <input type="number" class="form-control" id="registroCupos" name="registroCupos" placeholder="Cupos campaña ej: 1000" required>

                </div>

              </div>

              <div class="form-group">

                  <label for="registroFechaInicio" class="control-label">Fecha Inicio</label>

                <div class="input-group">

                    <input type="datetime-local" name="registroFechaInicio" class="form-control" id="registroFechaInicio" required>

                </div>

              </div>



              <div class="form-group">

                  <label for="registroFechaFinal" class="control-label">Fecha Final</label>

                <div class="input-group">

                    <input type="datetime-local" name="registroFechaFinal" class="form-control" id="registroFechaFinal" required>

                </div>

              </div>

              <div class="form-group">

                <label for="registroFechaRetorno" class="control-label">Fecha Retorno</label>

                <div class="input-group">

                  <input type="date" name="registroFechaRetorno" class="form-control" id="registroFechaRetorno" required>

                </div>

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

    $registrarCampanas = new ControladorCampanas();
    $registrarCampanas->ctrRegistroCampana();

    ?>


      </form>

    </div>
  </div>
</div>
        </div>



<!--=====================================
REGISTRAR COMPROBANTE
======================================-->

<!-- The Modal -->
<div class="modal" id="modalRegistrarComprobante">
  <div class="modal-dialog">
    <div class="modal-content">

    	<form method="post" enctype="multipart/form-data">

	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">Cargar</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>

	      <!-- Modal body -->
	      <div class="modal-body">

        <input type="hidden" value="<?php echo $usuario["doc_usuario"]; ?>" name="doc_usuario">

        <input type="hidden" id="id_campana" name="id_campana">

              <div class="form-group">

                <label for="registrarEstado" class="control-label">Estado</label>

                <div>
                  <select class="form-control" id="registrarEstado" name="registrarEstado" readonly>

                      <option value="2">Pendiente</option>

                  </select>

                </div>

              </div>

      <!-- ENTRADA PARA LA FOTO DEL COMPROBANTE -->
      <div class="form-group">

				<input id="registrarFotoComprobante" type="file" class="form-control-file border registrarFotoComprobante" name="registrarFotoComprobante" required>

        <img id="previsualizarRegistrar" src="" class="img-thumbnail previsualizarRegistrar" width="100px">


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

      $registrarComprobantes = new ControladorComprobantes();
      $registrarComprobantes->ctrRegistrarComprobantes();

      ?>
      

      </form>

    </div>
  </div>
</div>