<nav class="main-header navbar navbar-expand navbar-white navbar-light border-bottom">

  <!-- Left navbar links -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
    </li>
  </ul>
  
  <!-- Right navbar links -->
  <ul class="navbar-nav ml-auto">

  <li class="nav-item">     
      <a class="nav-link copiarLinkInicio" href="#">
        <i class="fa fa-link"> Link Afiliado</i>
        <input type="hidden" id="linkAfiliado" value="<?php echo $ruta . $usuario["enlace_afiliado"]; ?>" readonly>
        <span class="badge badge-info navbar-badge"></span>
      </a>
    </li>

    <li class="nav-item">     
      <a class="nav-link copiarCodigoInicio" href="#">
        <i class="fa fa-link"> Código: <?php echo $usuario["enlace_afiliado"]; ?></i>
        <input type="hidden" id="codigoAfiliado" value="<?php echo $usuario["enlace_afiliado"]; ?>" readonly>
        <span class="badge badge-info navbar-badge"></span>
      </a>
    </li>

    <?php
    $ticketRecibidos = ControladorSoporte::ctrMostrarTickets("receptor", $usuario["id_usuario"]);
    $totalTicketsRecibidos = count($ticketRecibidos);
    ?>

    <li class="nav-item">     
      <a class="nav-link" href="soporte">
        <i class="far fa-comments"></i>
        <?php if($totalTicketsRecibidos>0): ?>
        <span class="badge badge-info navbar-badge"><?php echo $totalTicketsRecibidos ?></span>
        <?php endif ?>
      </a>
    </li>

     <li class="nav-item">     
      <a class="nav-link" href="uninivel">
        <i class="far fa-bell"></i>
        <span class="badge badge-dark navbar-badge">15</span>
      </a>
    </li>

     <li class="nav-item">
      <a class="nav-link" href="salir">
        <i class="fas fa-sign-out-alt"></i>
      </a>
    </li>

  </ul>

</nav>