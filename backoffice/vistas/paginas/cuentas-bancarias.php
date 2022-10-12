<?php

$item = "titular";
$valor = $usuario["doc_usuario"];
$cuentas = ControladorCuentas::ctrMostrarCuentas($item, $valor);

?>
<div class="content-wrapper" style="min-height: 1058.31px;">

  <!-- Content Header (Page header) -->
  <section class="content-header">

    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Cuentas</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="inicio">Inicio</a></li>
            <li class="breadcrumb-item active">Cuentas</li>
          </ol>
        </div>
      </div>
    </div><!-- /.container-fluid -->

  </section>

  <!-- Main content -->
  <section class="content">

    <!-- Default box -->
    <div class="card">

      <div class="card-header">

        <h3 class="card-title">Cuentas bancarias registradas</h3>

        <div class="card-tools">
          <button type="button" class="btn btn-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
            <i class="fas fa-minus"></i></button>
          <button type="button" class="btn btn-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
            <i class="fas fa-times"></i></button>
        </div>

      </div>

      <div class="card-body">

        <table class="table table-striped table-bordered dt-responsive tablaCuentas" width="100%">

          <thead>
            <tr>
              <th width="10px">#</th>
              <th>Número</th>
              <th>Entidad</th>
              <th>Tipo</th>
              <th>Estado</th>
              <th>Fecha</th>
              <th>Acciones</th>
            </tr>
          </thead>
          <tbody>


          </tbody>
        </table>

        <input type="hidden" value="<?php echo $usuario["doc_usuario"]; ?>" id="titular">

      </div>
      <!-- /.card-body -->

      <div class="card-footer">
        Footer
      </div>
      <!-- /.card-footer-->

    </div>
    <!-- /.card -->

  </section>
  <!-- /.content -->

</div>