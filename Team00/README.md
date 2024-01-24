## Русскоязычная версия

<details>
<summary>Всем привет!  </summary>
Сегодняшняя цель - научиться проектировать интерфейс при помощи SwiftUI - современного UI фреймворка, который позволяет
создавать самые красивые приложения для всех платформ компании Apple.

Основные достоинства SwiftUI заключаются в его простоте создания макетов для всех платформ,
использовании реактивных компонентов (!) и управлении темами приложения.

**Совет!** Примеры компонентов и стандартных сценариев использования были показаны на [WWDC22](https://developer.apple.com/videos/swiftui-ui-frameworks/)

Сегодня мы опробуем SwiftUI для построения интерфейса приложения и реализуем навигацию.

**Совет!** Не забывайте смотреть в [документацию](https://developer.apple.com/documentation/swiftui/), в случае Apple она всегда актуальна!

## Темы:
- декларативный подход к проектированию интерфейсов
- реализация навигации в приложении

### Проект: Вкусные записки для iOS

Тема проекта - записная книжка с рецептами

### Задание 0. Создать новый проект в XCode

Проект создаётся один раз и используется для всех последующих заданий.

### Задание 1. Экран записки
Реализовать компонент View для отображения рецепта.

- Экран записки должен содержать изображение рецепта;
- Изображение рецепта должно находится в круглой рамке
- Экран записки должен содержать название рецепта;
- Экран записки должен содержать пошаговое описание рецепта;
- Шрифты названия и описания рецепта должны отличаться друг от друга.

**Совет!** Используйте Preview для удобства редактирования ваших компонентов!

### Задание 2. Экран списка рецептов (основной)
Реализовать компонент View для отображения списка рецептов.

- Экран списка рецептов должен отображаться при запуске приложения;
- Экран списка рецептов должен содержать список доступных рецептов;
- Данные доступных рецептов могут формироваться как из локального JSON файла так и с помощью общедоступного API;
- Выбрать API можно из [списка](https://github.com/public-apis/public-apis#food--drink);
- Способ получения данных в рамках задания не оценивается;
- Каждый элемент списка должен содержать заголовок и изображение;
- Изображение должно находиться в круглой рамке.

**Совет!** Пример локального JSON файла можно найти [здесь](./materials/example.json)

### Задание 3. Навигация
Реализовать навигацию между элементами списка рецептов и их описанием с помощью NavigationView.

- Каждый элемент списка должен вести на соответствующий ему экран с описанием рецепта;
- Экран описания рецепта должен получать id соответствующего рецепта от экрана списка рецептов;
- Должно быть реализовано возвращение с экрана описания рецепта на предыдущий экран (экран списка рецептов);
- Возвращение должно осуществляться на то же место в списке рецептов, с которого был осуществлен переход на описание рецепта.

**Совет!** Используйте LivePreview XCode для отладки навигации.

</details>


## The English version

<details>
<summary>Hello, everyone!  </summary>

Today's goal is to learn how to design an interface using SwiftUI, a modern UI framework that helps
create the most beautiful applications for all Apple platforms.

The main advantages of SwiftUI are its ease of creating layouts for all platforms, the use of reactive components (!) and the management of application themes.

**Tip!** Examples of components and standard use cases were shown at [WWDC22].(https://developer.apple.com/videos/swiftui-ui-frameworks/)


Today we will try out SwiftUI to build the application interface and implement the navigation.

**Tip!** Don't forget to read  [documentation](https://developer.apple.com/documentation/swiftui/), in the case of Apple it is always relevant!

## Topics:
- declarative approach to interface design
- implementation of navigation in the application

### Project: Yummy notes for iOS

Project theme - recipe notebook

### Task 0. Create a new project in XCode

The project is created only once and is used for all subsequent tasks.

### Task 1. Note screen

Implement a View component to display a recipe.
- The note screen must contain a picture of the recipe;
- The picture of the recipe must be in a circular frame
- The note screen must contain the name of the recipe;
- The note screen must contain a step-by-step recipe description;
- The fonts of the name and description of the recipe must be different from each other.

**Tip!** Use Preview for easy editing of your components!

### Task 2: Recipe list screen (Main)
Implement a View component to display a list of recipes.

- The recipe list screen must be displayed when you open the application;
- The recipe list screen must contain a list of available recipes;
- Data of available recipes can be generated both from a local JSON file and via a public API;
- You can select an API from the [list](https://github.com/public-apis/public-apis#food--drink);
- The method of data extraction within the task is not evaluated;
- Each list element must have a title and a picture;
- The picture of the recipe must be in a circular frame.

**Tip! ** You can find an example of a local JSON file [here](./materials/example.json)

### Task 3: Navigation
Implement navigation between recipe list elements and their descriptions using NavigationView.

-Each element in the list must lead to its corresponding screen with a description of the recipe;
-The recipe description screen must receive the id of the corresponding recipe from the recipe list screen;
- The return from the recipe description screen to the previous screen (recipe list screen) must be implemented;
- The return must be to the same place in the recipe list from which the transition to the recipe description was made.
.

**Tip! ** Use LivePreview XCode to debug the navigation.

</details>
