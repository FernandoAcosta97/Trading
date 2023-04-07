<?php

// https://github.com/PHPMailer/PHPMailer
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Style\NumberFormat;
use PhpOffice\PhpSpreadsheet\Style\Border;
use PhpOffice\PhpSpreadsheet\Style\Color;
use PhpOffice\PhpSpreadsheet\Style\Fill;

Class ControladorCuentas{


	/*=============================================
	registrar cuenta bancaria
	=============================================*/

	public function ctrRegistrarCuentaBancaria($pagina){

		$tabla = "cuentas_bancarias";

		if(isset($_POST["idUsuarioCuentaRegistrar"])){

			$cuenta_existe = ModeloCuentas::mdlMostrarCuentas($tabla, "numero", $_POST["registrarNumeroCuenta"]);

			if($cuenta_existe==""){

			$campo_entidad="";
			if(isset($_POST["registrarEntidadCuentaCampo"]) && $_POST["registrarEntidadCuentaCampo"]!=""){
				$campo_entidad=$_POST["registrarEntidadCuentaCampo"];
			}else{
				$campo_entidad=$_POST["registrarEntidadCuenta"];
			}

			if(preg_match('/^[0-9]+$/', $_POST["registrarNumeroCuenta"])&&
			preg_match('/^[a-zA-ZñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["registrarNombreTitular"])
			 && preg_match('/^[0-9]+$/', $_POST["registrarNumeroTitular"]) &&
			preg_match('/^[a-zA-ZñÑáéíóúÁÉÍÓÚ ]+$/', $campo_entidad) ){

				$datos = array(	"titular" => $_POST["registrarNumeroTitular"],
				"tipoDocumento" => $_POST["registrarTipoDocumento"],
				"nombreTitular" => $_POST["registrarNombreTitular"],
				"usuario" => $_POST["idUsuarioCuentaRegistrar"],
				"estado" => 1,
				"tipo" => $_POST["registrarTipoCuenta"],
				"entidad" => $campo_entidad,
				"numero" => $_POST["registrarNumeroCuenta"]);

				
		$cuentas = ControladorCuentas::ctrMostrarCuentasAll("usuario",$_POST["idUsuarioCuentaRegistrar"]);

		foreach($cuentas as $key => $value){
			if($value["estado"]==1){
				$actualizar_cuentas = ControladorCuentas::ctrActualizarCuenta( $value["id"] ,"estado", 0);
			}
		}

		$respuesta = ModeloCuentas::mdlRegistrarCuentaBancaria($tabla, $datos);

		if($respuesta == "ok"){
			echo '<script>

							swal({

								type:"success",
								title: "REGISTRO EXITOSO",
								text: "¡SU CUENTA BANCARIA HA SIDO CREADA CORRECTAMENTE!",
								showConfirmButton: true,
								confirmButtonText: "Cerrar"

							}).then(function(result){

								if(result.value){

									window.location = "'.$pagina.'";

								}


							});	

						</script>';
		}

				}
			}
			}



	}



	
	/*=============================================
	Mostrar Cuentas
	=============================================*/

	static public function ctrMostrarCuentas($item, $valor){
	
		$tabla = "cuentas_bancarias";

		$respuesta = ModeloCuentas::mdlMostrarCuentas($tabla, $item, $valor);

		return $respuesta;

	}


	/*=============================================
	Mostrar Cuentas x estado
	=============================================*/

	static public function ctrMostrarCuentasxEstado($item, $valor,$item2, $valor2){
	
		$tabla = "cuentas_bancarias";

		$respuesta = ModeloCuentas::mdlMostrarCuentasxEstado($tabla, $item, $valor, $item2, $valor2);

		return $respuesta;

	}


	/*=============================================
	Mostrar Cuentas All
	=============================================*/

	static public function ctrMostrarCuentasAll($item, $valor){
	
		$tabla = "cuentas_bancarias";

		$respuesta = ModeloCuentas::mdlMostrarCuentasAll($tabla, $item, $valor);

		return $respuesta;

	}


	/*=============================================
	Actualizar Cuenta
	=============================================*/

	static public function ctrActualizarCuenta($id, $item, $valor){

		$tabla = "cuentas_bancarias";

		$respuesta = ModeloCuentas::mdlActualizarCuenta($tabla, $id, $item, $valor);

		return $respuesta;

	}




	/*=============================================
	editar cuenta bancaria
	=============================================*/

	public function ctrEditarCuenta($pagina){

		$tabla = "cuentas_bancarias";

		if(isset($_POST["editarNumero"])){

			$cuenta_existe = "";

			if($_POST["editarNumero"]!=$_POST["nCuentaActual"]){

			$cuenta_existe = ModeloCuentas::mdlMostrarCuentas($tabla, "numero", $_POST["editarNumero"]);

			}

			if($cuenta_existe==""){

			$campo_entidad="";
			if(isset($_POST["editarEntidadCuentaCampo"]) && $_POST["editarEntidadCuentaCampo"]!=""){
				$campo_entidad=$_POST["editarEntidadCuentaCampo"];
			}else{
				$campo_entidad=$_POST["editarEntidad"];
			}

			if(preg_match('/^[0-9]+$/', $_POST["editarDocumentoTitular"]) && preg_match('/^[0-9]+$/', $_POST["editarNumero"]) &&
			preg_match('/^[a-zA-ZñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["editarNombreTitular"]) ){

				$datos = array(	"numero" => $_POST["editarNumero"],
				"nombre_titular" => $_POST["editarNombreTitular"],
				"entidad" => $campo_entidad,
				"tipo" => $_POST["editarTipoCuenta"],
				"tipo_documento" => $_POST["editarTipoDocumento"],
				"titular" => $_POST["editarDocumentoTitular"],
				"id" => $_POST["idCuenta"]);

				
		$respuesta = ModeloCuentas::mdlEditarCuenta($tabla, $datos);

		if($respuesta == "ok"){
			echo '<script>

							swal({

								type:"success",
								title: "ACTUALIZACIÓN EXITOSA",
								text: "¡LA CUENTA BANCARIA HA SIDO ACTUALIZADA CORRECTAMENTE!",
								showConfirmButton: true,
								confirmButtonText: "Cerrar"

							}).then(function(result){

								if(result.value){

									window.location = "'.$pagina.'";

								}


							});	

						</script>';
		}

				}
			}
			}



	}



	/*=============================================
	Eliminar Cuenta bancaria
	=============================================*/

	static public function ctrEliminarCuenta($id){

		$tabla = "cuentas_bancarias";

		$tabla2 = "pagos_inversiones";
		$tabla3 = "pagos_comisiones";
		$tabla4 = "pagos_extras";

		$cuenta = ModeloCuentas::mdlMostrarCuentas($tabla, "id", $id);

		$pagosInversiones = ModeloCuentas::mdlMostrarPagosCuentas($tabla, $tabla2, $id);

		$pagosComisiones = ModeloCuentas::mdlMostrarPagosCuentas($tabla, $tabla3, $id);

		$pagosExtras = ModeloCuentas::mdlMostrarPagosCuentas($tabla, $tabla4, $id);

		if($pagosInversiones!="" || $pagosComisiones!="" || $pagosExtras!="") return 1;

		$respuesta = ModeloCuentas::mdlEliminarCuenta($tabla, $id);

		if($respuesta=="ok"){

			return $cuenta["usuario"];

		}else{

			return "error";

		}



	}


	public function ctrDescargarReporte(){

        if(isset($_GET["excel"]) && $_GET["excel"]==1){


        $cuentas=ControladorCuentas::ctrMostrarCuentas(null, null);
            
        $excel = new Spreadsheet();
		$excel->getDefaultStyle()->getFont()->setName('Arial');
		$excel->getDefaultStyle()->getFont()->setSize(12);
        $hoja = $excel->getActiveSheet();
        $hoja->setTitle("Cuentas Bancarias");

        $styleArrayTitulos = [
            'font' => [
                'bold' => true,
            ],
            'alignment' => [
                'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
            ],
            'borders' => [
                'allBorders' => [
                    'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                ],
            ],
            'fill' => [
                'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
                'startColor' => [
                    'argb' => 'FFA4FFA4',
                ],
            ],
        ];

        $hoja->getStyle('A1')->applyFromArray($styleArrayTitulos);
        $hoja->getStyle('B1')->applyFromArray($styleArrayTitulos);
        $hoja->getStyle('C1')->applyFromArray($styleArrayTitulos);
        $hoja->getStyle('D1')->applyFromArray($styleArrayTitulos);
        $hoja->getStyle('E1')->applyFromArray($styleArrayTitulos);
        $hoja->getStyle('F1')->applyFromArray($styleArrayTitulos);
        $hoja->getStyle('G1')->applyFromArray($styleArrayTitulos);
        $hoja->getStyle('H1')->applyFromArray($styleArrayTitulos);

        $styleArray = [
            'alignment' => [
                'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
            ],
            'borders' => [
                'allBorders' => [
                    'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                ],
            ],
        ];

        $n=count($cuentas)+1;
        
        $hoja->getStyle('A2:H'.$n)->applyFromArray($styleArray);

        $hoja->getColumnDimension("A")->setWidth(5);
        $hoja->setCellValue("A1", "N°");

		$hoja->getColumnDimension("B")->setWidth(20);
		$hoja->getStyle("B")->getNumberFormat()->setFormatCode(NumberFormat::FORMAT_NUMBER);
        $hoja->setCellValue("B1", "DOCUMENTO");

		$hoja->getColumnDimension("C")->setWidth(30);
        $hoja->setCellValue("C1", "NOMBRE");

		$hoja->getColumnDimension("D")->setWidth(30);
        $hoja->setCellValue("D1", "PAIS");

		$hoja->getColumnDimension("E")->setWidth(20);
        $hoja->setCellValue("E1", "ENTIDAD");

        $hoja->getColumnDimension("F")->setWidth(30);
        $hoja->getStyle("F")->getNumberFormat()->setFormatCode(NumberFormat::FORMAT_NUMBER);
        $hoja->setCellValue("F1", "# DE CUENTA");

        $hoja->getColumnDimension("G")->setWidth(20);
        $hoja->setCellValue("G1", "TIPO");

        $hoja->getColumnDimension("H")->setWidth(20);
        $hoja->setCellValue("H1", "FECHA");

        $fila = 2;
        $totalApagar = 0;
        $totalInversion = 0;

        foreach($cuentas as $key => $value){

            $us=ControladorUsuarios::ctrMostrarUsuarios("id_usuario", $value["id_usuario"]);

            $hoja->setCellValue('A'.$fila, $key+1);
            $hoja->setCellValue('B'.$fila, $us["doc_usuario"]);
            $hoja->setCellValue('C'.$fila, $us["nombre"]);
			$hoja->setCellValue('D'.$fila, $us["pais"]);
			$hoja->setCellValue('E'.$fila, $value["entidad"]);
			$hoja->setCellValue('F'.$fila, $value["numero"]);
            $hoja->setCellValue('G'.$fila, $value["tipo"]);
            $hoja->setCellValue('H'.$fila, $value["fecha"]);

            $fila++;

        }

		ob_end_clean();

        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');

        header('Content-Disposition: attachment;filename="cuentas-bancarias.xlsx"');
        
        header('Cache-Control: max-age=0');
        
        $writer = IOFactory::createWriter($excel, 'Xlsx');
        $writer->save('php://output');
        exit;
    }


    }


	


}

