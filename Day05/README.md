## Русскоязычная версия

<details>
<summary>Привет!</summary>
В сегодняшнем проекте рассматривается тема асинхронных операций в Swift и IOS приложениях. 

Асинхронные операции важны в iOS приложениях, потому что они позволяют выполнять длительные задачи в фоновом режиме,
не блокируя основной поток.

Основной поток в iOS отвечает за обновление пользовательского интерфейса и взаимодействие с пользователем. 
Если выполняется длительная задача в основном потоке, 
это может вызвать временные задержки пользовательского интерфейса и привести к плохому пользовательскому опыту.

Выполняя длительные задачи асинхронно, гарантируется, 
что основной поток остается свободным для обработки обновлений пользовательского интерфейса 
и взаимодействия с пользователем, что приводит к отзывчивому и гладкому пользовательскому опыту.

Основными фреймворками для асинхронной разработки в iOS являются Combine и SwiftRx.
SwiftRx обладает лучшей обратной совместимостью, поэтому в курсе рассматривается именно он.

## Темы
- async-await
- конструкции SwiftRx(Observable, Single и другие)

## Проект: асинхронные операции 

## Задание:

**Создание проекта с зависимостями**
Для добавления зависимостей в проект ты можешь использовать Swift Packet Manager, встроенный в XCode, 
либо менеджер зависимостей [Cocoapods](https://cocoapods.org/).
Для создания проекта cocoapods воспользуйтесь инструкцией на сайте проекта, связанной с командами `pod`.

Примеры проект с SPM и CocoaPods ты можешь найти в папке `code-samples`. 
В проекте с cocoapods необходимо предварительно вызвать команду `pod install`.

**Требование!** Создай workspace внутри папки src с названием day05, если используешь Swift Packet Manager.
При использовании Cocoapods воспользуйтесь сгенерированным workspace после команды `pod install`
Для каждой задачи внутри workspace необходимо создать macOS/Command Line Tool проект. Например, day05/quest1, day05/quest2.
Также не забудь при создании проекта в пункте `Add to:` выбрать созданный workplace.
Более подробное описание о создании проектов можно прочитать в [документации](https://www.swift.org/getting-started/).

**Совет** Перед выполнением задания посмотри примеры асинхронной работы в документации [SwiftRx](https://github.com/ReactiveX/RxSwift/tree/main/Documentation)
и [Swift Concurrency](https://docs.swift.org/swift-book/LanguageGuide/Concurrency.html).
Для установки зависимости SwiftRx в проект используй [CocoaPods](https://guides.cocoapods.org/)
или [Swift Packet Manager](https://www.swift.org/package-manager/)

**Требования к функциям**:
1. Все реализованные функции должны быть вызваны хотя бы 1 раз в функции main с применением `await`
2. В качестве входных данных для каждой функции выступают `firstCollection` и `secondCollection` из примера.
3. В случае, если функция применяется к `firstCollection` - входным параметром является Observable из строк,
а если к `secondCollection` - входным параметром является Observable из `Sample`.

### Задание 1

- Реализовать функцию, которая будет фильтровать `firstCollection` и сохранять только строки, где есть буква `e`

### Задание 2

- Реализовать функцию, которая будет возвращать первый элемент из `firstCollection`, начинающийся на `th`

### Задание 3

- Реализовать функцию, проверяющую все ли строки из `firstCollection` длиннее `5` символов

### Задание 4

- Реализовать функцию, проверяющую присутствуют ли строки длиннее `5` символов в `firstCollection`

### Задание 5

- Реализовать функцию, проверяющую отсутствие пустых строк в `firstCollection`

### Задание 6

- Реализовать функцию, считающую общую длину строк в `firstCollection`

### Задание 7

- Реализовать функцию, считающую количество строк в `firstCollection`

### Задание 8

- Реализовать функцию, возвращающую массив строк (полей text) из `secondCollection`

### Задание 9

- Реализовать функцию, группирующую значения по id в `secondCollection`

### Задание 10

- Реализовать функцию, группирующую значения по id в `secondCollection` и считающую количество элементов в каждой группе. 
Пример вывода listOf(Pair(1, 2), Pair(2, 2), Pair(3, 1)

</details>

## The English version

<details>
<summary>Hello!</summary>

Today's project is about asynchronous operations in Swift and IOS applications. 

Asynchronous operations are important in iOS applications because they allow you to perform long tasks in the background without blocking the main thread.

The main thread in iOS is responsible for updating the user interface and interaction with the user. 
If a long task is running in the main thread, this can cause temporary delays in the UI and lead to a poor user experience.

By running long tasks asynchronously, it is guaranteed that the main thread remains free to handle UI updates and user interaction, resulting in a responsive and smooth user experience.

The main frameworks for asynchronous development in iOS are Combine and SwiftRx.
SwiftRx has the best backward compatibility, so it is considered in the course.

## Topics
- async-await
- SwiftRx components(Observable, Single and others)

## Project: asynchronous operations 

## Task:

**Creating a project with dependencies**
To add dependencies to a project, you can use the Swift Packet Manager built into XCode, 
or the dependency manager [Cocoapods](https://cocoapods.org/).
Use the instructions on the project website related to `pod` commands to create a cocoapods project.

You can find examples of projects with SPM and CocoaPods in the `code-samples` folder. 
You need to call the `pod install` command in advance for the project with cocoapods.

**Requirement!** Create a workspace inside the src folder named day05 if using the Swift Packet Manager.
If using Cocoapods, use the generated workspace after the `pod install` command
For each task inside the workspace, you need to create a macOS/Command Line Tool project. For example, day05/quest1, day05/quest2.
Also don't forget to select the created workspace under `Add to:` when creating a project.
You can read more about creating projects in [documentation](https://www.swift.org/getting-started/).

**Function requirements**:
1. All implemented functions must be called at least once in the main function with `await`.
2. The inputs for each function are `firstCollection` and `secondCollection` from the example.
3. If the function is applied to `firstCollection` - the input parameter is Observable from strings,
If to ``secondCollection` - the input parameter is Observable from `Sample`.

### Task 1

- Implement a function that will filter `firstCollection` and save only string with the letter `e`

### Task 2

- Implement a function that will return the first element from the `firstCollection` beginning with `th`

### Task 3

- Implement a function that checks if all strings from the `firstCollection` are longer than `5` characters

### Task 4

- Implement a function that checks if there are any strings longer than `5` characters in the `firstCollection`

### Task 5

- Implement a function that checks for empty strings in the `firstCollection`

### Task 6

- Implement a function that counts the total length of strings in the `firstCollection`

### Task 7

- Implement a function that counts the number of strings in the `firstCollection`

### Task 8

- Implement a function that returns an array of strings (text fields) from the `secondCollection`

### Task 9

- Implement a function that groups values by id in the `secondCollection`

### Task 10

- Implement a function that groups values by id in the `secondCollection` and counts the number of elements in each group. 
Output example listOf(Pair(1, 2), Pair(2, 2), Pair(3, 1)
</details>
