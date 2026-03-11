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
" 2 configuraciones que se pueden aplicar a las tablas de persistencia
" en el entorno abap en el mismo paquete de desarrollo

*@EndUserText.label : 'Invoices Tabla base de datos'
*@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
*@AbapCatalog.tableCategory : #TRANSPARENT

*@AbapCatalog.deliveryClass : #A

    "CLASES DE ENTREGA
    "acceso con ctrl espacio

*    Clase   Tipo de datos   Transporte
*    A   datos de aplicación normalmente no
"        FIN tabla que almacena datos maestros (cliente, materiales ...) y datos transaccionales
"        DEPENDEN del mANDANTE
*    C   configuración por cliente   sí
"        FIN Tablas de parámetrización o customizing table
"        Configuraciones que el cliente va a necesitar por ej clases por el tipo de iva
"        url para llamar al web service. No queremos incluir en el código fuente datos de configuración
"        se pueden transportar en diferentes ambientes (orden de transporte de tipo customizing)
*    L   datos temporales    no
"        fin tablas para tener datos temporales (ej copias de clientes instalaciones etc
*    G   configuración global    sí
"        fin tabla de personalización, protegida contra actualización de sap
"        Los datos de estas tablas no se pueden modificar ni eliminar por sap
"
*    E   tablas del sistema  gestionadas por SAP
"         fin tablas de control
"    S      tabla estándar SAP con datos        SAP
"           Tabla del sistema, mantenimiento solo por sap , cambio = modificación
"    W     tabla SAP ampliable     SI
"          Tablas con contenido transportable en los diferentes entornos por los administradores de sist




*@AbapCatalog.dataMaintenance : #RESTRICTED

" CATALOGO DATA MANTENIMIENTO

*Opción  Qué permite
*#ALLOWED    insertar / modificar / borrar
*#RESTRICTED mantenimiento limitado (con restricciones) y visualización
*#NOT_ALLOWED    no se puede mantener. Los datos no se pueden visualizar ni modificar
*#DISPLAY    solo visualizar

" word click derecho generate abap repository objects

"Cambiamos a C @AbapCatalog.deliveryClass : #C

" generate abap repository object - managed object - next
" otro error - no tiene sentido tener una tabla de parametrizaciones
"si no permitimos modificaciones


" cambiamos a Allowed



*@AbapCatalog.dataMaintenance : #ALLOWED




" 2.7. Incluir estructuras en Tablas
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" En la def de las tablas en abap
" Es posible hacer referencia a los componentes de una estructura
" como columnas de la tabla de persistencia
" utilizando un INCLUDE
" EJ AGREgar más columnas en la tabla zinvoice_mpc

*Opción 1
*Copiar y pegar todos los componentes de la estructura ZST_EMPL_ADDRESS_MPC en la tabla zinvoice_mpc
*
*Como columnas dentro de la tabla de persistencia
*Si tenemos que usar la misma estructura en múltiples tablas tenemos que realizar la copia de la misma manera sin ninguna referencia a la estructura.
*Son dos objetos que no dependen de ninguna manera uno de otro
*No tienen dependencia
*Y además si más adelante se solicita la ampliación de un nuevo componente o campo para los datos de dirección tenemos que ir tabla por tabla haciendo el mismo cambio
*En cambio si referenciamos con un include en todas las tablas a la misma estructura en el momento que se solicita una ampliación es suficiente ampliar la estructura con un nuevo componente
*Que se va a reflejar en la definición de todas las tablas donde se utiliza la estructura
*
*Opción 2 include para referencia a la estructura
*Deshacemos opción 1 que es una mala praxis
*1º indicar por un grupo  ej add de address : include y después el nombre de la estructura zst

"incluir en la tabla zinvoice_mpc un campo
"add : include zst_empl_address_mpc;

"Se puede poner nombre address la recomendación es asignar 3 caracteres en el grupo add

" activar y ver la bbdd

" with suffix (max 3 caracteres)
" ad1 ad2 porque queremos almacenar la información con la dirección del cliente y con la dirección de entrega
" para no duplicar campos agregamos un sufijo en el include
" f8


" 2.8. Campos, Importe y Cantidad
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"zinvoice_mpc

" importe - moneda que le corresponde
" cantidad - unidad de medida que le corresponde
" hay que conocer como referenciarlos a las monedas y u.m. respectivamente en las tablas de persistencia
*Incluir en zinvoice_mpc los nuevos campos (lo ideal con un dominio)
*Amount - Curr = currency (longitud, decimales) es un tipo predefinido. Sale un mensaje de error porque se desconoce cuál es la clave de la moneda . Tenemos que referenciar e incluir en cada columna de amount la anotación de cuál es la clave de la moneda
*Currency_key = clave de la moneda  cuky = tipo predefinido
*Es posible tener múltiples monedas
*Seguimos con el error  porque falta referenciar amount con currency_key
*Incluimos delante de amount @semantics – ‘tabla de referencia.columna de moeda.’
*El mismo proceso para cantidad y unidad de medida

*@EndUserText.label : 'Invoices Tabla base de datos'
*@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
*@AbapCatalog.tableCategory : #TRANSPARENT
*@AbapCatalog.deliveryClass : #A
*@AbapCatalog.dataMaintenance : #RESTRICTED
*define table zinvoice_mpc {
*
*  key client     : abap.clnt not null;
*  key invoice_id : abap.char(10) not null;
*  key comp       : abap.char(4) not null;
*  customer       : abap.char(30);
*  status         : abap.char(1);
*  @Semantics.amount.currencyCode : 'zinvoice_mpc.currency_key'
*  amount         : abap.curr(16,2);
*  currency_key   : abap.cuky;
*  @Semantics.quantity.unitOfMeasure : 'zinvoice_mpc.unit'
*  quantity       : abap.quan(10,2);
*  unit           : abap.unit(3);
*  created_by     : abap.char(12);
*  add            : include zst_empl_address_mpc;
*  ad2            : include zst_empl_address_mpc with suffix ad;
*  ad3            : include zst_empl_address_mpc with suffix ad3;
*
*}

"quitar cantidad


" 2.9. Indice
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"zinvoice_mpc

" Table Index: ZINVOICE_MPC~CUS

" ver word

*Un índice de tabla sirve para acelerar búsquedas en la base de datos.
*Propiedad   Qué hace
*Unique Index    no permite duplicados - mejora tiempos de respuestas
*Index on Table Buffer only  índice solo en memoria. sólo aplica a las tablas que tienen el buffer activo
*Fuzzy Search Index  búsqueda borrosa o aproximada - habilita la capacidad de la base de datos para búsquedas avanzadas
*Index Fields    campos que forman el índice. Agregar los nombres de las columnas a indexar

"2.10. Tabla Global Temporal
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ver word
" DICCIONAR NUEVA TABLA BASE DE DATOS
" ZEMPL_MPC      - GLOBAL TEMPORARY TABLE - VER WORD
" ZCL_GTT_MPC    - VER ZCL

*
*@EndUserText.label : 'Employees - Global Temporal Table'
*@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
*@AbapCatalog.tableCategory : #GLOBAL_TEMPORARY
*@AbapCatalog.deliveryClass : #A
*@AbapCatalog.dataMaintenance : #RESTRICTED
*
*define table zempl_lgl {
*
*  key client     : abap.clnt not null;
*  key emp_id     : abap.numc(5) not null;
*
*  first_name     : zde_first_name_lgl;
*  last_name      : zde_last_name_lgl;
*
*}


  ENDMETHOD.
ENDCLASS.
