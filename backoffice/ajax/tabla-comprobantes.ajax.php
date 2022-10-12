<?php

require_once '../controladores/Comprobantes.controlador.php';
require_once '../modelos/Comprobantes.modelo.php';

class TablaComprobantes {

    public function mostrarTabla() {

        $item = null;
        $valor = null;

        if(isset($_GET["doc_usuario"])){
            $item = "doc_usuario";
            $valor = $_GET["doc_usuario"];
        }

        $comprobantes = ControladorComprobantes::ctrMostrarComprobantes( $item, $valor );

        if ( count( $comprobantes ) < 1 ) {

            echo '{ "data":[]}';

            return;

        }

        $datosJson = '{"data":[';

        foreach ( $comprobantes as $key => $value ) {

            //FOTO COMPROBANTES

            if ( $value[ 'foto' ] == '' ) {

                $foto = "<img src='vistas/img/comprobantes/default/default.jpg' class='img-thumbnail' width='60px'>";

            } else {

                $foto = "<img src='".$value[ 'foto' ]."' class='img-thumbnail' width='60px'>";

            }

            //ESTADO COMPROBANTES

            if ( $value[ 'estado' ] == 1 ) {

                $estado = "<select class='form-control selectAprobado' estadoComprobante=0 idComprobante='".$value["id"]."'><option value='aprobado' selected>Aprobado</option><option value='rechazado'>Rechazado</option></select>";

            } else {

                $estado = "<select class='form-control selectAprobado' estadoComprobante=1 idComprobante='".$value["id"]."'><option value='aprobado'>Aprobado</option><option value='rechazado' selected>Rechazado</option></select>";

            }

            $acciones = "<div class='btn-group'><button class='btn btn-warning btn-xs btnEditarComprobante' idComprobante='".$value["id"]."' data-toggle='modal' data-target='#modalEditarComprobante'><i class='fa fa-pen' style='color:white'></i></button></div>";

            $datosJson .= '[
					   "'.( $key+1 ).'",
					   "'.$value[ 'codigo' ].'",
				       "'.$foto.'",
				       "'.$estado.'",
				       "$ '.number_format($value[ 'valor' ], 0, ",", ".").'",
					   "'.$value[ 'doc_usuario' ].'",
					   "'.$value[ 'fecha' ].'",
					   "'.$value[ 'campaña' ].'",
					   "'.$acciones.'"
				],';

        }

        $datosJson = substr( $datosJson, 0, -1 );

        $datosJson .= ']}';

        echo $datosJson;

    }
    // cierre metodo

}
// cierre clase

$activarTabla = new TablaComprobantes();
$activarTabla -> mostrarTabla();
