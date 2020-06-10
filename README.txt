Para syntactic analysis foram feitos os seguintes tipos de erros nas expressões while.
Para todas as mensagens, é mostrada a linha e coluna do erro.
- "The expression is missing a '(' after the while keyword"
- "The expression is missing a ')' at the end"
- "The expression is missing an argument after the operator [&& | < | ...]"
- "The expression is missing an argument before the operator [&& | < | ...]"
- "The expression value is invalid! An X is not valid in this context."
- "The expression cannot be empty."
- "The expression is missing a closing bracket ']'"

Checklist CP2:
- Symbol Table
    . global: inclui info de imports e a classe declarada [X]
    . classe-specific: inclui info de extends, fields e methods [X]
    . method-specific: inclui info dos arguments e local variables [X]
    . sub topics:
       + tem de permitir method overload (i.e. métodos com mesmo nome mas assinatura de parâmetros diferente) [X]
       + tem de permitir consulta da tabela por parte da análise semantica (e geração de código) [X]
       + tem de permitir ligar e desligar a sua impressão para fins de debug (neste caso para fins de avaliação) [X]
- Type Verification
    . verificar se operações são efetuadas com o mesmo tipo (e.g. int + boolean tem de dar erro) [X]
    . não é possível utilizar arrays diretamente para operações aritmeticas (e.g. array1 + array2) [X]
    . verificar se um array access é de facto feito sobre um array [X]
    . verificar se o indice do array access é um inteiro [X]
    . verificar se valor do assignee é igual ao do assigned (a_int = b_boolean não é permitido!) [X]
    . verificar se operação booleana é efetuada só com booleanos [X]
    . verificar se conditional expressions (if e while) resulta num booleano [X]
    . verificar se variáveis são inicializadas, dando um WARNING em vez de ERRO [X]
       + parametros são assumidos como inicializados [X]
       + devem fazer uma análise através do control flow, i.e., se há um if e a variável só é inicializada dentro de ou o then ou o else, deve-se dar um warning a indicar que poderá não estar inicializada [X]
       + será considerado bónus a quem resolver esta verificação usando erros em vez de warning. [X]
            - cuidado que se a analise não estiver bem feita os erros vão fazer com que o vosso compilador não passe para a geração de código!
			- caso pretendam fazer esta abordagem com erros adicionem uma forma de ativar/desativar o erro para facilitar no caso de haver problemas.
			
- Function Verification
	* verificar se o "target" do método existe, e se este contém o método (e.g. a.foo, ver se 'a' existe e se tem um método 'foo') [X]
	    - caso seja do tipo da classe declarada (e.g. a usar o this), verificar se é método do extends olhando para o que foi importado (isto se a classe fizer extends de outra classe importada) [X]
	* caso o método não seja da classe declarada, isto é importada, verificar se método foi importado [X]
	* verificar se o número de argumentos na invocação é igual ao número de parâmetros da declaração [X]
	* verificar se o tipo dos parâmetros coincide com o tipo dos argumentos [X]
	    - não esquecer que existe method overloading [X]
-= Code Generation =-
    * estrutura básica de classe (incluindo construtor <init>) [X]
	* estrutura básica de fields [X]
	* estrutura básica de métodos (podem desconsiderar os limites neste checkpoint: limit_stack 99, limit_locals 99) [X]
	* assignments [X]
	* operações aritméticas (com prioridade de operações correta) [X]
		- neste checkpoint não é necessário a seleção das operações mais eficientes mas isto será considerado no CP3 e versão final
	* invocação de métodos [X]


Para type verification foram feitos os seguintes tipos de erros. 
Sempre que há um tipo inesperado, é mostrado o tipo que foi encontrado.
Para todas as mensagens, é mostrada a linha e coluna do erro.
- "Assignment of different types. Can't assign X to Y"
- "If expression is not a boolean."
- "While expression is not a boolean."
- "Array size must be an int..."
- "Array must be of type int[]..."
- "Array index is not an int..."
- "Left/Right operand of + is not an int..." (Indica se o erro está à esquerda ou direita)
- "Left/Right operand of - is not an int..." (Indica se o erro está à esquerda ou direita)
- "Left/Right operand of * is not an int..." (Indica se o erro está à esquerda ou direita)
- "Left/Right operand of / is not an int..." (Indica se o erro está à esquerda ou direita)
- "Left/Right operand of < is not a boolean..." (Indica se o erro está à esquerda ou direita)
- "Left/Right operand of && is not a boolean..." (Indica se o erro está à esquerda ou direita)
- "Operand of ! is not a boolean..."
- "Tried to call ".length" on non array..."
- "Class X does not contain static method Y"
- "Method X is not static"
- "Symbol X does not exist"
- "Class X does not contain method Y"
- "Method X is static"
- "Can't extend class from itself"
- "Extended class was not imported"
- "Variable X has not been initialized"
- "Variable X may not have been initialized" (WARNING)
- "Invalid import declaration X, constructor cannot be static"
- "Invalid import declaration X, constructor cannot return a value"
- "Duplicate import declaration: X." (WARNING)
- "Duplicate class declaration: X."
- "Duplicate main method for class: X"
- "Duplicate method declaration: X"
- "Duplicate method variable name X"
- "Duplicate variable name X"
- "Invalid variable type: X"
- "Such constructor does not exist: X"
- "Cannot use 'this' in static function"

Relativamente à inicialização de variáveis, o programa mostra um erro se não houver hipótese de a variável ter sido inicializada antes, isto é, se não houver nenhum assignment anterior, quer em ifs ou whiles.
Se a variável for inicializada em todos os caminhos da control flow, isto é, no caso de ser num if, também teria de ser inicializada no else, não ocorre nenhum erro ou warning.
Caso contrário, por exemplo, se a variável tiver sido inicializada apenas num if mas não no seu else, o programa mostra warning.
Isto também funcionará com ifs dentro de ifs, sendo sempre obrigatório inicializar em todos os caminhos possíveis.
Seguindo esta lógica, se a variável apenas estiver inicializada no corpo de um while, haverá warning.

Para code generation, foi também feita a geração de código para Ifs, Whiles, e Arrays, para além do pedido para o CP2.

A gramática foi também alterada para permitir construtores com argumentos, havendo também análise semântica e geração de código para o efeito



