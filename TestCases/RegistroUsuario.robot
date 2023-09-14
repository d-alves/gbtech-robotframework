*** Settings ***
Library  SeleniumLibrary
Resource  ../ResourceFiles/resources.robot
Default Tags    RegistroUsuario    cadastro-inicial    dados-pessoais    formacao    objetivos-profissionais

*** Test Cases ***

RegistroUsuario_Sucesso
	[Tags]    cadastro-inicial    dados-pessoais    formacao    objetivos-profissionais
	Inicia Teste Registro Usuario
	# Dados Iniciais
	Informa Nome Completo  Maria Silva
	Informa Email Valido
	Informa Telefone Celular    31999999999
	Informa Cidade Existente    Belo Horizonte
	Informa Cargo Existente    Analista
	Aceita Politicas Privacidade
	Clica Botao Cadastrar Curriculo
	Valida Cadastro Inicial
	# Dados Pessoais
	Informa CPF Valido
	Informa Genero Feminino
	Informa Data Nascimento    01/01/2000
	Seleciona Estado Civil Solteiro
	Informa Desemprego
	Informa CEP    30130-100
	Informa Senha Valida
	Clica Botao Confirmar Dados Pessoais
	Valida Cadastro Dados Pessoais Realizado
	# Formacao
	Seleciona Grau Escolaridade
	Seleciona Area Estudo
	Informa Instituicao Formacao    UFMG
	Informa Data Inicio Formacao    01/01/2018
	Informa Data Fim Formacao    01/12/2022
	Clica Botao Salvar Formacao
	Valida Cadastro Formacao Realizado
	# Objetivos Profissionais
	Informa Pretensao Salarial    5000
	Informa Resumo    Teste
	Clica Botao Salvar Objetivos Profissionais
	Valida Cadastro Final Realizado
    Encerra Browser

RegistroUsuario_NomeObrigatorio
	[Tags]    cadastro-inicial
	Inicia Teste Registro Usuario
	Informa Email Valido
	Informa Telefone Celular    31999999999
	Informa Cidade Existente    Belo Horizonte
	Informa Cargo Existente    Analista
	Aceita Politicas Privacidade
	Clica Botao Cadastrar Curriculo
	Valida Mensagem Erro Nome Completo    Nome é obrigatório
    Encerra Browser

RegistroUsuario_NomeIncompleto
	[Tags]    cadastro-inicial
	Inicia Teste Registro Usuario
	Informa Nome Completo  Maria
	Informa Email Valido
	Informa Telefone Celular    31999999999
	Informa Cidade Existente    Belo Horizonte
	Informa Cargo Existente    Analista
	Aceita Politicas Privacidade
	Clica Botao Cadastrar Curriculo
	Valida Mensagem Erro Nome Completo    Digite seu nome completo
    Encerra Browser

RegistroUsuario_EmailObrigatorio
	[Tags]    cadastro-inicial
	Inicia Teste Registro Usuario
	Informa Nome Completo  Maria Silva
	Informa Telefone Celular    31999999999
	Informa Cidade Existente    Belo Horizonte
	Informa Cargo Existente    Analista
	Aceita Politicas Privacidade
	Clica Botao Cadastrar Curriculo
	Valida Mensagem Erro Email    E-mail é obrigatório
    Encerra Browser

RegistroUsuario_EmailInvalido
	[Tags]    cadastro-inicial
	Inicia Teste Registro Usuario
	Informa Nome Completo  Maria Silva
	Informa Email    teste
	Informa Telefone Celular    31999999999
	Informa Cidade Existente    Belo Horizonte
	Informa Cargo Existente    Analista
	Aceita Politicas Privacidade
	Clica Botao Cadastrar Curriculo
	Valida Mensagem Erro Email    Digite um e-mail válido
    Encerra Browser

RegistroUsuario_TelefoneObrigatorio
	[Tags]    cadastro-inicial
	Inicia Teste Registro Usuario
	Informa Nome Completo  Maria Silva
	Informa Email Valido
	Informa Cidade Existente    Belo Horizonte
	Informa Cargo Existente    Analista
	Aceita Politicas Privacidade
	Clica Botao Cadastrar Curriculo
	Valida Mensagem Erro Telefone Celular    Telefone celular é obrigatório
    Encerra Browser

RegistroUsuario_CidadeObrigatoria
	[Tags]    cadastro-inicial
	Inicia Teste Registro Usuario
	Informa Nome Completo  Maria Silva
	Informa Email Valido
	Informa Telefone Celular    31999999999
	Informa Cargo Existente    Analista
	Aceita Politicas Privacidade
	Clica Botao Cadastrar Curriculo
	Valida Mensagem Erro Cidade    Cidade é obrigatória
    Encerra Browser

RegistroUsuario_CidadeNaoEncontrada
	[Tags]    cadastro-inicial
	Inicia Teste Registro Usuario
	Informa Nome Completo  Maria Silva
	Informa Email Valido
	Informa Telefone Celular    31999999999
	Informa Cidade Inexistente    ASDF
	Informa Cargo Existente    Analista
	Aceita Politicas Privacidade
	Clica Botao Cadastrar Curriculo
	Valida Mensagem Erro Cidade    Cidade não encontrada
    Encerra Browser

RegistroUsuario_CargoObrigatorio
	[Tags]    cadastro-inicial
	Inicia Teste Registro Usuario
	Informa Nome Completo  Maria Silva
	Informa Email Valido
	Informa Telefone Celular    31999999999
	Informa Cidade Existente    Belo Horizonte
	Aceita Politicas Privacidade
	Clica Botao Cadastrar Curriculo
	Valida Mensagem Erro Cargo    Cargo é obrigatório
    Encerra Browser

RegistroUsuario_CargoNaoEncontrado
	[Tags]    cadastro-inicial
	Inicia Teste Registro Usuario
	Informa Nome Completo  Maria Silva
	Informa Email Valido
	Informa Telefone Celular    31999999999
	Informa Cidade Existente    Belo Horizonte
	Informa Cargo Inexistente    testeteste
	Aceita Politicas Privacidade
	Clica Botao Cadastrar Curriculo
	Valida Mensagem Erro Cargo    Cargo não encontrado
    Encerra Browser

RegistroUsuario_AceiteNaoRealizado
	[Tags]    cadastro-inicial
	Inicia Teste Registro Usuario
	Informa Nome Completo  Maria Silva
	Informa Email Valido
	Informa Telefone Celular    31999999999
	Informa Cidade Existente    Belo Horizonte
	Informa Cargo Existente    Analista
	Clica Botao Cadastrar Curriculo
	Valida Mensagem Erro Aceite Privacidade    Ler e concordar com a Política de Privacidade
    Encerra Browser

RegistroUsuario_SenhaObrigatoria
	[Tags]    dados-pessoais
	Executa Cadastro Inicial
	Informa CPF Valido
	Informa Genero Feminino
	Informa Data Nascimento    01/01/2000
	Seleciona Estado Civil Solteiro
	Informa Desemprego
	Informa Confirmacao Senha    12345
	Informa CEP    30130-100
	Clica Botao Confirmar Dados Pessoais
	Valida Mensagem Erro Senha    Senha é obrigatória
	Encerra Browser

RegistroUsuario_RepetirSenhaObrigatorio
	[Tags]    dados-pessoais
	Executa Cadastro Inicial
	Informa CPF Valido
	Informa Genero Feminino
	Informa Data Nascimento    01/01/2000
	Seleciona Estado Civil Solteiro
	Informa Desemprego
	Informa CEP    30130-100
	Informa Senha    12345
	Clica Botao Confirmar Dados Pessoais
	Valida Mensagem Erro Confirmacao Senha    Repetir Senha é obrigatória
	Encerra Browser

RegistroUsuario_RepetirSenhaDiferenteSenha
	[Tags]    dados-pessoais
	Executa Cadastro Inicial
	Informa CPF Valido
	Informa Genero Feminino
	Informa Data Nascimento    01/01/2000
	Seleciona Estado Civil Solteiro
	Informa Desemprego
	Informa CEP    30130-100
	Informa Senha    12345
	Informa Confirmacao Senha    123456
	Clica Botao Confirmar Dados Pessoais
	Valida Mensagem Erro Confirmacao Senha    As senhas estão diferentes
	Encerra Browser

RegistroUsuario_Senha4Digitos
	[Tags]    dados-pessoais
	Executa Cadastro Inicial
	Informa CPF Valido
	Informa Genero Feminino
	Informa Data Nascimento    01/01/2000
	Seleciona Estado Civil Solteiro
	Informa Desemprego
	Informa CEP    30130-100
	Informa Senha    1234
	Informa Confirmacao Senha    1234
	Clica Botao Confirmar Dados Pessoais
	Valida Mensagem Erro Senha    A senha deve conter entre 5 e 15 caracteres
	Valida Mensagem Erro Confirmacao Senha    A senha deve conter entre 5 e 15 caracteres
	Encerra Browser

RegistroUsuario_Senha16Digitos
	[Tags]    dados-pessoais
	Executa Cadastro Inicial
	Informa CPF Valido
	Informa Genero Feminino
	Informa Data Nascimento    01/01/2000
	Seleciona Estado Civil Solteiro
	Informa Desemprego
	Informa CEP    30130-100
	Informa Senha    1234567812345678
	Informa Confirmacao Senha    1234567812345678
	Clica Botao Confirmar Dados Pessoais
	Valida Mensagem Erro Senha    A senha deve conter entre 5 e 15 caracteres
	Valida Mensagem Erro Confirmacao Senha    A senha deve conter entre 5 e 15 caracteres
	Encerra Browser