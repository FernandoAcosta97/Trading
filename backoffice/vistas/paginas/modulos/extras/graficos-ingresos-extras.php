<?php

$pagos = ControladorPagos::ctrMostrarPagosExtrasxEstadoAll("id_usuario", $usuario["id_usuario"],"estado",1);
$total_pagos=0;

if($pagos!=""){

foreach ($pagos as $key => $value) {

	$bonos = ControladorPagos::ctrMostrarBonosExtrasAll("id_pago_extra", $value["id"]);

		$total_pagos+=$value["valor"];	
}
}

?>

<div class="card card-primary card-outline">
	
	<div class="card-header">	

		<h3 class="pl-3 pt-3">
			
			<i class="fas fa-chart-pie mr-1"></i>

			Bonos Extras Liquidados: COP$ <?php echo number_format($total_pagos); ?>

		</h3>


	</div>

	<div class="card-body">	
	
		<div class="tab-content p-0">
			
			<div class="chart tab-pane active" id="revenue-chart" style="position: relative; height: 300px;"></div>

			<div class="chart tab-pane" id="sales-chart" style="position: relative; height: 300px;"></div>

		</div>

	</div>


</div>

<script>
	

var area = new Morris.Area({
element   : 'revenue-chart',
resize    : true,
data      : [

<?php

	foreach ($pagos as $key => $value) {

		$bonos = ControladorPagos::ctrMostrarBonosExtrasAll("id_pago_extra", $value["id"]);

		foreach ($bonos as $key2 => $value2) {

			$campana=ControladorCampanas::ctrMostrarCampanas("id", $value2["id_campana"]);	

			echo "{y: '".substr($value["fecha"],0,-9)."', item1: ".$campana["retorno"]."},";	
		}	
		
	}

  ?>


],
xkey      : 'y',
ykeys     : ['item1'],
labels    : ['Bonos'],
lineColors: ['#17a2b8', '#727cb6'],
hideHover : 'auto'

})


</script>