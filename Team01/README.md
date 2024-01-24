## Русскоязычная версия

<details>
<summary>Всем привет!</summary>
Пришло время применить полученные нами навыки для реализации простого iOS приложения.
В качестве основы проекта будем использовать наше приложение для чтения рецептов.

## Темы:
- разработка сетевого слоя
- разработка слоя получения данных
- реализация реактивной связи UI и данных 

### Слои абстракции в приложении

Обычно в приложениях выделяют следующие слои абстракции:
- Слой представления - содержит в себе классы, которые непосредственно участвуют в отображении данных.
- Слой получения данных - содержит классы, необходимые для работы с получением данных. Обычно делится на:
  - Локальный - получение данных из локальных источников.
  - Удалённый - получение данных извне, например, из сети.
- Доменный слой - "промежуточный" уровень, основная задача которого состоит в организации взаимодействия классов из разных уровней.

Приложение должно функционировать следующим образом: слой получения данных передаёт их доменному слою,
который в свою очередь передаёт их на сохранение в локальную базу данных.
Аналогичным образом через доменный уровень данные из локальной базы данных попадают к пользователю, то есть
в слой представления.

### Проект: Вкусные записки для iOS. Продвинутый уровень
- Создай новый проект или используй проект с предыдущего группового дня.
- Проект является приложением - записной книжкой с рецептами.
- У рецепта обязательно есть:
  - его название;
  - одна фотография;
  - описание рецепта.

На первом этапе реализуем интерфейс (напомним, что можно использовать наработки предыдущего дня) для отображения рецептов.
После этого привяжем к нашему интерфейсу логику: позволим пользователю изменять рецепты и получать их из сети. 
Разработка будет по клиент-серверному взаимодействию:
- клиент запрашивает рецепты и позволяет редактировать их
- сервер хранит рецепты и обрабатывает запросы клиента

В качестве внешнего источника данных будем использовать API рецептов. ([URL](https://github.com/public-apis/public-apis#food--drink))

**API**
- URL для получения списка рецептов

**Используемые технологии**
- CocoaPods
- SwiftUI
- SwiftRX
- Realm
- Alamofire
- Swinject
- XcTest

### Задание 1. Разработка интерфейса приложения

Если проект с задания предыдущего дня реализован, то данное задание можно считать выполненным.

- Необходимо реализовать компонент View для отображения рецепта;
- При запуске приложения должен отображаться список существующих рецептов;
- Каждый элемент списка должен вести на соответствующий ему экран с описанием рецепта;
- Экран записки должен содержать изображение рецепта; 
- Изображение рецепта должно находится в круглой рамке 
- Экран записки должен содержать название рецепта; 
- Экран записки должен содержать пошаговое описание рецепта; 
- Шрифты названия и описания рецепта должны отличаться друг от друга;

### Задание 2. Разработка слоя получения данных

- Необходимо добавить получение данных о рецептах из сети с помощью Alamofire.
- Для хранения данных в локальной базе данных использовать Realm.
- Реализовать модели данных для базы данных, сетевого и доменного уровней.
- Необходимо соединить сетевой уровень с локальным хранилищем посредством доменного уровня. Напомним, что 
у доменного слоя должны быть свои модели данных, а для конвертации соответствующих моделей данных разных слоёв 
необходимо реализовать мапперы (функции, которые преобразуют друг в друга модели разных доменов).
- Добавить логику отображения данных по принципу offline first.

В результате задания у тебя получится приложение для отображения списков рецептов с их подробностями
на основе сетевых данных.

### Задание 3. Редактирование рецептов

- Добавим экран редактирования рецепта, на котором пользователь сможет изменять следующие поля рецепта:
  - Заголовок рецепта
  - Описание рецепта
  - Изображение рецепта

- Переход на экран редактирования рецепта осуществляется с экрана подробного описания

- Сохранение рецепта должно выполняться в виде локальной копии в таблице Realm, то есть изменённые данные не отправляются на сервер

### Бонусное задание: Редактирование шагов рецепта

- Добавим экран редактирования шага рецепта

- Доступ к нему может быть получен с экрана подробного описания

- Сохранение шага должно выполняться в виде локальной копии

</details>


## The English version

<details>
<summary>Hello, everyone!</summary>
It's time to apply the skills we learned to implement a simple iOS app.
We will use our recipe reader app as the foundation of the project.

## Topics:
- network layer development
- database layer development
- implementation of UI and data reactive connection 

### Abstraction layers in the application

Usually the following abstraction layers are distinguished in applications:
- The view layer contains classes that are directly involved in displaying data.
- Data retrieval layer contains classes that are needed to handle data retrieval. It is usually divided into:
  - Local - data retrieval from local sources.
  - Remote - data retrieving from the outside, for example, from the network.
- Domain layer - the "intermediate" layer, whose main task is to organize the interaction of classes from different layers.

The application is supposed to work as follows: The retrieval layer passes the data to the domain layer,
which in turn sends it to the local database for storage.
Similarly, through the domain layer, the data from the local database reaches the user, i.e.
into the view layer.

### Project: Yummy notes for iOS. Advanced level
- Create a new project or use a project from a previous group day.
- The project is an application - a notebook with recipes.
- The recipe must have:
  - its name;
  - one picture;
  - recipe description.

The first step is to implement an interface (recall that you can use the developments of the previous day) to display the recipes.
After that, let's add logic to our interface: let the user modify recipes and get them from the network. 
The development will be by client-server interaction:
- The client requests recipes and allows you to edit them
- server stores recipes and processes client's request

We will use recipe API as an external data source.([URL](https://github.com/public-apis/public-apis#food--drink))

**API**
- URL for a list of recipes

**Used technologies**
- CocoaPods
- SwiftUI
- SwiftRX
- Realm
- Alamofire
- Swinject
- XcTest

### Task 1. Application interface development
If the project from the previous day is completed, this task can be considered completed.

-You need to implement a View component to display the recipe;
- The recipe list screen must be displayed when you open the application;
- Each element in the list must lead to its corresponding screen with a description of the recipe;
- The note screen must contain a picture of the recipe;
- The picture of the recipe must be in a circular frame
- The note screen must contain the name of the recipe;
- The note screen must contain a step-by-step recipe description;
- The fonts of the name and description of the recipe must be different from each other.

### Task 2.  Data retrieval layer development

- You need to add getting recipe data from the network using Alamofire.
- Use Realm to store data in the local database.
- Implement data models for the database, network and domain layers.
- You need to connect the network layer to the local storage through the domain layer. Recall that domain layer must have its own data models, and in order to convert the corresponding data models of different layers you need to implement mappers (functions that convert models of different domains into each other).
- Add logic to display data according to the offline first principle.

### Task 3. Recipe editing
Let's add a recipe editing screen, where the user can change the following recipe fields:
  - Recipe name
  - Recipe description
  - Recipe picture

You can go to the recipe editing screen from the detailed description screen

Recipe must be saved as a local copy in the Realm table, i.e. the changed data are not sent to the server

### Bonus task: Editing recipe steps

- Add a recipe step editing screen

- It can be accessed from the detailed description screen

- The step must be saved as a local copy
</details>
