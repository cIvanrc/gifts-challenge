# Gifts Challenge

Apptegy plans to offer its school users a gift delivery service. The gifts will be school-branded and
sent to members of the school community through a dedicated section on Thrillshare, our core
product. Apptegy will create the item in-house and send it out for delivery. All the user has to do
within Thrillshare is essentially choose the gift, select the recipient(s), and confirm the order.

## Table of contents

- [Gift Challenge]
   - [Environment URLS](#environment-urls)
  - [Development](#development)
    - [Stack](#stack)
    -  [Requeriments](#requeriments)
    -   [Setup the project](#setup-the-project)
    -   [Runing specs](#runing-specs)
  - [Deploying](#deploying)
  - [Architecture and Business notes](#architecture-and-business-notes)
    - [Entity - Relationship Map](#entity---relationship-map)
    - [Businnes schema](#bussines-schema)
    - [Constraints](#constraints)



### Environment URLS

* **API Documentation** - pending
* **Staging** -pending


## Development
### Stack
- Built to run in Docker
- Code Language: Ruby 2.7.2
- Framework: Rails 6.1.3.1
- Database: Postgres 13.1
- Cloud provider: AWS (well it's pending)

### Requeriments
 - Docker
 - Docker compose

### Setup the project

1. Clone this repository into your local machine

2. Create a `.env` from the `env_example` file in the project's source
   directory.

```bash
$  cp env_example .env
```

The current value of the env_example file contains a descriptive value of what is expected;
You only need to assign a value to the variables
Any questions you can approach me to guide you in the assignment of values

3. Up the containers

```bash
$ docker-compose up -d
```

That command will lift every service that the project needs, such as the `api service`, `database`, and `test service`.

4.You need to setup the database:

First enter to the container

``` bash
$ docker-compose exec api bash
```
Once you are in the api container, you can setup the database

``` bash
# rails db:create db:migrate
```

Once the database is configured, run the seed file

``` bash
# rails db:seed
```

This is going to create an example user, (at this moment there is no need to handle users, you can create your own users, but for the moment you can use the user with the following credentials)
email: 'example_email@domain.com', password: 'password'

### Running specs

1. Enter to the test container

```bash
$ docker-compose run --rm test bash
```

or if the test container is already up, you can use this

```bash
$ docker-compose exec test bash
```
2.- Now (inside your test container) run the spcs

```
# rspec
```

## Deploying
Pending, curretly is only the Continuous Integration with Github Actions, the Continuous Delivery is not configured, but there is already a ECS

## Architecture and Business notes
### Entity - Relationship Map

### Businnes schema
![image](https://user-images.githubusercontent.com/29314633/115674474-4c047a00-a313-11eb-8470-3aede7efefa6.png)

### Constraints
- All Recipients and Orders are scoped to a school.
- There are four types of gift: `mug, t_shirt, hoodie, sticker`.
- Orders have the following workflow status: `received, processing, shipped, cancelled`.
- Orders can be sent to multiple Recipients and contain multiple gifts.
- When an Order is marked to be `shipped` there should be a flag on the order to determine whether to send the Recipient(s) an email message that their gift is on its way.
- Individual Orders are limited to a maximum of 20 Recipients.
- Schools are limited to send out a total of 60 gifts per day. For example a single Order for 20
recipients and 3 gifts per recipient would be the only order allowable for that day for users at that
school.
