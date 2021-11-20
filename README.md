# Shooting-Method
O metodo de Shooting e utilizado para resolver problemas onde n~ao s~ao conhecidas todas as
condic~oes iniciais necessarias para saber como um certo sistema vai evoluir, mas que se possua
informac~oes sobre o que acontece ou o que se pretende que aconteca nesse sistema, num instante
posterior. Designamos este tipo de problemas como problemas de valores de fronteira.
Em geral, o metodo de Shooting consiste em arbitrar duas condic~oes ou par^ametros iniciais
desconhecidos e, de seguida, a partir, por exemplo, da ode45 (metodo adequado para problemas
de valor inicial), e integrada numericamente a equac~ao do problema em estudo. No nal dessa
integrac~ao, e vericado se o resultado obtido se afasta ou se aproxima das condic~oes fronteira
desejadas. Apos essa vericac~ao, as condic~oes iniciais s~ao ajustadas de modo a que o resultado
se aproxime da soluc~ao pretendida. Este processo de ajuste e realizado, neste trabalho, atraves
do metodo da secante, onde e repetido n vezes ate que se obtenha a soluc~ao pretendida.
