CLASS zcl_abap_dd_mpc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .


" EXPLICACIÓN ty_employee,
"
" Este código define un tipo de estructura local llamado TY_EMPLOYEE.
"
" La estructura contiene campos básicos del empleado como:
" EMPLOYEE_ID, FIRST_NAME, LAST_NAME, START_DATE y CATEGORY.
"
" Además, utiliza la sentencia INCLUDE TYPE para incorporar todos
" los campos de la estructura ZST_EMPL_ADDRESS_LGL dentro de esta
" estructura. Esto permite reutilizar la definición de dirección
" sin tener que declarar nuevamente todos sus campos.
"
" Finalmente, se cierra la definición de la estructura con
" END OF TY_EMPLOYEE.
*-----------------------------------------------------------------------

TYPES: BEGIN OF ty_employee,
         employee_id TYPE c LENGTH 10,
         first_name  TYPE zde_first_name_MPC,
         last_name   TYPE zde_last_name_MPC,
         start_date  TYPE zde_start_date_MPC,
         category    TYPE zde_job_category_MPC.
         INCLUDE TYPE zst_empl_address_MPC. "ES UN CONJUNTO DE INSTRUCCION INCLUDE TYPE. ESTRUCTURA PLANA
TYPES: END OF ty_employee.

*-----------------------------------------------------------------------
" EXPLICACIÓN RESUMIDA PARA EL ALUMNO
"
" Este código define una estructura local llamada TY_EMPLOYEE_NESTED.
"
" La estructura contiene los datos principales del empleado
" (ID, nombre, apellido, fecha de inicio y categoría).
"
" A diferencia del ejemplo anterior con INCLUDE TYPE, aquí la dirección
" se define como una subestructura completa llamada ADDRESS del tipo
" ZST_EMPL_ADDRESS_LGL.
"
" Esto crea una estructura anidada (nested structure), donde todos
" los campos de la dirección quedan agrupados dentro del componente
" ADDRESS.
*-----------------------------------------------------------------------
TYPES: BEGIN OF ty_employee_nested,
         employee_id TYPE c LENGTH 10,
         first_name  TYPE zde_first_name_MPC,
         last_name   TYPE zde_last_name_MPC,
         start_date  TYPE zde_start_date_MPC,
         category    TYPE zde_job_category_MPC,
         address     TYPE zst_empl_address_MPC, "ESTRUCTURA ANIDADA
       END OF ty_employee_nested.

"1.10 TIPO TABLAS CON CLAVE SECUNDARIA
*"DECLARAMOS un tipo en la definición y luego declaramos otro tipo en la implantación
*"PASO 1 - TAMBIÉN se puede poner abajo en la implantación
*
*TYPES: BEGIN OF ty_employee_secondary,
*         employee_id TYPE c LENGTH 10,
*         first_name  TYPE zde_first_name_MPC,
*         last_name   TYPE zde_last_name_MPC,
*         start_date  TYPE zde_start_date_MPC,
*         category    TYPE zde_job_category_MPC,
*         status type c length 1.
*         INCLUDE TYPE zst_empl_address_MPC.
*TYPES END OF ty_employee_secondary.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_abap_dd_mpc IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  "B7_ 1.4 ELEMENTO DE DATOS
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "-----------------------------------------------------------------------
" EXPLICACIÓN RESUMIDA PARA EL ALUMNO
"
" Este código muestra cómo declarar una variable en ABAP usando
" DATA y asignarle un valor de tipo texto.
"
" Primero se declara la variable LV_FIRST_NAME con el tipo de dato
" ZDE_FIRST_NAME_LGL (probablemente un elemento de datos definido
" en el diccionario ABAP).
"
" Después se asigna el valor 'First Name' a la variable usando
" el operador de asignación (=).
"-----------------------------------------------------------------------

"1.5 ESTRUCTURA PLANA
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*DATA lv_first_name TYPE ZDE_FIRST_NAME_MPC.
*
*lv_first_name = 'First Name'.
*
*
*"CREar ZST_employees_MPC
*
*DATA ls_employee TYPE zst_employees_MPC.
*
*ls_employee-employee_id = '001'.
*ls_employee-address_id = ''.
*
**-----------------------------------------------------------------------
*" EXPLICACIÓN RESUMIDA PARA EL ALUMNO
*"
*" Este código muestra cómo declarar una variable de tipo estructura
*" en ABAP y cómo asignar valores a sus campos.
*"
*" Primero se declara la variable LS_EMPLOYEE del tipo
*" ZST_EMPLOYEES_LGL (estructura definida previamente).
*"
*" Después se asignan valores a campos específicos de la estructura
*" usando la notación:
*"
*"     estructura-campo = valor
*"
*" En este caso se asigna un identificador de empleado y un
*" identificador de dirección.
**-----------------------------------------------------------------------

"1.6 ESTRUCTURA ANIDADA
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*
*DATA lv_first_name TYPE ZDE_FIRST_NAME_MPC.
*
*lv_first_name = 'First Name'.
*
*" CREAR zST_empl_address_mpc
*"CREar ZST_empl_MPC_ANIDADA
*
*DATA ls_employee TYPE zst_empl_MPC_ANIDADA.
*
*ls_employee-employee_id = '001'.
*ls_employee-address-address_id = ''.

"1.7 ESTRUCTURA CON INCLUDE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
**-----------------------------------------------------------------------
*" EXPLICACIÓN
*
*" Este código muestra cómo trabajar con una estructura que contiene
*" otra estructura (estructura anidada).
*"
*" Se declara la variable LS_G_EMPLOYEE del tipo ZST_EMPLOYEES_I_LGL.
*"
*" Luego se asigna un valor al campo ADDRESS_ID dentro de la
*" subestructura ADDRESS usando la notación:
*"
*"     estructura-subestructura-campo
*"
*" También se asigna un valor al campo ADDRESS_ID principal.
*"
*" Finalmente se muestran ambos valores con OUT->WRITE para ver
*" el contenido de cada campo en la salida.
**-----------------------------------------------------------------------
*DATA lv_first_name TYPE ZDE_FIRST_NAME_MPC.
*
*lv_first_name = 'First Name'.
*
*"crear ZST_EMPLOYEES_I_MPC
*
*
*DATA ls_g_employee TYPE zst_employees_i_MPC.
*
*ls_g_employee-address-address_id = '002'.
*ls_g_employee-address_id = '003'.
*ls_g_employee-address-address_id = '006'.
*
*out->write( ls_g_employee-address-address_id ).
*out->write( ls_g_employee-address_id ).
*
*"APUNTAMOS al mismo espacio en memoria por lo que el valor que queda es el último
*" CREAR ESTRUCTURA LOCAL VER EN DEFINICIÓN " EXPLICACIÓN ty_employee,
*
**-----------------------------------------------------------------------
*" EXPLICACIÓN RESUMIDA PARA EL ALUMNO
*"
*" Este código muestra la diferencia entre trabajar con una estructura
*" normal y una estructura anidada (nested structure).
*"
*" 1) LS_L_EMPLOYEE
*"    Es una estructura del tipo TY_EMPLOYEE donde los campos de
*"    dirección están incluidos directamente en la estructura.
*"    Por eso se puede acceder al campo ADDRESS_ID directamente.
*"
*" 2) LS_L_EMPLOYEE_NESTED
*"    Es una estructura del tipo TY_EMPLOYEE_NESTED donde la dirección
*"    está dentro de una subestructura llamada ADDRESS.
*"    Por eso se accede al campo usando:
*"       estructura-subestructura-campo
*"-----------------------------------------------------------------------
*
*DATA ls_l_employee TYPE ty_employee.
*ls_l_employee-address_id = '006'.
*
*DATA ls_l_employee_nested TYPE ty_employee_nested.
*
*ls_l_employee_nested-address-address_id = '007'.
*
*
*out->write( ls_l_employee-address_id ).
*out->write( ls_l_employee_nested-address-address_id ).

" 1.8 tipO TABLA
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*"ZTT_EMPL_ADDRESS_MPC
*
**-----------------------------------------------------------------------
*" EXPLICACIÓN
*"
*" Este código declara una tabla interna llamada LT_EMPLOYEE_ADDRESS.
*"
*" La tabla usa el tipo ZTT_EMPL_ADDRESS_LGL, que normalmente es un
*" tipo de tabla definido en el Diccionario ABAP basado en una
*" estructura de direcciones de empleado.
*"
*" Las tablas internas se utilizan para almacenar múltiples registros
*" en memoria y poder procesarlos dentro de un programa ABAP.
**-----------------------------------------------------------------------
*
**DATA lt_employee_address TYPE ZTT_EMPL_ADDRESS_MPC.
**
**"Al declarar una variable lt con TYPE hace referencia a tipo tabla ztt entonces tenemos itab interna que
**"Hereda todas las caracteríticas del tipo de acceso de los componentes que se han definido
**" de la clave (unica o unica)
*
**-----------------------------------------------------------------------
*" EXPLICACIÓN RESUMIDA PARA EL ALUMNO
*"
*" Este código muestra cómo acceder y modificar directamente un campo
*" de una fila específica dentro de una tabla interna.
*"
*" La tabla interna LT_EMPLOYEE_ADDRESS contiene múltiples registros
*" de direcciones. Usando la sintaxis:
*"
*"      tabla[ índice ]
*"
*" se accede a una fila concreta por su posición (en este caso la fila 1).
*"
*" Después se modifica el campo ADDRESS_ID de esa fila asignándole
*" un nuevo valor.
**-----------------------------------------------------------------------
*
**lt_employee_address[ 1 ]-address_id = ''.
*
*""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*" EXPLICACIÓN
*"
*" Este código muestra cómo trabajar con una tabla interna y una
*" estructura en ABAP.
*"
*" 1) Se declara una tabla interna LT_EMPLOYEE_ADDRESS del tipo
*"    ZTT_EMPL_ADDRESS_LGL (tipo tabla definido en el Diccionario).
*"
*" 2) Se declara una estructura LS_EMPLOYEE_ADDRESS del tipo
*"    ZST_EMPL_ADDRESS_LGL que representa una sola dirección.
*"
*" 3) Se asigna un valor al campo ADDRESS_ID de la estructura.
*"
*" 4) Finalmente se utiliza la sentencia APPEND para insertar la
*"    estructura como una nueva fila dentro de la tabla interna.
**-----------------------------------------------------------------------
*
DATA: lt_employee_address TYPE ztt_empl_address_MPC,
      ls_employee_address TYPE zst_empl_address_MPC.

ls_employee_address-address_id = '0001'.
APPEND ls_employee_address TO lt_employee_address.


"1.9 ESTRUCTURA PROFUNDA
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*-----------------------------------------------------------------------
" EXPLICACIÓN RESUMIDA PARA EL ALUMNO
"
" Este código define una estructura CDS profunda (Deep Structure)
" llamada zst_empl_mpc_deep que representa un empleado.
"
" La estructura contiene los datos básicos del empleado:
" - EMPLOYEE_ID
" - FIRST_NAME
" - LAST_NAME
" - START_DATE
" - CATEGORY
"
" Además incluye el campo ADDRESS que es una tabla interna del tipo
" ZTT_EMPL_ADDRESS_MPC. Esto significa que cada empleado puede tener
" múltiples direcciones asociadas.
"
" Este tipo de estructura se usa frecuentemente en servicios OData
" y modelos RAP cuando se necesitan relaciones 1:N (por ejemplo,
" un empleado con varias direcciones).
*-----------------------------------------------------------------------

" EXPLICACIÓN RESUMIDA PARA EL ALUMNO
"
" Este código muestra cómo trabajar con una estructura profunda
" (Deep Structure) que contiene una tabla interna.
"
" LS_EMPLOYEES_DEEP es una estructura del tipo ZST_EMPLOY_LGL,
" donde el campo ADDRESS es una tabla interna de direcciones.
"
" Primero se declara la estructura del empleado.
"
" Luego se utiliza APPEND para insertar una estructura de dirección
" (LS_EMPLOYEE_ADDRESS) dentro de la tabla interna ADDRESS que está
" dentro de la estructura LS_EMPLOYEES_DEEP.
"
" Es decir:
"   estructura → tabla interna → nueva fila
*-----------------------------------------------------------------------
*
*DATA ls_employees_deep TYPE ZST_EMPL_MPC_DEEP.
*
*APPEND ls_employee_address TO ls_employees_deep-address.
*
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"1.10. Tipo Tabla con Clave Secundaria - s = secondary
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*"PASO 2
*"clave primaria employee_id y clave secundaria cat_status
*" configuración opcional reservar espacio en memoria 50
*
**-----------------------------------------------------------------------
*" RESUMEN PARA EL ALUMNO
*"
*" Este código define:
*"
*" 1) Una estructura TY_EMPLOYEE_S que contiene los datos básicos
*"    del empleado y reutiliza los campos de dirección mediante
*"    INCLUDE TYPE.
*"
*" 2) Un tipo de tabla interna TT_EMPLOYEES_S de tipo SORTED TABLE
*"    con:
*"       - clave primaria única: EMPLOYEE_ID
*"       - clave secundaria: CAT_STATUS (CATEGORY + STATUS)
*"
*" 3) Una tabla interna GT_EMPLOYEES_S basada en ese tipo.
*"
*" 4) Un LOOP AT usando FIELD-SYMBOLS para recorrer la tabla
*"    directamente en memoria (más eficiente).
**-----------------------------------------------------------------------
*
*TYPES: BEGIN OF ty_employee_s,
*         employee_id TYPE c LENGTH 10,          "ID del empleado
*         first_name  TYPE zde_first_name_mpc,   "Nombre del empleado
*         last_name   TYPE zde_last_name_mpc,    "Apellido del empleado
*         start_date  TYPE zde_start_date_mpc,   "Fecha de inicio en la empresa
*         category    TYPE zde_job_category_mpc, "Categoría del puesto
*         status      TYPE c LENGTH 1.           "Estado del empleado (por ejemplo A/I)
*
*         INCLUDE TYPE zst_empl_address_mpc.     "Incluye todos los campos de la estructura de dirección
*
*TYPES: END OF ty_employee_s.                    "Fin de la estructura del empleado
*
*
*TYPES: tt_employees_s TYPE SORTED TABLE OF ty_employee_s
*       WITH UNIQUE KEY employee_id              "Clave primaria única basada en EMPLOYEE_ID
*       WITH NON-UNIQUE SORTED KEY cat_status COMPONENTS category status
*                                               "Clave secundaria para búsquedas por categoría y estado
*       "with further secondary keys initial size 50
*       .
*
*
*DATA gt_employees_s TYPE tt_employees_s.        "Declaración de la tabla interna de empleados
*
*
*LOOP AT gt_employees_s ASSIGNING FIELD-SYMBOL(<gs_employee>)
*                                               "Recorre la tabla usando FIELD-SYMBOL (referencia directa a la fila)
*
*  "Aquí se podrían modificar campos del registro directamente
*  "porque el FIELD-SYMBOL apunta a la fila real en memoria.
*
*  "iterar por la clave primaria
*    where employee_id between '0000000001' and '0000000100'.
*
*ENDLOOP.
*
*"Iterar sobre los componentes de la clave secundaria
*
**-----------------------------------------------------------------------
*" RESUMEN PARA EL ALUMNO
*"
*" Este código recorre la tabla interna GT_EMPLOYEES_S utilizando
*" una clave secundaria llamada CAT_STATUS.
*"
*" Gracias a esta clave secundaria (CATEGORY + STATUS), ABAP puede
*" acceder directamente a los registros que cumplen esas condiciones
*" sin recorrer toda la tabla, mejorando el rendimiento.
*"
*" Se usa FIELD-SYMBOL para trabajar directamente sobre la fila
*" encontrada en memoria.
**-----------------------------------------------------------------------
*
*LOOP AT gt_employees_s ASSIGNING FIELD-SYMBOL(<gs_employee_sec>)  "Recorre la tabla interna usando un field-symbol (referencia directa a la fila)
*
*     USING KEY cat_status                                         "Indica que se utilizará la clave secundaria CAT_STATUS
*
*     WHERE category EQ '01'                                       "Filtra registros donde CATEGORY = '01'
*       AND status   EQ 'A'.                                        "y STATUS = 'A'
*
*  "Aquí se procesarían los registros que cumplen la condición
*  "El field-symbol <gs_employee_sec> apunta directamente a la fila encontrada
*
*ENDLOOP.                                                           "Fin del recorrido de la tabla interna
*
*" lectura o read table / con try catch evitar excepciones (capturarla en una variable local lx)
*
**-----------------------------------------------------------------------
*" RESUMEN PARA EL ALUMNO
*"
*" Este código muestra cómo leer un registro de una tabla interna
*" usando una clave secundaria (CAT_STATUS) y cómo manejar la excepción
*" si el registro no existe.
*"
*" La lectura se realiza con la sintaxis moderna:
*"
*"     itab[ KEY key_name COMPONENTS ... ]
*"
*" Si no se encuentra ninguna fila que cumpla la condición,
*" ABAP lanza la excepción CX_SY_ITAB_LINE_NOT_FOUND.
*"
*" Por eso se utiliza TRY...CATCH para evitar que el programa
*" termine con error y poder gestionar la situación.
**-----------------------------------------------------------------------
*
*TRY.
*
*  "Lectura de la tabla interna usando la clave secundaria CAT_STATUS
*  "Busca un registro donde CATEGORY = '01' y STATUS = 'A'
*  DATA(gs_employees_s) = gt_employees_s[
*                          KEY cat_status
*                          COMPONENTS category = '01'
*                                     status   = 'A' ].
*
*CATCH cx_sy_itab_line_not_found INTO DATA(lx_itab_not_found).
*
*  "Si no se encuentra ninguna fila con esa clave,
*  "la excepción es capturada aquí
*
*ENDTRY.
*
*
*"PASO 3 INCORPORAR ESTA CONFIGURACION AL DICCIONARIO DE DATOS
*" PARA QUE SEA REUTILIZABLE
*
*"crear Table Type: ZTT_EMPL_STATUS_MPC
*" con estructura zst_empl_mpc_anidada incluyendo estatus
*" sorted con clave primaria unica y clave sencundaria no unica componentes
*"declarar variable
*
**-----------------------------------------------------------------------
*" RESUMEN PARA EL ALUMNO
*"
*" Este código declara una tabla interna llamada GT_EMPLOYEES_DD.
*"
*" La tabla utiliza el tipo ZTT_EMPLOYEES_STATUS_LGL, que normalmente
*" es un tipo de tabla definido en el Diccionario ABAP (DDIC).
*"
*" Los tipos ZTT_* suelen ser Table Types basados en una estructura
*" (por ejemplo ZST_*), y permiten almacenar múltiples registros
*" en memoria para procesarlos dentro de programas ABAP.
*"
*" Esta tabla interna probablemente almacenará empleados junto
*" con su estado (STATUS) definido en el modelo de datos.
**-----------------------------------------------------------------------
*
*DATA gt_employees_dd TYPE ZTT_EMPL_STATUS_mpc.   "Tabla interna basada en un Table Type del Diccionario ABAP
*
*LOOP AT gt_employees_dd ASSIGNING FIELD-SYMBOL(<gs_employee_sec_dd>)  "Recorre la tabla interna usando un field-symbol (referencia directa a la fila)
*
*     USING KEY cat_status                                         "Indica que se utilizará la clave secundaria CAT_STATUS
*
*     WHERE category EQ '01'                                       "Filtra registros donde CATEGORY = '01'
*       AND status   EQ 'A'.                                        "y STATUS = 'A'
*
*
*ENDLOOP.

"1.10. Tipo Tabla ANIDADA
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"paso 1 CREAR en diccionario de datos un nuevo tipo de tabla
" ZTT_EMPLOYEE_NESTED_MPC
" como es anidada el tipo de linea es un tipo de estructura profunda (que uno o varios de sus componentes
" puede apuntar a un tipo tabla)

" paso 2 declarar variable con el tipo tabla anidada

" paso 3 iterar con un puntero . Como es una tabla tenemos día tenemos que hacer uso del índice

" paso 4 crear un bucle anidado


*-----------------------------------------------------------------------
" RESUMEN PARA EL ALUMNO
"
" Este código muestra cómo trabajar con una estructura profunda
" (Deep Structure) que contiene una tabla interna anidada definida
" en el Diccionario ABAP (DDIC).
"
" El tipo ZTT_EMPLOYEES_NESTED_LGL es un Table Type definido en el
" diccionario que contiene empleados, y cada empleado tiene una
" tabla interna ADDRESS con múltiples direcciones.
"
" El programa realiza tres operaciones principales:
"
" 1) Recorre la tabla de empleados LT_NESTED_EMPLOYEES.
" 2) Lee la primera dirección de cada empleado usando la sintaxis
"    moderna VALUE #( ... OPTIONAL ) para evitar errores si no existe.
" 3) Recorre todas las direcciones del empleado y modifica el campo
"    ADDRESS_ID usando FIELD-SYMBOLS (acceso directo en memoria).
*-----------------------------------------------------------------------

DATA lt_nested_employees TYPE ztt_employee_nested_mpc.  "Tabla interna profunda definida en el Diccionario

LOOP AT lt_nested_employees ASSIGNING FIELD-SYMBOL(<ls_nested_employees>).
"Recorre la tabla de empleados usando FIELD-SYMBOL o apuntador (referencia directa a la fila)

  DATA(ls_first_address) = VALUE #( <ls_nested_employees>-address[ 1 ] OPTIONAL ).
  "Lee la primera dirección del empleado (indice 1 = primera dirección)
  "OPTIONAL evita excepción si la tabla ADDRESS está vacía

  LOOP AT <ls_nested_employees>-address ASSIGNING FIELD-SYMBOL(<ls_address>).
  "Recorre la tabla interna ADDRESS que está dentro de la estructura del empleado

    <ls_address>-address_id = ''.
    "Modifica el campo ADDRESS_ID directamente en la fila de la tabla interna

  ENDLOOP.

ENDLOOP.

  ENDMETHOD.
ENDCLASS.
