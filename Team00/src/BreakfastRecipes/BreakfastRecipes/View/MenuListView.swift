//
//  MenuListView.swift
//  BreakfastRecipes
//
//  Created by Aliia Satbakova  on 27.12.2023.
//

import SwiftUI

struct MenuListView: View {
    @ObservedObject var loader = RecipeLoader()
    
    var body: some View {
        NavigationView {
            List(loader.recipes) { data in
                NavigationLink(destination: DetailView(recipe: data)) {
                    HStack {
                        Image(data.image)
                            .resizable()
                            .clipShape(Circle())
                            .frame(width: 70, height: 70)
                        Text(data.title)
                            .font(.system(size: 20, design: .rounded))
                    }
                }
            }
            .navigationTitle("Recipes")
        }
    }
    
}

#Preview {
    MenuListView()
}
