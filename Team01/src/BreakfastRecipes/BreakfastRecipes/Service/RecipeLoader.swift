//
//  RecipeLoader.swift
//  BreakfastRecipes
//
//  Created by Aliia Satbakova  on 27.12.2023.
//

import Foundation
import Alamofire
import SwiftUI
import RealmSwift

final class RecipeLoader: ObservableObject {
    
    // MARK: - Public Properties
    
    @Published var recipeRealmModels = [RecipeRealmModel]()
    @Published var recipeImages = [Int: UIImage]()

    // MARK: - Init
    
    init() {
        loadData()
    }
    
    // MARK: - loadData
    
    func loadData() {
        guard let url = Bundle.main.url(forResource: "recipes", withExtension: "json") else {
            fatalError("JSON file not found")
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decodedRecipes = try decode(from: data)
            // Проверяем, что все ок
            // print(decodedRecipes)
            
            configureRealm()
            
            DispatchQueue.main.async {
                let realm = try! Realm()
                
                try! realm.write {
                    for recipeJSON in decodedRecipes {
                        let realmRecipe = RecipeRealmModel()
                        realmRecipe.id = recipeJSON.id
                        realmRecipe.title = recipeJSON.title
                        realmRecipe.descriptionText = recipeJSON.description
                        realmRecipe.info.append(objectsIn: recipeJSON.info)
                        realmRecipe.ingredients.append(objectsIn: recipeJSON.ingredients)
                        realmRecipe.steps.append(objectsIn: recipeJSON.steps)
                        realmRecipe.imageURL = recipeJSON.image
                        
                        realm.add(realmRecipe, update: .all)
                        
                        // Асинхронная загрузка изображений
                        self.loadImageFromURL(urlString: recipeJSON.image) { image in
                            if let image = image {
                                try! realm.write {
                                    // Сохраняем imageURL в формате String
                                    realmRecipe.imageURL = recipeJSON.image
                                }
                                // Обновить изображения после успешной загрузки
                                DispatchQueue.main.async {
                                    self.recipeImages[realmRecipe.id] = image
                                }
                            }
                        }
                    }
                    // Обновление recipeRealmModels после загрузки данных
                    self.recipeRealmModels = realm.objects(RecipeRealmModel.self).map { $0 }
                    // Проверяем, что все ок
                    // print(self.recipeRealmModels)
                }
            }
        } catch {
            fatalError("Error parsing JSON file: \(error.localizedDescription)")
        }
    }
    
    // MARK: - loadImageFromURL
    
    func loadImageFromURL(urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            print("Invalid URL: \(urlString)")
            completion(nil)
            return
        }
        
        AF.request(url).responseData { response in
            switch response.result {
            case .success(let data):
                if let image = UIImage(data: data) {
                    print("Image loaded successfully for URL: \(urlString)")
                    completion(image)
                } else {
                    print("Failed to create image from data")
                    completion(nil)
                }
            case .failure(let error):
                print("Error loading image: \(error.localizedDescription)")
                completion(nil)
            }
        }
    }
    
    // MARK: - Helper Methods
    
    private func decode(from data: Data) throws -> [Recipe] {
        let jsonDecoder = JSONDecoder()
        return try jsonDecoder.decode([Recipe].self, from: data)
    }
    
    private func configureRealm() {
        let config = Realm.Configuration(
            schemaVersion: 2, // Увеличиваем версию схемы базы данных
            migrationBlock: { migration, oldSchemaVersion in
                if oldSchemaVersion < 2 {
                    // Добавляем новое поле 'imageURL', если его еще нет
                    migration.enumerateObjects(ofType: RecipeRealmModel.className()) { oldObject, newObject in
                        if newObject!["imageURL"] == nil {
                            newObject!["imageURL"] = ""
                        }
                    }
                }
            }
        )
        Realm.Configuration.defaultConfiguration = config
    }
    
}
