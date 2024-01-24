//
//  DetailView.swift
//  BreakfastRecipes
//
//  Created by Aliia Satbakova  on 27.12.2023.
//

import SwiftUI

struct DetailView: View {
    
    // MARK: - Public Properties
    
    // Свойство представления
    @Binding var selectedRecipe: RecipeRealmModel?
    // Локальное состояние для хранения данных о рецепте
    @State var recipeRM: RecipeRealmModel
    // Для хранения изображений рецептов по их id
    let recipeImages: [Int: UIImage]
    
    // MARK: - Private Properties
    
    // Свойства представления
    @EnvironmentObject private var loader: RecipeLoader
    @EnvironmentObject private var appState: AppState
    // Локальное состояние
    @State private var isEditing = false
    
    var body: some View {
        ScrollView {
            VStack (alignment: .center) {
                Spacer()
                
                // MARK: - Image
                
                if let image = recipeImages[recipeRM.id] {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(height: 350)
                } else if let imageData = appState.selectedPhotoData, appState.isPhotoChanged {
                    Image(uiImage: UIImage(data: imageData)!)
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(height: 350)
                } else {
                    Image(systemName: "photo.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(height: 350)
                }
                
                // MARK: - Description

                Text(recipeRM.descriptionText)
                    .multilineTextAlignment(.center)
                    .padding()
                
                // MARK: - Info
                
                Text(recipeRM.info.joined(separator: " "))
                    .multilineTextAlignment(.center)
                    .font(.system(.body, design: .rounded))
                    .fontWeight(.semibold)
                    .padding()
            }
            
            VStack (alignment: .leading, spacing: 8) {
                
                // MARK: - Ingredients
                
                Text("Ingredients")
                    .font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                ForEach(recipeRM.ingredients, id: \.self) { ingredient in
                    Text("• " + ingredient)
                }
                
                Spacer()
                
                // MARK: - Steps
                
                Text("Directions")
                    .font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                ForEach(recipeRM.steps.indices, id: \.self) { index in
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Step \(index + 1)")
                            .font(.headline)
                        Text(recipeRM.steps[index])
                    }
                    .padding(.vertical, 4)
                }
            }
            .padding()
            .navigationBarTitle(recipeRM.title, displayMode: .inline)
            .navigationBarItems(trailing: Button("Edit") {
                isEditing = true
            }
                .sheet(isPresented: $isEditing) {
                    EditRecipeView(loader: loader, isEditing: $isEditing, recipe: $recipeRM, selectedRecipe: $selectedRecipe)
                }
            )
        }
    }
    
}



/*
 
 Image(uiImage: recipeImages[recipeRM.id] ?? UIImage(systemName: "photo.circle.fill")!)
     .resizable()
     .scaledToFit()
     .clipShape(Circle())
     .frame(height: 350)

 */
