<?php

require_once "../controladores/cuentas.controlador.php";
require_once "../modelos/cuentas.modelo.php";

class TablaCuentas
{

    public function mostrarTabla()
    {

        $item = null;
        $valor = null;

        if (isset($_GET["titular"])) {
            $item = "titular";
            $valor = $_GET["titular"];
        }
        $cuentas = ControladorCuentas::ctrMostrarCuentas($item, $valor);

        if (count($cuentas) < 1) {

            echo '{ "data":[]}';

            return;

        }

        $datosJson = '{"data":[';

        foreach ($cuentas as $key => $value) {

            //ESTADO CUENTAS

            if ($value["estado"] == 0) {

                $estado = "<button type='button' class='btn btn-danger btn-sm btnActivar' idUsuarioCuenta='" . $value["titular"] . "' estadoCuentaUsuario='1'>Desactivada</button>";

            } else {

                $estado = "<button type='button' class='btn btn-success btn-sm btnActivar' idUsuarioCuenta='" . $value["titular"] . "' estadoCuentaUsuario='0'>Activada</button>";
            }

            $acciones = "<div class='btn-group'><button class='btn btn-warning btn-xs btnEditarCuenta' idUsuarioCuenta='" . $value["titular"] . "' data-toggle='modal' data-target='#modalEditarCuenta'><i class='fa fa-pen' style='color:white'></i></button></div>";

            $datosJson .= '[

					   "' . ($key + 1) . '",
					   "' . $value["numero"] . '",
				       "' . $value["entidad"] . '",
					   "' . $value["tipo"] . '",
					   "' . $estado . '",
					   "' . $value["fecha"] . '",
					   "' . $acciones . '"
				],';

        }

        $datosJson = substr($datosJson, 0, -1);

        $datosJson .= ']}';

        echo $datosJson;

    }
    // cierre metodo

}
// cierre clase

$activarTabla = new TablaCuentas();
$activarTabla->mostrarTabla();
