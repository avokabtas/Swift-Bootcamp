## Русскоязычная версия

<details>
<summary>Привет, студент. Это твой первый проект на Swift</summary>


Сегодняшняя цель - знакомство с основными функциями языка Swift, 
который является одним из самых известных языков для разработки, используемых в устройствах компании Apple.

**Swift** — это язык программирования с открытым исходным кодом, разработанный компанией Apple, и предназначенный для разработки приложений для ОС экосистемы компании. Однако, время от времени, он также может использоваться в других проектах.

Главные преимущества Swift:
- Читаемость: синтаксис языка выделяется среди других языков, что делает написание и чтение кода проще.
- Производительность: Swift быстрее, чем Objective-C, и разработан для высокой эффективности, что делает его подходящим для разработки высоконагруженных приложений.
- Безопасность: Swift имеет богатые инструменты для проверки типов и обработки ошибок, что помогает разработчикам писать более безопасный и защищенный код.

Вот некоторые из возможностей языка, которые делают его мощным и удобным инструментом:
- Optional
- Расширения
- Встроенные шаблонные функции, такие как map, filter и т.д.
- Structs, поддерживающие методы, расширения и протоколы
- Расширенный контроль управления с помощью специальных конструкций do, guard, defer, и repeat

# Темы
Прямо сейчас мы познакомимся с основами языка, вспомним как работают базовые вещи и разомнем пальцы. Основные темы:
- Типы данных
- Операторы, циклы и условия
- Использование аргументов в программе

[Документация Swift](https://docs.swift.org/swift-book/LanguageGuide/)

### Проект: Умный калькулятор 
Рассматриваются базовые функции языка при помощи проекта, который представляет собой набор инструментов для решения разных типов задач.

# Задачи

**Внимание!** Для создания проектов в течение всего интенсива будем использовать Workspace. 
Он позволит вам удобно хранить несколько проектов в одном дне.

**Требование!** Создайте workspace внутри папки src с названием day00. 
Для каждой задачи внутри workspace необходимо создать macOS/Command Line Tool проект. Например, day00/quest1, day00/quest2.
Также не забудьте при создании проекта в пункте `Add to:` выбрать созданный workplace.
Более подробное описание о создании проектов можно прочитать в [документации](https://www.swift.org/getting-started/).

### Задание 0. Новый проект
Пример проекта можно посмотреть в папке `code-samples`.

- Выберите вкладку File -> New -> Workspace
- Выберите вкладку File -> New -> Project -> macOS -> Command line tool 
(в пункте `Add to:` укажите созданный workspace, также проект должен лежать внутри папки code-samples)

Успех! Ваше погружение в Swift началось!


### Задание 1. Круги на полях
Разработайте математический модуль, который определяет, пересекаются ли окружности.

- Две окружности на координатной плоскости: первая с центром в точке (x1, y1) с радиусом r1, вторая с центром в точке (x2, y2) с радиусом r2.
- Программа считывает координаты и радиус по очереди при помощи командной строки. 
- Программа работает с вещественными числами.
- Программа определяет, пересекаются ли окружности, и выводит это в качестве результата (касание также считается пересечением). В случае нахождения одного круга внутри другого необходимо вывести "One circle is inside another". Смотрите пример ниже.
- Программа не завершается с ошибкой при некорректных входных данных. Она выводит "Couldn't parse a number. Please, try again" и повторяет попытку ввода параметра.

| Входные данные | Выходные данные |
| ------ | ------ |
| 0.0<br/>  0.0 <br/> 3.0 <br/> 4.0 <br/> 4.0 <br/> 3.0 <br/> | The circles intersect |
| 2.0<br/>  2.0 <br/> 3.0 <br/> 1.0 <br/> 1.0 <br/> 1.0 <br/> | One circle is inside another |
| 4.0<br/> 4.0 <br/> 4.0 <br/> -4.0 <br/> -10.0 <br/> 1.0 <br/> | The circles is not intersect |

### Задание 2. Составление чисел
Разработайте модуль для составления чисел в соответствии с заданным пользователем числом.

- Программа последовательно составляет числа из соседних цифр в заданном пользователем числе и выводит их на экран. Например, 123 при расмотрении от высшего порядка к низшему будет выведено 3 числа - 1, 12 и 123.
- Пользователь выбирает порядок рассмотрения числа lower (от низшего порядка к высшему) или higher (от высшего порядка к низшему). Например, при lower результатом для 1022 будут выведенные числа - 2, 22, 220, 2201; при higher - 1, 10, 102, 1022.
- Составленное число должно быть частью заданного, начиная с первой цифры заданного или его перевернутой версии при рассмотрении от низшего порядка к высшему (lower).

Программа работает с целочисленными значениями типа `Int` и прекращает работу при неправильных входных переменных. Она должна бросить любую ошибку для остановки программы, например `throw Exception("message")`.

| Входные данные | Выходные данные |
| ------ | ------ |
| lower<br/> 352 | 3 <br/> 35 <br/> 352 |
| higher<br/> -352 | -2 <br/> -25 <br/> -253
| higher<br/> 1000 | 0 <br/> 0 <br/> 0 <br/> 1



### Задание 3. Термометр 
Наиболее комфортная температура для человека варьируется в зависимости от сезона: от 22 до 25°C летом и от 20 до 22°C зимой. Напишите программу, которая, учитывая текущий сезон, определяет и выводит комфортную температуру и разницу с текущей.
- Температурный сенсор работает со шкалой Цельсия. Входные данные представляют собой целочисленные значения.
- Программа может выводить результаты в трех шкалах: Цельсия, Кельвин и Фаренгейт. Входные данные должны быть указаны только в градусах Цельсия.
- Программа не должна завершаться с ошибкой при некорректных данных. Вместо этого она должна вывести сообщение об ошибке и предложить повторно ввести данные. Например - "Incorrect input. Enter a temperature:".
- Дополнительно, программа предлагает регулировать температуру, если она не удовлетворяет комфортным значениям.
- Порядок ввода данных:
  1. шкала измерения температуры, которую будет использовать программа для выходных значений;
  2. время года (S - лето, W - зима);
  3. текущая температура в градусах цельсия.

| Входные данные | Выходные данные |
| ------ | ------ |
| Celsius<br/>  S <br/> 17 <br/>  | The temperature is 17 ˚C <br/> The comfortable temperature is from 22 to 25 ˚C. <br/>Please, make it warmer by 5 degrees.|
| Fahrenheit<br/>  S <br/> 22 <br/>  | The temperature is 71,6 F <br/> The comfortable temperature is from 71,6 F to 77 F. <br/>The temperature is comfortable. |




### Задание 4. Слишком мокро
Добавим для предыдущего задания обработку значения влажности. 

Комфортная влажность для человека составляет от 30% до 60% летом и от 30% до 45% зимой. В задаче 4 необходимо добавить параметры комфортной влажности для обоих сезонов. После указания температуры необходимо ввести значение влажности и определить, является ли оно комфортным. Если влажность не удовлетворяет требованиям, то посоветуйте уменьшить или увеличить ее на определенный процент.

| Входные данные | Выходные данные |
| ------ | ------ |
| Celsius<br/>  S <br/> 17 <br/> 35 <br/>  | The temperature is 17 ˚C <br/> The comfortable temperature is from 22 to 25 ˚C. <br/>Please, make it warmer by 5 degrees. <br/> The comfortable humidity is from 30% to 45% <br/>The humidity is comfortable|

### Бонусное задание 5. Круги на полях - 2
Расширьте функционал 1 задания. Если окружности соприкасаются или пересекаются, выведите координаты точек касания и пересечения.

| Входные данные | Выходные данные |
| ------ | ------ |
| 0.0 <br/>  1.0 <br/> 1.0 <br/> 2.0 <br/> 1.0 <br/> 1.0 <br/> | The circles intersect <br/> [ [1.0, 1.0] ]|

</details>


## The English version

<details>
<summary>Hello, student! This is your first project in Swift</summary>

Today's goal is to learn the basic functions of the Swift language, which is one of the most famous development languages used in Apple devices.

**Swift** is an open-source programming language developed by Apple and intended for developing applications for the company's OS ecosystem. However, from time to time, it can also be used for other projects.

Swift's main advantages:
- Readability: the syntax of the language stands out from other languages, which makes writing and reading code easier.
- Performance: Swift is faster than Objective-C and is designed for high performance, making it suitable for developing high-load applications.
- Security: Swift has rich tools for type casting and error handling, which helps developers write safe and more secure code.

Here are some of the features of the language that make it a powerful and handy tool:
- Optional
- Extensions
- Built-in template functions such as map, filter, etc.
- Structs that support methods, extensions and protocols
- Extended control with special constructions as do, guard, defer, and repeat
# Topics
Now, we're going to learn the fundamentals of language, remember how basic things work, and stretch our fingers. Main topics:
- Data types
- Operators, loops and conditions
- Use of arguments in a program

[Swift documentation](https://docs.swift.org/swift-book/LanguageGuide/)

### Project: Smart calculator 
The basic functions of the language are covered using the project, which is a set of tools for solving different types of tasks.

# Tasks

**Attention!** We will use Workspace to create projects throughout the Intensive. 
It will help you conveniently keep several projects in one day.

**Requirement!** Create a workspace inside the src folder named day00. 
You must create a macOS/Command Line Tool project for each task inside the workspace. For example, day00/quest1, day00/quest2.
Also don't forget to select the created workspace under `Add to:` when creating a project.
You can read more about creating projects in [documentation](https://www.swift.org/getting-started/).

### Task 0. New project

You can see an example project in the `code-samples` folder.

- Select File -> New -> Workspace
- Select File -> New -> Project -> macOS -> Command line tool 
(In `Add to:` specify the created workspace, also the project must be located inside the code-samples folder)

Success! Your journey into Swift has begun!

### Task 1. Crop circles
Develop a math module that determines whether circles intersect.

- Two circles on the coordinate plane: the first with center at the point (x1, y1) with radius r1, the second with center at the point (x2, y2) with radius r2.
- The program reads the coordinates and radius one by one using the command line. 
- The program works with real numbers.
- The program determines if the circles intersect and outputs this as the result (touch is also considered an intersection). If one circle is inside another, output "One circle is inside another". See the example below.
- The program does not stop with an error if the input data is not correct. It outputs "Couldn't parse a number. Please try again" and retries entering the parameter.

| Input data | Output data |
| ------ | ------ |
| 0.0<br/>  0.0 <br/> 3.0 <br/> 4.0 <br/> 4.0 <br/> 3.0 <br/> | The circles intersect |
| 2.0<br/>  2.0 <br/> 3.0 <br/> 1.0 <br/> 1.0 <br/> 1.0 <br/> | One circle is inside another |
| 4.0<br/> 4.0 <br/> 4.0 <br/> -4.0 <br/> -10.0 <br/> 1.0 <br/> | The circles is not intersect |


### Task 2. Composing of numbers
Develop a module to compose numbers according to a user-defined number.

- The program sequentially composes numbers from neighboring digits in a user-defined number and displays them on the screen. For example, 123, when considered from higher order to lower order, 3 numbers will be output - 1, 12 and 123.
- The user chooses the order in which the number is considered: lower order (from lower to higher) or higher (from higher to lower order).  For example, at lower the result for 1022 will be numbers - 2, 22, 220, 2201; at higher - 1, 10, 102, 1022.
- The composed number must be a part of the given number, starting with the first digit of the given one or its inverted version when considered from lower order to higher order (lower).

The program works with integer values of `Int` type and stops when input variables are incorrect. It should throw any error to stop the program, such as `throw Exception("message")`.

| Input data | Output data |
| ------ | ------ |
| lower<br/> 352 | 3 <br/> 35 <br/> 352 |
| higher<br/> -352 | -2 <br/> -25 <br/> -253
| higher<br/> 1000 | 0 <br/> 0 <br/> 0 <br/> 1


### Task 3. Thermometer 
The most comfortable temperature for humans varies depending on the season: from 22 to 25°C in summer and from 20 to 22°C in winter. Write a program that, given the current season, determines and outputs the comfortable temperature and the difference from the current temperature.
- The temperature sensor operates on a Celsius scale. The inputs are integer numbers.
- The program can output results in three scales: Celsius, Kelvin and Fahrenheit. The input data must be specified in degrees Celsius only.
- The program does not stop with an error if the input data are not correct. Instead, it must display an error message and suggest re-entering the data. For example, "Incorrect input. Enter a temperature:".
- Additionally, the program offers to adjust the temperature if it does not meet the comfortable values.
- Data entry order:
  1. temperature measurement scale, which will be used by the program for the output values;
  2. season (S for summer, W for winter);
  3. current temperature in degrees Celsius.

| Input data | Output data |
| ------ | ------ |
| Celsius<br/>  S <br/> 17 <br/>  | The temperature is 17 ˚C <br/> The comfortable temperature is from 22 to 25 ˚C. <br/>Please, make it warmer by 5 degrees.|
| Fahrenheit<br/>  S <br/> 22 <br/>  | The temperature is 71,6 F <br/> The comfortable temperature is from 71,6 F to 77 F. <br/>The temperature is comfortable. |

### Task 4. Too wet
Let's add the humidity value processing for the previous task.

The comfortable humidity for humans is from 30% to 60% in summer and from 30% to 45% in winter. In task 4 you need to add the parameters of the comfortable humidity for both seasons. After specifying the temperature, you must enter the humidity value and determine if it is comfortable. If the humidity is not meeting the requirements, then advise to decrease or increase it by a certain percentage.

| Input data | Output data |
| ------ | ------ |
| Celsius<br/>  S <br/> 17 <br/> 35 <br/>  | The temperature is 17 ˚C <br/> The comfortable temperature is from 22 to 25 ˚C. <br/>Please, make it warmer by 5 degrees. <br/> The comfortable humidity is from 30% to 45% <br/>The humidity is comfortable|


### Bonus task 5. Crop circles - 2
Extend the functionality of the first task. If the circles touch or intersect, output the coordinates of the touch and intersection points.

| Input data | Output data |
| ------ | ------ |
| 0.0 <br/>  1.0 <br/> 1.0 <br/> 2.0 <br/> 1.0 <br/> 1.0 <br/> | The circles intersect <br/> [ [1.0, 1.0] ]|

</details>
