# Ruby on Rails Code Interview

Sistema desenvolvido para avaliação técnica com Ruby on Rails. O projeto abrange correções de filtros, paginação com cursor, CRUD, envio de e-mails, relatórios com background jobs e testes automatizados.

## Regras
1. **fazer fork do projeto para seu github**
2. **atualizar a versão do ruby e do rails**
3. **criar o dockerfile e o docker-compose**
4. **enviar o link do seu repositório para avaliação**
5. **não usar IA, e nem copiar de outros projetos, nesse caso será desclassificado**

---

## ⚙️ Funcionalidades

1. **Correção de filtros**
   - Filtro por empresa corrigido para retornar apenas usuários da empresa especificada.
   - Filtro por nome de usuário ajustado para permitir buscas parciais e case-insensitive com `ILIKE`.

2. **Teste geral**
   - RSpec com cobertura de casos de uso para todas as funcionalidades do sistema.

3. **Tweets com paginação por cursor**
   - `GET /tweets`: lista tweets ordenados por mais recentes com paginação baseada em cursor.
   - `GET /users/:user_id/tweets`: mesma lógica aplicada para tweets de um usuário.
   - Criar a relação entre usuário e tweet.

4. **CRUD de Empresas**
   - CRUD completo com páginas HTML (`CompaniesController`).

5. **Mailer de novo usuário**
   - E-mail enviado automaticamente ao cadastrar novo usuário.

6. **Relatório em segundo plano**
   - Relatório gerado com um service/repository usando Sidekiq (`ReportGenerationJob`).
   - O primeiro relatório deve listar todos os usuários e seus tweets, ordenados por data de criação.
   - O segundo relatório deve mostrar as empresas e o número de usuários associados a cada uma.

7. **Cobertura de testes**
   - Cobertura extraída com SimpleCov. Relatório em `coverage/index.html`.

8. **Gerar um relatório com QUERY RAW usando joins, e otimizando a query com indices**
   - aqui você pode criar as tabelas e indices que você achar melhor para demostrar suas habilidades.

9. **utilização de hotwire ou stimulus**
   - aqui é para você mostrar seu conhecimento de ambos.

---

## ▶️ Como rodar

## Informações necessarias
Para executar este projeto é necessário instalar o [`docker`](#docker) e o [`docker compose `](#docker)

## Passo a passo, para instalar
Primeiro precisar buildar o projeto  e rodar o setup. Se não quiser rodar o setup que já vem o [`seed`](#criar-seed), pode-se criar com o [`create`](#criar-banco-de-dados) depois [`migrate`](#rodar-migration)
```
$ docker-compose build
$ docker-compose run web bundle exec rails db:setup
```

## Para rodar o projeto
Antes de rodar o projeto precisa criar o banco de dados com o setup
```
$ docker-compose up
```

## Criar banco de dados
```
$ docker-compose run web bundle exec rails db:create
```

## Rodar Migration
```
$ docker-compose run web bundle exec rails db:migrate
```

## Criar seed
```
$ docker-compose run web bundle exec rails db:seed
```

## Rodar testes
```
$ docker-compose run web bundle exec rspec
```

## Rails console
```
$ docker-compose run web bundle exec rails c
```
## Rodar Sidekiq
Com o docker-compose up ja roda altomaticando mais se quiser rodar, pode-se rodar da forma abaixo
```
$ docker-compose run web bundle exec sidekiq -C config/sidekiq.yml
```
## Criar seed
```
$ docker-compose run web bundle exec rails db:seed
```
## Criar setup
```
$ docker-compose run web bundle exec rails db:setup
```
## Docker:
- Instale o docker-ce (Docker Community Edition) - https://docs.docker.com/install/linux/docker-ce/ubuntu/
- Instale o docker compose - https://docs.docker.com/compose/install/#install-compose
- Adicione permissão ao grupo de usuário:

```
$ sudo groupadd docker
$ sudo gpasswd -a $USER docker
```

## Como testar


1- Entrar nas rotas

```
GET    /companies/:company_id/users
GET    /users/:user_id/tweets
```

2 - Rodar comando
```
$ docker-compose run web bundle exec rspec
```

3 - Entrar nas rotas especificadas nos teste 
```
GET /tweets
GET /users/:user_id/tweets
```

4 - Entrar nas rotas
```
GET    /companies/:company_id/users(.:format)                                                            users#index
GET    /companies(.:format)                                                                              companies#index
POST   /companies(.:format)                                                                              companies#create
GET    /companies/new(.:format)                                                                          companies#new
GET    /companies/:id/edit(.:format)                                                                     companies#edit
GET    /companies/:id(.:format)                                                                          companies#show
PATCH  /companies/:id(.:format)                                                                          companies#update
PUT    /companies/:id(.:format)                                                                          companies#update
DELETE /companies/:id(.:format)
```
5 - Entrar no console e rodar

```
$ docker-compose run web bash bundle exec rails c
```
Dentro do console
```
$ FactoryBot.create(:user)
```

6 - Entrar no rota

```
reports GET    /reports
```

E clicar nos links que fara o download. OBS: pode demorar um pouco por que sidekiq esta rodando
