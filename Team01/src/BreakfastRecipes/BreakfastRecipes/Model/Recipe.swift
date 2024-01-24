//
//  Recipe.swift
//  BreakfastRecipes
//
//  Created by Aliia Satbakova  on 27.12.2023.
//

import Foundation

struct Recipe: Decodable, Identifiable {
    var id: Int
    var title: String
    var description: String
    var info: [String]
    var image: String
    var ingredients: [String]
    var steps: [String]
}
