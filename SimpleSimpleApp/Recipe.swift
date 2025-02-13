//
//  Recipe.swift
//  SimpleSimpleApp
//
//  Created by Rhoda Lucas on 2/11/25.
//

import Foundation

struct Recipe: Identifiable {
    let idMeal: String
    let strMeal: String
    let strCategory: String
    let strInstructions: String
    let strMealThumb: String
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    
    var id: String { idMeal }
    
    var ingredients: [String] {
        [strIngredient1, strIngredient2, strIngredient3].compactMap { $0 }
    }
}
