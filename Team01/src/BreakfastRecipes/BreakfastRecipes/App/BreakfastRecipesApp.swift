//
//  BreakfastRecipesApp.swift
//  BreakfastRecipes
//
//  Created by Aliia Satbakova  on 27.12.2023.
//

import SwiftUI

@main
struct BreakfastRecipesApp: App {
    
    @StateObject private var loader = RecipeLoader()
    @StateObject private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            MenuListView(selectedRecipe: $appState.selectedRecipe)
        }
        // Для доступа в любое представление SwiftUI
        .environmentObject(loader)
        .environmentObject(appState)
    }
}
