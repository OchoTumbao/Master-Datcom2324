# Preparando los datos

El EDA no es solo ponerse a mirar los datos, el 80% del tiempo del EDA lo dedicas a la parte de preparación de datos. Vamos a ver como podemos comprobar que los datos esten bien, y como podemos hacer el Analisis de componentes principales. No tanto la base matematica, sino de forma programatico y que información podemos sacar de ese analisis

## Corrigiendo los datos para la consistencia

Estas borracho si crees que los datos que te van a venir van a estar bien. Tienes que lidiar con muchos problemas

- Coerción de tipos
 Esto consiste en convertir un dato de un tipo a otro tipo
  - Las fechas, las fechas son un por culo. 
    - El paquete Tidyverse nos facilita mucho las cosas porque utiliza una gramatica similar para todo.  Para las fechas tu paquete el lubridate. Cuando recibas datos de fechas que por ejemplo hayan tomado varias personas, en fechas diferentas por personas diferentes. Cada persona va a apuntar la fecha como le de la real gana. 15 Feb 13, DD/MM/YYYY DD-MM-YYYY etc etc.. Lubridate tiene codificado casi todas las formas de nombrar una fecha de forma interna y usando la funcion dmy(vector de fechas como le den la gana) te lo convierte ya en fechas en formato yyyy-mm-dd Tambien otra cosa importante es que una fecha en si misma no es importante, pero lo relevante son las diferencias entre fechas. En general cuando tenemos fechas tenemos que pensar en intervalos de tiempo interesantes. Lubridate tiene la función difftime(date2,date1) que nos da las diferencias entre dos fechas. Tambien, para una fecha deterinada lubridate nos permite extraer una parte concreta de una fecha, sea el dia de la semana, el mes, el dia del mes, el dia del año. Controlando ya si el año es bisiesto, si el mes tiene 30 o 31 dias.

  - Recodificación de factores
    - Como sabemos un factor es un vector categorico con niveles. Siendo los niveles los valores posibles que puede tomar la variable. Muchas veces te vas a encontrar que te van a pasar datos, por ejemplo de sexo. Y te lo han apuntado como M,H,male,female,fem,F,Female etc etc... si trabajamos directamente con esos factores tenemos 7 categorias cuando realmente hay 2. Esto es un caso facil, porque bueno, sabes cuales son las categorias. Pero imaginate que tienes datos de sensores y no sabes donde estan los limites. A veces tienes un interlocutor y le puedes preguntar. Sobre todo si la empresa es seria. Pero otras veces no tienes. Que es lo que se hace ahi? Pues primero quitar los espacios en blanco, pasar todo a mayusculas o minusculas y despues, ya con todos los factores que pueden ser problematicos eliminados hay que buscar similitudes entre las cadenas. ESO ES UN CO ÑA ZO. La solución es utilizar forcats, una libreria de tidyverse. Esta libreria funciona como dplyr, con verbos. 
      - fct_reorder(): Reorder nos permite reordenar los factores en base a otra variable
      - fct_infreq(): Podemos reordenar segun la frecuencia
      - fct_relevel: Cambiar el orden de los factores a mano
      - fct_lump(): Comprime los factores, coge las clase menos frecuentes y las mezcla todas en una categoria unica "otros" mutate
      - fct_collapse(): Nos permite colapsar factores en nuevos con menos niveles, util cuando estamos hablando del caso anterior donde nos han dado el genero de muchisimas formas
      - fct_anon(): para anonimizar los datos, es muy importante en el mundo actual y es mas comodo
    

- Valores perdidos
  - Este es uno de los problemas mas complicados, un valor faltante puede ocurrir por que los datos no se hayan puesto bien, que no se hayan medido bien, que lo hayan codificado de forma incorrecta. Un blanco en una celda no tiene porque significar lo mismo en cada caso. Imaginate que hablamos de Salario, Si esa casilla esta en blanco puede ser que haya un sesgo de alguien que cobra mucho o poco y le de verguenza. Y entonces todos tus datos son casos medias. O en un tema de medida. En ese caso un valor de 0 NO ES IGUAL A UN VALOR VACIO. Depende del contexto. Antes de empezar ningun analisis hay que ver que coño hacemos con los missing values. Consejo muy importante. POR FAVOR, POR EL AMOR DE CRISTO GUARDA UN DATASET EN PURO, SIN HACER NINGUN TIPO DE CAMBIO. UN RAW DATA. Podemos tener problemas de extracción de los datos, suponte por ejemplo extraidos de internet. Y te falta algo, puede ser que en ese momento el servidor estuviera caido.  Tratando prolemas que no sea tecnicos tenemos las siguientes categorias
    - Datos que se pierden al azar. Hay la misma probabilidad para cada una de las celdas de que el dato este o no este. 
    - Datos "Al azar". El numero de NA varian en funcion de variables. Imaginate que tienes datos de velocidad, para dos sensores que estan muy cerca en algun dispositivo. Y ves que hay datos perdidos al azar en esos valores.
    - Datos perdidos que dependen de observaciones no medidas: Discomfort, este es el caso donde por ejemplo le preguntas la edad a una mujer, entre los 40 y 60 años de normal les puede dar cosas. Coño pues un missing value hay te puede dar una clase latente
    - Variables que dependen del valor en si mismo: Ejemplo del salario de antes

  - Estas dos ultimos tipos puedes hacer imputaciones, a partir de otros datos del dataset
  - Que podemos hacer con los missing values?
    - ME LOS CARGO. Buena campeon, te has quedado sin trabajo. Esto hay que saber si podemos hacerlo o no, si tenemos un dataset pequeño igual cargarte los NA puede ser cargarte un 20% del dataset. Si tenemos big data a cholon pues igual si te da mas igual
    - Me cargo las variables
    - Hago las variables cateooricas con bining
    - Remplazo los valores por el valor medio, mediana etc etc
    - Imputacion

  - Para quitarte los missing values hay una funcion na.omit() que se carga cualquier columna con un NA
  - Hay una función complete.cases() o drop_na() que te deja ver el dataset sin NA
  - Puedes convertir valores en NA porque te los hayan marcado de alguna forma. Ahora esta muy de moda poner un valor de -9 a un NA y ahi cagaste infinito
  - ANTES DE HACER NADA intenta comprender la distrbución de NA, en la libreria mice hay una funcion md.pattern, pero mejor utiliza paquetes como VIM y como Amelia, VIM te va a mostrar para cada columna de variables que filas tienen missing values, y nos da un histograma para cada columna, o una tabla, o lo que tu quieras. Amelia  nos da un grafico muy chulo
  - Para imputar un dato perdido podemos utilizar por ejemplo la media, pero eso tienes que tener cuidado. Tambien puedes poner un valor parecido a partir de otros perfiles que si conoces. Tambien puede pasar que tu tengas un conocimiento del tema, y a partir de tu conocimiento puedas imputar un valor (yo se que a partir de los 80 años te retiran el carnet, yo veo un NA en una variable carnet o no carnet de una persona que tiene 80 años, asumo que no lo tiene). Puedo imputar por KNN o por interpolación. Pero esto son tecnicas mas sofistiadas que ahora no veremos. En este curso de normal utilizaremos la media, la mediana o el conocimiento heuristico.

- Valores duplicados
  - Puede pasarte que haya un caso que este dos veces, es un error? es azar? es porque resulta que hay muestras diferentes con un valor identico?, ya ahi depende del caso, y tienes que mirar y ser listo. PUedes usar la funcion unique y duplicated para verlos y eliminarlos
  
- Normalización de los datos
  - En la gran mayoria de modelos de aprendizaje automatico las medidas muy altas van a dominar. Es importante que todas las variables esten dentro de un mismo rango para que tengan la misma importancia para el algoritmo. Para ello normalmente se escalan las variables, o se centran. O ambas. Hay funciones para hacerlo, scale() nos lo hace. Pero lo normal es utilizar el paquete caret. Tambien puedes mirar el paquete Tidymodels. El paquete Karet tiene una función de preprocesamiento automatico y si se lo paso a mi dataset me va a mirar los datos y va a detectar la mejor transformación para que se asemeje a una normal. Nos guarda la transformación y podemos aplicar esa transformación al dataset de validación por ejemplo.  Otra opción es reescalar por rangos. Esto es util cuando estamos trabajando con modelos multiclase.

  - Una forma de quitarte variables es usar zero variation que es quitarte variables que varien de forma identica, el near zero variation, que es hacerlo cuando la variación es muy cercana a 0 y luego PCA, que es usar los elementos principales
  - A veces tambien podemos necesitar que todas las variables sean categoricas (Por ejemplo usando Naive-Bayes). Podemos convertir variables numericas a categoricas usando la tecnica de Binning. R tiene una función cut que para una variable numerica te la convierte en un factor con los trozos que le de yo con vectores, haciendo intervalos entre ellos. Tambien si no tengo ni idea le puedo decir a la propia funcion cut simplemente el numero de intervalos y ya lo hace automaticamente.
  - Otra opción es hacerlo al reves. Hay algoritmos como el KNN o la regresión lineal que todo lo que necesita es numerico. Si no queremos perder nuestras variables categoricas necesitamos pasarlos a numericas creando variables dummy, hay una libreria dummy que nos lo crea automaticamente
  
  