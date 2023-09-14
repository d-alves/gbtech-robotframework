## gbtech-robotframework

Para este projeto, foi utilizado para os testes o site https://www.empregos.com.br/. Foram desenvolvidos 16 casos de teste, sendo que 1 deles valida sucesso, e o restante valida cenários de falha.

No arquivo report.html é possível verificar o resultado da última execução realizada, em que 15 casos de teste passaram e um apresentou erro. 
O cenário que apresentou o erro consiste de uma validação de senha, em que o sistema informa que a senha deve conter entre 5 e 15 caracteres, mas que está permitindo 16 caracteres no campo.

Os códigos foram separados em três diretórios: Utils, TestCases e ResourceFiles:
- Utils: contém uma classe Helpers.py, que possui métodos para geração de string aleatória, de email válido* e de senha válida.
- TestCases: contém o arquivo RegistroUsuario.robot, com os casos de teste mencionados acima.
- ResourceFiles: contém dois arquivos, um de variáveis comuns (GeneralVariables.robot), e outro com as keywords de usuário (resources.robot).

* Como se trata de um site em que não temos controle dos dados existentes neles, não era possível executar os testes utilizando sempre o mesmo email. Dessa forma, optei por sempre gerar um novo email, de maneira aleatória. Entretanto, é possível que com essa solução, seja gerado um email já existente na base, e o caso de teste falhar, gerando um falso negativo.