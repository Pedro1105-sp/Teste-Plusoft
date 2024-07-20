*** Settings ***
Documentation    Suite de testes na tela de Pesquisa no teste da Plusoft

Library          Browser


*** Test Cases ***
Realizar busca no site teste da Plusoft

# MASSA DE TESTE PARA REALIZAR A PESQUISA
    ${search}                    Set Variable     Resultado 1

# CHECK POINTS - VERIFICANDO SE É A PÁGINA CORRETA
    New Browser                browser=chromium    headless=False
    New Page                   http://127.0.0.1:5500/HTML/search.html


# PALAVRA CHAVE DE CHECK POINT -> WAIT FOR ELEMENTS STATE
    Wait For Elements State    body h2    visible    5000
    Get Text                   body h2    equal      Busca

    Fill Text                  css=input[id=search_input]        ${search}     

    Click                      css=button[id=search_button]

Verificar se a busca foi encontrada no site teste da Plusoft
    ${search}                    Set Variable     Resultado 1

    New Browser                browser=chromium    headless=False
    New Page                   http://127.0.0.1:5500/HTML/search.html

    Wait For Elements State    body h2    visible    5000
    Get Text                   body h2    equal      Busca

    Fill Text                  css=input[id=search_input]        ${search}     

    Click                      css=button[id=search_button

    # ENCONTRAR PROPRIEDADE APÓS CLICAR PARA REALIZAR A PESQUISA, DEVERIA APARECER O RESULTADO PESQUISADO. (VALIDAR SE A PESQUISA FOI REALIZADA COM SUCESSO).
    Get Property               css=h2                     value equal     ${search}

    # ESPERA 10 SEGUNDOS
    Sleep                       10









# MELHORIAS / DEFEITOS
    # APÓS REALIZAR UMA PESQUISA E CLICAR NO BOTÃO 'BUSCAR', A PÁGINA NÃO É REDIRECIONADA PARA O RESULTADO DA PESQUISA. E E COM ISSO NÃO É POSSÍVEL FAZER UMA BUSCA.
    # MESMO SEM REALIZAR A PESQUISA JÁ APARECE DOIS TIPOS DE RESULTADO 1 E 2, DEVERIA REALIZAR UMA MELHORIA PARA QUE O RESULTADO SÓ APAREÇA DEPOIS QUE CLICAR NO BOTÃO 'BUSCAR'.