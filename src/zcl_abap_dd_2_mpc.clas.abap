CLASS zcl_abap_dd_2_mpc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_abap_dd_2_mpc IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


" bloque 7 2. tabla de base de datos
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 7.1 conceptos
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"7.2 tabla de base de datos
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*-----------------------------------------------------------------------
" RESUMEN PARA EL ALUMNO
"
" Este código muestra la creación de una tabla de base de datos
" en el Diccionario ABAP (ABAP Dictionary) utilizando DDL Source
" desde ADT (Eclipse).
"
" La tabla ZINVOICE_LGL almacenará información de facturas.
"
" Se definen:
"  • Anotaciones del catálogo ABAP (metadatos técnicos)
"  • La clave primaria de la tabla
"  • Los campos que formarán la estructura de la tabla
"
" La clave primaria está compuesta por:
"     CLIENT + INVOICE_ID + COMP
"
" Esto significa que no puede existir más de un registro con la
" misma combinación de esos tres campos.
"
" Este tipo de definición es la forma moderna de crear tablas
" en S/4HANA y ABAP Cloud usando DDL.
*-----------------------------------------------------------------------
*
*@EndUserText.label : 'Invoices'                       "Etiqueta funcional de la tabla visible para el usuario
*@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE   "La tabla no permite extensiones
*@AbapCatalog.tableCategory : #TRANSPARENT             "Define que es una tabla transparente en la base de datos
*@AbapCatalog.deliveryClass : #A                       "Clase de entrega A = datos de aplicación
*@AbapCatalog.dataMaintenance : #RESTRICTED            "Mantenimiento de datos restringido
*
*define table zinvoice_lgl {                           "Definición de la tabla de base de datos
*
*  key client     : abap.clnt not null;                "Campo mandante (CLIENT) obligatorio para tablas dependientes de cliente
*
*  key invoice_id : abap.char(10) not null;            "Identificador único de la factura
*
*  key comp       : abap.char(4);                      "Código de compañía (parte de la clave primaria)
*
*  customer       : abap.char(30);                     "Identificador del cliente
*
*  status         : abap.char(1);                      "Estado de la factura (por ejemplo: A=Activa, C=Cancelada)
*
*  created_by     : abap.char(12);                     "Usuario que creó la factura
*
*}


"2.3. Inserción de datos
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"zinvoice_mpc  -> diccionario tabla bbdd  pinchar en sql console - sin datos
" crear una clase ZCL_INV_DATA_GEN_MPC


"2.4. Configuraciones Técnicas
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ver word
" tipo de almacenamiento cómo se va a guardar en la capa de persistencia
*Row Store   optimizado para operaciones rápidas por fila
*    Ej para tablas a las que se accede con select single que devuelve un único registro
*Y luego hacer la agregación
*Column Store    optimizado para análisis y lecturas masivas
" buffer
" log store

" 2.5. Tipos de ampliaciones y Categorías
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

*@EndUserText.label : 'Invoices'                       "Etiqueta funcional de la tabla visible para el usuario

*@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE   "La tabla no permite extensiones

" CATEGORIA DE LA AMPLIACION

" esta anotación permite indicar cómo es posible ampliar la tabla o la definición de la tabla
" a través de los posibles valores que se pueden asignar (ctrl space)
    " NOT EXTENSIBLE valor por defecto: la tabla NO SE puede ampliar
    " EXTENSIBLE CHARACTER Estructura plana con componentes de tipo caracter
    " EXTENSIBLE CHARACTER NUMERIC todos los componentes deben ser planos
    " EXTENSIBLE ANY es posible extender la tabla sin ninguna restricción anterior

" ver abap development objetct (icono carpeta)
    " permite buscar objetos del repositorio abap en el mismo servidor de aplicaciones
    " En el historial de búsqueda tengo la tabla t005 -
    " es la abla donde sap mantiene el código de los países
    " observamos que la categoría de la ampliación es un extensible character numeric
    " que permite agregar definiciones d euna manera plana
    " con f8
    "No tenemos permisos para ver los datos de esta tabla
    "Aún así esta tabla se está usando en una entidad cds
    " Sin accedemos a icountry
    " vemos que se realiza una selección a la tabla t005
    " f8
    " Podemos navegar a través de la asociación (OTRO concepto de los cds para ver los textos
    " que corresponden a la entrada del país seleccionado en este caso Andorra)
    " nota cds = core data services
    "Siendo s España es posible filtrar por la clave del idioma
    "Se puede ir modificando el filtro a la derecha



*@AbapCatalog.tableCategory : #TRANSPARENT             "Define que es una tabla transparente en la base de datos

" CATEGORÍA DE LA TABLA

" 2 tipos
    "TRANSPARENT : categoria por defecto = TABLAS DE PERSISTENCIA
                    "Tipo de objeto que permite guardar la info en la bbdd
                    " estructura minima que se necesita para guardar la inofrmación en la base de datos

    " GLOBAL_TEMPORARY : admite el guardado de la info durante un contexto de ejecución
                        " no va a persistir la info en tiempo



*@AbapCatalog.deliveryClass : #A                       "Clase de entrega A = datos de aplicación
*@AbapCatalog.dataMaintenance : #RESTRICTED            "Mantenimiento de datos restringido
*
*define table zinvoice_lgl {                           "Definición de la tabla de base de datos
*
*  key client     : abap.clnt not null;                "Campo mandante (CLIENT) obligatorio para tablas dependientes de cliente
*
*  key invoice_id : abap.char(10) not null;            "Identificador único de la factura
*
*  key comp       : abap.char(4);                      "Código de compañía (parte de la clave primaria)
*
*  customer       : abap.char(30);                     "Identificador del cliente
*
*  status         : abap.char(1);                      "Estado de la factura (por ejemplo: A=Activa, C=Cancelada)
*
*  created_by     : abap.char(12);                     "Usuario que creó la factura
*
*}


" 2.6. Clases de entrega y Mantenimiento de datos
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

























  ENDMETHOD.
ENDCLASS.
