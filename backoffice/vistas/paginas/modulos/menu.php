<aside class="main-sidebar sidebar-dark-primary elevation-4" style="overflow-x:hidden">
  <!-- Brand Logo -->
  <a href="inicio" class="brand-link">
    <img src="vistas/img/plantilla/icono.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
    <span class="brand-text font-weight-light">Inversiones Trading</span>
  </a>

  <!-- Sidebar -->
  <div class="sidebar">
    <!-- Sidebar user panel (optional) -->
    <div class="user-panel mt-3 pb-3 mb-3 d-flex">
      <div class="image">

        <?php if ($usuario["foto"] == "") : ?>

          <img src="vistas/img/usuarios/default/default.png" class="img-circle elevation-2" alt="User Image">

        <?php else : ?>

          <img src="<?php echo $usuario["foto"] ?>" class="img-circle elevation-2" alt="User Image">

        <?php endif ?>

      </div>
      <div class="info">
        <a href="perfil" class="d-block"><?php echo $usuario["nombre"] ?></a>
      </div>
    </div>


    <nav class="mt-2">

      <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">

      <!--=====================================
      Botón Inicio
      ======================================-->

        <li class="nav-item">
          <a href="inicio" class="nav-link">
            <i class="nav-icon fas fa-home"></i>
            <p>Inicio</p>
          </a>
        </li>

        <!--=====================================
      Botón Mi Perfil
      ======================================-->

        <li class="nav-item">
          <a href="perfil" class="nav-link">
            <i class="nav-icon fas fa-user"></i>
            <p>Mi perfil</p>
          </a>
        </li>

      <!--=====================================
      Botón Usuarios
      ======================================-->

        <?php if ($usuario["perfil"] == "admin") : ?>

        <li class="nav-item">
            <a href="usuarios" class="nav-link">
            <i class="nav-icon fas fa-users"></i>
              <p>Usuarios</p>
            </a>
          </li>

        <?php endif ?>

        <?php if ($usuario["firma"] != null) : ?>

      <!--=====================================
      Botón Campañas
      ======================================-->

      <li class="nav-item">
          <a href="campanas" class="nav-link">
            <i class="nav-icon fas fa-money-bill"></i>
            <p>Campañas</p>
          </a>
        </li>

      <?php if ($usuario["perfil"] != "admin") : ?>

      <!--=====================================
      Botón Inversiones
      ======================================-->

      <li class="nav-item">
          <a href="inversiones" class="nav-link">
            <i class="nav-icon fas fa-money-bill"></i>
            <p>Inversiones</p>
          </a>
        </li>

        <?php endif?>

        <!--=====================================
      Botón Cuentas
      ======================================-->

          <li class="nav-item">
            <a href="cuentas-bancarias" class="nav-link">
              <i class="nav-icon fa fa-university"></i>
              <p>Cuentas</p>
            </a>
          </li>


      <!--=====================================
      Botón Comprobantes
      ======================================-->

      <li class="nav-item">
            <a href="comprobantes" class="nav-link">
              <i class="nav-icon fa fa-file-invoice"></i>
              <p>Comprobantes</p>
            </a>
          </li>

        <!--=====================================
      Botón Redes Multinivel
      ======================================-->

          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-sitemap"></i>
              <p>
                Mi red
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="uninivel" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Red uninivel</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="binaria" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Red binaria</p>
                </a>
              </li>
            </ul>
          </li>



        <!--=====================================
        Botón Ingresos
        ======================================-->

          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-money-check-alt"></i>
              <p>
                Ingresos
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="ingresos-uninivel" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Ingresos uninivel</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="ingresos-binaria" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Ingresos binaria</p>
                </a>
              </li>
            </ul>
          </li>

        <?php endif ?>

        <!--=====================================
        Botón Plan de compensación
        ======================================-->

        <li class="nav-item">
          <a href="plan-compensacion" class="nav-link">
            <i class="nav-icon fas fa-gem"></i>
            <p>Plan de compensación</p>
          </a>
        </li>

        <!--=====================================
        Botón Soporte
        ======================================-->

        <li class="nav-item">
          <a href="soporte" class="nav-link">
            <i class="nav-icon fas fa-comments"></i>
            <p>Soporte</p>
          </a>
        </li>

        <!--=====================================
        Botón Salir
        ======================================-->

        <li class="nav-item">
          <a href="salir" class="nav-link">
            <i class="nav-icon fas fa-sign-out-alt"></i>
            <p>Cerrar sesión</p>
          </a>
        </li>

      </ul>

    </nav>
    <!-- /.sidebar-menu -->
  </div>
  <!-- /.sidebar -->
</aside>