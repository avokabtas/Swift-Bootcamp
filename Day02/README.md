## Русскоязычная версия

<details>
<summary>Хорошего дня!</summary>
Пришло время познакомиться поближе с различными коллекциями и функциями их преобразования. 
Разработчики Swift постарались сделать работу с данными в коллекциях максимально удобной. 
Особенно порадовало большое количество различных методов, возможность сделать их еще больше за счет расширений. 

Также уделим немного внимания операциям над файлами - чтению и записи.

## Темы:
- Коллекции
- In/out: файлы
- Функциональные типы
- Замыкание

### Проект: Job Search

Распространен случай, когда пользователю необходимо отобразить данные, взятые из разных источников/сущностей. 
Для этого в слое представления обычно есть специальные сущности, имеющие необходимые для отображения поля и свойства,
которые перед показом заполняются данными. При этом преобразование одних сущностей в другие не должно никоим образом изменять исходные значения (принцип неизменности).

## Задания

**Требование!** Создайте workspace внутри папки src с названием day02.
Для каждой задачи внутри workspace необходимо создать macOS/Command Line Tool проект. Например, day02/quest1, day02/quest2.
Также не забудьте при создании проекта в пункте `Add to:` выбрать созданный workplace.
Более подробное описание о создании проектов можно прочитать в [документации](https://www.swift.org/getting-started/).

### Задание 1. Ищем собеседования
Простым примером использования функций преобразования является список предварительного просмотра, содержащий частичную информацию об объекте. 

**Совет!** В папке `data-samples` есть несколько примеров функций преобразования коллекций (`map`, `filter`). Используйте их для выполнения упражнений.

Создайте коллекцию компаний, каждая из которых описана следующим образом:
- Имя
- Деятельность (IT, Banking, Public services)
- Описание
- Список вакансий, каждая из которых содержит информацию о профессии (Developer, QA, Project Manager, Analyst, Designer), level (junior, middle, senior) и предполагаемый уровень зарплаты
- Список необходимых навыков (например ["swift", "CoreData", "Realm"])
- Контакты

Также у объекта компании должен быть описан метод interview типа (Int, Candidate) -> Bool (номер вакансии компании и входной кандидат), 
который описывает процесс найма в каждой компании и его результат. 
Объект кандидата должен включать следующие поля:
- Имя
- Профессия (Developer, QA, Project Manager, Analyst, Designer)
- Уровень (junior, middle, senior)
- Предполагаемый уровень зарплаты
- Навыки

Кандидат может быть один на весь код, для простоты запишите данные объекта в коде. 

Функция интервью должна иметь логику проверки наличия навыков для вакансии - при совпадении менее 50 % кандидат не будет нанят. 
Если же кандидат имеет 50% и более навыков необходимых для работы, то результатом работы функции должно быть случайное значение true или false.

У вас должно быть как минимум 5 компаний с разными полями деятельности, профессий, уровнями кандидатов и зарплаты.
Для простоты запишите их в коде.

Используя данные кандидата, выведите подходящий для него список вакансий в соответствии с профессией и зарплатными ожиданиями. 
Далее с клавиатуры вводится номер вакансии, по которой будет проводиться собеседование. 
У объекта компании найма вызывается метод `interview`, результат которого будет выведен на экран.

Вводимый номер вакансии с клавиатуры должен быть целочисленным. 
При неправильном вводе программа выводит "It doesn't look like a correct input." и запрашивает данные снова.

_Пример_

_Кандидат_
```
Candidate:
- Name: Ivan
- Profession: Analyst
- Level: Junior
- Salary: 100000
- Skills: ["python", "matlab"]
```
```
Banking. Analyst. Junior. >= 100000
The list of suitable vacancies:

1.
Junior Analyst     ---      >= 100000
  OOO "SuperPay"
  Banking
  ["python", "matlab", "tensorflow", "excel"]
---------------------------------------

1. 
Junior Analyst     ---      >= 100000
  MMM
  Public services
  ["excel", "access"]
---------------------------------------

3.
Junior Analyst     ---      >= 100000
  CryptoSuperGo
  Banking
  ["python", "sql", "matlab", "pandas"]
---------------------------------------

3

Processing Interview...
Success, candidate was applied.
```

### Задание 2. Анализ резюме
Напишем алгоритм, позволяющий анализировать резюме и генерировать теги на его основе.

Резюме имеет шаблон:
- Блок информации о кандидате
  - Полное имя
  - Профессия (список профессий такой же, как и в предыдущем упражнении)
  - Пол
  - Дата рождения
  - Контакты (e-mail)
- Блок информации об образовании. Для каждого учебного заведения:
    - Тип
    - Годы обучения
    - Описание
- Блок с опытом работы. Для каждого место работы:
    - Период работы
    - Название компании и если есть контакты
    - Описание
- Блок о себе в свободной текстовой форме

Наш инструмент распознает блоки шаблонов и создает соответствующие объекты, заполненные данными из резюме.
- Текст анализируется по словам, которые сопоставляются с облаком тегов.
- Есть механизм экспорта резюме
  
**Входные данные:**   
  - _resume.txt_ - его необходимо заполнить в соответствии с образцом резюме
  - _tags.txt_ - он должен быть заполнен исходным набором тегов (не менее 3-х слов)
  - _export.txt_
  - _analysis.txt_

**Выходные данные:**  
Проверьте корректность алгоритмов: 
- В файл _export.txt_ , перенесите данные из объектов в соответствии с шаблоном резюме. 
- После этого файлы _resume.txt_ и _export.txt_ должны совпадать (можно проверить в онлайн-редакторах) 

Выведите в файл  _analysis.txt_:
- Раздел с каждым словом из текста (один раз) с количеством повторений в формате: "разработчик - 42", в порядке убывания по номеру
- Раздел со словами, совпадающими со словами из файла _tags.txt_ (их должно быть не менее 3-х)

Примеры файлов - [resume.txt](data-samples/resume.txt), [tags.txt](data-samples/tags.txt), [analysis.txt](data-samples/analysis.txt) в папке data-samples.

</details>

## The English version

<details>
<summary>Have a nice day!</summary>
It's time to learn more about various collections and their conversion functions. The Swift developers have tried to make working with data in collections as convenient as possible. Especially pleasing is the great variety of methods, and the possibility to make them even more by extensions.
Let's also pay a little attention to operation with files -  reading and writing.

## Topics:
- Collections
- In/out: files
- Functional types
- Closure

### Project: Job Search

A common case is when the user needs to display data taken from different sources/entities. For this purpose, the view layer usually has special entities that have the necessary fields and properties to display, which are filled with data before displaying them. Converting some entities to other entities must not change the original values in any way (immutability principle).

## Tasks

**Requirement!** Create a workspace inside the src folder named day02. 
You must create a macOS/Command Line Tool project for each task inside the workspace. For example, day02/quest1, day02quest2.
Also don't forget to select the created workspace under `Add to:` when creating a project.
You can read more about creating projects in [documentation](https://www.swift.org/getting-started/).

### Task 1. Looking for job interviews
A simple example of using the conversion function is a preview list containing partial information about an object.

**Tip!** There are several examples of collection conversions (`map`, `filter`) in the `data-sample` folder. Use them to do your tasks.

Create a collection of companies, each described as follows:
- Name
- Activity (IT, Banking, Public services)
- Description
- A list of jobs, each of which contains information about the profession (Developer, QA, Project Manager, Analyst, Designer), level (junior, middle, senior) and expected salary level
- List of required skills (for example, ["swift", "CoreData", "Realm"])
- Contacts

The company object must also have a method of interview type (Int, Candidate) -> Bool(company vacancy number and entry candidate) that describes the hiring process at each company and its result. The candidate object must include identical company fields:
- Name
- Profession (Developer, QA, Project Manager, Analyst, Designer)
- Level (junior, middle, senior)
- Expected salary level
- Skills

The candidate can be one for the whole code, for simplicity write the data of the object in the code.

The interview function should have the logic of checking the availability of skills for the vacancy - 
if the match is less than 50%, the candidate will not be hired. If the candidate has 50% or more of the skills necessary for the job, then the result of the function should be a random value true or false.

You must have at least 5 companies with different fields, professions, candidate levels and salaries. For simplicity, write them down in code.

Using the candidate's data, output a suitable list of vacancies for him according to the parameters of the profession and salary.
Next, the number of the vacancy for which the interview will be conducted is entered from the keyboard.
The hiring company object uses the `interview` method, the result of which will be displayed on the screen.

The vacancy number entered from the keyboard must be integer.
If the input is incorrect, the program outputs "It doesn't look like a correct input.". and requests data again.

_Example_

_Candidate_
```
Candidate:
- Name: Ivan
- Profession: Analyst
- Level: Junior
- Salary: 100000
- Skills: ["python", "matlab"]
```
```
Banking. Analyst. Junior. >= 100000
The list of suitable vacancies:

1.
Junior Analyst     ---      >= 100000
  OOO "SuperPay"
  Banking
  ["python", "matlab", "tensorflow", "excel"]
---------------------------------------

1. 
Junior Analyst     ---      >= 100000
  MMM
  Public services
  ["excel", "access"]
---------------------------------------

3.
Junior Analyst     ---      >= 100000
  CryptoSuperGo
  Banking
  ["python", "sql", "matlab", "pandas"]
---------------------------------------

3

Processing Interview...
Success, candidate was applied.
```

### Task 2. Analyzing resumes
Let's write an algorithm that allows analyzing resumes and generating tags based on them.

The resume has a template:
- Candidate information block
  - Full name
  - Profession (the list of professions is the same as in the previous task)
  - Sex
  - Birth date
  - Contacts (e-mail)
- Education information Block. For each educational institution:
    - Type
    - Years of study
    - Description
-Work experience block. For each place of work:
    - Working period
    - Company name and if there are contacts
    - Description
- Block about yourself in free text form

Our tool recognizes template blocks and creates corresponding objects filled with data from the resume.
- The text is analyzed by words that are compared to a tag cloud.
- There is a mechanism for exporting resumes
  
**Input data:**   
  - _resume.txt_ - it must be filled out following the sample resume
  - _tags.txt_ - it must be filled with the original set of tags (at least 3 words)
  - _export.txt_
  - _analysis.txt_

**Output data:**  
Check the correctness of the algorithms: 
- In the _export.txt_ file, transfer the data from the objects according to the resume template. 
- After that, the files _resume.txt_ and _export.txt_ must match (you can check in online editors) 

Output to the _analysis.txt_ file:
- Section with each word from the text (once) with the number of repetitions in the format: "developer - 42", in descending order by number
- Section with words that match the words in the _tags.txt_ file (there must be at least 3)

File examples - [resume.txt](data-samples/resume.txt), [tags.txt](data-samples/tags.txt), [analysis.txt](data-samples/analysis.txt) in data-samples folder.
</details>
