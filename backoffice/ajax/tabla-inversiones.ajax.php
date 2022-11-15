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
        $retorno = 0;

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


        if(isset($_GET["inicio"]) && isset($_GET["fin"])){

                $fechaInicial=$_GET["inicio"];
                $fechaFinal=$_GET["fin"];
                $item2 = "estado";
                $valor2 = 1;
    
                $comprobantes = ControladorComprobantes::ctrMostrarComprobantesxEstadoyFecha( $item, $valor, $item2, $valor2, $fechaInicial, $fechaFinal);
            
        }else{

            $item2 = "estado";
            $valor2 = 1;

            $comprobantes = ControladorComprobantes::ctrMostrarComprobantesxEstadoyFecha( $item, $valor, $item2, $valor2, null, null);

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

                if($value["estado"]==1 && $campana["estado"]==2){
                    $estado = "<h5><span class='badge badge-success'>Aprobado</span><br><span class='badge badge-warning'>Campaña finalizada</span></h5>";
                }else if($value["estado"]==1){
                    $estado = "<h5><span class='badge badge-success'>Aprobado</span></h5>";
                }
                
                $acciones="<button type='button' class='btn btn-primary btn-xs btnSoporte'><i class='fa fa-envelope'></i></button>";

            }

            $ganancia = ($value['valor']*$campana['retorno'])/100;
            $retorno = $value['valor']+$ganancia;

            $datosJson .= '[
                       "'.$acciones.'",
				       "'.$foto.'",
				       "'.$estado.'",
				       "$ '.number_format($value[ 'valor' ], 0, ",", ".").' COP",
					   "'.$value[ 'fecha' ].'",
                       "$ '.number_format($ganancia, 0, ",", ".").' COP",
                       "$ '.number_format($retorno, 0, ",", ".").' COP",
                       "'.$campana[ 'fecha_fin' ].'",
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
