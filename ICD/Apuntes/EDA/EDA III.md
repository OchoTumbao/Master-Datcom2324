# EDA III: PCA
El PCA es un metodo de reducción de dimensionalidad, nuestro objetivo es reducir el numero de variables conservando la mayor información posible. Siendo la información la cantidad de variación que contiene. Hay variables con mucha intravariación que son significativas para el dataset mientras que hay otras que no varian apenas.

Si queremos utilizar PCA debemo plantearnos algunas cosas. El PCA encuentra relaciones lineales. Muchas veces asumimos que las relaciones entre los datos son lineales pero no tiene porque haberlas. Tiene que haber una cierta correlación lineal. El dataset no deberia tener outliers. Pues PCA es sensible a los outliers. Podemos transformar las variables con Outliers para quitarnos esa problema. Los datos deben seguir una distribución APROXIMADAMENTE normal, a ver, si tienes muchos datos puees asumir que las cosas son normales. Pero... bueno, ya te consuelas como quieras. TAMBIEN DEBEMOS CONVERTIR LAS FECHAS A INTERVALOS. Y idealmente tener un dataset muy grande.

Para realizar un PCA tenemos que seguir los siguientes pasos

1. Estandarizar cada columna para que no haya columnas dominantes
2. Calcular la matriz de covarianza para identificar las correlaciones
3. Calcular los vectores propios y los valores propios de la matriz de covarianza para identificar los PCAs
4. Crear un vector e caraceristicas para decidir que componentes principales mantener tomando el producto punto del vector propio y las columnas estandarizadas
5. Refundir los datos a lo largo de los ejes de coordenada principales

Vamos a trabajar con un dataset de Kaggle llamado County data. Esto es una ONG que ha recaudado 10 millones de dolares y ahora dee decidir a que paises darselos de forma urgente. Tenemos datos socioeconomicos y sanitarios y tenemos que sugerir a que paises hay que dar maxima prioridad. Dos lirerias clave para esto son

FactoMineR y factoetra. Son utiles porque generan graficos explicativos chulos sin mucho esfuerzo. Pero hay otras cuantas


Podemos usar directamente la función PCA de factoMineR , si le pones el parametro scale.unit = TRUE estandariza los datos. Tambien hay que indicarle el numero de componentes principales. Tambien tenemos otras fuhas funciones como para extraer los autovalores, visualizar los valores, el valor informativo de los pca, Extraer resultados tato de los individuos como de las variables, graficarla, en general cuando yo hago PCA a mi me devuelve un objeto donde yo tengo todo lo que necesito.

- Con los eigenvalues puedo obtener la cantidad devariación retenida por cada componente principal. Pero si tengo un eigenvalue con un valor por debajo de 1 no es tan util. Lo minimo que deberias coger de varianza acumulada es 75% pero puedes parar de ahi arriba cuando quieras. Visualemente podemos utiliza fviz_cos2() para saber cuale sson las 10 variables mas importantes que contribuyen a las dimensiones que le digamospor parametro