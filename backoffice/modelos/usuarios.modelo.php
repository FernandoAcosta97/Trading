<?php

require_once "conexion.php";

class ModeloUsuarios
{

    /*=============================================
    Registro de usuarios
    =============================================*/

    public static function mdlRegistroUsuario($tabla, $datos)
    {

        $stmt = Conexion::conectar()->prepare("INSERT INTO $tabla(perfil, doc_usuario, nombre, email, password, verificacion, email_encriptado, patrocinador) VALUES (:perfil, :doc_usuario, :nombre, :email, :password, :verificacion, :email_encriptado, :patrocinador)");

        $stmt->bindParam(":perfil", $datos["perfil"], PDO::PARAM_STR);
        $stmt->bindParam(":doc_usuario", $datos["doc_usuario"], PDO::PARAM_INT);
        $stmt->bindParam(":nombre", $datos["nombre"], PDO::PARAM_STR);
        $stmt->bindParam(":email", $datos["email"], PDO::PARAM_STR);
        $stmt->bindParam(":password", $datos["password"], PDO::PARAM_STR);
        $stmt->bindParam(":verificacion", $datos["verificacion"], PDO::PARAM_STR);
        $stmt->bindParam(":email_encriptado", $datos["email_encriptado"], PDO::PARAM_STR);
        $stmt->bindParam(":patrocinador", $datos["patrocinador"], PDO::PARAM_STR);


        if ($stmt->execute()) {

            return "ok";
        } else {

            return print_r(Conexion::conectar()->errorInfo());
        }

        $stmt->close();
        $stmt = null;
    }


    /*=============================================
    Registro de usuarios Manual
    =============================================*/

    public static function mdlRegistroUsuarioManual($tabla, $datos)
    {

        $stmt = Conexion::conectar()->prepare("INSERT INTO $tabla(perfil, doc_usuario, nombre, email, password, verificacion, email_encriptado, patrocinador, pais, codigo_pais, telefono_movil, fecha_contrato, firma) VALUES (:perfil, :doc_usuario, :nombre, :email, :password, :verificacion, :email_encriptado, :patrocinador, :pais, :codigo_pais, :telefono_movil, :fecha_contrato, :firma)");

        $stmt->bindParam(":perfil", $datos["perfil"], PDO::PARAM_STR);
        $stmt->bindParam(":doc_usuario", $datos["doc_usuario"], PDO::PARAM_INT);
        $stmt->bindParam(":nombre", $datos["nombre"], PDO::PARAM_STR);
        $stmt->bindParam(":email", $datos["email"], PDO::PARAM_STR);
        $stmt->bindParam(":password", $datos["password"], PDO::PARAM_STR);
        $stmt->bindParam(":verificacion", $datos["verificacion"], PDO::PARAM_STR);
        $stmt->bindParam(":email_encriptado", $datos["email_encriptado"], PDO::PARAM_STR);
        $stmt->bindParam(":patrocinador", $datos["patrocinador"], PDO::PARAM_STR);
        $stmt->bindParam(":pais", $datos["pais"], PDO::PARAM_STR);
        $stmt->bindParam(":codigo_pais", $datos["codigo_pais"], PDO::PARAM_STR);
        $stmt->bindParam(":telefono_movil", $datos["telefono_movil"], PDO::PARAM_STR);
        $stmt->bindParam(":fecha_contrato", $datos["fecha_contrato"], PDO::PARAM_STR);
        $stmt->bindParam(":firma", $datos["firma"], PDO::PARAM_STR);

        if ($stmt->execute()) {

            return "ok";
        } else {

            return print_r(Conexion::conectar()->errorInfo());
        }

        $stmt->close();
        $stmt = null;
    }


    /*=============================================
    Mostrar Usuarios
    =============================================*/

    public static function mdlMostrarUsuarios($tabla, $item, $valor)
    {

        if ($item != null && $valor != null) {

            $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

            $stmt->bindParam(":" . $item, $valor, PDO::PARAM_STR);

            $stmt->execute();

            return $stmt->fetch();
        } else {

            $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla ORDER BY 'id_usuario' ASC");

            $stmt->execute();

            return $stmt->fetchAll();
        }

        $stmt->close();

        $stmt = null;
    }

    public static function mdlMostrarUsuariosFetchAll($tabla, $item, $valor)
    {

        $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

        $stmt->bindParam(":" . $item, $valor, PDO::PARAM_STR);

        $stmt->execute();

        return $stmt->fetchAll();


        $stmt->close();

        $stmt = null;
    }


    /*=============================================
    Total Usuarios
    =============================================*/

    public static function mdlTotalUsuarios($tabla)
    {

        $stmt = Conexion::conectar()->prepare("SELECT COUNT(*) FROM $tabla WHERE perfil!='admin'");
        $stmt->execute();
        return $stmt->fetch();

        $stmt->close();
        $stmt = null;
    }

    /*=============================================
    MOSTRAR USUARIOS X FILTRO O ACTIVIDAD ----- FUNCIONAL FERNANDO
    =============================================*/
    public static function mdlTotalUsuariosXfiltro($tabla, $item, $valor)
    {

        $stmt = Conexion::conectar()->prepare("SELECT count(*) as total FROM $tabla WHERE $item = trim(:$item) AND perfil!='admin'");
        $stmt->bindParam(":" . $item, $valor, PDO::PARAM_STR);
        $stmt->execute();
        return $stmt->fetch();

        $stmt->close();
        $stmt = null;
    }

    /*=============================================
    Actualizar usuario
    =============================================*/

    public static function mdlActualizarUsuario($tabla, $id, $item, $valor)
    {

        $stmt = Conexion::conectar()->prepare("UPDATE $tabla SET $item = :$item WHERE id_usuario = :id_usuario");

        $stmt->bindParam(":" . $item, $valor, PDO::PARAM_STR);
        $stmt->bindParam(":id_usuario", $id, PDO::PARAM_INT);

        if ($stmt->execute()) {

            return "ok";
        } else {

            return print_r(Conexion::conectar()->errorInfo());
        }

        $stmt->close();

        $stmt = null;
    }

    /*=============================================
    Editar usuario
    =============================================*/

    public static function mdlEditarUsuario($tabla, $datos)
    {

        $stmt = Conexion::conectar()->prepare("UPDATE $tabla SET nombre = :nombre, email = :email, telefono_movil = :telefono, password = :password, perfil = :perfil WHERE id_usuario = :id_usuario");

        $stmt->bindParam(":nombre", $datos["nombre"], PDO::PARAM_STR);
        $stmt->bindParam(":password", $datos["password"], PDO::PARAM_STR);
        $stmt->bindParam(":telefono", $datos["telefono"], PDO::PARAM_STR);
        $stmt->bindParam(":perfil", $datos["perfil"], PDO::PARAM_STR);
        $stmt->bindParam(":email", $datos["email"], PDO::PARAM_STR);
        $stmt->bindParam(":id_usuario", $datos["id_usuario"], PDO::PARAM_STR);

        if ($stmt->execute()) {

            return "ok";
        } else {

            return print_r(Conexion::conectar()->errorInfo());
        }

        $stmt->close();

        $stmt = null;
    }


    /*=============================================
    Eliminar usuario
    =============================================*/

    public static function mdlEliminarUsuario($tabla, $id)
    {

        $stmt = Conexion::conectar()->prepare("DELETE FROM $tabla WHERE id_usuario = :id_usuario");

        $stmt->bindParam(":id_usuario", $id, PDO::PARAM_INT);

        if ($stmt->execute()) {

            return "ok";
        } else {

            return print_r(Conexion::conectar()->errorInfo());
        }

        $stmt->close();

        $stmt = null;
    }
    

    public static function mdlRegistroReferido($tabla, $datos)
    {

        $stmt = Conexion::conectar()->prepare("INSERT INTO $tabla(patrocinador, referido) VALUES (:patrocinador, :referido)");

        $stmt->bindParam(":patrocinador", $datos["patrocinador"], PDO::PARAM_INT);
        $stmt->bindParam(":referido", $datos["referido"], PDO::PARAM_INT);

        if ($stmt->execute()) {

            return "ok";
        } else {

            return print_r(Conexion::conectar()->errorInfo());
        }

        $stmt->close();
        $stmt = null;
    }

    /*=============================================
    Iniciar Suscripción
    =============================================*/

    // public static function mdlIniciarSuscripcion($tabla, $datos)
    // {

    //     $stmt = Conexion::conectar()->prepare("UPDATE $tabla SET doc_usuario = :doc_usuario, enlace_afiliado = :enlace_afiliado, patrocinador = :patrocinador, pais = :pais, codigo_pais = :codigo_pais, telefono_movil = :telefono_movil, firma = :firma, fecha_contrato = :fecha_contrato  WHERE id_usuario = :id_usuario");

    //     $stmt->bindParam(":doc_usuario", $datos["doc_usuario"], PDO::PARAM_INT);
    //     $stmt->bindParam(":enlace_afiliado", $datos["enlace_afiliado"], PDO::PARAM_STR);
    //     $stmt->bindParam(":patrocinador", $datos["patrocinador"], PDO::PARAM_STR);
    //     $stmt->bindParam(":pais", $datos["pais"], PDO::PARAM_STR);
    //     $stmt->bindParam(":codigo_pais", $datos["codigo_pais"], PDO::PARAM_STR);
    //     $stmt->bindParam(":telefono_movil", $datos["telefono_movil"], PDO::PARAM_STR);
    //     $stmt->bindParam(":firma", $datos["firma"], PDO::PARAM_STR);
    //     $stmt->bindParam(":fecha_contrato", $datos["fecha_contrato"], PDO::PARAM_STR);
    //     $stmt->bindParam(":id_usuario", $datos["id_usuario"], PDO::PARAM_INT);

    //     if ($stmt->execute()) {

    //         return "ok";
    //     } else {

    //         return print_r(Conexion::conectar()->errorInfo());
    //     }

    //     $stmt->close();

    //     $stmt = null;
    // }

     /*=============================================
    Iniciar Suscripción
    =============================================*/

    public static function mdlIniciarSuscripcion($tabla, $datos)
    {
        $stmt = Conexion::conectar()->prepare("UPDATE $tabla SET doc_usuario = :doc_usuario, enlace_afiliado = :enlace_afiliado, pais = :pais, codigo_pais = :codigo_pais, telefono_movil = :telefono_movil, firma = :firma, fecha_contrato = :fecha_contrato  WHERE id_usuario = :id_usuario");

        $stmt->bindParam(":doc_usuario", $datos["doc_usuario"], PDO::PARAM_INT);
        $stmt->bindParam(":enlace_afiliado", $datos["enlace_afiliado"], PDO::PARAM_STR);
        $stmt->bindParam(":pais", $datos["pais"], PDO::PARAM_STR);
        $stmt->bindParam(":codigo_pais", $datos["codigo_pais"], PDO::PARAM_STR);
        $stmt->bindParam(":telefono_movil", $datos["telefono_movil"], PDO::PARAM_STR);
        $stmt->bindParam(":firma", $datos["firma"], PDO::PARAM_STR);
        $stmt->bindParam(":fecha_contrato", $datos["fecha_contrato"], PDO::PARAM_STR);
        $stmt->bindParam(":id_usuario", $datos["id_usuario"], PDO::PARAM_INT);

        if ($stmt->execute()) {

            return "ok";
        } else {

            //echo print_r(Conexion::conectar()->errorInfo());
            return print_r(Conexion::conectar()->errorInfo());
        }

        $stmt->close();

        $stmt = null;
    }

    /*=============================================
    Cancelar Suscripción
    =============================================*/

    public static function mdlCancelarSuscripcion($tabla, $datos)
    {

        $stmt = Conexion::conectar()->prepare("UPDATE $tabla SET  suscripcion = :suscripcion, ciclo_pago = :ciclo_pago, firma = :firma, fecha_contrato = :fecha_contrato WHERE id_usuario = :id_usuario");

        $stmt->bindParam(":suscripcion", $datos["suscripcion"], PDO::PARAM_STR);
        $stmt->bindParam(":ciclo_pago", $datos["ciclo_pago"], PDO::PARAM_STR);
        $stmt->bindParam(":firma", $datos["firma"], PDO::PARAM_STR);
        $stmt->bindParam(":fecha_contrato", $datos["fecha_contrato"], PDO::PARAM_STR);
        $stmt->bindParam(":id_usuario", $datos["id_usuario"], PDO::PARAM_INT);

        if ($stmt->execute()) {

            return "ok";
        } else {

            return print_r(Conexion::conectar()->errorInfo());
        }

        $stmt->close();

        $stmt = null;
    }

    /*=============================================
    registrar cuenta
    =============================================*/

    public static function mdlRegistrarCuentaBancaria($tabla, $datos)
    {

        $stmt = Conexion::conectar()->prepare("INSERT INTO $tabla(numero, titular, usuario, entidad, estado, tipo) VALUES (:numero, :titular, :usuario, :entidad, :estado, :tipo)");

        $stmt->bindParam(":numero", $datos["numero"], PDO::PARAM_INT);
        $stmt->bindParam(":titular", $datos["titular"], PDO::PARAM_INT);
        $stmt->bindParam(":usuario", $datos["usuario"], PDO::PARAM_INT);
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

    


}
