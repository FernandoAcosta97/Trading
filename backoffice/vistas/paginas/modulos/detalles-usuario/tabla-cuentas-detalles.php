<?php 

$red = ControladorMultinivel::ctrMostrarRed("usuarios", "red_uninivel", "patrocinador_red",	$usuario["enlace_afiliado"]);

$cuentas = ControladorCuentas::ctrMostrarCuentasAll("usuario",$usuario["id_usuario"]);

           /*=============================================
			Limpinado el array de tipo Objeto de valores repetidos
			=============================================*/

			$resultado = array();

			foreach ($red as $value) {
				
				$resultado[$value["id_usuario"]]= $value;
				
			}

			$red = array_values($resultado);


$operando = 0;
$sinOperar = 0;

if(count($red) > 0){

	foreach ($red as $key => $value) {

		if($value["perfil"]!="admin"){
	
		if($value["operando"] == 1){

			++$operando;
		
		}else{

			++$sinOperar;

		}
	}
	}

}else{

	$operando = 0;
	$sinOperar = 0;

}


?>

<input type="hidden" value="<?php echo $usuario["enlace_afiliado"]?>" id="enlace_afiliado">

<div class="col-12 col-lg-7">

	<div class="card card-primary card-outline">

		<div class="card-header">
			
			<h5 class="m-0 float-left">Cuentas Bancarias</h5>

			<?php if ($usuario["enlace_afiliado"] != $patrocinador): ?>

			<h5 class="float-right">Patrocinador: 
				<span class="badge badge-secondary"><?php echo $usuario["patrocinador"]; ?></span>
			</h5>
				
			<?php endif ?>		

		</div>

		
        <div style="margin:1em auto auto auto">

            <button class="btn btn-primary" data-toggle="modal" data-target="#registrarCuenta">Registrar Cuenta</button>

        </div>

		<div class="card-body">

			<table class="table table-bordered table-striped dt-responsive tablaCuentasDetalles" width="100%">
				
				<thead>

					<tr>
						<th>Acciones</th>
						<th>Número</th>			   
						<th>Titular</th>					
						<th>Estado</th>
						<th>Entidad</th>
						<th>Fecha</th>

					</tr>   

				</thead>

				<tbody>

				<?php 

				if(is_array($cuentas) && count($cuentas)>0){

					foreach ($cuentas as $key => $value) {

					if ( $value["estado"] == 1 ) {
    
						$estado = "<select class='form-control selectAprobado' idCuenta='".$value["id"]."'><option value='1' selected>Aprobada</option><option value='0'>Rechazada</option><option value='2'>Pendiente</option></select>";
		
					} else if($value["estado"] == 0){
		
						$estado = "<select class='form-control selectAprobado' idCuenta='".$value["id"]."'><option value='1'>Aprobada</option><option value='0' selected>Rechazada</option><option value='2'>Pendiente</option></select>";
		
					}else if($value["estado"] == 2){
		
						$estado = "<select class='form-control selectAprobado' idCuenta='".$value["id"]."'><option value='1'>Aprobada</option><option value='0'>Rechazada</option><option value='2' selected>Pendiente</option></select>";
		
					}

					$acciones = "<div class='btn-group'><button class='btn btn-warning btn-xs btnEditarCuenta' idCuenta= '" . $value["id"] . "' idUsuarioCuenta='" . $value["titular"] . "' data-toggle='modal' data-target='#modalEditarCuenta'><i class='fa fa-pen' style='color:white'></i></button><button class='btn btn-danger btn-xs btnEliminarCuenta' idCuenta='".$value["id"]."'><i class='fa fa-times' style='color:white'></i></button></div>";


					echo '<tr>
					
						<td>'.$acciones.'</td> 
						<td>'.$value["numero"].'</td> 
						<td>'.$value["titular"].'</td> 
						<td>'.$estado.'</td> 		  
						<td>'.$value["entidad"].'</td>		
						<td>'.$value["fecha"].'</td>	

					</tr>';
				}
			}

					
				 ?>

				</tbody>

			</table>

			<input type="hidden" id="#id_usuario_detalles" value="<?php echo $usuario["id_usuario"] ?>">

		</div>

	</div>

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
