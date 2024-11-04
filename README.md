# Extrato Bancário <img src="ExtratoBancario.png" alt="Logo" width="42" height="42">
[![](https://img.shields.io/badge/release-1.0.0-blue?style=flat-square&logoColor=white)](https://github.com/zrfisaac/ExtratoBancario/releases/download/v1.0.0/ExtratoBancario-1.0.0-x32.exe)
[![](https://img.shields.io/badge/windows-x32-darkgreen?style=flat-square&logoColor=white)](https://github.com/zrfisaac/ExtratoBancario/releases/download/v1.0.0/ExtratoBancario-1.0.0-x32.exe)
[![](https://img.shields.io/badge/fonte-zip-red?style=flat-square&logoColor=white)](https://github.com/zrfisaac/ExtratoBancario/archive/refs/tags/v0.0.3.zip)

**Descrição:**
Uma aplicação simples e eficiente para gestão de extratos bancários, permitindo adicionar, editar, remover e listar transações de crédito e débito.

**Tecnologia Utilizada:**
Desenvolvido com Delphi Community e utilizando o banco de dados Firebird 3.0 com o componente FireDAC.

## Estrutura da Aplicação
A aplicação foi organizada em diferentes unidades e classes para facilitar a manutenção e a compreensão do código. Algumas das principais classes e unidades incluem:

- **Menu Principal:** Gerencia a navegação entre diferentes menus da aplicação.
- **Menu de Configuração:** Permite ao usuário configurar as informações de conexão com o banco de dados.
- **Menu de Transação:** Gerencia as operações relacionadas às transações bancárias.
- **Menu Modelo:** Fornece uma interface para inserir um modelo de dados para testes, facilitando o desenvolvimento e a verificação das funcionalidades da aplicação.

## Princípios SOLID
Foram aplicados os seguintes princípios do SOLID:

- **Single Responsibility Principle (SRP):** Cada classe foi criada com uma única responsabilidade, como a configuração de conexão com o banco de dados e a manipulação de transações, o que facilita a manutenção e a evolução do código.
- **Open/Closed Principle (OCP):** As classes podem ser estendidas sem a necessidade de modificar o código existente. Isso foi implementado através da herança e do uso de classes base para menus.

## Padrão de Projeto

Foi utilizado o padrão de projeto **Facade** para simplificar a interface entre a aplicação e o banco de dados. Isso melhora a flexibilidade e a manutenção, permitindo que mudanças na forma de acesso ao banco não afetem outras partes da aplicação.

## Estrutura da Tabela

A tabela `TB_TRANSACAO` foi criada para armazenar as transações bancárias, com a seguinte estrutura:

```sql
CREATE TABLE TB_TRANSACAO (
    CL_ID        INT PRIMARY KEY,
    CL_DATA      DATE NOT NULL,
    CL_NOME      VARCHAR(200) NOT NULL,
    CL_VALOR     DECIMAL(15,2) NOT NULL,
    CL_TIPO      VARCHAR(20) NOT NULL
);
```

## Descrição dos Campos

- **CL_ID:** Identificador único da transação (chave primária).
- **CL_DATA:** Data em que a transação foi realizada.
- **CL_NOME:** Nome ou descrição da transação.
- **CL_VALOR:** Valor da transação, podendo ser um crédito ou débito.
- **CL_TIPO:** Tipo da transação, que pode ser "Crédito" ou "Débito".

Essa estrutura permite o registro eficiente e organizado das transações bancárias, facilitando a manipulação e consulta dos dados.

## Estrutura de Dados

Foi implementada uma estrutura de dados personalizada para gerenciar as transações bancárias. A escolha recaiu sobre uma lista encadeada, que é apropriada para adicionar e remover transações com eficiência. Essa estrutura permite:

- **Adicionar Transações:** Novas transações são facilmente inseridas na lista.
- **Remover Transações:** Transações podem ser removidas sem a necessidade de deslocar os outros elementos.
- **Buscar Transações:** Métodos foram implementados para localizar transações específicas na lista.
- **Listar Transações:** Todas as transações podem ser percorridas e exibidas de forma sequencial.

A lista encadeada oferece flexibilidade e é eficaz para o gerenciamento dinâmico das transações, tornando a aplicação mais responsiva e eficiente.

## Funcionalidades

- Adicionar transações
- Editar transações
- Remover transações
- Listar transações

## Principais Arquivos

A seguir, está a lista dos principais arquivos incluídos no projeto, com uma breve descrição de cada um:

- `Fontes\uMenuConfiguracao.pas` : Unidade responsável pela interface de configuração da conexão com o banco de dados. Contém métodos para conectar, desconectar e gravar as configurações.
- `Fontes\uMenuPrincipal.pas` : Unidade principal da aplicação, que gerencia a interface do usuário e a navegação entre os diferentes menus. Coordena a inicialização e exibição de formulários.
- `Fontes\uModeloMenu.pas` : Classe base para os menus da aplicação. Define a estrutura e o comportamento comum para todas as telas de menu.
- `Fontes\uDataPrincipal.pas` : Unidade que contém o DataModule, gerenciando a conexão com o banco de dados e as operações relacionadas a ele.
- `Fontes\uUnitConfig.pas` : Unidade que lida com as configurações da aplicação, permitindo a leitura e gravação de parâmetros de configuração.
- `Fontes\uUnitAjuda.pas` : Unidade que fornece funcionalidades de ajuda e informações sobre a aplicação.
- `Fontes\uMenuSobre.pas` : Unidade que apresenta informações sobre a aplicação, como versão e desenvolvedores.
- `Fontes\uMenuTransacao.pas` : Unidade que gerencia a interface para operações de transações bancárias, permitindo a adição, edição e remoção de registros.

## Geradores de Instalador

Os geradores de instalador utilizados para a aplicação são:

- `ExtratoBancarioX32.nsi` : Script para criar o instalador da versão 32 bits da aplicação.

Esses scripts garantem que a aplicação seja instalada corretamente em sistemas operacionais compatíveis.

## Licença

Este projeto é licenciado sob a **GNU General Public License, Version 3, 29 June 2007**. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou enviar pull requests para melhorar o projeto.
