Feature: Login na EBAC-SHOP

    Como cliente da EBAC-SHOP
    Eu quero fazer o login na plataforma
    Para visualizar meus pedidos

    Scenario Outline: Login com dados válidos
        Given que estou na página de login da EBAC-SHOP
        When preencho o campo de e-mail com "<email>"
        And preencho o campo de senha com "<senha>"
        And clico no botão "Entrar"
        Then devo ser direcionado para a tela de checkout
        And não devo ver a mensagem de alerta "Usuário ou senha inválidos"

        Examples:
            | email                 | senha    |
            | cliente@ebac.com      | senha123 |
            | outrocliente@ebac.com | 123senha |

    Scenario Outline: Login com dados inválidos
        Given que estou na página de login da EBAC-SHOP
        When preencho o campo de e-mail com "<email>"
        And preencho o campo de senha com "<senha>"
        And clico no botão "Entrar"
        Then devo ver a mensagem de alerta "Usuário ou senha inválidos"

        Examples:
            | email               | senha      |
            | cliente@ebac.com    | senhainval |
            | emailinval@ebac.com | senha123   |
