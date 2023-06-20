//
//  DessertStruct.swift
//  Desserts
//
//  Created by Bryce Cullen on 6/20/23.
//

import SwiftUI

struct Dessert: Hashable, Codable, Identifiable {
    var id: UUID //unqiue identifier
    var dbId: String //idMeal from first api call -> use for lookup
    var name: String //strMeal
    var origin: String //strArea
    var instructions: String //strInstructions
    var imageUrl: String //strMealThumb
    var tags: [String] //strTags -> parse from string into arr
    var videoUrl: String //strYoutube
    var ingredients: [String] //strIngredient1, strIngredient2, ... strIngredient20 -> Add each ingredient to this array
    var measures: [String] //strMeasure1, strMeasure2, ... strMeasure20 -> Add each measurement to this array
    var sourceUrl: String //strSource
}

/*
 FROM https://themealdb.com/api/json/v1/1/filter.php?c=Dessert
 {"meals":
    [
        {"strMeal":"Carrot Cake",
         "strMealThumb":"https:\/\/www.themealdb.com\/images\/media\/meals\/vrspxv1511722107.jpg",
         "idMeal":"52897"
        },
        {},...
    ]
 }
 
 FROM https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID
 {"meals":
    [
        {"idMeal":"52897",
         "strMeal":"Carrot Cake",
         "strDrinkAlternate":null,
         "strCategory":"Dessert",
         "strArea":"British",
         "strInstructions":"For the carrot cake, preheat the oven to 160C\/325F\/Gas 3. Grease and line a 26cm\/10in springform cake tin.\r\nMix all of the ingredients for the carrot cake, except the carrots and walnuts, together in a bowl until well combined. Stir in the carrots and walnuts.\r\nSpoon the mixture into the cake tin and bake for 1 hour 15 minutes, or until a skewer inserted into the middle comes out clean. Remove the cake from the oven and set aside to cool for 10 minutes, then carefully remove the cake from the tin and set aside to cool completely on a cooling rack.\r\nMeanwhile, for the icing, beat the cream cheese, caster sugar and butter together in a bowl until fluffy. Spread the icing over the top of the cake with a palette knife.",
         "strMealThumb":"https:\/\/www.themealdb.com\/images\/media\/meals\/vrspxv1511722107.jpg",
         "strTags":"Cake,Treat,Sweet",
         "strYoutube":"https:\/\/www.youtube.com\/watch?v=asjZ7iTrGKA",
         "strIngredient1":"Vegetable Oil",
         "strIngredient2":"Plain Flour",
         "strIngredient3":"Bicarbonate Of Soda",
         "strIngredient4":"Sugar",
         "strIngredient5":"Eggs",
         "strIngredient6":"Salt",
         "strIngredient7":"Cinnamon",
         "strIngredient8":"Carrots",
         "strIngredient9":"Walnuts",
         "strIngredient10":"Cream Cheese",
         "strIngredient11":"Caster Sugar",
         "strIngredient12":"Butter",
         "strIngredient13":"",
         "strIngredient14":"",
         "strIngredient15":"",
         "strIngredient16":"",
         "strIngredient17":"",
         "strIngredient18":"",
         "strIngredient19":"",
         "strIngredient20":"",
         "strMeasure1":"450ml",
         "strMeasure2":"400g",
         "strMeasure3":"2 tsp",
         "strMeasure4":"550ml",
         "strMeasure5":"5",
         "strMeasure6":"\u00bd tsp",
         "strMeasure7":"2 tsp",
         "strMeasure8":"500g grated",
         "strMeasure9":"150g",
         "strMeasure10":"200g",
         "strMeasure11":"150g",
         "strMeasure12":"100g ",
         "strMeasure13":"",
         "strMeasure14":"",
         "strMeasure15":"",
         "strMeasure16":"",
         "strMeasure17":"",
         "strMeasure18":"",
         "strMeasure19":"",
         "strMeasure20":"",
         "strSource":"https:\/\/www.bbc.co.uk\/food\/recipes\/classic_carrot_cake_08513",
         "strImageSource":null,
         "strCreativeCommonsConfirmed":null,
         "dateModified":null}]}
 */
