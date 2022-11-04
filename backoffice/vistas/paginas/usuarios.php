<?php

if ($usuario["perfil"] != "admin") {

    echo '<script>

  window.location = "inicio";

  </script>';

    return;
}

?>


<div class="content-wrapper" style="min-height: 1058.31px;">

  <!-- Content Header (Page header) -->
  <section class="content-header">

    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Usuarios</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="inicio">Inicio</a></li>
            <li class="breadcrumb-item active">Usuarios</li>
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

        <h3 class="card-title">Usuarios registrados</h3>

        <div style="margin:1em auto auto auto">

				<button class="btn btn-primary" data-toggle="modal" data-target="#modalRegistroUsuarioManual">Registrar Usuario</button>

			  </div>

          <label for="selectFiltro" class="control-label" style="margin:1em">FILTRO</label>

          <div style="width:50%">
            <select class="form-control form-select" id="selectFiltro">

            <?php if(isset($_GET["estado"]) && ($_GET["estado"]==1 || $_GET["estado"]==0)){ 
             
              if($_GET["estado"]==1){ ?>

                <option value="tabla-usuarios">TODOS</option>
                <option value="tabla-usuarios-operando" selected>OPERANDO</option>
                <option value="tabla-usuarios-sin-operar">SIN OPERAR</option>
                <option value="tabla-usuarios-referidos">CON REFERIDOS</option>
                <option value="tabla-usuarios-sin-referidos">SIN REFERIDOS</option>

             <?php }else{ ?>

                <option value="tabla-usuarios">TODOS</option>
                <option value="tabla-usuarios-operando">OPERANDO</option>
                <option value="tabla-usuarios-sin-operar" selected>SIN OPERAR</option>
                <option value="tabla-usuarios-referidos">CON REFERIDOS</option>
                <option value="tabla-usuarios-sin-referidos">SIN REFERIDOS</option>

              <?php }
              
              }else{ ?>

              <option value="tabla-usuarios" selected>TODOS</option>
              <option value="tabla-usuarios-operando">OPERANDO</option>
              <option value="tabla-usuarios-sin-operar">SIN OPERAR</option>
              <option value="tabla-usuarios-referidos">CON REFERIDOS</option>
              <option value="tabla-usuarios-sin-referidos">SIN REFERIDOS</option>

              <?php } ?>

            </select>

          </div>


        <div class="card-tools">
          <button type="button" class="btn btn-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
          <i class="fas fa-minus"></i></button>
          <button type="button" class="btn btn-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
          <i class="fas fa-times"></i></button>
        </div>

      </div>

      <div class="card-body">


        <table id="tablaUsuarios" class="table table-striped table-bordered dt-responsive tablaUsuarios" width="100%">

          <thead>
            <tr>
              <!-- <th style="width:10px">#</th> -->
              <th>Acciones</th>
              <th>CC</th>
              <th>Nombre</th>
              <th>Email</th>
              <th>País</th>
              <th>Estado</th>
              <th>Operando</th>
              <th>Afiliados activos</th>
              <th>Patrocinador</th>
              <th>Enlace Afiliado</th>
              <th>Telefono</th>
              <th>Última actualización</th>
            </tr>
          </thead>
          <tbody>



          </tbody>
        </table>

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
EDITAR USUARIO
======================================-->

<!-- The Modal -->
<div class="modal" id="modalEditarUsuario">
  <div class="modal-dialog">
    <div class="modal-content">

    	<form method="post">

	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">Editar usuario</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>

	      <!-- Modal body -->
	      <div class="modal-body">

	      	<input type="hidden" id="editarUsuario" name="editarUsuario">

              <!-- ENTRADA PARA EL NOMBRE -->
              <div class="form-group">

                <label for="editarNombre" class="control-label">Usuario</label>

                <div>

                  <input type="text" class="form-control" id="editarNombre" name="editarNombre" required>

                </div>

              </div>

              <div class="form-group">

                  <label for="editarEmail" class="control-label">Correo electrónico</label>

                <div>

                  <input type="email" class="form-control" id="editarEmail" name="editarEmail" required>

                </div>

              </div>

              <div class="form-group">

                  <label for="editarMovil" class="control-label">Teléfono Móvil</label>

                <div class="input-group">

                      <div class="input-group-prepend">
                        <span class="p-2 bg-info rounded-left dialCode"></span>
                          </div>

                        <input type="text" name="editarMovil" class="form-control" id="editarMovil" data-inputmask="'mask':'(999) 999-9999'" data-mask>

                </div>

              </div>

              <div class="form-group">

                <label for="editarPerfil" class="control-label">Perfil</label>

                <div>
                  <select class="form-control" id="editarPerfil" name="editarPerfil" readonly>

                      <!-- <option value="">Seleccione un pefil</option> -->
                      <option value="usuario">Usuario</option>
                      <!-- <option value="especial">Especial</option> -->

                  </select>

                </div>

              </div>

			<div class="form-group">

				<input type="password" class="form-control" placeholder="Nueva contraseña" name="editarPassword">

        <input type="hidden" id="passwordActual" name="passwordActual">

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

$editarUsuario = new ControladorUsuarios();
$editarUsuario->ctrEditarUsuario();

?>


      </form>

    </div>
  </div>
</div>





<?php $ruta = ControladorGeneral::ctrRuta();?>
<!--=====================================
REGISTRO USUARIO MANUAL
======================================-->

<!-- The Modal -->
<div class="modal" id="modalRegistroUsuarioManual">
  <div class="modal-dialog">
    <div class="modal-content">

    	<form method="post">

	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">Registrar Usuario</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>

	      <!-- Modal body -->
	      <div class="modal-body">



	<div class="card card-primary card-outline">

		<div class="card-header">


		</div>

		<div class="card-body">

			<div class="form-group">

             <label for="inputDoc" class="control-label">Numero documento</label>

              <div>

	               <input type="number" class="form-control" id="inputDoc" name="registroDoc" required>

              </div>

            </div>

			<div class="form-group">

				<label for="inputName" class="control-label">Nombre completo</label>

				<div>

					<input type="text" class="form-control" id="inputName" name="registroNombre">

				</div>

			</div>

			<div class="form-group">

				<label for="inputEmail" class="control-label">Correo electrónico</label>

				<div>

					<input type="text" class="form-control" id="inputEmail" name="registroEmail">

				</div>

			</div>

			<div class="form-group">

				<label for="inputPatrocinador" class="control-label">Patrocinador</label>

				<div>

					<input type="text" class="form-control" id="inputPatrocinador" name="registroPatrocinador" value="<?php echo $usuario["enlace_afiliado"] ?>" readonly>

				</div>

			</div>


			<div class="form-group">

				<label for="inputPais" class="control-label">País</label>

				<div>
					<select class="form-control select2 py-4" id="inputPais" name="registroPais">

						<option value="">Seleccione su país</option>

					</select>

				</div>

			</div>



			<div class="form-group">

				<label for="inputMovil" class="control-label">Teléfono Móvil</label>

				<div class="input-group">

					<div class="input-group-prepend">
						<span class="p-2 bg-info rounded-left dialCode"></span>
					</div>

					<input type="text" class="form-control" id="inputMovil" name="registroTelefono" data-inputmask="'mask':'(999) 999-9999'" data-mask>

				</div>

			</div>


      <div class="form-group">

        <label for="inputPassword" class="control-label">Contraseña</label>

        <div>

          <input type="password" class="form-control" id="inputPassword" name="registroPassword" required>

        </div>

      </div>

			<div class="form-group">
				<div class="col-sm-offset-2">
					<button type="submit" class="btn btn-dark registroManual">Enviar</button>
				</div>
			</div>
<?php
      $registroUsuarioManual = new ControladorUsuarios();
      $registroUsuarioManual->ctrRegistroUsuarioManual();

?>

</form>
		</div>

	</div>


<!-- Modal footer -->
<div class="modal-footer d-flex justify-content-between">

<div>

  <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>

</div>


</div>