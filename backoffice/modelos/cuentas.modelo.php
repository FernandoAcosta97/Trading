<?php

require_once "conexion.php";

class ModeloCuentas{

	/*=============================================
	Mostrar cuentas
	=============================================*/

	static public function mdlMostrarCuentas($tabla, $item, $valor){

		if($item != null && $valor != null){

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

			$stmt->bindParam(":".$item, $valor, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetch();

		}else{

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla");

			$stmt -> execute();

			return $stmt -> fetchAll();

		}

		$stmt -> close();

		$stmt = null;

	}


	/*=============================================
    Editar cuenta
    =============================================*/

    public static function mdlEditarCuenta($tabla, $datos)
    {

        $stmt = Conexion::conectar()->prepare("UPDATE $tabla SET numero = :numero, entidad = :entidad, tipo = :tipo WHERE id = :id");

        $stmt->bindParam(":numero", $datos["numero"], PDO::PARAM_INT);
        $stmt->bindParam(":entidad", $datos["entidad"], PDO::PARAM_STR);
        $stmt->bindParam(":tipo", $datos["tipo"], PDO::PARAM_STR);
        $stmt->bindParam(":id", $datos["id"], PDO::PARAM_INT);

        if ($stmt->execute()) {

            return "ok";
        } else {

            return print_r(Conexion::conectar()->errorInfo());
        }

        $stmt->close();

        $stmt = null;
    }


	/*=============================================
    Actualizar Cuenta
    =============================================*/

    public static function mdlActualizarCuenta($tabla, $id, $item, $valor)
    {

        $stmt = Conexion::conectar()->prepare("UPDATE $tabla SET $item = :$item WHERE id = :id");

        $stmt->bindParam(":" . $item, $valor, PDO::PARAM_INT);
        $stmt->bindParam(":id", $id, PDO::PARAM_INT);

        if ($stmt->execute()) {

            return "ok";
        } else {

            return print_r(Conexion::conectar()->errorInfo());
        }

        $stmt->close();

        $stmt = null;
    }




}