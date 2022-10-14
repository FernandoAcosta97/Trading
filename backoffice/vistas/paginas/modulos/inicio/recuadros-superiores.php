<?php

/*=============================================
HISTÓRICO DE COMISIONES
=============================================*/

if ($usuario["enlace_afiliado"] != $patrocinador) {

    $pagos = ControladorMultinivel::ctrMostrarPagosRed("pagos_uninivel", "usuario_pago", $usuario["id_usuario"]);

} else {

    $pagos = ControladorMultinivel::ctrMostrarPagosRed("pagos_uninivel", null, null);

}

/*=============================================
TOTAL USUARIOS
=============================================*/
$totalUsuarios = 0;
$totalUsuarios = ControladorUsuarios::ctrTotalUsuarios();

/*=============================================
TOTAL COMISIONES
=============================================*/

$totalComisiones = 0;

foreach ($pagos as $key => $value) {

    if ($usuario["enlace_afiliado"] != $patrocinador || $value["periodo_comision"] == $value["periodo_venta"]) {

        $totalComisiones += $value["periodo_comision"];

    } else {

        $totalComisiones += $value["periodo_venta"] - $value["periodo_comision"];

    }

}

/*=============================================
CANTIDAD DE PERSONAS EN LA RED
=============================================*/

$totalUsuariosSinOperar = 0;
$totalUsuariosOperando = 0;

if ($usuario["estado"] != 0 && $usuario["firma"] != "") {

    $red = ControladorMultinivel::ctrMostrarRed("usuarios", "red_uninivel", "patrocinador_red", $usuario["enlace_afiliado"]);

    /*=============================================
    Limpiando el array de tipo Objeto de valores repetidos
    =============================================*/

    $resultado = array();

    foreach ($red as $value) {
        if ($value["perfil"] != "admin") {
            $resultado[$value["id_usuario"]] = $value;
        }

    }

    $red = array_values($resultado);

    /*=============================================
    TOTAL USUARIOS SIN OPERAR Y OPERANDO
    =============================================*/

    if ($usuario["perfil"] != "admin") {

        foreach ($red as $value) {
            if ($value["operando"] == 0) {
                ++$totalUsuariosSinOperar;
            }else{
				++$totalUsuariosOperando;
			}
		
        }
        // $totalUsuariosSinOperar = ControladorMultinivel::ctrMostrarRedOperandoTotal("usuarios", "red_uninivel", "patrocinador_red", $usuario["enlace_afiliado"], "operando", 0);

    } else {

        $res = ControladorUsuarios::ctrTotalUsuariosXfiltro("operando", "0");
        $totalUsuariosSinOperar = $res[0];

		$res2 = ControladorUsuarios::ctrTotalUsuariosXfiltro("operando", "1");
        $totalUsuariosOperando = $res2[0];
    }


} else {

    $red = array();
}

$totalRed = 0;
if ($usuario["firma"] != null) {
    $totalRed = count($red);
}

?>

<div class="row">

<?php if($usuario["perfil"]=="admin"){ ?>

	<div class="col-12 col-sm-6 col-lg-3">

		<!-- small box -->
		<div class="small-box bg-info">
			<div class="inner">
				<h3><?php echo number_format($totalUsuarios[0], 0, ",", "."); ?></h3>

				<p>Usuarios</p>
			</div>
			<div class="icon">
				<i class="fas fa-users"></i>
			</div>
			<a href="usuarios" class="small-box-footer">Más información <i class="fas fa-arrow-circle-right"></i></a>
		</div>
	</div>
	<!-- ./col -->
	<?php } ?>

	<div class="col-12 col-sm-6 col-lg-3">

		<!-- small box -->
		<div class="small-box bg-success">
			<div class="inner">
				<h3><?php echo $totalUsuariosOperando; ?></h3>

				<p>Operando</p>
			</div>
			<div class="icon">
				<i class="fas fa-users"></i>
			</div>
			<a href="ingresos-uninivel" class="small-box-footer">Más información <i class="fas fa-arrow-circle-right"></i></a>
		</div>
	</div>
	<!-- ./col -->

	<div class="col-12 col-sm-6 col-lg-3">

		<!-- small box -->
		<div class="small-box bg-danger">
			<div class="inner">
				<h3><?php echo $totalUsuariosSinOperar; ?></h3>

				<p>Sin Operar</p>
			</div>
			<div class="icon">
				<i class="fas fa-users"></i>
			</div>
			<a href="ingresos-uninivel" class="small-box-footer">Más información <i class="fas fa-arrow-circle-right"></i></a>
		</div>
	</div>
	<!-- ./col -->


	<div class="col-12 col-sm-6 col-lg-3">

<!-- small box -->
<div class="small-box bg-warning">
	<div class="inner">
		<h3><?php echo $totalUsuariosSinOperar; ?></h3>

		<p>Sin Contrato</p>
	</div>
	<div class="icon">
		<i class="fas fa-users"></i>
	</div>
	<a href="uninivel" class="small-box-footer">Más información <i class="fas fa-arrow-circle-right"></i></a>
</div>
</div>
<!-- ./col -->


	<div class="col-12 col-sm-6 col-lg-3">

		<!-- small box -->
		<div class="small-box bg-info">
			<div class="inner">
				<h3>$ <?php echo number_format($totalComisiones, 2, ",", "."); ?></h3>

				<p>Mis comisiones</p>
			</div>
			<div class="icon">
				<i class="fas fa-dollar-sign"></i>
			</div>
			<a href="ingresos-uninivel" class="small-box-footer">Más información <i class="fas fa-arrow-circle-right"></i></a>
		</div>
	</div>
	<!-- ./col -->

	<div class="col-12 col-sm-6 col-lg-3">
		<!-- small box -->
		<div class="small-box bg-purple">
			<div class="inner">
				<h3><?php echo $totalRed; ?></h3>

				<p>Mi red</p>
			</div>
			<div class="icon">
				<i class="fas fa-sitemap"></i>
			</div>
			<a href="uninivel" class="small-box-footer">Más información <i class="fas fa-arrow-circle-right"></i></a>
		</div>
	</div>
	<!-- ./col -->

	<div class="col-12 col-sm-6 col-lg-3">
		<!-- small box -->
		<div class="small-box bg-primary">
			<div class="inner">
				<h3>0</h3>

				<p>Mis tickets</p>
			</div>
			<div class="icon">
				<i class="fas fa-comments"></i>
			</div>
			<a href="soporte" class="small-box-footer">Más información <i class="fas fa-arrow-circle-right"></i></a>
		</div>
	</div>
	<!-- ./col -->

	<div class="col-12 col-sm-6 col-lg-3">
		<!-- small box -->
		<div class="small-box bg-red">
			<div class="inner">


				<?php if ($usuario["estado"] != 0): ?>

				<h3>Activo</h3>

				<p>------------------------</p>

			</div>

			<div class="icon">
				<i class="fas fa-user"></i>
			</div>

			<a href="perfil" class="small-box-footer">Perfil <i class="fas fa-arrow-circle-right"></i></a>

			<?php else: ?>

				<h3>Desactivado</h3>

        		<p class="text-uppercase">SIN OPERACIONES</p>

        	</div>

        	<div class="icon">
				<i class="fa-solid fa-arrow-down-right"></i>
			</div>

			<a href="perfil" class="small-box-footer">Operar ahora <i class="fa fa-arrow-circle-right"></i></a>

			<?php endif?>

		</div>
	</div>
	<!-- ./col -->

</div>