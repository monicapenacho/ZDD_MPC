CLASS zcl_inv_data_gen_mpc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    " bloque 7
    "2.3. Inserción de datos
    """"""""""""""""""""""""""""""""
    " paso 1  definir constantes para los distintos estados de las facturas.
    " como miembro estático de la clase
    "-----------------------------------------------------------------------
    " RESUMEN

    "
    " Este código define una clase ABAP llamada ZCL_INV_DATA_GEN_LGL.
    "
    " La clase implementa la interfaz IF_OO_ADT_CLASSRUN, lo que permite
    " ejecutar la clase directamente desde ADT (Eclipse) como un programa
    " de consola.
    "
    " Dentro de la sección pública se definen varias constantes que
    " representan los posibles estados de una factura.
    "
    " Cada constante tiene longitud 1 y guarda un código de estado:
    "
    "   P → Paid (Pagada)
    "   U → Unpaid (No pagada)
    "   O → Overdue (Vencida)
    "   C → Cancelled (Cancelada)
    "   ' ' → Posted o estado inicial
    "
    " Estas constantes permiten evitar el uso de valores "hardcoded"
    " dentro del programa y mejorar la legibilidad del código.
*-----------------------------------------------------------------------

    INTERFACES if_oo_adt_classrun.        "Permite ejecutar la clase desde ADT (modo consola)

    CONSTANTS:                            "Definición de constantes para estados de factura

      c_payed     TYPE c LENGTH 1 VALUE 'P',   "Factura pagada (Paid)

      c_unpayed   TYPE c LENGTH 1 VALUE 'U',   "Factura no pagada (Unpaid)

      c_overdue   TYPE c LENGTH 1 VALUE 'O',   "Factura vencida (Overdue)

      c_cancelled TYPE c LENGTH 1 VALUE 'C',   "Factura cancelada (Cancelled)

      c_posted    TYPE c LENGTH 1 VALUE 'X'.   "Estado inicial o contabilizado (Posted)

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_inv_data_gen_mpc IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    "PASO 2 delete from para eliminar todos los registros ¡ojo MUY PELIGROSO = PERDIDA DATOS!!
    "modify para poder ejecutar múltiples veces el método main

*-----------------------------------------------------------------------
   " RESUMEN P
   "
   " Este código realiza una carga de datos de ejemplo en la tabla de base
   " de datos ZINVOICE_LGL.
   "
   " 1) Primero elimina todos los registros existentes de la tabla.
   " 2) Luego inserta varios registros usando la sentencia moderna
   "    MODIFY ... FROM TABLE junto con VALUE #( ).
   "
   " VALUE #( ) permite crear una tabla interna "inline" con múltiples
   " registros que luego se insertan o actualizan en la tabla de base
   " de datos.
   "
   " Los valores de STATUS se toman de constantes definidas en la clase
   " (c_payed, c_overdue, c_posted, etc.).
   "
   " El campo CREATED_BY se rellena con el usuario técnico actual usando
   " la clase CL_ABAP_CONTEXT_INFO.
   "
   " Este patrón es muy común en ABAP moderno para cargar datos de prueba
   " o inicializar tablas en SAP S/4HANA.
*-----------------------------------------------------------------------

   DELETE FROM zinvoice_mpc.   "Elimina todos los registros de la tabla de facturas


   MODIFY zinvoice_mpc FROM TABLE @( VALUE #(

      ( invoice_id = '1'         "Factura 1
        comp       = '1010'      "Compañía
        customer   = 'Coca-Cola' "Cliente
        status     = c_payed     "Estado: pagada
        created_by = cl_abap_context_info=>get_user_technical_name( ) ) "Usuario actual

      ( invoice_id = '2'         "Factura 2
        comp       = '1020'
        customer   = 'Pepsi'
        status     = c_overdue   "Estado: vencida
        created_by = cl_abap_context_info=>get_user_technical_name( ) )

      ( invoice_id = '3'         "Factura 3
        comp       = '1030'
        customer   = 'Nestle'
        status     = c_posted    "Estado: registrada
        created_by = 'CB999999993' )

      ( invoice_id = '4'         "Factura 4
        comp       = '1050'
        customer   = 'Pringles'
        status     = c_payed
        created_by = 'CB999999993' )

      ( invoice_id = '5'         "Registro adicional de ejemplo
        comp       = '1020'
        customer   = 'Milka'
        status     = c_cancelled
        created_by = 'CB999999994' )

    ) ).

"INSERT  Inserta un registro nuevo   Cuando sabes que no existe
"MODIFY  Inserta o actualiza Cuando puede existir

    "paso 3 verifiicar consola vacía

    "paso 4 verificar en la tabla de base de datos la carga de los datos - run (ver word)

    "paso 5 verificar si operación ok


    "
" Este código verifica si una operación sobre la base de datos
" (INSERT, MODIFY, UPDATE o DELETE) se ejecutó correctamente.
"
" SY-SUBRC indica si la operación fue exitosa (0 = éxito).
"
" SY-DBCNT indica cuántos registros fueron afectados por la operación.
"
" Si la operación fue correcta, se muestra en consola el número
" de registros modificados.
*-----------------------------------------------------------------------

IF sy-subrc EQ 0.                    "Comprueba si la operación SQL fue exitosa

  out->write( |{ sy-dbcnt } rows affected| ).
                                     "Muestra cuántas filas fueron afectadas en la base de datos

ENDIF.                                "Fin de la verificación

" ya existen datos (con una lógica incrementada manualmente - 5 registros
  ENDMETHOD.

ENDCLASS.
