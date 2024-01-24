//
//  main.swift
//  quest1
//
//  Created by Aliia Satbakova  on 03.01.2024.
//

import Foundation
import RealmSwift

class Recipe: Object {
    @Persisted var name: String
    @Persisted var instructions: String
    @Persisted var linkToThePicture: String
}

class RecipeDataSource {
    private var realm: Realm
    
    init(realm: Realm) {
        self.realm = realm
    }
    
    // CRUD операции (Create, Read, Update, Delete)
    
    func create(name: String, instructions: String, linkToThePicture: String) {
        let recipe = Recipe()
        recipe.name = name
        recipe.instructions = instructions
        recipe.linkToThePicture = linkToThePicture
        
        try? realm.write {
            realm.add(recipe)
        }
    }
    
    func read() -> Results<Recipe>? {
        return realm.objects(Recipe.self)
    }
    
    func update(recipe: Recipe, name: String, instructions: String, linkToThePicture: String) {
        try? realm.write {
            recipe.name = name
            recipe.instructions = instructions
            recipe.linkToThePicture = linkToThePicture
        }
    }
    
    func delete(recipe: Recipe) {
        try? realm.write {
            realm.delete(recipe)
        }
    }
    
    // Поиск рецепта по названию
    func searchRecipeByName(name: String) -> Results<Recipe>? {
        return realm.objects(Recipe.self)
            .filter("name CONTAINS[c] %@", name)
    }
}

func main() {
    // Open the local-only default realm
    let realm = try! Realm()
    
    // Создание и инициализация объекта
    let recipeDataSource = RecipeDataSource(realm: realm)
    
    // Для тестирования - удаляем все перед загрузкой данных
    try? realm.write {
        realm.deleteAll()
    }
    
    print("Realm is ready!\n")
    
    // Добавление рецептов в базу данных
    recipeDataSource.create(name: "Пирог", instructions: "Инструкция к пирогу", linkToThePicture: "www.recipe.com/пирог.jpg")
    recipeDataSource.create(name: "Салат Оливье", instructions: "Инструкция к салату оливье", linkToThePicture: "www.recipe.com/салат_оливье.jpg")
    recipeDataSource.create(name: "Плов", instructions: "Инструкция к плову", linkToThePicture: "www.recipe.com/плов.jpg")
    
    // Получение всех рецептов из базы данных и вывод на экран
    print("----- Все рецепты:")
    if let allRecipes = recipeDataSource.read() {
        for recipe in allRecipes {
            print("Name: \(recipe.name), Instructions: \(recipe.instructions), Photo: \(recipe.linkToThePicture)")
        }
    }
    
    // Удаление первого рецепта из базы данных
    if let firstRecipe = recipeDataSource.read()?.first {
        recipeDataSource.delete(recipe: firstRecipe)
    }
    
    // Получение и вывод всех рецептов после удаления
    if let remainingRecipes = recipeDataSource.read() {
        print("\n----- Оставшиеся рецепты после удаления первого рецепта:")
        for recipe in remainingRecipes {
            print("Name: \(recipe.name), Instructions: \(recipe.instructions), Photo: \(recipe.linkToThePicture)")
        }
    }
    
    // Обновление первого рецепта
    if let firstRecipe = recipeDataSource.read()?.first {
        recipeDataSource.update(recipe: firstRecipe, name: "Салат цезарь", instructions: "Инструкция к салату цезарь", linkToThePicture: "www.recipe.com/салат_цезарь.jpg")
        print("\n----- Обновили первый рецепт:")
        print("Name: \(firstRecipe.name), Instructions: \(firstRecipe.instructions), Photo: \(firstRecipe.linkToThePicture)")
    }
  
    // Поиск рецепта по названию и вывод результатов
    let searchResults = recipeDataSource.searchRecipeByName(name: "Салат цезарь")
    if let results = searchResults {
        print("\n----- Результат поиска по названию:")
        for recipe in results {
            print("Name: \(recipe.name), Instructions: \(recipe.instructions), Photo: \(recipe.linkToThePicture)")
        }
    }
    
    // Выводим еще раз все рецепты
    print("\n----- Все рецепты:")
    if let allRecipes = recipeDataSource.read() {
        for recipe in allRecipes {
            print("Name: \(recipe.name), Instructions: \(recipe.instructions), Photo: \(recipe.linkToThePicture)")
        }
    }
}

main()
