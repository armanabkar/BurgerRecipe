//
//  BurgerJSON.swift
//  BurgerRecipe
//
//  Created by Arman Abkar on 5/14/21.
//

import Foundation

struct BurgerJSON: Decodable {
    var name: String
    var ingredients: String
    var imageName: String
    var thumbnailName: String
    var type: BurgerType
}

enum BurgerType: String, Decodable {
    case vegetarian = "vegetarian"
    case meat = "meat"
}
