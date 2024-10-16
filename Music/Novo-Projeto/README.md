# Novo Projeto

Esse projeto permite aceitar (via formulário HTML) uploads de arquivos, normalizar os dados e salvá-los corretamente no banco de dados, exibindo a renda bruta total representada pelos dados de vendas após o upload do arquivo.

## Pré-requisitos

Antes de começar, você precisará ter os seguintes softwares instalados:

- [Ubuntu](Microsoft Store) (versão 22.04)
- [Ruby](https://www.ruby-lang.org/en/downloads/) (versão 3.1.2)
- [Rails](https://rubyonrails.org/) (versão X.X.X)
- [PostgreSQL](https://www.postgresql.org/download/) (ou outro banco de dados)
- [Git](https://git-scm.com/downloads)

## Configuração do Projeto

Siga os passos abaixo para configurar o projeto em sua máquina local.


2. Instale as Dependências

Instale as gemas necessárias:

bundle install

3. Configure o Banco de Dados

Crie e migre o banco de dados:

rails db:create
rails db:migrate

Se necessário, carregue dados iniciais:

rails db:seed

4. Executar o Servidor

Inicie o servidor Rails:

rails server

Acesse o aplicativo em seu navegador em http://localhost:3000.

Estrutura do Projeto

O projeto consiste em exibir a renda bruta total do arquivo (Sale_Controller, index.html, etc.).
