<?php

require_once "../controladores/general.controlador.php";
require_once "../controladores/usuarios.controlador.php";
require_once "../modelos/usuarios.modelo.php";
require_once "../controladores/multinivel.controlador.php";
require_once "../modelos/multinivel.modelo.php";

class AjaxUsuarios
{

    /*=============================================
    Validar email existente
    =============================================*/

    public $validarEmail;

    public function ajaxValidarEmail()
    {

        $item = "email";
        $valor = $this->validarEmail;

        $respuesta = ControladorUsuarios::ctrMostrarUsuarios($item, $valor);

        echo json_encode($respuesta);

    }

    /*=============================================
    ACTIVAR USUARIO
    =============================================*/

    public $activarUsuario;
    public $activarId;

    public function ajaxActivarUsuario()
    {

        $tabla = "usuarios";

        $item = "estado";
        $valor = $this->activarUsuario;

        $id = $this->activarId;

        $respuesta = ModeloUsuarios::mdlActualizarUsuario($tabla, $id, $item, $valor);

    }

    /*=============================================
    OPERAR USUARIO
    =============================================*/

    public $operarUsuario;
    public $operarId;

    public function ajaxOperarUsuario()
    {

        $tabla = "usuarios";

        $item = "operando";
        $valor = $this->operarUsuario;

        $id = $this->operarId;

        $respuesta = ModeloUsuarios::mdlActualizarUsuario($tabla, $id, $item, $valor);

    }

    /*=============================================
    Suscripción
    =============================================*/
    public $aceptar;
    public $id_usuario;
    public $doc_usuario;
    public $telefono_movil;
    public $codigo_pais;
    public $pais;
    public $enlace_afiliado;
    public $firma;
    public $patrocinador;

    public function ajaxSuscripcion()
    {
        $patrocinador=$this->patrocinador;

        $validarPatrocinador = ControladorUsuarios::ctrMostrarUsuarios("enlace_afiliado", $patrocinador);

        if (!$validarPatrocinador) {

            $confimarPatrocinador = $patrocinador;

        } else {

            if ($validarPatrocinador["firma"] != null) {

                $confimarPatrocinador = $validarPatrocinador["enlace_afiliado"];

            } else {

                $confimarPatrocinador = $patrocinador;

            }
        }

        $f = getdate();
        $fecha = $f["year"] . "-" . $f["mon"] . "-" . $f["wday"];

        $datos = array("aceptar" => $this->aceptar,
            "id_usuario" => $this->id_usuario,
            "doc_usuario" => $this->doc_usuario,
            "telefono_movil" => $this->telefono_movil,
            "codigo_pais" => $this->codigo_pais,
            "pais" => $this->pais,
            "enlace_afiliado" => $this->enlace_afiliado,
            "firma" => $this->firma,
            "fecha_contrato" => $fecha);

        $datosUninivel = array("usuario_red" => $this->id_usuario,
            "patrocinador_red" => $confimarPatrocinador,
            "periodo_venta" => 10);

        $datosArbol = array("usuario_red" => $this->id_usuario,
            "patrocinador_red" => $confimarPatrocinador);

        $registroUninivel = ControladorMultinivel::ctrRegistroUninivel($datosUninivel);
        $registroArbol = ControladorMultinivel::ctrRegistroBinaria($datosArbol);

        $respuesta = "error";

        if($registroUninivel == "ok" && $registroArbol == "ok"){
            
            $respuesta = ControladorUsuarios::ctrIniciarSuscripcion($datos);
        }
        // $ruta = ControladorGeneral::ctrRuta();
        //$valorSuscripcion = ControladorGeneral::ctrValorSuscripcion();
        // $fecha = substr(date("c"), 0, -6)."Z";
        // $valor = $this->documento;
        // $url = "http://localhost/www/trading/backoffice/index.php?pagina=perfil&id=".urlencode($valor);

        // echo $url;
        echo $respuesta;

    }

    /*=============================================
    Cancelar Suscripción
    =============================================*/
    public $idUsuario;

    public function ajaxCancelarSuscripcion()
    {

        $valor = $this->idUsuario;

        $respuesta = ControladorUsuarios::ctrCancelarSuscripcion($valor);

        echo $respuesta;

    }

    /*=============================================
    EDITAR USUARIO
    =============================================*/

    public $idUsuarioEditar;

    public function ajaxEditarUsuario()
    {

        $item = "id_usuario";
        $valor = $this->idUsuarioEditar;

        $respuesta = ControladorUsuarios::ctrMostrarUsuarios($item, $valor);

        echo json_encode($respuesta);

    }

    /*=============================================
    Eliminar Usuario
    =============================================*/

    public $idUsuarioEliminar;

    public function ajaxEliminarUsuario()
    {

        $valor = $this->idUsuarioEliminar;

        $respuesta = ControladorUsuarios::ctrEliminarUsuario($valor);

        echo $respuesta;

    }

}

/*=============================================
Validar email existente
=============================================*/

if (isset($_POST["validarEmail"])) {

    $valEmail = new AjaxUsuarios();
    $valEmail->validarEmail = $_POST["validarEmail"];
    $valEmail->ajaxValidarEmail();

}

/*=============================================
ACTIVAR USUARIO
=============================================*/

if (isset($_POST["activarUsuario"])) {

    $activarUsuario = new AjaxUsuarios();
    $activarUsuario->activarUsuario = $_POST["activarUsuario"];
    $activarUsuario->activarId = $_POST["activarId"];
    $activarUsuario->ajaxActivarUsuario();

}

/*=============================================
OPERAR USUARIO
=============================================*/

if (isset($_POST["operarUsuario"])) {

    $operarUsuario = new AjaxUsuarios();
    $operarUsuario->operarUsuario = $_POST["operarUsuario"];
    $operarUsuario->operarId = $_POST["operarId"];
    $operarUsuario->ajaxOperarUsuario();

}

/*=============================================
Suscripción
=============================================*/

if (isset($_POST["aceptar"])) {

    $activoRegistro = new AjaxUsuarios();
    $activoRegistro->aceptar = $_POST["aceptar"];
    $activoRegistro->id_usuario = $_POST["id_usuario"];
    $activoRegistro->doc_usuario = $_POST["doc_usuario"];
    $activoRegistro->enlace_afiliado = $_POST["enlace_afiliado"];
    $activoRegistro->pais = $_POST["pais"];
    $activoRegistro->codigo_pais = $_POST["codigo_pais"];
    $activoRegistro->telefono_movil = $_POST["telefono_movil"];
    $activoRegistro->firma = $_POST["firma"];
    $activoRegistro->patrocinador = $_POST["patrocinador"];
    $activoRegistro->ajaxSuscripcion();

}

/*=============================================
Cancelar Suscrpción
=============================================*/

if (isset($_POST["idUsuario"])) {

    $cancelarSuscripcion = new AjaxUsuarios();
    $cancelarSuscripcion->idUsuario = $_POST["idUsuario"];
    $cancelarSuscripcion->ajaxCancelarSuscripcion();

}

/*=============================================
EDITAR USUARIO
=============================================*/
if (isset($_POST["idUsuarioEditar"])) {

    $editar = new AjaxUsuarios();
    $editar->idUsuarioEditar = $_POST["idUsuarioEditar"];
    $editar->ajaxEditarUsuario();

}

/*=============================================
Eliminar Usuario
=============================================*/

if (isset($_POST["idUsuarioEliminar"])) {

    $eliminarUsuario = new AjaxUsuarios();
    $eliminarUsuario->idUsuarioEliminar = $_POST["idUsuarioEliminar"];
    $eliminarUsuario->ajaxEliminarUsuario();

}
