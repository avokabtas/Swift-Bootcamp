//
//  DetailView.swift
//  BreakfastRecipes
//
//  Created by Aliia Satbakova  on 27.12.2023.
//

import SwiftUI

struct DetailView: View {
    let recipe: Recipe
    
    var body: some View {
        ScrollView {
            VStack (alignment: .center) {
                Spacer()
                Image(recipe.image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(height: 350)
                
                Text(recipe.description)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text(recipe.info.joined(separator: " "))
                    .multilineTextAlignment(.center)
                    .font(.system(.body, design: .rounded))
                    .fontWeight(.semibold)
                    .padding()
            }
            
            VStack (alignment: .leading, spacing: 8) {
                Text("Ingredients")
                    .font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                ForEach(recipe.ingredients, id: \.self) { ingredient in
                    Text("• " + ingredient)
                }
                
                Spacer()
                
                Text("Directions")
                    .font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                ForEach(recipe.steps.indices, id: \.self) { index in
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Step \(index + 1)")
                            .font(.headline)
                        Text(recipe.steps[index])
                    }
                    .padding(.vertical, 4)
                }
            }
            .padding()
            .navigationBarTitle(recipe.title, displayMode: .inline)
        }
    }
    
}
