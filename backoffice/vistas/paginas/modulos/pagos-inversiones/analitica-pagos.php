<?php


$total_a_pagar = 0;
$total_pagos = 0;
$pagos = ControladorPagos::ctrMostrarPagos(null,null);

foreach ($pagos as $key => $value) {

	$comprobante=ControladorComprobantes::ctrMostrarComprobantes("id",$value["id_comprobante"]);

	$campana=ControladorCampanas::ctrMostrarCampanas("id",$comprobante[0]["campana"]);

	$ganancia = ($comprobante[0]['valor']*$campana['retorno'])/100;
    $total = $comprobante[0]['valor']+$ganancia;

	if($value["estado"]==0){
		$total_a_pagar+=$total;
	}else{
		$total_pagos+=$total;
	}



}



?>

<div class="row">

	<div class="col-12 col-sm-6 col-lg-3">

		<div class="small-box bg-info">

			<div class="inner">

				<h3>$ <span><?php echo number_format($total_a_pagar); ?></span></h3>

				<p class="text-uppercase">Inversiones por pagar</p>

			</div>

			<div class="icon">

				<i class="fas fa-dollar-sign"></i>

			</div>

			<a href="pagos-inversiones" class="small-box-footer">Más información <i class="fa fa-arrow-circle-right"></i></a>

		</div>

	</div>

	<div class="col-12 col-sm-6 col-lg-3">

		<div class="small-box bg-purple">

			<div class="inner">

				<h3>$ <span><?php echo number_format($total_pagos); ?></span></h3>

				<p class="text-uppercase">Inversiones pagadas</p>

			</div>

			<div class="icon">

				<i class="fas fa-wallet"></i>

			</div>

			<a href="inversiones-pagadas" class="small-box-footer">Más información <i class="fa fa-arrow-circle-right"></i></a>
			
		</div>

	</div>



</div>

