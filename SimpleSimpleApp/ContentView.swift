//
//  ContentView.swift
//  SimpleSimpleApp
//
//  Created by Rhoda Lucas on 2/11/25.
//

import SwiftUI
struct ContentView: View {
    
    @State private var searchText = ""
    @State private var favoritesOnly = false
    
    var filteredRecipes: [Recipe] {
        SampleData.recipes.filter { recipe in
            (recipe.name.localizedCaseInsensitiveContains(searchText) || searchText.isEmpty) && (!favoritesOnly || recipe.isFavorite)
            
        }
    }
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                TextField("Search Recipe", text: $searchText)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                Toggle("Favorites Only", isOn: $favoritesOnly)
                    .padding()
                
                
                List{
                    ForEach(["Main Course"], id: \..self){ category in
                        
                        Section(header: Text(category).font(.headline)){
                            
                            ForEach(filteredRecipes.filter { $0.category == category }) { recipe in
                                NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                                    
                                    HStack{
                                        
                                        Image(recipe.imageName)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50, height: 50)
                                            .cornerRadius(8)
                                        VStack(alignment: .leading) {
                                            Text(recipe.name)
                                                .font(.headline)
                                            VStack {
                                                ForEach(0..<recipe.rating, \..self){
                                                    Image(systemName: "star.fill").foregroundColor(.yellow)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                .navigationBarTitle("Recipes")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
