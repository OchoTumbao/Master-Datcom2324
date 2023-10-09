# Introducción a la estadistica

La estadistica es necesaria en ciencia de datos porque nos aporta tecnicas propias como la regresión ( donde podemos determinar una explicación por medio de una recta de regresion que ajuste una nube de puntos, formada por varias variables, ) o el test ANOVA ( nos permite determinar si existe una correlación entre las medias de dos variables) Estas tecnicas sin embargo estan muy dirigidas por el experto del campo

Ademas de ello nos aporta herramientas muy potentes para la fase de preprocesamiento. Por ejemplo las tecnicas de transformación de variables (ACP ) nos permiten construir nuevas variables a partir de combinaciones de variables de nuestro conjunto de datos para reducir la dimensionalidad de nuestro conjunto de datos. O Por ejemplo nos permite diferenciar cuales variables nos dan mas información. Utilizando herramientas como la información mutua, que nos permite saber cuanto se reduce la incertidumbre de una variable debido al hecho de conocer el valor de otra variable del conjunto de datos

Tambien podemos utilizar tecnicas como el z-score para la fase de transformación de datos. Esto nos permite transformar un conjunto de datos en otro donde no hay diferencia en las magnitudes con las que se mide cada variable. De esta forma podemos aplicar tecnicas de clustering donde sea necesario que todas las variables esten en la misma magnitud.

Ademas podemos utilizar el ACP para construir un biplot, donde representamos en un espacio tri o bi dimensional toda la información contenida en el conjunto de observaciones originales. Asumiendo que perdemos información. Pero si elegimos bien las componentes principales podemos asumir que la explicación es lo suficientemente cercana

La estadistica tambien es importante en la fase de evaluación de un proyecto de mineria de datos. Podemos crear una tabla donde las columnas sean los algoritmos y las filas los datasets en la que se ejecutan los algoritmos. De forma que cada entrada sea la tasa de acierto de ese algoritmo para ese dataset. De esta forma podemos plantear un test de hipotesis ( en este ejemplo un test de Friedman ) para comprobar que algoritmo da mejor resultados 

## Analisis exploratorio de datos

Vamos a introducir algunos constructos estadisticos y graficos basicos para analizar un conjunto de datos

- Medida de una variable: hace referencia a la naturaleza de una variable, una medida puede ser nominal donde no hay un orden definido (como el sexo de una persona), nominal (donde si hay un orden definido y hay algunas operaciones matematicas que tienen sentido, por ejemplo valoracion numerica del 1 al 5 de satisfaccion) o de escala (valor numerico estandar donde tienen sentido las operaciones)
- Tipo de una variable: Hace referencia a la codificación en la que se almacena esa variabel, puede ser un tipo de dato numerico, una cadena de caracteres u otros tipos de datos. La elección del tipo de dato depende de la medida y las cosas que queramos hacer con el.

Lo que hace que un test estadistico sea aplicable o no tiene mas que ver con la medida

Partiendo entonces de las variables Nominales

- ¿Como se distribuye una variable nominal?
    - Supongamos la variable nominal sexo y lanzamos un diagrama de barras, la anchura de esas barras no supondria nada
- ¿Podemos establecer relacion entre dos variables nominales?
    - Lo veremos en cursos posteriores, en este curso las variables nominales las usaremos para agrupar valores de una variable dependiente de escala. (Por ejemplo el salario de los hombres y el salario de las mujeres)

Y ahora con las variables de escala

- ¿Como se distribuye una variable de escala?
    - Como ahora tenemos muchos valores numericos no podemos realizar conteos de cada uno de ellos. Por tanto agruparemos en intervalos los valores de la variable en cuestion y contaremos la cantidad de valores para un intervalo dado. Esto nos crea un histograma. Pero necesitaremos valores numericos para resumir la información de esa distribución. Aqui entran diferentes estadisticos que nos seran muy utiles despues

Estadisticos de localización

Estos nos permiten localizar la distribucion (cual es su rango de valores). Por ejemplo la media muestral nos indica cual es el valor medio de la distribución. Este estadistico es muy sensible a casos extremos (Outliers). Para ello otro estadistico es la mediana muestral. Que se consigue ordenando los valores y cogiendo el valor central (en caso de numero par de valores se calcula la media muestral entre los dos valores centrales). En estadistica la mediana se utiliza menos que la media aunque representa mejor el valor central porque la media se calcula a partir de una función muy comoda mientras que la mediana se calcula a traves de un procedimiento. 

Otro estadistico de localización es la moda muestral, que representa el valor más comun.

Estadisticos de Dispersion

Nos dan una idea de la variabilidad de los datos

El mas comun es la desviación tipica muestral, nos representa la dispersión de los datos con respecto a la media aritmetica. Se define como

$$S=+\sqrt{\frac{1}{n-1}\sum{(X_i-\overline{X})²}}$$

Esta formula, que es una función derivable y nos aporta un estadistico insesgado.

Nos da una idea de la dispersión de los datos, porque en distribuciones usuales sin picos el 95% de los datos deberian estar comprendidos en el intervalo definido por la media +/- 2 veces la desviación tipica, y el 70% por la media +/- la desviación tipica. Si la desviación tipica fuera muy pequeña entonces sabemos que casi todos los valores estan concentrados alrededor de la media. Mientras que si fuera muy grande los valores estarian alejados de la media.

Otro estadistico es la varianza muestral que se define como el cuadrado de la desviación tipica

Los cuantiles son un conjunto de valores que visto de forma conjunta nos dan una idea de la dispersión. Consiste en dividir el area de nuestra distribucion de datos en n partes, por tanto tendiramos cuartiles si dividiesemos en 4 partes o percentiles si dividiesemos en 100 partes. Lo normal es usar los cuartiles. para dividir el area en 4 partes necesitamos 3 cuartiles donde el segundo cuartil correspondera con la mediana. Podemos conocer la dispersión analizando todos los cuartiles porque si hay distancia pequeña entre los cuartiles implica que los datos no estan dispersos. Para representar esto de forma visual se utiliza lo que se conoce como un diagrama de caja. Donde se destaca un valor central correspondiente a la mediana y luego otras lineas correspondientes al primer y tercer cuartil. Con eso construimos una caja que complementamos con una linea que va desde el principio hasta el final.

Por medio de la dispersión podemos calcular los valores atipicos. Un valor atipico es aquel que se aleja de la mediana tanto por abajo como por arriba. Podemos utilizar la distancia intercuartil para calcular outliers. Este metodo teoricamente solo es aplicable a la distribución normal, pero se puede aplicar a una distribucion cualquiera que no tenga varios maximos. En cursos futuros se estudiaran otros metodos para calcular outliers con respecto a mas de una variable. Volviendo al metodo la distancia intercuartil se calcula restando el tercer cuartil menos el primero. A partir de aqui podemos decir que un punto es un outlier normal si esta a partir del tercer cuartil una distancia 1.5 veces la distancia intercuartil, (idem para el otro extremo) y un outlier extremo si esta 3 veces la distancia intercuartil.

Saber detectar valores extremos es interesante. Pero lo relevante es saber si un outlier representa información real o es un error de medida. Si es un error de medida basta con eliminarlo, pero si es una información real tendremos que tener cuidado si la tecnica que estemos utilizando sea especialmente sensible a la presencia de outliers. Si la respuesta es no podemos mantenerlo, pero si la respuesta es si habria que evaluar si eliminarlo o no.

Otro uso de los cuantiles son los graficos q-q, nos permiten comprobar si una dhistograma se acerca a una distribución de referencia. Para ello calculamos en el eje Y todos los cuantiles, y en el eje X los cuantiles de la distribución de referencia. Construimos una linea de referencia en la diagonal y representamos cada punto como los cuantiles equivalentes, de forma visual cuanto mas cerca esten los puntos a la linea mas se acercara la distribución a la de referencia. Podemos comparar dos distribuciones cualesquiera

Finalmente vamos a describir el metodo de Z-score para la normalización.

Lo que hacemos es restar a cada dato la media y dividimos entre la desviación tipica. De este modo tenemos un conjunto de datos con la mista posición relativa en una escala mas uniforme, (en el mismo rango de valores que una normal 0,1). Este proceso nos permite que todas las variables esten en la misma escala de medidas. Con todos estos constructos podemos responder a preguntas más complejas como la relación de una variable de escala en función de una variable nominal. Necesitamos una ultima cosa

## Inferencia estadistica

En la inferencia estadistica podemos comprobar hasta que punto una afirmación estadistica es cierta o no. Para ello necesitamos entender la base de los test de hipotesis. Estos trabajan sobre muestras de una población que siguen una distribución concreta. que establecen una hipotesis nula y una alternativa sobre un parametro de la poblacion (aunque puede ser mas complejo) y la fuerza de estos test de hipotesis es que nos permiten rechazar la hipotesis nula. A partir de eso hay dos conceptos, el error tipo 1 que es el error que se comete al rechazar la hipotesis nula cuando no se deberia, y el error tipo 2 que es el que se comete cuando no se rechaza la hipotesis nula pero se deberia haber hecho.

El objetivo es tener una visión intuitiva de los procesos teoricas que se producen al plantear un test de hipotesis.

Para ello tenemos que introducir una hipotesis basica y es que los valores que toma una variable concreta estan determinados por una probabilidad descrita a partir de una función de densidad. Estas funciones son las famosas distribuciones y dependen de parametros que podemos variar para generar funciones de densidad dentro de la familia de las distribuciones, distribuciones tipicas son la normal o la T-student. Nuestro procedimiento funciona de la siguiente forma. Dado un histograma podemos tratar de ver que familia de funciones de densidad se acerca más al histograma y que funcion concreta de densidad ajusta mejor nuestro histograma. 

Para responder a la primera pregunta podemos utilizar metodos graficos, o test estadisticos como el de chi cuadrado, podemos tratar de ajustar varias curvas al histograma etc etc.

La segunda pregunta es tratar de encontrar que valor de los parametros de la funcion de densidad ajusta mejor los datos con los que estamos trabajando. Esto depende de cada familia. por ejemplo la distribucion normal tiene dos parametros $\mu$ y $\sigma$ donde $\mu$ es el valor maximo que alcanza la función y $\sigma$ es el achatamiento

El objetivo de la inferencia estadistica es obtener una estimación de los parametros de la distribución. Para ello hay varios procedimientos como

- Estimación puntual: que encuentra un buen estimador de un parametro concreto de la distribción
- Intervalos de confianza: En vez de dar un valor concreto damos un rango de valores y un rango de certeza
- Test de hipotesis: Este procedimiento similar a los intervalos de confianza nos permite establecer a priori una hipotesis sobre el parametro que el test nos permitira rechazar o no

Este ultimo sera el procedimiento que nosotros utilizaremos.

Supongamos una distribución normal. Podemos plantear un test de hipotesis de que el parametro nu vale un valor concreto.Tenemos entonces que plantear una hipotesis alternativa que por simplicidad vamos a asumir simplemente como la negación de la hipotesis nula. Despues se tiene que construir un estadistico, por ejemplo la media y se calcula con el la distribución de ese estadistico que debe corresponder con una distribución dada( No te rayes por esto, esta parte la hacen los matematicos) Asumiendo que conocemos esa distribución podemos comprobar el valor de ese estadistico cuando la hipotesis nula es cierta. Podemos entonces saber la probabilidad de que se cumpla la hipotesis nula en esa distribución. Y por tanto si es un valor poco probable podemos rechazar esa hipotesis nula por reducción al absurdo ( si el valor de mu fuera efectivamente ese el valor del estadistico deberia haber sido uno más probable). NO ES NECESARIO QUE TE SEPAS EL ESTADISTICO SOLO COMO FUNCIONA EL TEST DE HIPOTESIS

que estadistico T utilizar y a que distribución corresponde no es tu problema, es problema de los estadisticos, ¿Como cuantificar que el valor es poco probable? Pues hay que fijar un nivel de significación. Normalmente se utiliza un valor de 5%. Se considera que el valor es poco probable si cae en alguna de las colas definidas por alfa medios. Definimos el area que deja a la derecha el valor del estadistico T como el p-valor, trabajando a dos colas es el doble del area. En SPSS se conoce como sig. Tambien hay test a una sola cola, eso depende la hipotesis nula, pero vaya eso ya se va. Por ahora la alternativa siempre es la hipotesis nula negada y por tanto trabajamos a dos colas.

Si el estadistico T cae en una zona donde no se rechaza ESO NO IMPLICA QUE LA HIPOTESIS NULA ES CIERTA AL 95% Estos test tienen fuerza cuando rechazan la hipotesis nula, en caso de no rechazarlo solo podemos decir que la muestra no rechaza la hipotesis.

Si la distribución subyacente no es una normal lo idoneo es aplicar un test especifico para cada distribución. PERO PODEMOS PLANTEAR EL TEST ANTERIOR (el de la t-student) pero con menos potencias. PERO OJO ese test solo establece una hipotesis sobre el parametro mu especifico de una normal. Que sentido tiene hacerlo sobre otra familia de distribuciones con parametros distintos. 

Pensemos lo siguiente. Podemos definir la esperanza de una variable aleatoria X con una función de densidad f(x) a partir de una integral, la varianza tambien se define a partir de otra integral. Sin entrar en detalle de esas formulas podemos ver que la esperanza es una generalización de la media muestral. y la varianza de la desviación tipica. Por tanto podemos decir que la Esperanza nos da una idea del valor central de la distribución y la varianza de su dispersión. EN EL CASO DE LA DISTRIBUCION NORMAL LA ESPERANZA ES MU Y LA VARIANZA ES SIGMA CUADRADO. En otras distribuciones esto no tiene que cumplirse. Pero si es relevante que la esperanza representa el valor central de la distribucion donde tenemos dos fragmentos con areas equivalentes. Con estos conceptos podemos definir lo que se conoce como el teorema central del limite.

En esencia este teorema nos dice que para una distribucion estadistica cualquiera la media es un buen estimador de la esperanza, e idem para la varianza muestral.

Formalmente para un conjunto de variables aleatorias independientes e identicamente distribuidas (no dependen entre si y todas se obtienen de la misma distribucion con esperanza mu desconocida) Podemos calcular un estadistico concreto que se distribuye segun la T de student donde el valor de la media muestral de esas estadisticas va a ser muy probablement cercano al valor de la esperanza. PARA CUALQUIER DISTRIBUCION. POR TANTO PODEMOS PLANTEAR UN TEST DE HIPOTESIS SIMILAR AL T-TEST SOBRE LA ESPERANZA DE CUALQUIER DISTRIBUCION, YA NO SOLO SOBRE EL PARAMETRO DE UNA NORMAL. Este test deberia solo aplicarse con suficientes datos (mas de treinta) y sera fiable si la distribucion subyacente es decente (un unico maximo y cierta simetria). Podemos utilizar test basados e el teorema central del limite para obtener información sobre la esperanza y la varianza de una distribución concreta, de modo que, aunque no obtendremos la distribución concreta si tendremos una idea de como es. Concretamente podemos utilizar le t-test para calcular la esperanza de cualquier distribución. Tenemos la posibilidad de calcular la probabilidad de obtener un falso positivo o un falso negativo y en función.  

## Test para muestras independientes

### Prueba T-student para muestras independientes

Este test se utiliza cuando tenemos dos grupos. Sirve para comparar las medias de dos grupos pero hacer esto de forma directa sin tener en cuenta la dispersión de los datos nos arroja información incompleta. Es por esto que se introduce un estadistico que compara las medias teniendo en cuenta la varianza. (ANOVA = ANlaysis Of VAriance). Este test que estamos comprobando es un caso particular del ANOVA. Para ello, en este test establecemos nuestra hipotesis nula en que la esperanza de ambas distribuciones es la misma, frente a la hipotesis alternativa de que son distintas. Se construye el estadistico 

$$T=\frac{(\overline{X_1}-\overline{X_2})}{\sqrt{\frac{S^2_1}{n_1}+\frac{S^2_2}{n_2}}}$$

Este estadistico se distribuye dentro de una T-student con $n_1+n_2-2$ grados de libertad

Pero para poder aplicarlo tiene que haber independencia de los datos dentro de cada grupo y entre los grupos, la distribución de los datos en cada grupo debe ser una normal y se debe dar la condicion de homocedasticidad es decir, una varianza igual en cada uno de los grupos.

Analizando las condiciones

- Inpedendencia en y entre grupos:
    - Esto quiere decir que a la hora de diseñar el experimento los sujetos han de elegirse aleatoriamente y han de asignarse aleatoriamente a los grupos. Sin la presencia de sesgos. Esto puede ser una cosa muy sutil y tenemos que estar pendientes a razonamientos mas complejos que detecten sesgos.
- Requisito de normalidad
  - Los datos de cada grupo han de seguir una distribución normal. Aunque bueno, debido al teorema central del limite y que estamos haciendo hipotesis sobre la esperanza... mas o menos nos vale cualquiera, eso si las distribuciones no han de ser demasiado cantosas, no pueden ser asimetricas ni tener varios picos ( test no parametricos en esos casos). Como siempre podemos utilizar los q-q plots para ver la diferencia con la normal. PUNTO MUY IMPORTANTE, SI LA FALTA DE NORMALIDAD LA GENERAN OUTLIERS NI SE TE OCURRA ELIMINARLOS, ESOS DATOS PERTENECEN A LAS MUESTRAS. Podemos probar a lanzar los test sin los outliers detallando lo que estamos haciendo.
- Homocedasticidad
  - Las varianzas de los grupos deben ser similares, para ver esto habria que hacer graficos de cajas. Realmente de forma estadistica habria que usar el test de Levene para rechazar o aceptar que las varianzas son las mismas. En caso de que rechazemos que las varianzas son iguales podemos utilizar el test de Welch que es un test similar al ANOVA pero que penaliza grados de libertad y no tiene este requisito de Homocedasticidad.
  
### ANOVA General
Este test es una extensión del test anterior donde hay N grupos en lugar de solo dos. Por ejemplo agrupacion de los empleados por categoria laboral. Para plantear un ANOVA tenemos unos requisitos iguales a los de T-student salvo con el matiz que los datos son independientes entre si y entre cada grupo y que el requisito de normalidad es sobre los "residuos" (No te rayes mucho). Luego lo que se hace es plantear un test para cada combinación donde para k grupos tenemos $m=k(k-1)/2$ combinaciones distintas. por tanto planteamos m test donde sabemos que la probabilidad de no cometer un error de tipo 1 es $1-\alpha$ en un test, por tanto para m test la probabilidad es $(1-\alpha)^m$ y por tanto la probabilidad de cometer al menos un error de tipo 1 es $1-(1-\alpha)^m$ Esto es lo que se conoce como el FWER o Family wise experiment error. Asumiendo un alpha de 0.05 y m=3 el error nos sale de 0.14 y con m= 10 el error es de 0.4 MUCHO MAYOR QUE 0.05 que es el grado tipico de error que se fija para evitar un falso positivo. Por tanto tenemos que cambiar el planteamiento del test y no hacer un conjunto de test. Si no hacer un unico test donde la hipotesis nula que dice que todos los grupos tienen la misma media y la hipotesis alternativa cuando hay al menos un grupo con una media distinta. Para resolver este test hay una movida muy gorda que bueno, no te rayes. Una vez tienes el test hecho y rechazas la hipotesis nula ahora necesitamos saber que grupo es el que tiene la esperanza distinta al resto. Para ello tenemos que utilizar lo que se denomina un post-hoc que consiste en plantear una familia de test de hipotesis PERO ESO NOS DA LA MOVIDA DE ANTES DEL FWER. Para controlarlo penalizamos el valor de alpha dividiendo alpha entre m o con una formulita chula. Es importante no hacer esto directamente y hacerlo solo en el post-hoc, que es la potenica, al haber penalizado tanto alpha hemos reducido mucho la potencia del test.

Al lanzar el conjunto de test del post-hoc veremos que medias rechazan cada par. Por ejemplo el test comparandoe el grupo 1 con el 3 rechaza, el 1 con el 4 tambien y lo hace el 2 con el 3. Tenemos que ver pareja por pareja para ver cuales no podemos considerar que son distintos

Otra posibilidad es que rechace y se genere una situación con solapamiento donde no podamos saber cual es distinto del resto. Esto ocurre cuando se produce un error de tipo beta (falso negativo ).  y no podemos determinar en el post-hoc que grupo tiene una media distinta

Y finalmente otra posibilidad es que ningun test rechaze. Esto es otro error de tipo Beta ( Falso negativo ) idem que el caso anterior

Para hacer el post-hoc podemos aplicar test especificos que ya incorporen la penalización al alpha, por otra parte podemos aplicar test genericos a cada par como el t-student en este caso concreto. Y luego penalizar de forma manual.

Uno de estos test especificos es el Test de Tukey.

Otra posibilidad es hacer el post-hoc fijando uno de los grupos y comparando con el resto. Esto aumenta la potencia de los test porque reduce el error FWER. De nuevo tenemos test especificos y test genericos. Donde como siempre deberemos penalizar el alpha manualmente

### Tests no parametricos

Estos son tests donde no se asume la condicion de normalidad. La hipotesis nula cambia a que ahora las distribuciones son similares en base a un estadistico de localización. En los que vamos a ver la mediana. No requieren normalidad pero si independencia. Estos test se hacen sobre las medianas si todos los grupos tienen una distribucion similar. En otro caso el test sera uno de dominancia estocastica. Simplemente eso comprueba que para dos valores aleatorios de dos distribuciones la probabilidad de que el valor de una de ellas sea mayor que el  de un x cualquiera es mayor con respecto a la otra. OJO QUE ESTO ES UTIL PORQUE nos permite por ejemplo ver dentro de dos grupos cual es mas probable que tenga un valor mayor. Si al final podemos hacer el test sobre las medianas si se verifica que la mediana de un grupo es superior al de otro tambien se verifica que un grupo domina estocasticamente al otro. Al reves no sucede. Por tanto el test es más restrictivo. A partir de ahora vamos a asumir distribuciones similares.

### Test U de Mann-Whitney

Este test trabaja sobre dos muestras independientes o grupos de variables escalares formados a partir de una distinción en una variable nominal. Es el equivalente parametrico al de la t-student PERO ES MENOS POTENTE ASÍ QUE SI PUEDES UTILIZA EL DE LA T-STUDENT. Lo bueno es que al depender de la mediana en vez de la media el test es mas robusto a la presencia de outliers que el de la T-student. Ademas este test se puede aplicar sobre valores ordinales.

Para empezar el test se mezclan los datos de los grupos y se ordenan. Anotamos el numero del orden para cada valor, en caso de empate se calcula la media aritmetica. Se suman los ordenes de cada grupo y se construye un estadistico igual al minimo de dos valores construidos en base a la suma de los ordenes que hemos calculado antes. Una vez construido tenemos que mirar en las tablas de mann whitney para ver si el valor obtenido es usual o inusual, si el valor obtenido es mas pequeño que el que esta en la tabla la hipotesis nula se rechaza. 

### ANOVA NO Parametrico, Rank de Kruskal-Wallis

Condiciones analogas al test U y al ANOVA y se procede de forma similar con otro estadistico y se mira en la tabla.

### Post-hoc no parametrico
Pues igual que en los parametricos, o se usan test especificos como el test de Dunn o se usan test genericos con una penalización de alpha

## Test para muestras dependientes 

Estos test los usamos cuando tengamos variables que dependan unas de otras, (salario_inicial,salario_final) Cuando estas dependencias entre columnas evidentes se muestras tenemos que adaptar los tests que hemos descrito antes