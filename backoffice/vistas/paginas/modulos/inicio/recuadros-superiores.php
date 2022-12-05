<?php

/*=============================================
HISTÓRICO DE COMISIONES
=============================================*/

$pagos = ControladorPagos::ctrMostrarPagosComisionesxEstadoAll("id_usuario", $usuario["id_usuario"], "estado", 1);

$pagosInversiones = ControladorPagos::ctrMostrarPagosInversionesxUsuario("doc_usuario", $usuario["doc_usuario"], "estado", 1);


$pagosExtras = ControladorPagos::ctrMostrarPagosExtrasxEstadoAll("id_usuario", $usuario["id_usuario"], "estado", 1);



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

        $totalComisiones += $value["valor"];

}

/*=============================================
TOTAL INVERSIONES
=============================================*/

$totalInversiones = 0;

foreach ($pagosInversiones as $key => $value) {

		$campana = ControladorCampanas::ctrMostrarCampanas("id", $value["campana"]);
		$ganancia = ($value["valor"]*$campana["retorno"])/100;
		$totalInversiones+=$value["valor"]+$ganancia;

}


/*=============================================
TOTAL BONOS EXTRAS
=============================================*/

$totalBonos = 0;

foreach ($pagosExtras as $key => $value) {

        $totalBonos += $value["valor"];

}

/*=============================================
CANTIDAD DE PERSONAS EN LA RED
=============================================*/

$totalUsuariosSinOperar = 0;
$totalUsuariosOperando = 0;
$totalSinContrato=0;

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
			if($value["firma"]== null){
				++$totalSinContrato;
			}
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

		$res3 = ControladorUsuarios::ctrTotalUsuariosXfiltro("firma", null);
		$totalSinContrato = $res3[0];

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
			<a href="index.php?pagina=usuarios&filtro=operando" class="small-box-footer">Más información <i class="fas fa-arrow-circle-right"></i></a>
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
			<a href="index.php?pagina=usuarios&filtro=sin-operar" class="small-box-footer">Más información <i class="fas fa-arrow-circle-right"></i></a>
		</div>
	</div>
	<!-- ./col -->
	<?php } ?>


	<!-- <div class="col-12 col-sm-6 col-lg-3"> -->

<!-- small box -->
<!-- <div class="small-box bg-warning">
	<div class="inner">
		<h3><?php echo $totalSinContrato; ?></h3>

		<p>Sin Contrato</p>
	</div>
	<div class="icon">
		<i class="fas fa-users"></i>
	</div>
	<a href="uninivel" class="small-box-footer">Más información <i class="fas fa-arrow-circle-right"></i></a>
</div>
</div> -->
<!-- ./col -->
<?php
$comprobantes = ControladorComprobantes::ctrMostrarComprobantesxEstado("doc_usuario",$usuario["doc_usuario"],"estado","1");

$ticketRecibidos = ControladorSoporte::ctrMostrarTickets("receptor", $usuario["id_usuario"]);
?>

<?php if($usuario["perfil"]!="admin"):
if ($usuario["operando"] == 1):?>

<div class="col-12 col-sm-6 col-lg-3">
	<!-- small box -->
	<div class="small-box bg-success">
		<div class="inner">


			<h3>OPERANDO</h3>

			<p>------------------------</p>

		</div>

		<div class="icon">
			<i class="fas fa-user"></i>
		</div>

		<a href="campanas" class="small-box-footer">CAMPAÑAS <i class="fas fa-arrow-circle-right"></i></a>

	</div>
</div>
<!-- ./col -->

<?php else: ?>

	<div class="col-12 col-sm-6 col-lg-3">
	<!-- small box -->
	<div class="small-box bg-red">
		<div class="inner">


			<h3>SIN OPERAR</h3>

			<p>------------------------</p>

		</div>

		<div class="icon">
			<i class="fas fa-user"></i>
		</div>

		<a href="campanas" class="small-box-footer">INVERTIR <i class="fas fa-arrow-circle-right"></i></a>

	</div>
</div>
<!-- ./col -->

<?php endif?>
<?php endif?>

<?php if($usuario["perfil"]!="admin"): ?>

	<div class="col-12 col-sm-6 col-lg-3">

		<!-- small box -->
		<div class="small-box bg-info">
			<div class="inner">
				<h3>$ <?php echo number_format($totalComisiones); ?></h3>

				<p>Mis comisiones</p>
			</div>
			<div class="icon">
				<i class="fas fa-dollar-sign"></i>
			</div>
			<a href="ingresos-binaria" class="small-box-footer">Más información <i class="fas fa-arrow-circle-right"></i></a>
		</div>
	</div>
	<!-- ./col -->


	<div class="col-12 col-sm-6 col-lg-3">

<!-- small box -->
<div class="small-box bg-info">
	<div class="inner">
		<h3>$ <?php echo number_format($totalInversiones); ?></h3>

		<p>Mis inversiones</p>
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
<div class="small-box bg-info">
	<div class="inner">
		<h3>$ <?php echo number_format($totalBonos); ?></h3>

		<p>Mis bonos extras</p>
	</div>
	<div class="icon">
		<i class="fas fa-dollar-sign"></i>
	</div>
	<a href="ingresos-binaria" class="small-box-footer">Más información <i class="fas fa-arrow-circle-right"></i></a>
</div>
</div>
<!-- ./col -->

	<?php  endif ?>

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
				<h3><?php echo count($ticketRecibidos);?></h3>

				<p>Mis tickets</p>
			</div>
			<div class="icon">
				<i class="fas fa-comments"></i>
			</div>
			<a href="soporte" class="small-box-footer">Más información <i class="fas fa-arrow-circle-right"></i></a>
		</div>
	</div>
	<!-- ./col -->

	

</div>