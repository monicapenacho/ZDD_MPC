CLASS zcl_gtt_mpc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_gtt_mpc IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  "2.10. Tabla Global Temporal
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " 1.- CREAR TABLA INTERNA TIPO TABLA GLOBAL TEMPORAL
  " PARA HACER INTERESECCIONES Y TRANSFORMACIONES
  " 2.- empujar los datos a zempl_mpc desde lt_employees
  " ESTAMOS EN EL ESTADO INTERMEDIO (ver gráfico word 2.9)
  " 3.- Selección con inner join para acceder a otras fuentes de datos

  "-----------------------------------------------------------------------
" Ejemplo de uso de una GLOBAL TEMPORARY TABLE (zempl_lgl)
*"
*" zempl_mpc es una tabla temporal en la base de datos SAP HANA.
*" Los datos insertados en ella solo existen durante la sesión o la
*" transacción actual y se eliminan automáticamente después.
*"
*" El código muestra tres pasos:
*" 1. Crear una tabla interna con la estructura de la tabla temporal
*" 2. Insertar los datos de la tabla interna en la tabla temporal
*" 3. Leer los datos de la tabla temporal usando un SELECT con JOIN
*"-----------------------------------------------------------------------
*
*data lt_employees type standard table of zempl_MPC.     "Se declara una tabla interna llamada lt_employees con la misma estructura que la tabla temporal zempl_lgl
*
*insert zempl_MPC from table @lt_employees.              "Inserta todos los registros de la tabla interna lt_employees dentro de la tabla temporal zempl_lgl
*                                                         "ESTAMOS EN EL ESTADO INTERMEDIO
*
*select from zempl_MPC                                   "Inicio de una sentencia SELECT que leerá datos desde la tabla temporal zempl_lgl
*       inner join                                       "Se indica que la lectura utilizará un INNER JOIN con otra tabla o fuente de datos
*
*  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-----------------------------------------------------------------------
" Ejemplo de uso de una tabla GLOBAL TEMPORARY (zempl_lgl)
"
" Una GLOBAL TEMPORARY TABLE en SAP HANA guarda datos solo durante la
" sesión o transacción actual. Los registros insertados se eliminan
" automáticamente al finalizar la sesión o la unidad lógica de trabajo.
"
" En este código:
" 1. Se insertan datos directamente en la tabla temporal usando VALUE #
" 2. Se leen los datos con un SELECT
" 3. Se muestran los datos si existen, o un mensaje si la tabla está vacía
"-----------------------------------------------------------------------

insert zempl_MPC from table @( value #( ( emp_id     = '00001'      "Inserta en la tabla temporal un registro creado dinámicamente con VALUE # y asigna el valor '00001' al campo emp_id
                                           first_name = 'John'       "Asigna el valor 'John' al campo first_name dentro del registro que se está creando
                                           last_name  = 'Smith' ) ) ). "Asigna el valor 'Smith' al campo last_name y cierra la creación del registro y la inserción en la tabla temporal

select from zempl_MPC                                      "Inicio de una sentencia SELECT que leerá datos desde la tabla temporal zempl_lgl
       fields *                                            "Indica que se seleccionarán todos los campos de la tabla
       into table @data(lt_employees).                     "Guarda el resultado del SELECT en una tabla interna llamada lt_employees creada automáticamente con DATA(...)

if sy-subrc eq 0.                                          "Comprueba el código de retorno del SELECT; 0 significa que se encontraron registros
  out->write( lt_employees ).                              "Muestra el contenido de la tabla interna lt_employees en la salida del programa
else.                                                      "Se ejecuta si el SELECT no devuelve registros
  out->write( |No data| ).                                 "Escribe el texto 'No data' indicando que la tabla temporal está vacía
endif.

" ver que tras la ejecución = f9 en la base de datos zempl_mpc no tenemos datos
" si comentamos la parte de insert - observamos al ejecutar f9 que no hay datos

"-----------------------------------------------------------------------
" Ejemplo de manejo de datos en una GLOBAL TEMPORARY TABLE (zempl_lgl)
"
" zempl_lgl es una tabla global temporal en SAP HANA. Los datos que se
" insertan en este tipo de tablas existen solo durante la sesión o la
" unidad lógica de trabajo (LUW). Las operaciones de DELETE, COMMIT y
" ROLLBACK afectan a los datos almacenados temporalmente.
"
" En este fragmento:
" 1. Se eliminan los registros de la tabla temporal - uso recomendable opcional antes del endmethod de una tabla temporal
" 2. Se confirma la transacción con COMMIT WORK
" 3. Se muestra un ejemplo de ROLLBACK WORK para deshacer cambios

" con estos tres comandos evitamos un error dump
"-----------------------------------------------------------------------

delete from zempl_mpc.   "Elimina todos los registros existentes en la tabla global temporal zempl_lgl
*
*commit work.             "Confirma la transacción actual en la base de datos, haciendo permanentes los cambios dentro de la unidad lógica de trabajo
*
*rollback work.           "Revierte los cambios realizados en la transacción actual si aún no se han confirmado

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" zempl_mpc -> limite 15 columnas


  ENDMETHOD.
ENDCLASS.
