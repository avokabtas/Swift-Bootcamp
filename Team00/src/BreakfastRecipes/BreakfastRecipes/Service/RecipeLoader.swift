//
//  RecipeLoader.swift
//  BreakfastRecipes
//
//  Created by Aliia Satbakova  on 27.12.2023.
//

import Foundation

final class RecipeLoader: ObservableObject {
    @Published var recipes = [Recipe]()
    
    init() {
        loadData()
    }
    
    // Load recipes from local resourse
    func loadData() {
        guard let url = Bundle.main.url(forResource: "recipes", withExtension: "json") else {
            fatalError("JSON file not found")
        }
        
        do {
            let data = try Data(contentsOf: url)
            let jsonDecoder = JSONDecoder()
            let decodedRecipes = try jsonDecoder.decode([Recipe].self, from: data)
            DispatchQueue.main.async {
                self.recipes = decodedRecipes
            }
        } catch {
            fatalError("Error parsing JSON file: \(error.localizedDescription)")
        }
    }
}
