# Reglas de asociación

Mas de una vez te enfrentas a un problema donde no tendras a priori definida una variable sobre la que predecir. Solo tendras una situación en la que no que nos va a interesar extraer información o asociaciones para el problema. Extraer grupos dentro de los datos que me permitan reconocer mejor el problema. Este aprendizaje es normalmente más desafiante que el tradicional supervisado,y como abordarlo es muy subjetivo y depende de lo que queremos buscar. Tampoco existe unaforma universal de validar los resultados de estos metodos

Asume que tienes una lista de items en una base de datos. El objetivo es obtener una conjunto de reglas de la forma X --> Y  donde X e Y son conjuntos de items (itemset) que cumplen que su intersección es nula. Por ejemplo la regla Pizza --> Cocacola quiere decir que si vas a comprar pizza vas a comprar cocacola.

Para tener una lista de elementos no podemos usar una base de datos convencional. Tenemos que convertirla en una lista a pares. Estas asociaciones a pares son los items

Podemos realizar medidas clasicas, como el soporte, que se basa en calcular la frecuencia con la que el itemset ocurre en la base de datos

La confianza por otra parte se calcula dividiendo el soporte de ambos elementos de una regla entre el soporte del antecedente, Es decir, nos dara una medida entre 0 y 1 porque 



