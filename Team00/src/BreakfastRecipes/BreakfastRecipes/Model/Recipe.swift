//
//  Recipe.swift
//  BreakfastRecipes
//
//  Created by Aliia Satbakova  on 27.12.2023.
//

import Foundation

struct Recipe: Decodable, Identifiable {
    let id: Int
    let title: String
    let description: String
    let info: [String]
    let image: String
    let ingredients: [String]
    let steps: [String]
}
