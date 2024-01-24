## Русскоязычная версия

<details>
<summary>Всем привет!</summary>
Цель - знакомство с паттерном DI в iOS. 
Для работы необходима библиотека [SwiInject](https://github.com/Swinject/Swinject).

## Темы
- DI
- Swinject
  
### Проект: DI в приложении
Dependency Injection (DI) - это паттерн проектирования программного обеспечения, который позволяет управлять зависимостями компонентов приложения, разделить ответственность, улучшить тестируемость и облегчить поддержку кода.

Когда приложение создает объекты, которые зависят от других объектов, 
это может привести к проблемам при их изменении и сложностям при тестировании. 
DI позволяет абстрагировать создание объектов от их использования, внедрять зависимости из внешних источников и управлять жизненным циклом объектов.

Напишите программу, которая будет состоять из заглушечных классов, имитирующих выполнение запросов и методов сохранения данных в базу (т.е. объекты не работают с сетью и базой данных, а лишь возвращают заранее определённые в коде объекты)

## Задания

**Требование!** Создайте workspace внутри папки src с названием day08, если используете Swift Packet Manager.
При использовании Cocoapods воспользуйтесь сгенерированным workspace после команды `pod install`
Для каждой задачи внутри workspace необходимо создать macOS/Command Line Tool проект. Например, day08/quest1, day08/quest2.
Также не забудьте при создании проекта в пункте `Add to:` выбрать созданный workplace.
Более подробное описание о создании проектов можно прочитать в [документации](https://www.swift.org/getting-started/).

### Задание 0. Создать новый проект в XCode

### Задание 1. Подготовка объектов для DI

Для подготовки необходимо:
 - Создать класс данных `User`, содержащий не менее четырех полей
 - Создать протокол `NetworkService`, у которого есть метод для получения списка объектов `User`
 - Реализовать протокол `NetworkService` с именем класса `NetworkServiceImpl`, который возвращает заглушечный список заранее определенных объектов (список заполненных объектов можно создать прямо в методе получения)
 - Создать протокол `DatabaseService`, у которого есть метод для сохранения списка объектов `User`
 - Реализовать протокол `DatabaseService` с именем класса `ReleaseDatabaseServiceImpl`, который при сохранении выводит список в консоль "Release: [user1, user2, ... , userN] were saved"
- Реализовать протокол `DatabaseService` с именем класса `DebugDatabaseServiceImpl`, который при сохранении выводит список в консоль "Debug: [user1, user2, ... , userN] were saved"
- Реализовать `UserRepository` с методом для обновления данных о пользователях, в котором используются `NetworkService` и `DatabaseService`. `NetworkService` возвращает данные, `DatabaseService` сохраняет данные

### Задание 2. DI Swinject

**Совет:** Перед выполнением задания посмотрите построения DI от [SwiInject](https://github.com/Swinject/Swinject) в их репозитории.

Все дальнейшие действия необходимо проделать в функции **main**. Каждый пункт является отдельной функцией, которая вызывается в **main**.

1. Получение объекта `UserRepository` с использованием фабричного метода:
  - Создайте `Container`
  - Зарегистрируйте в нем `NetworkService` с реализацией `NetworkServiceImpl`
  - Зарегистрируйте в нем `DatabaseService` с реализацией `ReleaseDatabaseServiceImpl`
  - Зарегистрируйте в нем `UserRepository` с существующими в `Container` `NetworkService` и `DatabaseService`
  - Получите объект `UserRepository` из `Container` и вызовите метод для обновления данных о пользователе
  - Получите еще один `UserRepository` из `Container`
  - Сравните два полученных объекта `UserRepository` и результат выведите в консоль
2. Получение объекта `UserRepository` с использованием именнованных зависимостей:
  - Создайте `Container`
  - Зарегистрируйте в нем `NetworkService` с реализацией `NetworkServiceImpl`
  - Зарегистрируйте в нем `DatabaseService` с реализацией `ReleaseDatabaseServiceImpl` и именем **release**
  - Зарегистрируйте в нем `DatabaseService` с реализацией `DebugDatabaseServiceImpl` и именем **debug**
  - Зарегистрируйте в нем `UserRepository` с существующими в `Container` `NetworkService` и `DatabaseService` с именем **release**
- Зарегистрируйте в нем `UserRepository` с существующими в `Container` `NetworkService` и `DatabaseService` с именем **debug** 
- Получите объект `UserRepository` с именем **release** из `Container` и вызовите метод для обновления данных о пользователе
- Получите объект `UserRepository` с именем **debug** из `Container` и вызовите метод для обновления данных о пользователе
3. Получение единственного экземпляра `UserRepository`:
- Создайте `Container`
- Зарегистрируйте в нем `NetworkService` с реализацией `NetworkServiceImpl`
- Зарегистрируйте в нем `DatabaseService` с реализацией `ReleaseDatabaseServiceImpl`
- Зарегистрируйте в нем `UserRepository` с существующими в `Container` `NetworkService` и `DatabaseService` с использованием **scope**, который создает синглтон (подходящий scope нужно найти в документации)
- Получите объект `UserRepository` из `Container` и вызовите метод для обновления данных о пользователе
- Получите еще один `UserRepository` из `Container`
- Сравните два полученных объекта `UserRepository` и результат выведите в консоль


</details>

## The English version

<details>
<summary>Hello, everyone!</summary>

The goal is to learn about the DI pattern in iOS. 
You will need [SwiInject](https://github.com/Swinject/Swinject) library.

## Topics
- DI
- Swinject
  
### DI in applications
Dependency Injection (DI) is a software design pattern that allows you to manage application component dependencies, segregate responsibility, improve testability and make it easier to maintain code.

DI allows you to abstract the creation of objects from their use, implement dependencies from external sources and manage the life cycle of objects.

Write a program that will consist of stub classes that simulate the execution of queries and methods to save data to the database (i.e. the objects do not work with the network and the database, only return objects predefined in the code).

## Tasks

**Requirement!** Create a workspace inside the src folder named day08 if using the Swift Packet Manager.
If using Cocoapods, use the generated workspace after the `pod install` command
For each task inside the workspace, you need to create a macOS/Command Line Tool project. For example, day08/quest1, day08/quest2.
Also don't forget to select the created workspace under `Add to:` when creating a project.
You can read more about creating projects in [documentation](https://www.swift.org/getting-started/).

### Task 0. Create a new project in XCode

### Task 1. Preparing objects for DI

You need to:
 - Create a `User` data class with at least four fields
 - Create a `NetworkService` protocol that has a method to get a list of `User` objects
 - Implement a `NetworkService` protocol with `NetworkServiceImpl` class name , which returns a stub list of predefined objects (a list of filled objects can be created directly in the get method)
 - Create a `DatabaseService` protocol that has a method to save a list of `User` objects
 - Implement a `DatabaseService` protocol with  `ReleaseDatabaseServiceImpl` class name, which outputs the list to the console when saving 
"Release: [user1, user2, ... , userN] were saved"
- Implement a `DatabaseService` protocol with `DebugDatabaseServiceImpl` class name , which outputs a list to the console when saving 
"Debug: [user1, user2, ... , userN] were saved"
- Implement `UserRepository` with a method for updating user data, which uses `NetworkService` and `DatabaseService`. The `NetworkService` returns data, the `DatabaseService` stores data

### Task 2. DI Swinject

All further steps must be done in the **main** function. Each step is a separate function that is called in **main**.

1. Get `UserRepository` object using factory method:
  - Create `Container`
  - Register `NetworkService` with the `NetworkServiceImpl` implementation in it 
  - Register `DatabaseService` with the `ReleaseDatabaseServiceImpl` implementation in it
  - Register `UserRepository` with the existing `NetworkService` and `DatabaseService` in it
  - Get the `UserRepository` object from the `Container` and call the method to update user data
  - Get one more `UserRepository` from `Container`
  - Compare those two `UserRepository` objects and display the result in the console
2. Get `UserRepository` object using named dependencies:
  - Create `Container`
  - Register `NetworkService` with the `NetworkServiceImpl` implementation in it
  - Register `DatabaseService` with the `ReleaseDatabaseServiceImpl` implementation and the **release** name 
  - Register `DatabaseService` with the `DebugDatabaseServiceImpl` implementation and the  **debug** name
  - Register `UserRepository` with the existing `NetworkService` and `DatabaseService` in the `Container` with the **release** name
- Register `UserRepository` with the existing  `NetworkService` and `DatabaseService` in the `Container` with the **debug** name
- Get the `UserRepository` object named **release** from the `Container` and call the method to update the user data
- Get the `UserRepository` object named **debug** from the `Container` and call the method to update the user data
3. Getting a single instance of `UserRepository`:
- Create `Container`
- Register `NetworkService` with the `NetworkServiceImpl` implementation in it
- Register `DatabaseService` with the `ReleaseDatabaseServiceImpl` implementation in it
- Register `UserRepository` with the existing `NetworkService` and `DatabaseService` in it using **scope**, which creates a singleton (a suitable scope should be found in the documentation)
- Get the `UserRepository` object from the `Container` and call the method to update user data
- Get another `UserRepository` from the `Container`
- Compare the two received `UserRepository` objects and output the result to the console

</details>
