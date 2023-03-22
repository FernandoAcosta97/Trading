<?php

require_once "controladores/pagos.controlador.php";
require_once "modelos/pagos.modelo.php";

$reporte = new ControladorPagos();
$reporte -> ctrDescargarReportePagosBienvenida();

echo "<script> window.location.reload(); </script>";
