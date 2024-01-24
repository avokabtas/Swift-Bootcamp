//
//  EditRecipeView.swift
//  BreakfastRecipes
//
//  Created by Aliia Satbakova  on 11.01.2024.
//

import SwiftUI
import RealmSwift
import PhotosUI

struct EditRecipeView: View {
    
    // MARK: - Private Properties
    
    // Свойства представления
    @EnvironmentObject private var appState: AppState
    
    @ObservedObject private var loader: RecipeLoader
    
    @Binding private var isEditing: Bool
    @Binding private var recipeRM: RecipeRealmModel
    @Binding private var selectedRecipe: RecipeRealmModel?
    
    // Локальные состояния
    @State private var editedRecipe: RecipeRealmModel
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedPhotoData: Data?
    
    // MARK: - Init
    
    init(loader: RecipeLoader, isEditing: Binding<Bool>, recipe: Binding<RecipeRealmModel>, selectedRecipe: Binding<RecipeRealmModel?>) {
        self.loader = loader
        self._isEditing = isEditing
        self._recipeRM = recipe
        self._selectedRecipe = selectedRecipe
        self._editedRecipe = State(initialValue: recipe.wrappedValue)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Recipe Details")) {
                    
                    // MARK: - Title, Description
                    
                    TextField("Title", text: $editedRecipe.title, axis: .vertical)
                    TextField("Description", text: $editedRecipe.descriptionText, axis: .vertical)
                    
                    // MARK: - Image
                    
                    PhotosPicker( selection: $selectedItem, matching: .images) {
                        Label("Select a photo", systemImage: "photo")
                    }
                    .onChange(of: selectedItem) { newItem, selectedItem in
                        guard let newItem = selectedItem else { return }
                        Task {
                            if let data = try? await newItem.loadTransferable(type: Data.self) {
                                selectedPhotoData = data
                                appState.selectedPhotoData = data
                                appState.isPhotoChanged = true
                                
                                // Обновляем свойство imageURL в RecipeRealmModel
                                if let recipe = appState.selectedRecipe {
                                    let realm = try! await Realm()
                                    try! realm.write {
                                        recipe.imageURL = selectedPhotoData?.base64EncodedString() ?? ""
                                    }
                                }
                            }
                        }
                    }
                    // При исчезновении представления, если фото было изменено, то оно сохраняется в массив
                    .onDisappear {
                        if appState.isPhotoChanged, let recipe = appState.selectedRecipe {
                            if let image = UIImage(data: selectedPhotoData ?? Data()) {
                                // Обновляем массив recipeImages
                                loader.recipeImages[recipe.id] = image
                            }
                            appState.isPhotoChanged = false
                        }
                    }
                    // Показать выбранное фото на экране перед сохранением
                    if let imageData = appState.selectedPhotoData, appState.isPhotoChanged {
                        VStack {
                            Image(uiImage: UIImage(data: imageData)!)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .cornerRadius(8)
                                .padding()
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    }
                }
                // При появлении представления, если у рецепта есть сохраненное фото, оно загружается и отображается
                .onAppear {
                    if let recipe = appState.selectedRecipe {
                        if let imageData = Data(base64Encoded: recipe.imageURL) {
                            selectedPhotoData = imageData
                        }
                    }
                }
                
                // MARK: - Info
                
                Section(header: Text("Info")) {
                    ForEach(editedRecipe.info.indices, id: \.self) { index in
                        TextField("Info \(index + 1)", text: Binding(
                            get: {
                                editedRecipe.info[index]
                            },
                            set: { newValue in
                                let realm = try! Realm()
                                try! realm.write {
                                    editedRecipe.info[index] = newValue
                                }
                            }
                        ), axis: .vertical)
                    }
                }
                
                // MARK: - Ingredients
                                
                Section(header: Text("Ingredients")) {
                    ForEach(editedRecipe.ingredients.indices, id: \.self) { index in
                        TextField("Ingredient \(index + 1)", text: Binding(
                            get: {
                                editedRecipe.ingredients[index]
                            },
                            set: { newValue in
                                let realm = try! Realm()
                                try! realm.write {
                                    editedRecipe.ingredients[index] = newValue
                                }
                            }
                        ), axis: .vertical)
                    }
                }
                
                // MARK: - Steps
                
                Section(header: Text("Directions")) {
                    ForEach(editedRecipe.steps.indices, id: \.self) { index in
                        TextField("Step \(index + 1)", text: Binding(
                            get: {
                                editedRecipe.steps[index]
                            },
                            set: { newValue in
                                let realm = try! Realm()
                                try! realm.write {
                                    editedRecipe.steps[index] = newValue
                                }
                            }
                        ), axis: .vertical)
                    }
                }
            }
            .navigationTitle("Edit Recipe")
            .navigationBarItems(
                trailing: Button("Save") {
                    let realm = try! Realm()
                    try! realm.write {
                        realm.add(editedRecipe, update: .modified)
                    }
                    selectedRecipe = editedRecipe
                    isEditing = false
                }
            )
        }
    }
}







/*
 ___________ If Using TextEditor ___________
 
 TextEditor(text: $editedRecipe.title)
 TextEditor(text: $editedRecipe.descriptionText)
 
 Section(header: Text("Info")) {
     ForEach(editedRecipe.info.indices, id: \.self) { index in
         TextEditor(text: Binding(
             get: {
                 editedRecipe.info[index]
             },
             set: { newValue in
                 let realm = try! Realm()
                 try! realm.write {
                     editedRecipe.info[index] = newValue
                 }
             }
         ))
     }
 }
 
 Section(header: Text("Ingredients")) {
     ForEach(editedRecipe.ingredients.indices, id: \.self) { index in
         TextEditor(text: Binding(
             get: {
                 editedRecipe.ingredients[index]
             },
             set: { newValue in
                 let realm = try! Realm()
                 try! realm.write {
                     editedRecipe.ingredients[index] = newValue
                 }
             }
         ))
     }
 }
 
 Section(header: Text("Steps")) {
     ForEach(editedRecipe.steps.indices, id: \.self) { index in
         TextEditor(text: Binding(
             get: {
                 editedRecipe.steps[index]
             },
             set: { newValue in
                 let realm = try! Realm()
                 try! realm.write {
                     editedRecipe.steps[index] = newValue
                 }
             }
         ))
     }
 }
 
 */
