from datetime import datetime
import random, string

class Helpers:

    def String_Aleatoria(self, tamanho):
        letras = string.ascii_lowercase
        return ''.join(random.choice(letras) for i in range(tamanho))

    def Gera_Email_Valido(self):
        return str(datetime.today().strftime('%Y%m%d%H%M%S')) + "@" + self.String_Aleatoria(9) + ".com"

    def Gera_Senha_Valida(self):
        return self.String_Aleatoria(5)

    def Gera_Usuario_Valido(self):
        return str(datetime.today().strftime('%Y%m%d%H%M%S')) + self.String_Aleatoria(4)

    def Gera_CPF_Valido(self):
        primeiraParte = ''
        for i in range(9):
            primeiraParte += str(random.randint(0, 9))

        contadorRegressivo_1 = 10

        resultadoDigito_1 = 0

        for digito in primeiraParte:
            resultadoDigito_1 += int(digito) * contadorRegressivo_1
            contadorRegressivo_1 -= 1

        digito_1 = (resultadoDigito_1 * 10) % 11
        digito_1 = digito_1 if digito_1 <= 9 else 0

        dez_digitos = primeiraParte + str(digito_1)
        contadorRegressivo_2 = 11

        resultadoDigito_2 = 0

        for digito in dez_digitos:
            resultadoDigito_2 += int(digito) * contadorRegressivo_2
            contadorRegressivo_2 -= 1

        digito_2 = (resultadoDigito_2 * 10) % 11
        digito_2 = digito_2 if digito_2 <= 9 else 0

        return f'{primeiraParte}{digito_1}{digito_2}'
