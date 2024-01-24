## Русскоязычная версия

<details>
<summary>Привет!</summary>
В этом проекте рассматриваются следующие темы:

- Generics - классы, которые могут иметь параметры типа. С их помощью можно написать класс или метод, который будет работать не с конкретными, а с произвольными типами данных: тип (или иерархия типов) будет определяться разработчиком в контексте использования. В то же время инструмент обеспечивает безопасность типов: после указания типа или иерархии типов работа с этим дженериком происходит только в контексте указанного типа.
- Lazy инициализация. Существуют ситуации, когда создание переменных не должно происходить в момент начала использования класса. Ленивые переменные позволяют создать объект в момент первого его вызова. Также это может помочь оптимизировать код и вычисления.
- Функциональные типы. Безусловно, работа с ними заслуживает внимания. Разработчики предусмотрели отличную поддержку этого популярного инструмента, а также добавили несколько удобных конструкций для выполнения задач в контексте объекта.

## Темы:
- Дженерики
- Subscript
- Ленивая инициализация
- Делегаты

**Совет!** Перед тем, как выполнять задания, посмотрите примеры в [документации](https://docs.swift.org/swift-book/LanguageGuide/Generics.html), где представлено несколько пример возможно использования дженериков.

### Проект: утилиты для создания игр

## Задания:

**Требование!** Создайте workspace внутри папки src с названием day03.
Для каждой задачи внутри workspace необходимо создать macOS/Command Line Tool проект. Например, day03/quest1, day03/quest2.
Также не забудьте при создании проекта в пункте `Add to:` выбрать созданный workplace.
Более подробное описание о создании проектов можно прочитать в [документации](https://www.swift.org/getting-started/).

### Задание 1. Мир дикого запада
Требуется описать класс, моделирующий револьвер. 
В данном задании это типизированный класс. 
Обойма револьвера содержит элемент в соответствии с объявленным типом. 
Например, RevolverMoonClip<Int> будет хранить элементы типа `Int`.

- Обойма револьвера представляет собой массив из 6 элементов. Если слот пустой, то там должен храниться `nil`.
- Вы можете добавить один элемент в ближайший свободный слот методом `add()`. При успешном добавлении возвращается true, иначе - false.
- Возможно добавление путем списка элементов. Функция принимает другую коллекцию, как ресурс, из которого добавляются все элементы в обойму. Если элементов в коллекции недостаточно, то заполняется объект револьвера настолько, насколько возможно. Если список пустой, метод возвращает false.
- Класс имеет свойство `pointer`. С его помощью вы сможете получать текущий элемент на курке. Таковым является элемент в обойме с индексом 0.
- Вы можете удалять элементы одним за одним при помощи метода стрельбы `shoot()`, который возвращает удаленный элемент. Удаление начинается с элемента `pointer`.
- Вы можете вызывать `unloadAll()` для всех элементов разом или `unload(index)` для извлечения одного. Функция возвращает извлеченный элемент либо список всех элементов.
- Вы можете прокрутить обойму методом `scroll()`, меняя позицию pointer на случайный элемент. Последовательность элементов между собой должна сохраниться, при этом элемент на курке должен поменяться.
- Добавьте метод getSize(), который возвращает количество элементов в револьвере.
- Создайте функцию расширения `toStringDescription()` для класса, которая будет представлять информацию об объекте класса и его элементах в виде `String`. Информация об элементах записывается, начиная с позиции элемента на курке (pointer).
- У класса должен корректно работать оператор сравнения `==`. Переопределите его при помощи протокола `Equatable`. Объекты класса эквивалентны, если имеют одинаковое сочетание элементов, начиная с любой позиции, включая nil. Пример сравнения представлен ниже. 
- Сделайте для класса метод subscript(index: `Int`). Он будет возвращать для любого револьвера при обращении по индексу элемент, который находится на данной позиции в обойме. Если индекс больше чем число, то происходит ошибка.

**Проверьте результат:** напишите программу, которая показывает, как работает класс `RevolverMoonClip`, и запустите ее
1. Создайте объект револьвера, заполнив его при помощи конструктора максимальным количеством элементов. Выведите в консоль описание класса типа `RevolverMoonClip<Type>`, содержимое обоймы, начиная с `pointer` и сам `pointer`.
2. Получите первый и последний элемент в обойме при помощи `subscript`, вызвав индексы соответствующих элементов.
3. Вызовите метод `scroll` и выведите объект консоль. Результат должен начинаться с другого элемента (но он может быть равным по значению). Порядок между элементами должен сохраняться.
4. Удалите 4 элемента один за другим. Напечатайте объект класса и сравните с предыдущим выводом. Измененная обойма должна начинаться с 5-ого элемента, за ним должен идти тот же элемент, что и до этого, затем 4 значения `nil`.
5. Создайте коллекцию из 8 элементов того же типа, что и дженерик созданного объекта. Добавьте эту коллекцию в револьвер и выведите сравнение старой и новой коллекции в револьвере. Обойма должна заполняться полностью первыми 4 элементами из коллекции. `pointer` устанавливается при каждом добавлении на заполненный элемент обоймы.
6. Вытащите все элементы класса `unloadAll`. Напечатайте размер вытащенного списка и размер объекта (должно быть 6 и 0) 
7. Добавьте 4 элемента `supply` в коллекцию объекта класса. Размер обоймы револьвера должен стать 4.
8. Создайте новый объект с теми же элементами, как в полученном выше списке. Также необходимо сделать предварительный scroll. Далее сопоставьте при помощи оператора `==` эквивалентны ли эти объекты. Результат операции должен быть true.

_Пример вывода программы_
```
1. Adding elements
Structure: RevolverMoonClip<Int> 
Objects: [3, 54, 7, 2, 56, 4]
Pointer: 3

2. Subscript
3, 4

3. Scroll
Structure: RevolverMoonClip<Int> 
Objects: [7, 2, 56, 4, 3, 54]
Pointer: 7

4. Deletion
Structure: RevolverMoonClip<Int> 
Objects: [3, 54, nil, nil, nil, nil]
Pointer: 3

5. Supply collection
Before: 
Supply collection: [4, 6, 3, 22, 77, 43, 76, 5]

Structure: RevolverMoonClip<Int> 
Objects: [3, 54, nil, nil, nil, nil]
Pointer: 3

After add operation performed:
Structure: RevolverMoonClip<Int> 
Objects: [22, 3, 6, 4, 3, 54]
Pointer: 22

6. Extraction
The extracted list: [22, 54, 6, 4, 3, 54]
size: 6

Structure: RevolverMoonClip<Int> 
Objects: [nil, nil, nil, nil, nil, nil]
Pointer: nil
size: 0

7. Supply collection 2
Before:
Supply collection: [77, 43, 76, 5]

Structure: RevolverMoonClip<Int> 
Objects: [nil, nil, nil, nil, nil, nil]
Pointer: nil

After add operation performed:
Structure: RevolverMoonClip<Int> 
Objects: [5, 76, 43, 77, nil, nil]
Pointer: 5

8. Equals
Structure: RevolverMoonClip<Int> 
Objects: [nil, 5, 76, 43, 77, nil]
Pointer: nil

Structure: RevolverMoonClip<Int> 
Objects: [nil, nil, 5, 76, 43, 77]
Pointer: nil

Result: equals
```

### Задание 2. Патроны
Требуется описать классы для работы с патронами в револьвере.

**Патрон:**
- Создайте класс для патрона (Patron)
- Также здесь нужно добавить поля для описания патрона (холостой или заряженный)
- Для уникальности патронов можете использовать класс `UUID`
- Патрон должен содержать свойство калибра (например - 22, 38, 45)
- Класс должен иметь свой метод `shoot()` с выводом "Bang" и информации о калибре

**Обновление содержания класса револьвера:**
- Добавьте свойство калибра для револьвера
- Сделайте так, что револьвер работал только с типом `Patron`. Вы не можете класть патроны разных калибров в одну обойму. Уберите типизацию из класса.
- При вызове `shoot()` соответствующий вызов должен происходит и у патронов. Однако, если патрон холостой, то shoot у его класса вызывать не нужно. 
- Если происходит выстрел при пустой ячейке, программа выводит "Click"

**Представление соответствующей логики для классов револьвера и патронов:**
  - Патрон может быть только в одной обойме револьверов. Если вы пытаетесь добавить патрон, который уже есть в другой обойме, метод револьвера `add` должен возвращать false. Также, если вы добавляете коллекцию патронов, то подобный патрон должен быть проигнорирован, а остальные добавлены. Аналогично для патронов, не совпадающих калибром с револьвером.
  - Каждый патрон может быть использован для заряженного выстрела лишь раз. Если патрон холостой, он выпадет из револьвера, но выстрел не произойдет. Револьвер не должен вызывать метод стрельбы у патрона, но печатает "Click", аналогично выстрелу из пустой ячейки.

**Проверка результата:** для проверки создайте программу, которая делает следующее. 
- Проверьте, что заряженные патроны стреляют, а холостые нет
- Попробуйте добавить патрон в разные револьверы. При первичном добавлении вернется true, вторичном - false. Предварительно создайте 2 пустых револьвера.
- Попробуйте добавить патрон в две разные коллекции. И попробуйте добавить эти коллекции в два разных револьвера. Предварительно создайте 2 пустых револьвера.

_Пример вывода программы_
```
1. Shoot or damp
Structure: RevolverMoonClip 32 caliber
Objects: [Patron(id1, charged, 32), Patron(id2, damp, 32), nil, nil, nil, nil]
Pointer: Patron(id1, charged, 32)

Shoot # call shoot()
Bang 32

Structure: RevolverMoonClip 32 caliber
Objects: [Patron(id2, damdp, 32), nil, nil, nil, nil, nil]
Pointer: Patron(id2, damp, 32)

Shoot 
Click
Objects: [nil, nil, nil, nil, nil, nil]
Pointer: nil

2. Unique Patron
Patron(id, charged, 32)

Revolver1: [nil, nil, nil, nil, nil, nil]
Revolver2: [nil, nil, nil, nil, nil, nil]

Add1 # call add()
Revolver1: [Patron(id, charged, 32), nil, nil, nil, nil, nil]
Revolver2: [nil, nil, nil, nil, nil, nil]

Add2
Revolver1: [Patron(id, charged, 32), nil, nil, nil, nil, nil]
Revolver2: [nil, nil, nil, nil, nil, nil]

3. Unique Patron in collection
Revolver1: [nil, nil, nil, nil, nil, nil]
Revolver2: [nil, nil, nil, nil, nil, nil]

[Patron(id, charged, 32), Patron(id1, charged, 32), Patron(id2, charged, 32)]
[Patron(id, charged, 32), Patron(id3, charged, 32), Patron(id4, charged, 32)]

Add1 # call add for 1 st collection

Add2 
Revolver1: [Patron(id, charged, 32), Patron(id1, charged, 32), Patron(id2, charged, 32), nil, nil, nil]
Revolver2: [Patron(id3, charged, 32), Patron(id4, charged, 32), nil, nil, nil, nil]
```

### Задание 3. Профиль игрока

В данном задании требуется создать объект для профиля игрока и реализовать паттерн `делегат` в виде присваивания объекта сервера классу игрока для поиска противника.

**Профиль игрока:**
Класс `Profile` должен содержать:
- ID при помощи `UUID`
- Никнейм
- Возраст
- Имя
- Револьвер
- Дата создания профиля в виде `String`
- Статус (`IN_PLAY` - в игре, `SEARCH` - в поиске, `IDLE` - в ожидании, `OFFLINE` - не в сети)
- Ссылка, которая будет формировать при помощи переменной `lazy var` по примеру `http://gameserver.com/${id}-${nickname}`

**Игровой сервер**
Класс `Server` будет описывать логику взаимодействия между игроками. Объект должен содержать следующее:
- Адрес сервера
- Список игроков на сервере (список `Profile`)

**Делегат сервера в профиле**
При построении архитектуры в IOS приложении не редким является использование паттерна `Делегат` для вызова части логики. Реализуем этот паттерн на примере вызова игроком поиска соперника.
Создайте протокол `PlayerAction`, который опишет возможные действия игрока при взаимодействии с сервером. В нашем случае там будет описана функция `findOpponent`. 
Класс `Server` должен унаследовать протокол и реализовать эту функцию. Функция возвращает профиль найденного игрока.
Делегат сервера добавьте в виде переменной `playerActionDelegate` класса `PlayerAction`, который будет вызывать запрос поиска противника.

**Проверка результата:** создайте несколько объектов профилей с разным статусом и поместите их на сервер. Создайте свой профиль, который будет в режиме ожидания. Поместите его также на сервер. 
Далее программа должна вызвать поиска оппонента и поменять статус игрока на `SEARCH`. Функция должна вернуть оппонента противника, с новым статусом `IN_PLAY` и поменять статус в профиле игрока.

_Пример вывода программы_
```
SearcherProfile:
Profile("coolpicker", IDLE)

ServerProfiles:
[Profile("super3228", IDLE), Profile("lrdxg", SEARCH), Profile("kmaw", IN_PLAY), Profile("aveelyr", SEARCH), Profile("coolpicker", IDLE)]

Start Search
SearcherProfile:
Profile("coolpicker", SEARCH)
ServerProfiles:
[Profile("super3228", IDLE), Profile("lrdxg", SEARCH), Profile("kmaw", IN_PLAY), Profile("aveelyr", SEARCH),  Profile("coolpicker", SEARCH)]

Result Search
SearcherProfile:
Profile("coolpicker", SEARCH)
Opponent:
Profile("lrdxg", SEARCH)
ServerProfiles:
[Profile("super3228", IDLE), Profile("lordyxD", IN_PLAY), Profile("kmaw", IN_PLAY), Profile("aveelyr", SEARCH),  Profile("coolpicker", IN_PLAY)]
```

</details>

## The English version

<details>
<summary>Hello!</summary>

The following topics are covered in this project:

- Generics are classes that can have type parameters. You can use them to write a class or method that will work with arbitrary data types rather than specific ones: the type (or type hierarchy) will be defined by the developer in the context of use. At the same time, the tool provides type safety: after specifying a type or a type hierarchy, work with this generic occurs only in the context of the specified type.
- Lazy initialization. There are situations where the creation of variables should not happen at the moment the class is used. It can also help to optimize code and calculations.
- Functional types. Working with them is certainly worthy of attention. The developers have provided excellent support for this popular tool, and also added some handy constructs for performing tasks in the context of an object.

## Topics:
- Generics
- Subscript
- Lazy initialization
- Delegates

**Tip!** Before you do your tasks, take a look at the examples in [documentation](https://docs.swift.org/swift-book/LanguageGuide/Generics.html), which provide several examples of possible generic use.

### Project: Game making utilities

## Tasks:

**Requirement!** Create a workspace inside the src folder named day03. 
You must create a macOS/Command Line Tool project for each task inside the workspace. For example, day03/quest1, day03quest2.
Also don't forget to select the created workspace under `Add to:` when creating a project.
You can read more about creating projects in [documentation](https://www.swift.org/getting-started/).

### Task 1. Westworld

Describe a class that simulates a revolver. 
In this task it is a typed class. 
The revolver's moon clip contains an element according to the declared type. 
For example, RevolverMoonClip<Int> will store elements of `Int` type.

- The revolver's moon clip is an array of 6 elements. If the slot is empty, then `nil` must be stored there.
- You can add one element to the nearest free slot with the `add()` method. If it is added successfully, it returns true, otherwise it returns false.
- It is possible to add via a list of elements. The function takes another collection as a resource from which all elements are added to the moon clip. If there are not enough elements in the collection, the revolver structure is filled as much as possible. If the list is empty, the method returns false.
- The structure has a `pointer` property. You can use it to get the current element on the trigger. This is the element in the moon clip with the index 0.
- You can remove elements one by one with the `shoot()` method, which returns the deleted element. The deletion starts with the `pointer` element.
- You can call `unloadAll()` for all elements at once or `unload(index)` to extract one. The function returns the extracted element or a list of all elements.
- You can scroll the moon clip with the `scroll()` method, changing the pointer position to a random element. The sequence of elements between each other must be preserved, and the element on the trigger must change.
- Add a getSize() method that returns the number of elements in the revolver.
- Create an extension function `toStringDescription()` for a class that presents information about the class object and its elements as `String`. Information about the elements is written starting from the element's position on the trigger (pointer).
- The class comparison operator `==` works correctly. Override it with the `Equatable` protocol.Class objects are equivalent if they have the same combination of elements, starting from any position, including nil. An example of a comparison is given below. 
- Create a subscript(index: `Int`) method for the class. It will return an element for any revolver that is at the given position in the clip when accessed by index. If the index is greater than a number, an error will occur.

**Check the result:** Write a program that shows how the `RevolverMoonClip` class works and run it
1. Create a revolver object, filling it with as many elements as possible using the constructor. Output to the console a description class of `RevolverMoonClip<Type>` type , the contents of the moon clip, starting with `pointer` and the `pointer` itself.
2. Retrieve the first and last element in the clip with `subscript`, by calling the indices of the corresponding elements.
3. Call the `scroll` method and display the object in the console. The result must start with a different element (but it can be equal in value). The order between the elements must be maintained.
4. Remove 4 elements one by one. Print the class object and compare it with the previous output. The modified moon clip must start with the 5th element, followed by the same element as before, then 4 `nil` values.
5. Create a collection of 8 elements of the same type as the generic of the created object. Add this collection to the revolver and output a comparison of the old and new collection in the revolver. The revolver must be filled completely with the first 4 elements of the collection. The `pointer` is set each time you add a filled moon clip element to the revolver.
6. Retrieve all elements of the `unloadAll` class. Print the size of the retrieved list and the size of the object ( must be 6 and 0) 
7. Add 4 `supply` elements to the class object collection. The size of the revolver's moon clip should become 4.
8. Create a new object with the same elements as in the list above. You also need to make a pre-scroll. Then use the `==` operator to compare whether these objects are equivalent. The result of the operation must be true.

_Output example_
```
1. Adding elements
Structure: RevolverMoonClip<Int> 
Objects: [3, 54, 7, 2, 56, 4]
Pointer: 3

2. Subscript
3, 4

3. Scroll
Structure: RevolverMoonClip<Int> 
Objects: [7, 2, 56, 4, 3, 54]
Pointer: 7

4. Deletion
Structure: RevolverMoonClip<Int> 
Objects: [3, 54, nil, nil, nil, nil]
Pointer: 3

5. Supply collection
Before: 
Supply collection: [4, 6, 3, 22, 77, 43, 76, 5]

Structure: RevolverMoonClip<Int> 
Objects: [3, 54, nil, nil, nil, nil]
Pointer: 3

After add operation performed:
Structure: RevolverMoonClip<Int> 
Objects: [22, 3, 6, 4, 3, 54]
Pointer: 22

6. Extraction
The extracted list: [22, 54, 6, 4, 3, 54]
size: 6

Structure: RevolverMoonClip<Int> 
Objects: [nil, nil, nil, nil, nil, nil]
Pointer: nil
size: 0

7. Supply collection 2
Before:
Supply collection: [77, 43, 76, 5]

Structure: RevolverMoonClip<Int> 
Objects: [nil, nil, nil, nil, nil, nil]
Pointer: nil

After add operation performed:
Structure: RevolverMoonClip<Int> 
Objects: [5, 76, 43, 77, nil, nil]
Pointer: 5

8. Equals
Structure: RevolverMoonClip<Int> 
Objects: [nil, 5, 76, 43, 77, nil]
Pointer: nil

Structure: RevolverMoonClip<Int> 
Objects: [nil, nil, 5, 76, 43, 77]
Pointer: nil

Result: equals
```

### Task 2. Bullets

**Bullet:**
- Create a class for a bullet
- Here you must also add a field to describe the bullet (blank or loaded)
- You can use the `UID` class to make your bullets unique
-The bullet must contain the caliber property (e.g., 22, 38, 45)
- The class must have its own `shoot()` method with "Bang" and caliber information output

**Revolver class contents update:**
- Add the caliber property for the revolver
- Make the revolver work only with the `Bullet` type. You can't put bullets of different calibers in the same moon clip. Remove typification from the class.
- When `shoot()` is called, a corresponding call should be made to the bullets as well. However, if a bullet is blank, the shoot class does not need to be called. 

**The view of the appropriate logic for revolver and bullet classes:**
  - A bullet can only be in one revolver’s moon clip. If you try to add a bullet that is already in another moon clip, the revolver `add` method must return false. Also, if you are adding a collection of bullets, a similar bullet must be ignored and the rest is added. Similarly for bullets that do not match the caliber of the revolver.
 
**Check the result:** to check, create a program that does the following. 
- Check that loaded bullets fire and blanks don't
- Try adding a bullet to different revolvers. The first addition will return true, the secondary will return false. Pre-create two blank revolvers.
- Try adding a bullet to two different collections. And try adding these collections to two different revolvers. Pre-create two blank revolvers.
 

_Output example_
```
1. Shoot or damp
Structure: RevolverMoonClip 32 caliber
Objects: [Patron(id1, charged, 32), Patron(id2, damp, 32), nil, nil, nil, nil]
Pointer: Patron(id1, charged, 32)

Shoot # call shoot()
Bang 32

Structure: RevolverMoonClip 32 caliber
Objects: [Patron(id2, damdp, 32), nil, nil, nil, nil, nil]
Pointer: Patron(id2, damp, 32)

Shoot 
Click
Objects: [nil, nil, nil, nil, nil, nil]
Pointer: nil

2. Unique Patron
Patron(id, charged, 32)

Revolver1: [nil, nil, nil, nil, nil, nil]
Revolver2: [nil, nil, nil, nil, nil, nil]

Add1 # call add()
Revolver1: [Patron(id, charged, 32), nil, nil, nil, nil, nil]
Revolver2: [nil, nil, nil, nil, nil, nil]

Add2
Revolver1: [Patron(id, charged, 32), nil, nil, nil, nil, nil]
Revolver2: [nil, nil, nil, nil, nil, nil]

3. Unique Patron in collection
Revolver1: [nil, nil, nil, nil, nil, nil]
Revolver2: [nil, nil, nil, nil, nil, nil]

[Patron(id, charged, 32), Patron(id1, charged, 32), Patron(id2, charged, 32)]
[Patron(id, charged, 32), Patron(id3, charged, 32), Patron(id4, charged, 32)]

Add1 # call add for 1 st collection

Add2 
Revolver1: [Patron(id, charged, 32), Patron(id1, charged, 32), Patron(id2, charged, 32), nil, nil, nil]
Revolver2: [Patron(id3, charged, 32), Patron(id4, charged, 32), nil, nil, nil, nil]
```

### Task 3. Player profile

In this task you need to create an object for the player profile and implement the `delegate` pattern by assigning a server object to the player class to search for an enemy.

**Player profile:**
Class `Profile` must contain:
- ID using `UUID`.
- Nickname
- Age
- Name
- Revolver
- Profile creation date in the form of `String`
- Status (`IN_PLAY` in game, `SEARCH` - in search, `IDLE` waiting; `OFFLINE`)
- The link that will be generated with the `lazy var` variable using the example `http://gameserver.com/${id}-${nickname}`

**Game server**
Class `Server` will describe the logic of the interaction between the players. The object must contain the following:
- Server address
- List of players on the server (`Profile`list)

**Server delegate in profile**
It's not unusual for an IOS application to use the pattern `Delegate` to call part of the logic. Let's implement this pattern using the example of a player's call to search for an opponent.
Create a `PlayerAction` protocol, which describes the possible actions of the player when interacting with the server. In our case, the function `findOpponent` will be described there. 
Class `Server` class must inherit the protocol and implement this function. The function returns the profile of the found player.
Add the server delegate as a `playerActionDelegate` variable of the `PlayerAction` class, which will call the enemy search request.

**Check the result:** create several profile objects with different statuses and put them on the server. Create your own profile that is idle. Also put him on the server. 
Then, the program must call the search for the opponent and change the status of the player to `SEARCH`. The function must return the opponen with the new status `IN_PLAY` and change the status in the player's profile.

_Output example_
```
SearcherProfile:
Profile("coolpicker", IDLE)

ServerProfiles:
[Profile("super3228", IDLE), Profile("lrdxg", SEARCH), Profile("kmaw", IN_PLAY), Profile("aveelyr", SEARCH), Profile("coolpicker", IDLE)]

Start Search
SearcherProfile:
Profile("coolpicker", SEARCH)
ServerProfiles:
[Profile("super3228", IDLE), Profile("lrdxg", SEARCH), Profile("kmaw", IN_PLAY), Profile("aveelyr", SEARCH),  Profile("coolpicker", SEARCH)]

Result Search
SearcherProfile:
Profile("coolpicker", SEARCH)
Opponent:
Profile("lrdxg", SEARCH)
ServerProfiles:
[Profile("super3228", IDLE), Profile("lordyxD", IN_PLAY), Profile("kmaw", IN_PLAY), Profile("aveelyr", SEARCH),  Profile("coolpicker", IN_PLAY)]
```
</details>
