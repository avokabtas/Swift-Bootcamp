## Русскоязычная версия

<details>
<summary>Привет!</summary>
Сегодня мы собираемся разработать проект, используя возможности объектно-ориентированной парадигмы языка.
В Swift реализована классическая однородительская модель наследования и возможность реализовать несколько интерфейсов поведения при помощи протоколов.
Очень важная фича Swift — это наличие типа Optional и операторов для взаимодействия с ним. Он позволяет писать безопасный код и практически избегать исключений, связанных с использованием пустых объектов.

Также разработчики языка предлагают использовать несколько удобных инструментов из этой области:
- Структуры
- Расширения

Расширения заслуживают особого внимания. Они позволяют расширить возможности класса или интерфейса новыми функциями без необходимости наследовать или использовать такие шаблоны, как Decorator.

# Темы:
- ООП, классы, протоколы, файлы, getter/setter
- Optional переменные
- Расширения
- Ошибки



[Документация Swift](https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html)

### Проект: Служба спасения
Город разделен на несколько зон, в каждой есть свой отряд спасательной службы. Сегодня мы разработаем функции для мобильного приложения экстренной помощи. 
Оно будет обрабатывать 2 основных запроса: получить полную информацию о конкретном районе и понять, есть ли инциденты.


## Задания

**Требование!** Создайте workspace внутри папки src с названием day01.
Для каждой задачи внутри workspace необходимо создать macOS/Command Line Tool проект. Например, day01/quest1, day01/quest2.
Также не забудьте при создании проекта в пункте `Add to:` выбрать созданный workplace.
Более подробное описание о создании проектов можно прочитать в [документации](https://www.swift.org/getting-started/).

### Задание 1. Служба спасения
Определите, находится ли инцидент в заданной зоне.
#### Описание инцидента:
- Инцидент описывается при помощи двух целочисленных координат на координатной плоскости
- Инцидент имеет:
  - Описание
  - Номер заявителя - может быть nil
  - Поле, описывающее один из трех типов инцидента (например, fire, gas leak, cat on the tree) - может быть nil


**Совет!** Используйте Enum для перечисления типов, например - типы инцидентов

#### Описание зоны:  
- Зона имеет четырехугольную, треугольную или круглую форму, представляющую фигуры на координатной плоскости.
- Каждая зона имеет:
  - Номер телефона
  - Имя
  - Код службы департамента
  - Уровень, представляющий вероятность инцидента (низкий, средний, высокий)
- Зона имеет метод, чтобы определить, произошел ли в ней инцидент.

**Входные данные:**
- Все координаты вводятся в формате двух целочисленных значений разделенных ';'. Например: 5;4.
- Ввод параметров зоны: программа автоматически определяет форму зоны, исходя из введенных данных:
  - Для окружности - два значения, введенных и разделенных пробелом: ее центр и радиус. Например: 5;4 6
  - Для треугольной - три точки, разделенных пробелами. Например, 5;4 3;6 2;5.
  - Для четырехугольной - четыре точки, разделенных пробелами. Точки должны быть введены в последовательности их соединения. Например: 0;1 0;2 1;2 1;1.
- Остальная информация о зонах, для легкого использования, должна быть записана в коде.
- Ввод точек с координатами инцидента.
- Неправильные введенные данные вызывают ошибку.
- Нахождение инцидента на границах зоны означает, что он находится в рассматриваемой зоне.

**Выходные данные:**
- Программа выводит полную информацию о зоне и инциденте.
- Программа выводит, произошел ли инцидент во введенной зоне. 
Если нет, то в выводе нужно предложить пользователю общий телефон для городских служб (88008473824)

**Пример**
_Входные данные_
```
Enter zone parameters:
3;4 2

Enter the zone info:
Enter the shape of area: 
circle 
Enter phone number: 
89347362826
Enter name: Sovetsky 
district
Enter emergency dept: 
49324
Enter danger level: 
low 

Enter an accident coordinates:
9;9

Enter the accident info:
Enter description: 
the woman said her cat can't get off the tree
Enter phone number: 
+74832648573
Enter type: 
cat on the tree
```
_Выходные данные_
```
An accident is not in Sovetsky district
Switch the applicant to the common number: 88008473824
```

### Задание 2. Маскирование номера
Маска телефона — это полезная функция UX, которая улучшает читаемость телефонных номеров.  
Напишите расширение класса String, которое применяет две разные маски к номеру телефона:
- Оно работает с 11-значными числами, начинающимися с 7 или 8, или с 12-значными числами, начинающимися с +7:
  - Если код оператора 800, то номер преобразуется в вид «8 (800) xxx xx xx»
  - Для другого оператора маска "+7 xxx xxx-xx-xx"
  - Обратите внимание, что помимо скобок, пробелов и дефисов, первая цифра (страна) также меняется в зависимости от маски. Пример: 84352835724 преобразуется в +7 435 283-57-24. 
- Остальные номера игнорируются 

**Проверьте результат:** примените это расширение в предыдущем задании, чтобы отобразить информацию о телефонах зоны и заявителя, затем повторите проверку упражнения.


| Входные данные | Выходные данные |
| ------ | ------ |
| 88005553535  |8 (800) 555 35 35| 
|89152342343|+7 915 234-23-43|

</details>

## The English version

<details>
<summary>Hello!</summary>

Today we are going to develop a project using the features of the object-oriented language paradigm.
Swift implements the classic single-root inheritance model and the ability to implement multiple behavior interfaces using protocols.
A very important feature of Swift is the Optional type and operators to interact with it. It allows you to write safe code and practically avoid exceptions related to the use of empty objects.

The language developers also offer some handy tools from this field:
- Structures
- Extensions

Extensions deserve special attention. They allow you to extend a class or interface with new features without having to inherit or use templates such as Decorator.

# Topics:
- OOP, classes, protocols, files, getter/setter
- Optional variables
- Extensions
- Errors

[Swift documentation](https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html)

### Project: Rescue Service
The city is divided into several zones, each with its own rescue squad. Today we are going to develop features for an emergency mobile app. It will handle 2 main requests: to get complete information about a particular zone and to understand if there are accidents.

## Tasks

**Requirement!** Create a workspace inside the src folder named day01. 
You must create a macOS/Command Line Tool project for each task inside the workspace. For example, day01/quest1, day01/quest2.
Also don't forget to select the created workspace under `Add to:` when creating a project.
You can read more about creating projects in [documentation](https://www.swift.org/getting-started/).

### Task 1. Rescue Service
Find out if there is an accident in a given zone.
#### Accident description:
- The accident is described using two integer coordinates on the coordinate plane
- The accident has:
  - Description
  - Applicant number - can be nil
  - Field describing one of the three types of accident (e.g., fire, gas leak, cat on the tree) - can be nil
  
**Tip!** Use Enum to enumerate types, e.g. - accident types

#### Zone description:  
- The zone has a quadrangular, triangular or circular shape, representing the figures on the coordinate plane.
- Each zone has:
  - Phone number
  - Name
  - Department Service Code
  - The level representing the probability of an accident (low, medium, high)
- The zone has a method to determine if there has been an accident.

**Input data:**
- All coordinates are entered as two integer values separated by ';'. For example: 5;4.
- Input zone parameters: the program automatically determines the shape of the zone based on the data entered:
  - For a circle - two values entered and separated by a space: its center and radius. For example: 5;4 6
  - For triangular - three points separated by spaces. For example, 5;4 3;6 2;5
  - For quadrangular - four points separated by spaces. The points must be entered in the sequence of their connection. For example: 0;1 0;2 1;2 1;1.
- The rest of the information about the zones, for easy use, must be written in code
- Entering points with accident coordinates
- Incorrect input data causes an error
- Finding an accident on the borders of the zone means that it is located in the zone under consideration.

**Output data:**
- The program outputs full information about the zone and the accident.
- The program outputs whether an accident occurred in the entered zone. 
If not, the output must offer the user a common phone number for city services (88008473824)

**Example**
_Input data_
```
Enter zone parameters:
3;4 2

Enter the zone info:
Enter the shape of area: 
circle 
Enter phone number: 
89347362826
Enter name: Sovetsky 
district
Enter emergency dept: 
49324
Enter danger level: 
low 

Enter an accident coordinates:
9;9

Enter the accident info:
Enter description: 
the woman said her cat can't get off the tree
Enter phone number: 
+74832648573
Enter type: 
cat on the tree
```
_Output data_
```
An accident is not in Sovetsky district
Switch the applicant to the common number: 88008473824
```

### Task 2. Number masking
The telephone mask is a useful UX feature that improves the readability of phone numbers.  
Write a String class extension that applies two different masks to a phone number:
- It works with 11-digit numbers starting with 7 or 8, or 12-digit numbers starting with +7:
  - If the operator code is 800, the number is converted to "8 (800) xxx xxx xx".
  - For other operator, the mask is "+7 xxx xxx-xx-xx-xx"
  - Notice that in addition to brackets, spaces, and hyphens, the first digit (country) also changes depending on the mask. Example: 84352835724 is converted to +7 435 283-57-24. 
- The other numbers are ignored 

**Check the result:** apply this extension in the previous task to display the zone and applicant phone information, then check the task again.


| Input data| Output data |
| ------ | ------ |
| 88005553535  |8 (800) 555 35 35| 
|89152342343|+7 915 234-23-43|

</details>
