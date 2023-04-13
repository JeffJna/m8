Feature: Configurar um produto na EBAC-SHOP

  Como cliente da EBAC-SHOP
  Eu quero configurar um produto de acordo com meu tamanho e gosto
  E escolher a quantidade
  Para depois inserir no carrinho

  Scenario Outline: Adicionar produto ao carrinho com seleções válidas
    Given que estou na página de visualização do produto
    When selecionei a cor "<cor>"
    And selecionei o tamanho "<tamanho>"
    And preencho a quantidade desejada com "<quantidade>"
    And clico no botão "Adicionar ao Carrinho"
    Then o produto deve ser adicionado ao carrinho
    And devo ver uma mensagem de sucesso

    Examples:
      | cor      | tamanho | quantidade |
      | vermelho | P       | 1          |
      | azul     | M       | 3          |

  Scenario: Limpar as seleções do produto
    Given que estou na página de visualização do produto
    And selecionei a cor "<cor>"
    And selecionei o tamanho "<tamanho>"
    And preencho a quantidade desejada com "<quantidade>"
    When clico no botão "Limpar"
    Then todas as seleções devem ser desmarcadas

  Scenario Outline: Adicionar produto ao carrinho com seleções inválidas
    Given que estou na página de visualização do produto
    When selecionei a cor "<cor>"
    And selecionei o tamanho "<tamanho>"
    And preencho a quantidade desejada com "<quantidade>"
    And clico no botão "Adicionar ao Carrinho"
    Then não devo ver uma mensagem de sucesso

    Examples:
      | cor      | tamanho | quantidade |
      | vazio    | P       | 1          |
      | vermelho | vazio   | 2          |
      | azul     | G       | 11         |

    **Critérios de aceitação:**

      | Critério | Descrição                                                                                            |
      | -------- | ---------------------------------------------------------------------------------------------------= |
      | 1        | As seleções de cor, tamanho e quantidade devem ser obrigatórias para permitir adicionar ao carrinho  |
      | 2        | Apenas até 10 produtos podem ser adicionados em cada venda                                           |
      | 3        | Ao clicar no botão "limpar", todas as seleções devem ser desmarcadas                                 |
