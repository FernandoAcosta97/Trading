<?php 

if($usuario["perfil"] != "admin"){

  echo '<script>

  window.location = "'.$ruta.'backoffice/inicio";

  </script>';

  return;
}

$item = null;
$valor = null;
$usuarios = ControladorUsuarios::ctrMostrarusuarios($item, $valor);

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
              <th style="width:10px">#</th>
              <th>CC</th>
              <th>Nombre</th>
              <th>Email</th>
              <th>País</th>
              <th>Estado</th>
              <th>Operando</th>
              <th>Patrocinador</th>
              <th>Enlace Afiliado</th>
              <th>Acciones</th>
              <th>Telefono</th>
              <th>Última actualización</th>
            </tr>
          </thead>
          <tbody>

         <!--  <?php foreach ($usuarios as $key => $value): ?>

             <tr>
              <td><?php echo($key+1); ?></td>
              <td><img src="<?php echo $value["foto"]?>" class="img-fluid" width="30px"></td>
              <td><?php echo $value["nombre"]?></td>
              <td><?php echo $value["email"]?></td>
              <td><?php echo $value["pais"]?></td>
              <td><?php echo $value["suscripcion"]?></td>
              <td><?php echo $value["id_suscripcion"]?></td>
              <td><?php echo $value["ciclo_pago"]?></td>
              <td><?php echo $value["enlace_afiliado"]?></td>
              <td><?php echo $value["patrocinador"]?></td>
              <td><?php echo $value["paypal"]?></td>
              <td><?php echo $value["fecha"]?></td>
              <td><?php echo $value["vencimiento"]?></td>
            </tr>
            
          <?php endforeach ?> -->

           
          
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

                <label for="editarNombre" class="control-label">Nombre completo</label>

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
			$editarUsuario -> ctrEditarUsuario();

		?>


      </form>

    </div>
  </div>
</div>
