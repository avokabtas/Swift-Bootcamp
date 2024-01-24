//
//  RecipeRealmModel.swift
//  BreakfastRecipes
//
//  Created by Aliia Satbakova  on 10.01.2024.
//

import Foundation
import RealmSwift

class RecipeRealmModel: Object, Identifiable {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var title: String = ""
    @Persisted var descriptionText: String = ""
    @Persisted var info: List<String> = List<String>()
    @Persisted var imageURL: String = ""
    @Persisted var ingredients: List<String> = List<String>()
    @Persisted var steps: List<String> = List<String>()
}
