*** Settings ***
Library    DiffLibrary


*** Test Cases ***
Teste 01: Testa diferença entre arquivos
    #Run Keyword And Continue On Failure    Verifica diferença entre arquivos
    ${status}    Run Keyword And Return Status        Verifica diferença entre arquivos
    Log    ${status}
    Run Keyword If    ${status} == ${False}    Log    Arquivos com conteúdos diferentes!


Teste 02: Testa diferença entre arquivos 2
    ${status}    Run Keyword And Return Status        Verifica diferença entre arquivos 2
    Run Keyword If    ${status} == ${True}     Log    Arquivos iguais!
    Log    ${status}
    

*** Keywords ***
Verifica diferença entre arquivos
    Diff Files     ${CURDIR}${/}loremipsum.txt     ./data/loremipsum.txt      fail=${True}

Verifica diferença entre arquivos 2
    Diff Files     ${CURDIR}${/}loremipsum.txt     ./data/loremipsum2.txt      fail=${True}

 