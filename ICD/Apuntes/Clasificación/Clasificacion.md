# Clasificación

A nivel general, la resolución de un problema de clasificación es muy similar al de regresión. Solo que el tipo de variable que queremos predecir es categorica. Normalmente con pocos niveles. Siendo el caso más tipico de clasificación la clasificación binaria. Donde la variable tiene solo dos niveles que se traducen a pertenece o no pertenece a esa categoria. Pero también existen problemas de clasificación con multiples posibles clases.

Para ello asuis que tenemos un conjunto de n instancias $X_i$ cada uno con una serie de predictores asociados $X_{ij}$ que representa la observaión del predictor j para la variable i. Finalmente hay una variable final llamada el target que representa el objetivo que queremos clasificar.

Cuando decimos que queremos crear un clasificador decimos que queremos crear un modelo matematico que codifica una funcion $f*$ que es una aproximación a la función que relaciona una observación con el target. Es importante que a nosotros no nos interesa evaluar el rendimiento del clasificador con la totalidad de nuestros datos. Sino que este estara divido en subconjuntos, uno de entrenamiento y otro de validación (test)

Mi loco, K-NN, tu ya te lo tienes mas que sabido