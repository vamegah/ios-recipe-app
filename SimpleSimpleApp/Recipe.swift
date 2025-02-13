//
//  Recipe.swift
//  SimpleSimpleApp
//
//  Created by Rhoda Lucas on 2/11/25.
//

import Foundation

struct Recipe: Identifiable {
    let id = UUID()
    let name: String
    let category: String
    let ingredients: [String]
    let instructions: String
    let servings: Int
    let prepTime: String
    let cookTime: String
    let imageName: String
    var isFavorite: Bool = false
    let rating: Int
}
