<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Style\NumberFormat;
use PhpOffice\PhpSpreadsheet\Style\Border;
use PhpOffice\PhpSpreadsheet\Style\Color;
use PhpOffice\PhpSpreadsheet\Style\Fill;

class ControladorReportes
{

    public function ctrDescargarReporteExcelUsuarios($datos, $titulo, $columnas){

        $letras=["A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S"];
        $n=count($datos);

        $excel = new Spreadsheet();
		$excel->getDefaultStyle()->getFont()->setName('Arial');
		$excel->getDefaultStyle()->getFont()->setSize(12);
        $hoja = $excel->getActiveSheet();
        $hoja->setTitle($titulo);

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

        for($i=0; $i<$n; $i++){

            $hoja->getStyle($letras[$i].''.$i+1)->applyFromArray($styleArrayTitulos);

        }

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

        $hoja->getStyle('A2:'.$letras[$n].''.$n+1)->applyFromArray($styleArray);



    }



}