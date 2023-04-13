Feature: Concluir cadastro na EBAC-SHOP

  Como cliente da EBAC-SHOP
  Eu quero concluir meu cadastro para finalizar minha compra

  Scenario Outline: Cadastro com dados válidos
    Given que estou na página de cadastro da EBAC-SHOP
    When preencho o campo de nome com "<nome>"
    And preencho o campo de e-mail com "<email>"
    And preencho o campo de CPF com "<cpf>"
    And preencho o campo de endereço com "<endereco>"
    And preencho o campo de telefone com "<telefone>"
    And clico no botão "Concluir Cadastro"
    Then devo ser direcionado para a tela de finalização de compra
    And não devo ver a mensagem de alerta "Campos obrigatórios não preenchidos"

    Examples:
      | nome          | email                | cpf            | endereco                        | telefone        |
      | João da Silva | joao.silva@email.com | 123.456.789-01 | Rua A, 123, Bairro C, São Paulo | (11) 99999-9999 |

  Scenario Outline: Cadastro com e-mail inválido
    Given que estou na página de cadastro da EBAC-SHOP
    When preencho o campo de nome com "<nome>"
    And preencho o campo de e-mail com "<emailinvalido>"
    And preencho o campo de CPF com "<cpf>"
    And preencho o campo de endereço com "<endereco>"
    And preencho o campo de telefone com "<telefone>"
    And clico no botão "Concluir Cadastro"
    Then devo ver a mensagem de erro "E-mail inválido"

    Examples:
      | nome          | emailinvalido       | cpf            | endereco                        | telefone        |
      | João da Silva | joao.silvaemail.com | 123.456.789-01 | Rua A, 123, Bairro C, São Paulo | (11) 99999-9999 |

  Scenario: Cadastro com campos vazios
    Given que estou na página de cadastro da EBAC-SHOP
    When preencho o campo de nome com ""
    And preencho o campo de e-mail com ""
    And preencho o campo de CPF com ""
    And preencho o campo de endereço com ""
    And preencho o campo de telefone com ""
    And clico no botão "Concluir Cadastro"
    Then devo ver a mensagem de alerta "Campos obrigatórios não preenchidos"

    **Critérios de aceitação:**

      | Critério | Descrição                                                                                                      |
      | -------- | -------------------------------------------------------------------------------------------------------------  |
      | 1        | Todos os campos obrigatórios, marcados com asteriscos, devem ser preenchidos para permitir concluir o cadastro |
      | 2        | O campo de e-mail não deve permitir formato inválido e deve exibir uma mensagem de erro                        |
      | 3        | Ao tentar cadastrar com campos vazios, deve exibir mensagem de alerta                                          |
