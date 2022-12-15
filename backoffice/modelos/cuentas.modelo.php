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
	Mostrar cuentas
	=============================================*/

	static public function mdlMostrarCuentasxEstado($tabla, $item, $valor, $item2, $valor2){

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item AND $item2 = :$item2");

			$stmt->bindParam(":".$item, $valor, PDO::PARAM_STR);
            $stmt->bindParam(":".$item2, $valor2, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetch();

		$stmt -> close();

		$stmt = null;

	}



    /*=============================================
	Mostrar cuentas
	=============================================*/

	static public function mdlMostrarCuentasAll($tabla, $item, $valor){

		if($item != null && $valor != null){

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

			$stmt->bindParam(":".$item, $valor, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetchAll();

		}else{

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla");

			$stmt -> execute();

			return $stmt -> fetchAll();

		}

		$stmt -> close();

		$stmt = null;

	}


    public static function mdlRegistrarCuentaBancaria($tabla, $datos)
    {

        $stmt = Conexion::conectar()->prepare("INSERT INTO $tabla(usuario, numero, titular, nombre_titular, entidad, estado, tipo) VALUES (:usuario, :numero, :titular, :nombre_titular, :entidad, :estado, :tipo)");

        $stmt->bindParam(":usuario", $datos["usuario"], PDO::PARAM_INT);
        $stmt->bindParam(":numero", $datos["numero"], PDO::PARAM_INT);
        $stmt->bindParam(":titular", $datos["titular"], PDO::PARAM_INT);
        $stmt->bindParam(":nombre_titular", $datos["nombreTitular"], PDO::PARAM_STR);
        $stmt->bindParam(":entidad", $datos["entidad"], PDO::PARAM_STR);
        $stmt->bindParam(":estado", $datos["estado"], PDO::PARAM_STR);
        $stmt->bindParam(":tipo", $datos["tipo"], PDO::PARAM_STR);

        if ($stmt->execute()) {

            return "ok";
        } else {

            return print_r(Conexion::conectar()->errorInfo());
        }

        $stmt->close();
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
    Actualizar cuenta
    =============================================*/

    public static function mdlActualizarCuenta($tabla, $id, $item, $valor)
    {

        $stmt = Conexion::conectar()->prepare("UPDATE $tabla SET $item = :$item WHERE id = :id");

        $stmt->bindParam(":" . $item, $valor, PDO::PARAM_STR);
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