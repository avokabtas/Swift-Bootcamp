## Русскоязычная версия

<details>
<summary>Привет!</summary>

Для разработки мобильных приложений зачастую необходимо использовать сетевой слой.
Рассмотрим [URLSession](https://developer.apple.com/documentation/foundation/urlsession) - библиотеку, 
предоставленную Apple для работы с сетью, а также [Alamofire](https://github.com/Alamofire/Alamofire), которая является сторонней библиотекой для упрощенного взаимодействия с сетью.

## Темы

- HTTP
- URL
- JSONSerialization
- URLSession
- Codable
- Alamofire

## Проект 

### Информация об объектах для IOS

Сегодня тема проекта - список объектов. А конкретно - приложение для получения списка объектов с описанием.

## Задания

**Требование!** Создай workspace внутри папки src с названием day07.
Для каждой задачи внутри workspace необходимо создать macOS/Command Line Tool проект. Например, day07/quest1, day07/quest2.
Также не забудь при создании проекта в пункте `Add to:` выбрать созданный workplace.
Более подробное описание о создании проектов можно прочитать в [документации](https://www.swift.org/getting-started/).

**Требования:** 
1. Используй [API от одного из самых известных международных аэропортов - Схипхол](https://developer.schiphol.nl/). 
2. Опиши модели данных для рейсов и получи данные от сервиса.

 **Подсказки:** 
1. Для получения доступа к API необходимо зарегистрироваться.
2. Описание API находится на вкладке Documentation. 
3. Обрати внимание на обязательные параметры запросов. 
4. Узнать Application ID и Application Key можно на вкладе Applications.
5. Не забывай дожидаться ответ от севера, ведь операция не выполняется мгновенно.

**Требование!** Создай workspace внутри папки src с названием day07, если используе Swift Packet Manager.
При использовании Cocoapods воспользуйся сгенерированным workspace после команды `pod install`
Для каждой задачи внутри workspace необходимо создать macOS/Command Line Tool проект. Например, day07/quest1, day07/quest2.
Также не забудь при создании проекта в пункте `Add to:` выбрать созданный workplace.
Более подробное описание о создании проектов можно прочитать в [документации](https://www.swift.org/getting-started/).

### Задание 0. Создать новый проект в XCode

### Задание 1. Протокол сетевого сервиса

При выполнении задания необходимо:
- Создать dto модели, описывающие структуру объектов полетов с необходимыми, по твоему мнению, полями, получаемых с сервера. Полей у объекта должно быть не менее десяти.
- Разработать протокол сетевого сервиса IObjectService, в котором должны быть:
    - Информация о базовом URL
    - Метод для получения списка объектов с описанием. В качестве параметра метода должна быть функция completion, в которую будет передаваться dto модель, либо nil.

Обязательно нужно разобраться с протоколом [HTTP](https://developer.mozilla.org/ru/docs/Web/HTTP/Overview), понять структуру [URL](https://developer.mozilla.org/ru/docs/Learn/Common_questions/Web_mechanics/What_is_a_URL), а также посмотреть [RESTful API](https://restfulapi.net).


### Задание 2. Реализация протокола сетевого сервиса с использованием URLSession

Необходимо реализовать разработанный протокол IObjectService с использованием URLSession.

- Реализация должна быть в ObjectURLSessionService
- Должен использоваться метод [dataTask](https://developer.apple.com/documentation/foundation/urlsession/1407613-datatask)
- Для десериализации JSON использовать [JSONSerialization](https://developer.apple.com/documentation/foundation/jsonserialization)
- Для dto моделей должен быть реализован дополнительный init для десериализации JSON
- При получении ответа должна вызываться функция completion
- При ошибке в функцию completion должен передаваться nil, а сама ошибка должна выводиться в консоль
- Должен быть вывод полученного ответа в консоль

### Задание 3. Реализация протокола сетевого сервиса с использованием Alamofire

Необходимо реализовать разработанный протокол IObjectService с использованием Alamofire, а также использовать [Codable](https://developer.apple.com/documentation/swift/codable) для сериализации.

- Реализация должна быть в ObjectAlamofireService
- dto модели должны реализовать протокол Decodable
- Для запроса Alamofire должен использоваться метод responseDecodable
- При получении ответа должна вызываться функция completion
- При ошибке в функцию completion должен передаваться nil, а сама ошибка должна выводиться в консоль
- Должен быть вывод полученного ответа в консоль

</details>


## The English version

<details>
<summary>Hello!</summary>
Mobile app development often involves the use of a network layer.
Let's start with [URLSession](https://developer.apple.com/documentation/foundation/urlsession) - a library, provided by Apple for networking, and also [Alamofire](https://github.com/Alamofire/Alamofire), which is a third-party library for simplified interaction with the network.

## Topics

- HTTP
- URL
- JSONSerialization
- URLSession
- Codable
- Alamofire

## Project

### Information about objects for IOS

Today's project topic is a list of objects. More specifically, an application for getting a list of objects with a description.

## Tasks

**Requirement!** Create a workspace inside the src folder named day07. 
You must create a macOS/Command Line Tool project for each task inside the workspace. For example, day07/quest1, day07/quest2.
Also don't forget to select the created workspace under `Add to:` when creating a project.
You can read more about creating projects in [documentation](https://www.swift.org/getting-started/).

**Requirements:** 
1. Use [API from one of the most famous international airports - Schiphol](https://developer.schiphol.nl/). 
2. Describe data models for flights and get data from the service.

 **Tips:** 
1. You need to register to get access to the API.
2. API description is located on the Documentation tab. 
3. Pay attention to the mandatory query parameters. 
4. You can see the Application ID and Application Key on the Applications tab.
5. Do not forget to wait for a response from the server, because the operation is not performed instantly.

**Requirement!** Create a workspace inside the src folder named day07 if using the Swift Packet Manager.
If using Cocoapods, use the generated workspace after the `pod install` command
For each task inside the workspace, you need to create a macOS/Command Line Tool project. For example, day07/quest1, day07/quest2.
Also don't forget to select the created workspace under `Add to:` when creating a project.
You can read more about creating projects in [documentation](https://www.swift.org/getting-started/).

### Task 0. Create a new project in XCode

### Task 1. Network service protocol

When completing this task you need to:
- Create dto models describing the structure of flight objects with the fields you think are needed, which are received from the server. The object must have at least ten fields.
- Develop a network service protocol IObjectService, which must contain:
    - Information about the base URL
    - A method to get a list of objects with a description. The parameter of the method must be a completion function to which the dto model will be passed, or nil.

It's very important that you understand the [HTTP](https://developer.mozilla.org/ru/docs/Web/HTTP/Overview) protocol and the structure of [URL](https://developer.mozilla.org/ru/docs/Learn/Common_questions/Web_mechanics/What_is_a_URL.) Also, read about [RESTful API](https://restfulapi.net).


### Task 2. Implementing a network service protocol using URLSession

You need to implement the developed IObjectService protocol using URLSession.

- The implementation must be in ObjectURLSessionService
- You must use [dataTask](https://developer.apple.com/documentation/foundation/urlsession/1407613-datatask) method
- To deserialize JSON use [JSONSerialization](https://developer.apple.com/documentation/foundation/jsonserialization)
- For dto models an additional init must be implemented for deserialization
- When you receive a response, the completion function must be called
- If there is an error, nil must be passed to the completion function, and the error itself is output to the console
- There must be an output of the received answer in the console

### Task 3. Implementing a network service protocol using Alamofire

You need to implement the developed IObjectService protocol using Alamofire, and also [Codable](https://developer.apple.com/documentation/swift/codable) for serialization.

- The implementation must be in ObjectAlamofireService
- Dto models must implement the Decodable protocol
- The responseDecodable method must be used for the Alamofire query
- When you receive a response, the completion function must be called
- If there is an error, nil must be passed to the completion function, and the error itself is output to the console
- There must be an output of the received answer in the console
</details>
