<?php

require_once "controladores/reportes.controlador.php";

$reporte = new ControladorReportes();

if(isset($_GET["t"])){
    if($_GET["t"]=="usuarios"){
        
        $reporte -> ctrDescargarReporteExcelUsuarios();
    }
}

