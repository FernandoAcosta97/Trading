<?php

require_once '../controladores/comprobantes.controlador.php';
require_once '../modelos/comprobantes.modelo.php';
require_once '../controladores/usuarios.controlador.php';
require_once '../modelos/usuarios.modelo.php';
require_once '../controladores/campanas.controlador.php';
require_once '../modelos/campanas.modelo.php';

class TablaComprobantes {

    public function mostrarTabla() {

        $item = null;
        $valor = null;
        $usuario = null;
        $fechaInicial = null;
        $fechaFinal = null;

        if(isset($_GET["doc_usuario"])){
            $item = "doc_usuario";
            $valor = $_GET["doc_usuario"];
            $usuario = ControladorUsuarios::ctrMostrarUsuarios($item, $valor);
            if($usuario["perfil"]=="admin"){
                $item = null;
                $valor = null;
                $usuario = null;
            }
        }

        if(isset($_GET["estado"])){

            if($_GET["estado"]==3){

                $comprobantes = ControladorComprobantes::ctrMostrarComprobantes( $item, $valor); 

            }else{
                
            $item2="estado";
            $valor2=$_GET["estado"];
            $comprobantes = ControladorComprobantes::ctrMostrarComprobantesxEstado( $item, $valor, $item2, $valor2); 

            }



        }else{
            $comprobantes = ControladorComprobantes::ctrMostrarComprobantes( $item, $valor); 
        }




  




        if ( count( $comprobantes ) < 1 ) {

            echo '{ "data":[]}';

            return;

        }

        $datosJson = '{"data":[';

        foreach ( $comprobantes as $key => $value ) {

            $campana = ControladorCampanas::ctrMostrarCampanas("id",$value["campana"]);

            //FOTO COMPROBANTES

            if ( $value[ 'foto' ] == '' ) {

                $foto = "<img src='vistas/img/comprobantes/default/default.jpg' class='img-thumbnail' width='60px'>";

            } else {

                $foto = "<img src='".$value[ 'foto' ]."' class='img-thumbnail fotoComprobante' width='60px' data-toggle='modal' data-target='#modalVerFotoComprobante'>";

            }

            if($usuario!=null){

                if($value["estado"]==1){
                    $estado = "<h5><span class='badge badge-success'>Aprobado</span></h5>";
                }else if($value["estado"]==0){
                    $estado = "<h5><span class='badge badge-danger'>Rechazado</span></h5>";
                }else if($value["estado"]==2){
                    $estado = "<h5><span class='badge badge-warning'>Pendiente</span></h5>";
                }

                $acciones="<button type='button' class='btn btn-primary btn-xs btnSoporte'><i class='fa fa-envelope'></i></button>";

            }else{
                //ESTADO COMPROBANTES
    
                if ( $value["estado"] == 1 ) {
    
                    $estado = "<select class='form-control selectAprobado' estadoComprobante=0 idComprobante='".$value["id"]."'><option value='1' selected>Aprobado</option><option value='0'>Rechazado</option><option value='2'>Pendiente</option></select>";
    
                } else if($value["estado"] == 0){
    
                    $estado = "<select class='form-control selectAprobado' estadoComprobante=1 idComprobante='".$value["id"]."'><option value='1'>Aprobado</option><option value='0' selected>Rechazado</option><option value='2'>Pendiente</option></select>";
    
                }else if($value["estado"] == 2){
    
                    $estado = "<select class='form-control selectAprobado' estadoComprobante=2 idComprobante='".$value["id"]."'><option value='1'>Aprobado</option><option value='0'>Rechazado</option><option value='2' selected>Pendiente</option></select>";
    
                }
                
            $acciones = "<div class='btn-group'><button class='btn btn-warning btn-xs btnEditarComprobante' idComprobante='".$value["id"]."' data-toggle='modal' data-target='#modalEditarComprobante'><i class='fa fa-pen' style='color:white'></i></button></div>";

            }

            $datosJson .= '[
                       "'.$acciones.'",
				       "'.$foto.'",
				       "'.$estado.'",
				       "$ '.number_format($value[ 'valor' ], 0, ",", ".").' COP",
					   "'.$value[ 'doc_usuario' ].'",
					   "'.$value[ 'fecha' ].'",
					   "'.$campana[ 'nombre' ].'"
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
