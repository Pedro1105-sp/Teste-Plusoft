*** Settings ***
Documentation    Suite de testes na tela de Login no teste da Plusoft

Library          Browser


*** Test Cases ***
Validar tela de Login no site teste da Plusoft


# MASSA DE TESTE PARA REALIZAR O LOGIN
    ${name}                    Set Variable     Pedro Henrique
    ${password}                Set Variable     senha  


# CHECK POINTS - VERIFICANDO SE É A PÁGINA CORRETA
    New Browser                browser=chromium    headless=False
    New Page                   http://127.0.0.1:5500/HTML/login.html


# PALAVRA CHAVE DE CHECK POINT -> WAIT FOR ELEMENTS STATE
    Wait For Elements State    body h2    visible    5000
    Get Text                   body h2    equal      Login

                              # PROPRIEDADE HTML PARA LOCALIZAR O ELEMENTO
    Fill Text                  css=input[name=username]                 ${name}
    Fill Text                  css=input[name=password]                 ${password}

    # REALIZAR O CLICK NO BOTÃO
    Click                      css=button[id=login_button]  

    # ENCONTRAR PROPRIEDADE NA TELA QUE DEVE SER REDIRECIONADA, QUE SERIA A TELA DE PESQUISA. QUERO ENCONTRAR A PROPRIEDADE H2 BUSCAR. (VALIDAR SE O REDIRECIONAMENTO ESTÁ CORRETO).
    Get Property               css=h2                     value equal     Buscar

    # ESPERA 10 SEGUNDOS
    Sleep                        10


# MELHORIAS / DEFEITOS
    # O BOTÃO NA TELA DE LOGIN NÃO ESTÁ SENDO REALIZADO O REDIRECIONAMENTO DA PÁGINA PARA A PRÓXIMA TELA... CORRIGIR
    # NA TELA DE LOGIN NÃO EXISTE CREDENCIAIS VÁLIDAS, AO INSERIR QUALQUER DADO VOCÊ SERÁ LOGADO.