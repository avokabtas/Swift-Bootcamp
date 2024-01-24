//
//  MenuListView.swift
//  BreakfastRecipes
//
//  Created by Aliia Satbakova  on 27.12.2023.
//

import SwiftUI

struct MenuListView: View {
    
    // MARK: - Private Properties
    
    // Свойства представления
    @EnvironmentObject private var loader: RecipeLoader
    @EnvironmentObject private var appState: AppState
    @Binding private var selectedRecipe: RecipeRealmModel?
    
    // Для хранения значения поискового запроса
    @State private var searchText = ""

    // MARK: - Init
    
    public init(selectedRecipe: Binding<RecipeRealmModel?>) {
        self._selectedRecipe = selectedRecipe
    }
    
    var body: some View {
        NavigationView {
            List(/*loader.recipeRealmModels*/filteredRecipes) { data in
                NavigationLink(destination: DetailView(selectedRecipe: $selectedRecipe, recipeRM: data, recipeImages: loader.recipeImages)) {
                    HStack {
                        if let image = loader.recipeImages[data.id] {
                            Image(uiImage: image)
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 70, height: 70)
                        } else if let imageData = appState.selectedPhotoData, appState.isPhotoChanged {
                            Image(uiImage: UIImage(data: imageData)!)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 70, height: 70)
                        } else {
                            Image(systemName: "photo.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 70, height: 70)
                        }
                        Text(data.title)
                            .font(.system(size: 20, design: .rounded))
                    }
                }
            }
            .navigationTitle("Recipes")
            .searchable(text: $searchText)
        }
    }
    
}

// MARK: - Filtered Recipes

extension MenuListView {
    
    // Отфильтрованный список рецептов
    private var filteredRecipes: [RecipeRealmModel] {
        guard !searchText.isEmpty else {
            return loader.recipeRealmModels
        }
        return loader.recipeRealmModels.filter { recipe in
            let title = recipe.title.lowercased()
            let search = searchText.lowercased()
            return title.hasPrefix(search) || title.contains(search)
        }
    }
    
}


/*
 
 if let image = loader.recipeImages[data.id] {
     Image(uiImage: image)
         .resizable()
         .clipShape(Circle())
         .frame(width: 70, height: 70)
 } else {
     Image(systemName: "photo.circle.fill")
         .resizable()
         .clipShape(Circle())
         .frame(width: 70, height: 70)
 }
 
 */
