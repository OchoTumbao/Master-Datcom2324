# Exploratory Data Analysis (EDA)

El EDA es "aburrido" en tanto en cuanto hay que hacer mucha estadistica para preparar y manipular los datos. Lo guapo no llegahasta que haces todo lo demas. Pero en esencia es jugar un poco a ser detective. Analizando los datos y poniendo ojo con el objetivo de 

- Tener una vision general del dataset, lo importante es sacar patrones en los datos que no se vean a simple vista
- Extraer variables importantes junto con los outliers y las anomalias.
- Buscar violaciones de asunciones estadisticas. (Ver si se viola la normalidad. Lo normal es que se viole la normalidad)
- Identificar la utilidad del dato en bruto y posibles transformaciones utiles de los datos
- Generar hipotesis. Tienes que culturizarte un poquito sobre lo que estes trabajando

Para hacer un buen EDA Necesitamos saber de graficos, y por esto se usa R. Porque para hacer graficos es la polla, y puedes combinar con estadistica chula. Hay que saber tablas de resumen, modelos matematicos descripción estadistica agrupaciones... Un poco de todo

Para empezar en un EDA lo primero es Ordenar y organizar los datos. Hacer graficos y estadisticas simples (o no tan simples) y maximizar esos datos para intentar ver relaciones que nos digan cosas

Para ello podemos analizar diferentes cosas

- Variables numericas
  - Discretas
  - Continuas
- Variables categoricas
  - Binarios (dos categorias)
  - Nominales (mas de dos categorias)
  - Ordinales ( ordenados con sentidas)
- Distribuciones de variables
- Exploracion de la normalidad
- Comparación de grupos
- Exploraciones de la correlacion
- Exploración de datos
- Explorar para modelos lineales
  
Hoy vamos a estudiar Analisis Univariable y Bivariable, con diferentes estrategias dependiendo del tipo de variable

Nosotros necesitamos cuantifiar nuestros datos. Para ello lo tipico es hacer el resumen estadistico de una variable ( media 2 cuartiles, desviacion tipica minimo y maximo)

Realmente lo que queremos ver son

- Medidas de tendencia central
  - Media mEDIANA Y Moda, EN R POR DEFECTO NO CONTABILIZA MISSING VAUES, CUANDO LO USES PON EL ARGUMENTO na.rm=T
  - Las medidas de tendencia central las mas populares son mediana y media. Dependiendo si tenemos o no outliers,  la media es mucho mas sensibles a outliers. Pero hay que considerar que tipo de outliers tenemos que saber si un Outlier es excluible de los datos o no.
- Medidas de dispersión
  - Tenemos dos poblaciones de medida de intolerancia a la lactosa, ambas con una media de 100. Pero eso no implica que la distribucion de la población sea la misma. Podemos enconrarna muchas distribuciones, la Normal que es un unicornio. La normal desviada positiva o negativamente (a la derecha o a la izquierda). Normales estrechas, normales aplanadas, normales BI O TRI modales con varios picos.
  - Las medidas tipicas de dispersión son la varianza y la desviación tipica, la varianza nos dice lo desperdigados que estan los datos y la desviación estandar indica como de lejos estan los valores de la media. Lo suyo es que un valor debe estar entre dos veces la desviación estandar de la media
  - Si tenemos una desviación estandar muy pequeña esta todo muy compacto. Si eso pasa en EDA Cagaste porque los datos son muy homogeneos y no te va a servir demasiado para diferenciar. Pero como veas una con la desviación estandar muy alta también malo porque es demasiado homogeneo para el otro lado.
  - Lo que se utiliza mucho ahora mismo es la Z-score estandarizada, Restando a cada dato la media y dividiendo entre la desviación estandar tenemos una distribucion con media 0 y SD de 1. Eso hace que nuestras variables se muevan todos por una escala parecida.
- Simetria de las distribuciones
  - Las distribuciones estan desviadas a la derecha o a la izquierda. Y existen transformaciones que nos permiten convertirlas en normales. (Una transformacion logaritmica nos devuelve normalmente una normal) Pero al hacer esto perdemos interpretabilidad. Si queremos dar una explicacion a una persona lo que sea es lo suyo que haya interpretabilidad para poder explicarle las razones de porque pasa algo. No es lo mismo decir que a la gente de mas de 60 años hay un buen pronostico para el cancer de mama que decir que a pacientes con un logaritmo de la edad igual a algo.
  - Como podems saber si una variable tiene skewness(si esta desviada) Pues hay una función en R mi absoluto hombre. Te va a dar un numero positivo o negativo y cuando mas alejado del 0 mas desviacion
  - Para saber como de significativo es la desviacion tenemos que hacer un test estadistico Usad la libreria moments que tiene el test D'agostino para la skewness
  - Tambien existe la Kurtosis que nos dice como de compacta son los valores de nuestra distribución, para saberlo lo de siempre Test estadistico, Anscombe-Glynn de kurtosis. La Kurtosis es relevante porque nos da información sobre los outliers
  
- Analisis del minimo y del maximo. Muchas veces una variable numerica no nos aporta nada en si misma y lo que si nos aporta son el minimo el maximo y el rango, para categorizar la variable.

- Otra estrategia tipica, los cuartiles. Nos permite saber como esta distribuida la población. EN R HAY 9 FORMAS DISTINTAS DE CALCULAR LOS CUARTILES. Lo que te va a cambiar es en donde estan los extremos y en que punto se te van a determinar los outliers. La funcion mas tipica es quantiles() Tambienestan los percentiles, que puedo pedirle a la función que me de los que quiera. Esto es util, porque hay variables continuas donde no vas a ver cosas.  Cuando no ves una distribucion clara puedes probar a hacerlo por percentiles. Agrupando categorias en función de como ves los numeros. Tambien puedes usar la función IQR(). La función Summary nos lo sescupe tambien.

Hasta ahora hemos visto el tipo de cosas que tenemos que hacer, hay unos cuantos paquetitos utiles. Que nos ahorran tiempo

- skimr y su comando skim(dataset) Nos da tablas para las variables categoricas y para las numericas nos escupe toda la estadistica descriptiva. Que sea necesaria
- gtsummary tiene dos funciones tbl_summary que nos categoriza las variables y nos escupe toda la infomación y tiene la función add_p que nos da el test estadistico (POR DEFECTO TEST PARAMETRICO, ESO ES ORIENTATIVO, PORQUE LAS MOVIDAS NO TIENEN PORQUE SEGUIR UNA NORMAL Y BUENO YA CAGASTE. Y SI SE DA CUENTA DE ESO INTENTA HACER TEST NO PARAMETRICOS)
- Hmisc  nos da la misma información y nos da distribuciones de las variables categoricas

## Explorando la normalidad

ES IMPORTANTE, Ya hemos visto dos formas de ver la normalidad,con la kurtosis y la skewness. Pero es que de verdad, aseguraos la normalidad porque es que todo lo que te ofrece por defecto R es parametrico. Dos formas, o visualmente con qqplots o con un test estadistico. De estos hay dos, el de Kolmogorov-smirnov y el de Shapiro Wilkinson. Ambsos se necesitan aunque el segundo es mejor, al tener más potencia. Pues bueno, Shapiro es un test estadistico que cuando un dataset es lo suficientemente grande te puede escupir que la distribución no es normal aunque realmente la distancia de una normal ideal es minima. Por ello es interesante hacerlo visualmente. Los graficos QQ ya los hemos visto en la partes de estadistica. De aqui vamos a ver muchos graficos rarunos, que ya al verlos nos van a decir como es la distribución, si tengo una bi modal por ejemplo ya se que eso va  aser categorico si tengo volas muy pesadas es que tengo outliers muy extremos, puedo ver la skewness.

El test de Saphiro tiene su función de R y con un P value muy bajo significa que aceptamos la hipotesis alternativa implicando que no es normal. Hay un paquete DataExplorer hay uno de estos que nos escupe ya los QQ plot de muchas variables pero por grupos. Y Ya de ahi podemos scar información

Otro paquete interesante es el dLookR que tiene una funcion muy chula llamada plot_normality() que nos escupe el histograma, el qqplot y más cosas. Podemos tambien utilizar distribuciones tipicas en R para generar datos que siguen esa distribución para ver hasta que punto nuestros datos se asemejan a una distribución normal.

Para variales categorcas podemos utilizar tablas de contingencia para ver cuantos datos tenemos en cada cateoria.

## Visualización de datos
De verdad, un grafico es increible, un buen grafico te enseña todo. Un grafico lo que tiene que hacer es ayudarnos a entender y a encontrar patrones. Tiene que ayudarnos a depurar los datos. Pero no es lo mismo un grafico para EDA y un grafico para comunicar resultados. Aqui queremos funcionalidad sobre forma. 
- Para variables unicas los mas utilizados son
  - Histogramas
    - En un histograma hay que saber hacer el grafico. Hay que probar que cantidad de bins se adapta mejor a los datos que queremos graficar
    - En los dataset pequeños los histogramas son un poco bullshit. Funcionan genial para dataset con muchos datos tho. Y hay que tener cuidado con los ejesy las escalas. Funcionan muy bien cuando los vemos en funcion de una variable categorica.
  - PLot de densidad
    - A veces los histogramasno van tan bien, y con curvas de densidades hay cosas que si se ven mejor
  - boxplot
    - Mi puto padre. Resumen 5 medidas estadisticas, nos enseñan del tiron el minimo, el maximo, la media, los cuartiles. Pero cuidado que la implementación del paquete te la puede liar. Hay un paquete que es ggstatsplot, esa función te saca un boxplot mu chulo con un test estadistico que te dice la diferencia entre los grupos, etc etc. Echale un ojo
  - bar plot
    - Pues de lo poco que tenemos para variables categoricas
  
## Analisis bivariable

Hay una libreria gmodels que tiene una función Crosstable que te escupe directamente para dos variables la cantidad de instancias, las que espera, cuando influye cada uno al test de la chi cuadrado.

La parte más interesante es saber cuanto cambia una variable con respecto a la otra. Esta es lo que se llama la covarianza. Cuando la covarianza es positiva implica que existe una relación linear positiva entre ambas, (directamente relacionadas) Si la relación es negativa es que es inversamente proporcinal y una de 0 es que no existe correlación lineal

Otro concepto importante es la correlación, Esta va entre 1 y -1 donde estar  en un extremo es que hay una correlación perfecta ya sea directa o inversa y en 0 es que no existe correlación todo lo que hay en medio. PERO OJO IMORTANTE CORRELACIÓN NO IMPLICA CAUSALIDAD POR DIOS. CORRELACIÓN IMPLICA CORRELACIÓN Y PUEDE SER COMPLETAMENTE CASUA. Para calcular la correlación tienes la función cor y luegoesta cor.test que por defecto utiliza el test de pearson para la correlación que es parametrico para las distribuciones normales. E igual o quiere usar otros no parametricos como kendall o spearman. Spearmanes muy robusto para outliers y Kendall para las bimodales.

Si usas Pearson hay requerimientos AMBAS DEBEN DE SER NORMALES, TIENEN QUE TENER UNA RELACION LINEAL ENTRE ELLAS Y TIENEN QUE CUMPLIR LA HOMOCEDASTICIDAD . Al hacer correr el test obtendremos un pvalue que como siempre si esta por debajo de 0.05 implicaria en este caso rechazar la hipotesis nula nos dice que las variables estan correladas.

Spearman por otraparte requiere que las variables seanordinales, intervalos o ratios cuya relación debe de ser monotonica. No tiene porque ser lineal pero si tiene que tener un solo sentido. Por otra parte al test de Kendall le da igual la distribución.  El problema es que el Tau de Kendall es menos significativo, entonces bueno. Lo comido por lo servido.

## Graficos para bi variables

Si las variables son las dos categoricas tenemos Mosaic plot y plot de asociación. si tenemos una categorica y una continua usamos boxplot y si tenemos dos continuas usamos scatterplot. 

Estos ultimos son relevantes porque nos dan buenas respuestas. Por ejemplo podemos ver sihay relaciones entre ellas. Podemos utilizar cosas como el geom_smooth que nos dibujan restas y margenes donde seria significativo si hay una relación lineal entre ambas variables. Lo que pasa es que cuidado. Si hay demasiados puntos uno ya no puede utilizar un scatterplot. Para poder visualizar bien o seutiliza una transparencia para que los puntos se vean mass oscuros cuanta mayor concentración o mediante plot de contorno.

Csa rara que funciona bien. Plor de Mosaico, pero solo para dos o tres variables como mucho. Esto nos saca cuadrados de proporcion. Y tambien como alternativa hay plot de asociación donde ya en vez de tener cuadrados Aún así hay otras opciones como los correlogramas, que a partir de una matriz de correlación cmo se distribuyen las correlaciones. Existe un paquete que se llama ggpairs que nos dice que tipo de variables y te genera todos los plot posibles para que los veas. Entonces, con todos los graficos que hay. Si yo ahora me pego con un dataset, que grafico pillo? Pues hay una chart, ya la pillas de las diapos o algo. 