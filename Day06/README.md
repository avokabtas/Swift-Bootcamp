## Русскоязычная версия

<details>
<summary>Привет!</summary>
Сегодня ты создашь первую базу данных для своего приложения на IOS. 

Кейсы применения баз данных в приложении:
- Хранение пользовательских данных: база данных может использоваться для хранения пользовательских данных,
таких как профили, предпочтения и настройки пользователя.
- Кэширование данных: приложение может кэшировать часто запрашиваемые данные в локальной базе данных для улучшения производительности приложения.
- Оффлайн-доступ: приложение может нуждаться в хранении данных локально для оффлайн-доступа, когда нет подключения к Интернету.
- Синхронизация: если приложение подключено к серверу или веб-приложению,
локальная база данных может использоваться для синхронизации данных между приложением и сервером.
- Аналитика и отчетность: база данных может использоваться для хранения данных для целей аналитики и отчетности,
таких как отслеживание поведения пользователей и статистики использования приложения.

Существуют два основных типа баз данных: реляционные и нереляционные (также известные как NoSQL).
Реляционная база данных основана на реляционной модели,
которая организует данные в одну или несколько таблиц с предопределенной схемой.
Каждая таблица имеет набор столбцов, и каждая строка представляет собой запись в таблице.
Реляционные базы данных обычно используются, когда есть потребность в сложных запросах, объединениях и согласованности данных.
Примеры популярных реляционных баз данных, используемых в разработке iOS, включают SQLite, MySQL и PostgreSQL.

Нереляционная база данных же не использует таблицы или предопределенную схему.
Вместо этого она использует гибкую модель документа или ключ-значение для хранения данных.
Нереляционные базы данных обычно используются, когда есть потребность в масштабируемости, гибкости и высокой доступности.
Примеры популярных нереляционных баз данных, используемых в разработке iOS, включают Realm, Firebase Realtime Database.
Другим популярным решением для разработки баз данных на iOS является фреймворк CoreData.


В текущем задании мы предлагаем использовать Realm, поскольку эта ORM позволяет вести кросс-платформенную разработку.
Преимуществом Realm является в том числе и улучшенная обратная совместимость с версиями iOS по сравнению с аналогами.

## Темы
- Использование Realm

### Проект: База данных рецептов

## Задания:

**Требование!** Создай workspace внутри папки src с названием day06, если используешь Swift Packet Manager.
При использовании Cocoapods воспользуйся сгенерированным workspace после команды `pod install`
Для каждой задачи внутри workspace необходимо создать macOS/Command Line Tool проект. Например, day06/quest1, day06/quest2.
Также не забудь при создании проекта в пункте `Add to:` выбрать созданный workplace.
Более подробное описание о создании проектов можно прочитать в [документации](https://www.swift.org/getting-started/).

**Совет** Перед выполнением задания посмотри примеры в официальной документации от [Realm](https://realm.io/realm-swift/).

### Задание 1. CRUD для рецептов
Реализуй модель рецептов для своей базы данных.

Создай сущность `Recipe`, которая включает:
- Название
- Пошаговая инструкция по готовке в виде строки
- Ссылка на фотографию

**Требования:**
- Должен быть реализован класс `RecipeDataSource`, в котором определены CRUD операции (Create, Read, Update, Delete)
- `RecipeDataSource` должен реализовывать метод поиска рецепта по названию

_Описание работы программы:_
- При запуске программы база данных заполняется твоими данными.
- Программа получает добавленные данные из базы данных и выводит их на экран в виде списка.
- Проверь удаление, удалив первый элемент списка из БД. Выведи весь список рецептов на экран.
- Проверь обновление в БД, обновив название первого элемемнта в списке.
- Проверь поиск рецепта по названию (название может быть задано в коде). Отобрази в консоли список полученных результатов.

</details>

## The English version

<details>
<summary>Hello!</summary>

Today you will create the first database for your iOS app. 

Cases of applying databases to an application:
- Storing user data: the database can be used to store user data, such as profiles, preferences and user settings.
- Data caching: the application can cache frequently requested data in the local database to improve application performance.
- Offline access: the application may need to store data locally for offline access when there is no Internet connection.
- Synchronization: if the application is connected to a server or a web application, the local database can be used to synchronize data between the application and the server.
- Analytics and reporting: the database can be used to store data for analytics and reporting purposes, such as tracking user behavior and application usage statistics.

There are two main types of databases: relational and non-relational (also known as NoSQL).
A relational database is based on a relational model that organizes data into one or more tables with a predefined schema. Each table has a set of columns, and each row is a record in the table. Relational databases are commonly used when there is a need for complex queries, joins, and data consistency. Examples of popular relational databases used in iOS development are SQLite, MySQL, and PostgreSQL.

A non-relational database, on the other hand, does not use tables or a predefined schema. Instead, it uses a flexible document model or key-value to store data. Non-relational databases are typically used when there is a need for scalability, flexibility and high availability. Examples of popular non-relational databases used in iOS development are Realm, Firebase Realtime Database.

In this task, we suggest using Realm, because this ORM allows cross-platform development.
The advantage of Realm is, among other things, the improved backward compatibility with iOS versions as compared to its analogues.

## Topics
- How to use Realm

### Project: Recipes database

## Tasks:

**Requirement!** Create a workspace inside the src folder named day06 if using the Swift Packet Manager.
If using Cocoapods, use the generated workspace after the `pod install` command
For each task inside the workspace, you need to create a macOS/Command Line Tool project. For example, day06/quest1, day06/quest2.
Also don't forget to select the created workspace under `Add to:` when creating a project.
You can read more about creating projects in [documentation](https://www.swift.org/getting-started/).

**Tip** Before completing the task, see the examples in the official documentation from [Realm](https://realm.io/realm-swift/).

### Task 1: Recipes CRUD
Implement a recipe model for your database.

Create an entity `Recipe` that includes:
- Name
- Step-by-step instructions for cooking in the form of a string
- Link to the picture

**Requirement!**
- You must implement a class `RecipeDataSource` in which CRUD operations (Create, Read, Update, Delete) are defined.
- `RecipeDataSource` must implement a method for searching for a recipe by name.

_Program description:_
- When you run the program, the database is filled with your data.
- The program retrieves the added data from the database and displays them as a list.
- Check the deletion by deleting the first element of the list from the database. Display the whole list of recipes on the screen.
- Check the update in the database by updating the name of the first element in the list.
- Check the search for the recipe by name (the name can be specified in the code). Display the list of results in the console.
</details>
