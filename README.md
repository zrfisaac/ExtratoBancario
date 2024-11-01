# Extrato Bancário <img src="ExtratoBancario.png" alt="Logo" width="42" height="42">
[![](https://img.shields.io/badge/release-0.0.1-blue?style=flat-square&logoColor=white)](#)

Uma aplicação simples e eficiente para gestão de extratos bancários, permitindo adicionar, editar, remover e listar transações de crédito e débito.

## Funcionalidades

- Adicionar novas transações (crédito ou débito)
- Editar transações existentes
- Remover transações
- Listar todas as transações com valores e datas

## Estrutura do Projeto

Este projeto foi estruturado para garantir organização e flexibilidade, seguindo boas práticas de desenvolvimento:

- **Princípios SOLID:** Aplicação dos princípios de Single Responsibility (SRP) e Interface Segregation (ISP).
- **Design Pattern (Strategy):** Padrão de projeto `Strategy` implementado para permitir diferentes tipos de transações (crédito e débito) sem alterar a lógica do repositório de transações.
- **Estrutura de Dados Personalizada (Lista Encadeada):** Implementação de uma lista encadeada para gerenciamento dinâmico e eficiente das transações.

## Tecnologias e Ferramentas

- **Delphi Community**
- **Firebird:** Banco de dados gratuito incluído no projeto
- **Componentes Nativos Delphi:** Sem bibliotecas de terceiros

## Instalação

- Clone este repositório:
```bash
git clone https://github.com/zrfisaac/ExtratoBancario.git
```
- Abra o projeto no **Delphi Community**.
- Configure o banco de dados Firebird:
  - O banco de dados está incluído no projeto para facilitar a configuração.
  - Verifique a conexão com o banco de dados no código e ajuste, se necessário.
- Compile e execute o projeto.

## Estrutura de Arquivos

Abaixo está a estrutura de diretórios do projeto, com uma breve descrição de cada pasta:

```bash
Controle-Extrato-Bancario/
├── Binarios/                    # Arquivos binários compilados
│   ├── x32/                     # Compilação para arquitetura x32
│   │   ├── Debug/               # Versão de Debug para x32
│   │   └── Release/             # Versão de Release para x32
│   └── x64/                     # Compilação para arquitetura x64
│       ├── Debug/               # Versão de Debug para x64
│       └── Release/             # Versão de Release para x64
│
├── Fontes/                      # Código-fonte e formulários do projeto
│   ├── uDataPrincipal.dfm       # Formulário principal para o gerenciamento de dados
│   ├── uDataPrincipal.pas       # Unidade de dados principal
│   ├── uMenuPrincipal.dfm       # Formulário do menu principal da aplicação
│   ├── uMenuPrincipal.pas       # Unidade do menu principal
│   ├── uModeloMenu.dfm          # Modelo do menu para templates adicionais
│   ├── uModeloMenu.pas          # Código associado ao modelo de menu
│   └── uUnitConfig.pas          # Configurações e parâmetros gerais da aplicação
│
├── Objetos/                     # Arquivos de objetos compilados
│   ├── x32/                     # Objetos para arquitetura x32
│   │   ├── Debug/               # Objetos de Debug para x32
│   │   └── Release/             # Objetos de Release para x32
│   └── x64/                     # Objetos para arquitetura x64
│       ├── Debug/               # Objetos de Debug para x64
│       └── Release/             # Objetos de Release para x64
│
├── ExtratoBancario.dpr          # Arquivo principal do projeto Delphi
├── ExtratoBancario.dproj        # Arquivo de configurações do projeto Delphi
├── ExtratoBancario.ico          # Ícone da aplicação
├── ExtratoBancario.png          # Imagem representativa da aplicação
├── ExtratoBancario.res          # Arquivo de recursos
├── LICENSE                      # Licença GNU GPL v3 para o projeto
└── README.md                    # Documentação do projeto
```

## Licença

Este projeto é licenciado sob a **GNU General Public License, Version 3, 29 June 2007**. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou enviar pull requests para melhorar o projeto.
