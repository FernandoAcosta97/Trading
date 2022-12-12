<input type="hidden" value="<?php echo $usuario["enlace_afiliado"]?>" id="enlace_afiliado">

<div class="col-12 col-lg-7">

	<div class="card card-primary card-outline">

		<div class="card-header">
			
			<h5 class="m-0 float-left">Últimos usuarios registrados</h5>

			<!-- <?php if ($usuario["enlace_afiliado"] != $patrocinador): ?> -->

			<!-- <h5 class="float-right">Patrocinador: 
				<span class="badge badge-secondary"><?php echo $usuario["patrocinador"]; ?></span>
			</h5> -->
				
			<!-- <?php endif ?>		 -->

		</div>

		<div class="card-body">

			<table class="table table-bordered table-striped dt-responsive tablaUltimosUsuarios" width="100%">
				
				<thead>

					<tr>

						<th style="width:10px">#</th> 
						<th>Foto</th>
						<th>Usuario</th>	
						<th>Nombre</th>				   
						<th>Pais</th>					
						<th>Fecha Contrato</th>
						<th>Estado</th>

					</tr>   

				</thead>

				<tbody>
					
					<!-- <tr>
					
						<td>1</td> 
						<td><img src="vistas/img/usuarios/default/default.png" class="img-fluid" width="30px"></td> 
						<td>Jaime Carrillo</td>			  
						<td>Colombia</td>			
						<td>2019-07-06</td>
						<td><h5><span class="badge badge-success">Activada</span></h5></td>

					</tr> -->

				</tbody>

			</table>

		</div>

	</div>

</div>