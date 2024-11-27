# AreiaCadente
Repositório para a publicação final do projeto de POO

A ideia do projeto é ser uma simulação denominada "celular automata".
Ou seja, trata-se de uma matrix capaz de armazenar celulas, cada
uma sendo uma classe e serão atualizadas a e renderizadas a cada frame.

O arquivo App abrange todas as funções principais não relacionadas diretamente
ao grid e as celulas.

A classe grid é instanciada como uma classe global, pois o Processing permite
que isso seja feito ao invés de utilizar classes estaticas como no Java convenvional.

A classe grid então possui, alem de funções que ditam a logica geral do programa,
duas matrizes, uma que armazena as celulas em si e outra que armazena valores
booleanos, esta segunda por sua vez é utilizada para verificar se uma celula ja foi
atualizada durante um frame, impedindo discrepâncias entre o update do estado
da simulação e a renderização em si.

Cada celula age da seguinte maneira.
Ela possui uma função act que consiste em um bloco de if else em que a mesma
verifica se é possivel ela se mover para determinada direção.

Para isso ocorre uma comparação entre o atributo "density" das celulas, que deve
ser serve como criteiro para a troca.

Quando o estado de uma celula é atualizado, ela troca de lugar com sua celula de destino. E então tais locais na matriz são impossibilitados de agirem até o proximo frame.

Uma ultima coisa importante a se ressaltar é que a ordem em que a matriz é percorrida alterna a cada frame, pois cada forma funciona melhor para cada tipo especifico de celula. Essa implementação evita bugs e comportamentos estranhos.