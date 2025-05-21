## Homework8

### Tasks
1. Создать публичный репозиторий с названием lab08 на сервисе GitHub
2. Ознакомиться со ссылками учебного материала
3. Выполнить инструкцию учебного материала
4. Составить отчет и отправить ссылку личным сообщением в Slack

### Выполнение:
* Клонируем репозиторий из лабы 6, удаляем ненужные файлы и создаём Dockefile:

```bash
FROM ubuntu:18.04

RUN apt update
RUN apt install -yy gcc g++ cmake

COPY . .

RUN cd hello_world_application && cmake -B_build && cmake --build _build
RUN hello_world_application/_build/hello_world
```

* В дирректории .github/workflows создаём новый файл:

```yml
name: Docker Image CI

on:
  push:
    branches: [ "main" ]
  pull_request:
    branches: [ "main" ]

jobs:

  build:

    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v4
    - name: Build the Docker image
      run: docker build -t logger .
```

* Проверяем в GithubActions результаты выполнения и видим, что работа библиотеки hello_world_application выполнена (сделал так , потому что по туториалу используется библеотека, которой нет, и решил так продемонстрировать работу с Docker)







