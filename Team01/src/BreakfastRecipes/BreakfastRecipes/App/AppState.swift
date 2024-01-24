//
//  AppState.swift
//  BreakfastRecipes
//
//  Created by Aliia Satbakova  on 15.01.2024.
//

import Foundation

class AppState: ObservableObject {
    // Выбранный в данный момент рецепт
    @Published var selectedRecipe: RecipeRealmModel? = nil
    // Фото данные
    @Published var selectedPhotoData: Data? {
        didSet {
            isPhotoChanged = true
        }
    }
    // Были ли изменены фото данные
    @Published var isPhotoChanged: Bool = false
}
