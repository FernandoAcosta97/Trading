<?php

if ($usuario["perfil"] != "admin") {

    echo '<script>

  window.location = "inicio";

  </script>';

    return;
}

if(!isset($_GET["id"])){

  echo '<script>
  
  window.location = "usuarios";
  
  </script>';
  
    return;
  
  }
  
  $usuario = ControladorUsuarios::ctrMostrarUsuarios("id_usuario",$_GET["id"]);


?>
<div class="content-wrapper" style="min-height: 1058.31px;">
  
  <!-- Content Header (Page header) -->
  <section class="content-header">
    
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Detalles de Usuario</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="inicio">Inicio</a></li>
            <li class="breadcrumb-item active">Detalles</li>
          </ol>
        </div>
      </div>
    </div><!-- /.container-fluid -->

  </section>

  <!-- Main content -->
  <section class="content">

    <div class="container-fluid">

      <div class="row">
        
        <?php

          include "modulos/detalles-usuario/info-usuario.php";

          include "modulos/detalles-usuario/tabla-cuentas-detalles.php";

          //  include "modulos/perfil/formulario-suscripcion.php";

           #include "modulos/perfil/material-promocion.php";

         ?>

     </div>

    </div>

  </section>
  <!-- /.content -->

</div>