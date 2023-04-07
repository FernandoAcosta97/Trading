<?php

require_once "controladores/cuentas.controlador.php";
require_once "modelos/cuentas.modelo.php";

$reporte = new ControladorCuentas();
$reporte -> ctrDescargarReporte();
