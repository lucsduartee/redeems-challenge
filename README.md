# Redeems Challenge

## Getting Started

Essas instruções fornecerão uma cópia do projeto instalado e funcionando em sua máquina local para fins de desenvolvimento e teste.

### Pré-requisitos

* [Ruby](https://www.ruby-lang.org/) - [Instalando o Ruby](https://www.ruby-lang.org/pt/documentation/installation/)

## Instalação:
Descompactar o arquivo [redeems-challenge-ruby-master.zip](https://github.com/lobby-tech/redeems-challenge-ruby/archive/refs/heads/master.zip) ou baixar o código através do  [repositório no GitHub](https://github.com/lobby-tech/redeems-challenge-ruby)

## Rodando a aplicação

### Utilizando Docker

Com o Docker instalado, abra um terminal, vá até a raiz do projeto e execute o comando abaixo para montar o container:
```sh
docker build -t redeems-challange:1.0 .
```

ou você pode usar também o docker-compose:

```sh
docker-compose build
```

Após a construção do container, execute o comando abaixo para que executar o servidor localmente:

```sh
docker-compose up app
```

Caso queeria visualizar o resultado dos testes, você pode executar o seguinte comando abaixo:

```sh
docker-compose up test
```

### Sem utilização do Docker
Com Ruby instalado em sua máquina, siga os seguintes passos:

- Instalando o bundler:
```sh
gem install bundler
```

- Instalar as gems necessárias no Gemfile:
```sh
bundle install
```

- Realizar a pré-configuração do banco de dados:
```sh
bundle exec rails db:setup
```

- Para executar o servidor localmente:
```sh
bundle exec rails server
```

- Para executar toda a suíte de testes:
```sh
bundle exec rails test
```

## Exemplo prático
Disponbilizamos uma aplicação web que mostra de forma visual como será a interface front-end.

https://lobby-redeems-challenge.netlify.app


## Próximos passos

Baseado nas premissas citadas: (100%)

- [x] Construir uma estrutura de banco condizente (100%)
- [x] Desenvolver as operações da respectiva API (100%)
  - [x] A aplicação base possui as rotas API para consulta de páginas de resgates e criação de resgates.
  - [x] O resgate obrigatoriamente deve estar associado a uma página de resgate.
  - [x] Páginas de resgate podem ficar inacessíveis para novos resgates.
  - [x] Páginas de resgate podem (ou não) ter variações de tamanhos.
  - [x] Páginas de resgate podem (ou não) ter perguntas extras.
  - [x] O mesmo usuário não deve conseguir realizar novos resgates antes de ter o resgate anterior aprovado ou reprovado.
- [x] Adequar os testes já implementados (100%)