## Русскоязычная версия

<details>
<summary>Привет!</summary>

Тесты - залог качества кода и улучшение процесса разработки. 
Поэтому сегодняшняя тема - Unit-тестирование для iOS.

# Темы:
- Unit-тестирование
- XcTest


**Совет!** Продолжай читать официальную документацию и статьи о преимуществах Swift.
[Документация Swift](https://developer.apple.com/documentation/xctest)

## Задания

**Требование!** Создай workspace внутри папки src с названием day09, если используе Swift Packet Manager.
При использовании Cocoapods применяй сгенерированный workspace после команды `pod install`
Для каждой задачи внутри workspace необходимо создать macOS/Command Line Tool проект. Например, day09/quest1, day09/quest2.
Также не забудь при создании проекта в пункте `Add to:` выбрать созданный workplace.
Более подробное описание о создании проектов можно прочитать в [документации](https://www.swift.org/getting-started/).


### Задание 1. Unit-тесты

Необходимо покрыть Unit-тестами класс ***SimpleCalculator***, который находится в файле `SimpleCalculator.swift`.

- Скопируй ***SimpleCalculator*** к себе в проект
- Создай новый **Target**, выбери **Unit Testing Bundle**, в **Product Name** впиши ***SimpleCalculatorTests***
- Все тесты необходимо реализовать в ***SimpleCalculatorTests***
- Для метода ***circleArea***(вычисление площади круга) написать тест с использованием XCTAssertEqual
- Для метода ***fibonacci***(нахождение n-го числа Фибоначчи) покрыть тестами все возможные случаи с использованием XCTAssertEqual
- Для метода ***fahrenheit***(конвертация градусов Цельсия в градусы Фаренгейта) написать тест с использованием XCTAssertEqual
- Для метода ***isEven***(проверка четности числа) покрыть тестами все возможные случаи с использованием XCTAssertTrue, XCTAssertFalse
- Для метода ***getAvg***(нахождение среднего значения) покрыть тестами все возможные случаи с использованием XCTAssertNil, XCTAssertNotNil, XCTAssertEqual

### Задание 2. Исправление ошибок

По результатам тестов найти и исправить ошибки в скопированном ***SimpleCalculator***





</details>

## The English version

<details>
<summary>Hello!</summary>

Tests are the key to code quality and improvement of the development process. 
So today's topic is Unit Testing for iOS.

# Topics:
- Unit-testing
- XcTest


**Tip! ** Keep reading the official documentation and articles about the benefits of Swift.
[ Swift documentation](https://developer.apple.com/documentation/xctest)

## Tasks

**Requirement!** Create a workspace inside the src folder named day09 if using the Swift Packet Manager.
If using Cocoapods, use the generated workspace after the `pod install` command
For each task inside the workspace, you need to create a macOS/Command Line Tool project. For example, day09/quest1, day09/quest2.
Also don't forget to select the created workspace under `Add to:` when creating a project.
You can read more about creating projects in [documentation](https://www.swift.org/getting-started/).

### Task 1. Unit-tests

***SimpleCalculator*** class, which is located in the `SimpleCalculator.swift` file, must be covered by Unit-tests.

- Copy  ***SimpleCalculator*** to your project
- Create new **Target**, select **Unit Testing Bundle**, put  ***SimpleCalculatorTests*** in **Product Name** 
- All of the tests must be implemented in  ***SimpleCalculatorTests***
- Write a test using XCTAssertEqual for ***circleArea*** method (circle area computation) 
- Cover all possible cases of ***fibonacci*** method (finding the nth Fibonacci number) with tests using XCTAssertEqual 
- Write a test using XCTAssertEqual for ***fahrenheit*** method (converting degrees Celsius to degrees Fahrenheit) 
- Cover all possible cases of the ***isEven*** method (number evenness check) with tests
 using XCTAssertTrue, XCTAssertFalse 
- Cover all possible cases of the ***getAvg*** method (find average) with tests using XCTAssertNil, XCTAssertNotNil, XCTAssertEqual 

### Task 2. Bug fixing

Based on test results, find and fix bugs in the copied ***SimpleCalculator***
</details>
