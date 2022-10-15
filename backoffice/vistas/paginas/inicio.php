<div class="content-wrapper" style="min-height: 1058.31px;">

  <!-- Content Header (Page header) -->
  <section class="content-header">

    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Tablero</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="inicio">Inicio</a></li>
            <li class="breadcrumb-item active">Tablero</li>
          </ol>
        </div>
      </div>
    </div><!-- /.container-fluid -->

  </section>

  <!-- Main content -->
  <section class="content">

    <div class="container-fluid">

    <?php

//$totalRed = ControladorMultinivel::ctrMostrarRedOperandoTotal("usuarios","red_uninivel","patrocinador_red",$usuario["enlace_afiliado"],null,null);

//$totalRedOperando = ControladorMultinivel::ctrMostrarRedOperandoTotal("usuarios","red_uninivel","patrocinador_red",$usuario["enlace_afiliado"],"operando",1);
$afiliadosNecesarios = 2;
$operando = 0;
$sinOperar = 0;

if ($usuario["firma"] != "") {

    $red = ControladorMultinivel::ctrMostrarRed("usuarios", "red_uninivel", "patrocinador_red", $usuario["enlace_afiliado"]);

    /*=============================================
    Limpinado el array de tipo Objeto de valores repetidos
    =============================================*/

    $resultado = array();

    foreach ($red as $value) {

        $resultado[$value["id_usuario"]] = $value;

    }

    $red = array_values($resultado);

    if (count($red) > 0) {

        foreach ($red as $key => $value) {

            if ($value["perfil"] != "admin") {

                if ($value["operando"] == 1) {

                    ++$operando;

                } else {

                    ++$sinOperar;

                }
            }
        }

    } else {

        $operando = 0;
        $sinOperar = 0;

    }

    $totalRed = $operando + $sinOperar;

    if ($usuario["perfil"] != "admin") {

        if ($totalRed > 2) {

            if ($operando < $totalRed - 1) {

              $afiliadosNecesarios = $totalRed - 1;

      //           echo '<div class="alert alert-warning alert-dismissible">
      //   <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
      //   <h5><i class="icon fas fa-exclamation-triangle"></i> Atención!</h5>
      //   Recuerda que para recibir tu rendimiento necesitas tener por lo menos [' . $afiliadosNecesarios . '] afiliados con una inversión activa, en estos momentos tienes [' . $operando . '] afiliados con una inversión activa, invita a tus demas referidos a inverir o trae un nuevo referido para que este realice su primer inversión.
      // </div>';

            }

        } 
      //   else {

      //       echo '<div class="alert alert-warning alert-dismissible">
      //   <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
      //   <h5><i class="icon fas fa-exclamation-triangle"></i> Atención!</h5>
      //   Recuerda que para recibir tu rendimiento necesitas tener por lo menos [2] afiliados con una inversión activa, en estos momentos tienes [' . $operando . '] afiliados con una inversión activa, invita a tus demas referidos a inverir o trae un nuevo referido para que este realice su primer inversión.
      // </div>';

      //   }
    }
} 
// else {

//     echo '<div class="alert alert-warning alert-dismissible">
//   <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
//   <h5><i class="icon fas fa-exclamation-triangle"></i> Atención!</h5>
//   Recuerda que para recibir tu rendimiento necesitas tener por lo menos [2] afiliados con una inversión activa, en estos momentos tienes [0] afiliados con una inversión activa, invita a tus demas referidos a inverir o trae un nuevo referido para que este realice su primer inversión.
// </div>';

// }

if ($usuario["perfil"] != "admin") {

echo '<div class="alert alert-warning alert-dismissible">
<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
<h5><i class="icon fas fa-exclamation-triangle"></i> Atención!</h5>
Recuerda que para recibir tu rendimiento necesitas tener por lo menos [' . $afiliadosNecesarios . '] afiliados con una inversión activa, en estos momentos tienes [' . $operando . '] afiliados con una inversión activa, invita a tus demas referidos a inverir o trae un nuevo referido para que este realice su primer inversión.
</div>';

}

?>

   <?php

include "modulos/inicio/recuadros-superiores.php";

?>

    </div>

  </section>
  <!-- /.content -->

</div>