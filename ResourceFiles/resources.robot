*** Settings ***
Library  SeleniumLibrary
Library  ../Utils/Helpers.py
Resource    GeneralVariables.robot

*** Keywords ***

Inicia Teste Registro Usuario
	Open Browser    ${URL}  ${BROWSER}
	#Maximize Browser Window
	Click Element    xpath://div[@id='ctl00_ContentScriptsCommon_upPolititicaPrivacidadeMaster']//a[@class='a-aceite']
	Click Element    xpath://div[@id='ctl00_divNaoLogadoTopo']//a[@class='cadastre-se']
	Wait Until Element Is Visible    id:ctl00_ContentBody_txtNomeCompleto

### Informa Campos

Informa Nome Completo
	[Arguments]    ${nomeCompleto}
	Input Text    id:ctl00_ContentBody_txtNomeCompleto  ${nomeCompleto}

Informa Email
	[Arguments]    ${email}
	Input Text    id:ctl00_ContentBody_txtEmail  ${email}

Informa Email Valido
	${emailValido}=  Gera Email Valido
	Informa Email  ${emailValido}

Informa Telefone Celular
	[Arguments]    ${telefone}
	Input Text    id:ctl00_ContentBody_txtTelefoneCelular  ${telefone}

Informa Cidade Existente
	[Arguments]    ${cidade}
	Input Text    id:ctl00_ContentBody_ucSuggestCidadeEstado_txtCidade  ${cidade}
	Wait Until Element Is Visible    xpath://div[@id='suggestCidade']/ul/li
	Click Element    xpath://div[@id='suggestCidade']/ul/li

Informa Cidade Inexistente
	[Arguments]    ${cidade}
	Input Text    id:ctl00_ContentBody_ucSuggestCidadeEstado_txtCidade  ${cidade}

Informa Cargo Existente
	[Arguments]    ${cargo}
	Input Text    id:ctl00_ContentBody_ucSuggestCargo_txtCargo  ${cargo}
	Wait Until Element Is Visible    xpath:(//div[@id='ctl00_ContentBody_ucSuggestCargo_divSuggestCargo']/ul/li)[1]
	Click Element    xpath:(//div[@id='ctl00_ContentBody_ucSuggestCargo_divSuggestCargo']/ul/li)[1]

Informa Cargo Inexistente
	[Arguments]    ${cargo}
	Input Text    id:ctl00_ContentBody_ucSuggestCargo_txtCargo  ${cargo}

Aceita Politicas Privacidade
	Click Element    xpath://div[@id='divMsgErrorAceitePrivacidade']//label

Clica Botao Cadastrar Curriculo
	Click Element    id:ctl00_ContentBody_btnCadastro

Informa CPF
	[Arguments]    ${cpf}
	Input Text    id:ctl00_ContentBody_txtCpf  ${cpf}

Informa CPF Valido
	${cpf}=  Gera CPF Valido
	Informa CPF    ${cpf}

Informa Genero Feminino
	Click Element    xpath://div[@id='content']//label[text()='Feminino']

Informa Data Nascimento
	[Arguments]    ${data}
	Input Text    id:ctl00_ContentBody_txtDataNascimento  ${data}

Seleciona Estado Civil Solteiro
	Select From List By Value    id:ctl00_ContentBody_ddlEstadoCivil  10

Informa CEP
	[Arguments]    ${cep}
	Input Text    id:ctl00_ContentBody_txtCep  ${cep}

Informa Desemprego
	Click Element    xpath://div[@class='box-form radio inline']//label[text()='Não']

Informa Senha
	[Arguments]    ${senha}
	Input Text    id:ctl00_ContentBody_txtSenha  ${senha}

Informa Confirmacao Senha
	[Arguments]    ${senha}
	Input Text    id:ctl00_ContentBody_txtSenhaConfirmacao  ${senha}

Informa Senha Valida
	${senha}=  Gera Senha Valida
	Informa Senha    ${senha}
	Informa Confirmacao Senha    ${senha}

Clica Botao Confirmar Dados Pessoais
	Click Element    id:ctl00_ContentBody_lkbContinuar

Seleciona Grau Escolaridade
	Select From List By Value    id:ctl00_ContentBody_rptEscolaridade_ctl00_ddlGrauDeEscolaridade  90

Seleciona Area Estudo
	Select From List By Value    id:ctl00_ContentBody_rptEscolaridade_ctl00_ddlAreaDeEstudo  50

Informa Instituicao Formacao
	[Arguments]    ${instituicao}
	Input Text    id:ctl00_ContentBody_rptEscolaridade_ctl00_txtInstituicao  ${instituicao}

Informa Data Inicio Formacao
	[Arguments]    ${data}
	Input Text    id:ctl00_ContentBody_rptEscolaridade_ctl00_txtDataInicio  ${data}

Informa Data Fim Formacao
	[Arguments]    ${data}
	Input Text    id:ctl00_ContentBody_rptEscolaridade_ctl00_txtDataFinal  ${data}

Clica Botao Salvar Formacao
	Click Element    id:ctl00_ContentBody_lkbContinuar

Informa Pretensao Salarial
	[Arguments]    ${pretensao}
	Input Text    id:ctl00_ContentBody_txtMinimoAceitavel  ${pretensao}

Informa Resumo
	[Arguments]    ${resumo}
	Input Text    id:ctl00_ContentBody_txtResumo  ${resumo}

Clica Botao Salvar Objetivos Profissionais
	Click Element    id:ctl00_ContentBody_lkbContinuar


### Validacoes

Valida Mensagem Erro
	[Arguments]    ${localizador}  ${mensagemEsperada}
	Wait Until Element Is Visible    ${localizador}
	${mensagemErro}=  Get Text    ${localizador}
	Should Be Equal As Strings    ${mensagemErro}   ${mensagemEsperada}

Valida Mensagem Erro Nome Completo
	[Arguments]    ${mensagemEsperada}
	Valida Mensagem Erro    xpath://input[@id='ctl00_ContentBody_txtNomeCompleto']/following-sibling::ul/li  ${mensagemEsperada}

Valida Mensagem Erro Email
	[Arguments]    ${mensagemEsperada}
	Valida Mensagem Erro    xpath://input[@id='ctl00_ContentBody_txtEmail']/following-sibling::ul/li  ${mensagemEsperada}

Valida Mensagem Erro Telefone Celular
	[Arguments]    ${mensagemEsperada}
	Valida Mensagem Erro    xpath://input[@id='ctl00_ContentBody_txtTelefoneCelular']/following-sibling::ul/li  ${mensagemEsperada}

Valida Mensagem Erro Cidade
	[Arguments]    ${mensagemEsperada}
	Valida Mensagem Erro    xpath://input[@id='ctl00_ContentBody_ucSuggestCidadeEstado_txtCidade']/following-sibling::ul/li  ${mensagemEsperada}

Valida Mensagem Erro Cargo
	[Arguments]    ${mensagemEsperada}
	Valida Mensagem Erro    xpath://input[@id='ctl00_ContentBody_ucSuggestCargo_txtCargo']/following-sibling::ul/li  ${mensagemEsperada}

Valida Mensagem Erro Aceite Privacidade
	[Arguments]    ${mensagemEsperada}
	Valida Mensagem Erro    xpath://input[@id='chkAceitePlrivacidade']/following-sibling::ul/li  ${mensagemEsperada}

Valida Cadastro Inicial
	Wait Until Element Is Visible    id:ctl00_ContentBody_ucTopoInclusao_divTopoInclusao
	${validacaoCadastroInicial}=  Get Text    //div[@id='ctl00_ContentBody_ucTopoInclusao_divTopoInclusao']/h1
	Should Be Equal As Strings    ${validacaoCadastroInicial}   Seu currículo

Valida Mensagem Erro CPF
	[Arguments]    ${mensagemEsperada}
	Valida Mensagem Erro    xpath://input[@id='ctl00_ContentBody_txtCpf']/following-sibling::ul/li  ${mensagemEsperada}

Valida Mensagem Erro Genero
	[Arguments]    ${mensagemEsperada}
	Valida Mensagem Erro    xpath://div[@id='containerErrorGenero']/ul/li  ${mensagemEsperada}

Valida Mensagem Erro Data Nascimento
	[Arguments]    ${mensagemEsperada}
	Valida Mensagem Erro    xpath://input[@id='ctl00_ContentBody_txtDataNascimento']/following-sibling::ul/li  ${mensagemEsperada}

Valida Mensagem Erro Estado Civil
	[Arguments]    ${mensagemEsperada}
	Valida Mensagem Erro    xpath://select[@id='ctl00_ContentBody_ddlEstadoCivil']/following-sibling::ul/li  ${mensagemEsperada}

Valida Mensagem Erro CEP
	[Arguments]    ${mensagemEsperada}
	Valida Mensagem Erro    xpath://input[@id='ctl00_ContentBody_txtCep']/following-sibling::ul/li  ${mensagemEsperada}

Valida Mensagem Erro Bairro
	[Arguments]    ${mensagemEsperada}
	Valida Mensagem Erro    xpath://input[@id='ctl00_ContentBody_txtBairro']/following-sibling::ul/li  ${mensagemEsperada}

Valida Mensagem Erro Situacao Trabalho
	[Arguments]    ${mensagemEsperada}
	Valida Mensagem Erro    xpath://div[@id='containerErrorCondicao']/ul/li  ${mensagemEsperada}

Valida Mensagem Erro Senha
	[Arguments]    ${mensagemEsperada}
	Valida Mensagem Erro    xpath://input[@id='ctl00_ContentBody_txtSenha']/following-sibling::ul/li  ${mensagemEsperada}

Valida Mensagem Erro Confirmacao Senha
	[Arguments]    ${mensagemEsperada}
	Valida Mensagem Erro    xpath://input[@id='ctl00_ContentBody_txtSenhaConfirmacao']/following-sibling::ul/li  ${mensagemEsperada}

Valida Cadastro Dados Pessoais Realizado
	Wait Until Element Is Visible    id:ctl00_ContentBody_rptEscolaridade_ctl00_ddlGrauDeEscolaridade
	${validacaoRealizouCadastroDadosPessoais}=  Get Text    xpath://div[@id='ctl00_ContentBody_ucTopoInclusao_divTopoInclusao']/h1
	Should Be Equal As Strings    ${validacaoRealizouCadastroDadosPessoais}  Escolaridade

Valida Cadastro Formacao Realizado
	Wait Until Element Is Visible    id:ctl00_ContentBody_txtMinimoAceitavel

Valida Cadastro Final Realizado
	${validacaoCadastroPrePagamento}=  Get Text    xpath://div[@id='content']//div[@class='plans-and-prices-carousel']//h1
	Should Be Equal As Strings    ${validacaoCadastroPrePagamento}  Escolha seu plano

### Executa Fluxos

Executa Cadastro Inicial
	Inicia Teste Registro Usuario
	Informa Nome Completo  Maria Silva
	Informa Email Valido
	Informa Telefone Celular    31999999999
	Informa Cidade Existente    Belo Horizonte
	Informa Cargo Existente    Analista
	Aceita Politicas Privacidade
	Clica Botao Cadastrar Curriculo
	Valida Cadastro Inicial

### Encerrar Browser

Encerra Browser
	Close Browser