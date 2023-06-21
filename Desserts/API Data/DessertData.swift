//
//  DessertData.swift
//  Desserts
//
//  Created by Bryce Cullen on 6/20/23.
//

import Foundation
import SwiftUI

//Array of desserts gathered from API
var desserts = [Dessert]()
var foodIds = [String]()

let allDesertsQueryUrl = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
let dessertIdQueryUrl = "https://themealdb.com/api/json/v1/1/lookup.php?i="

public func getFoodIds() {
    //no need to query if array already populated
    if !desserts.isEmpty {
        return
    }
    
    let queryUrl = URL(string: allDesertsQueryUrl)
    
    let headers = [
        "accept": "application/json",
        "cache-control": "no-cache",
        "connection": "keep-alive",
        "host": "themealdb.com"
    ]
    
    let request = NSMutableURLRequest(url: queryUrl!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
    
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers
    
    let semaphore = DispatchSemaphore(value: 0)
    
    
    URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        //ensure no error
        guard error == nil else {
            semaphore.signal()
            return
        }
        
        //ensure response was success
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            semaphore.signal()
            return
        }
        
        //unwrap data if it has value
        guard let jsonDataFromApi = data else {
            semaphore.signal()
            return
        }
        
        do {
            let jsonResponse = try JSONSerialization.jsonObject(with: jsonDataFromApi,
                                                                options: JSONSerialization.ReadingOptions.mutableContainers)
            
            var topLevelDictionary = Dictionary<String, Any>()
            
            if let jsonObject = jsonResponse as? [String: Any] {
                topLevelDictionary = jsonObject
            } else {
                return
            }
            
            var arrayOfMealsJsonObjects = Array<Any>()
            
            if let jsonArray = topLevelDictionary["meals"] as? [Any] {
                arrayOfMealsJsonObjects = jsonArray
            } else {
                return
            }
            
            //iterate over the meals array from api call
            for index in 0..<arrayOfMealsJsonObjects.count {
                var dessertDictionary = Dictionary<String, Any>()
                if let jsonDictionary = arrayOfMealsJsonObjects[index] as? [String: Any] {
                    dessertDictionary = jsonDictionary
                } else {
                    return
                }
                
                //Get id for dessert for id api query
                var dbId = ""
                if let idMeal = dessertDictionary["idMeal"] as! String? {
                    dbId = idMeal
                }
                
                foodIds.append(dbId)
            }
            
        } catch {
            semaphore.signal()
            return
        }
        
        semaphore.signal()
    }).resume()
    _ = semaphore.wait(timeout: .now() + 10)
    
}


public func getFoodsFromApi() {
    for food in foodIds {
        let queryUrl = URL(string: dessertIdQueryUrl + food)
        
        let headers = [
            "accept": "application/json",
            "cache-control": "no-cache",
            "connection": "keep-alive",
            "host": "themealdb.com"
        ]
        
        let request = NSMutableURLRequest(url: queryUrl!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let semaphore = DispatchSemaphore(value: 0)
        
        URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            //ensure no error
            guard error == nil else {
                semaphore.signal()
                return
            }
            
            //ensure response was success
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                semaphore.signal()
                return
            }
            
            //unwrap data if it has value
            guard let jsonDataFromApi = data else {
                semaphore.signal()
                return
            }
            
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with: jsonDataFromApi,
                                                                    options: JSONSerialization.ReadingOptions.mutableContainers)
                var topLevelDictionary = Dictionary<String, Any>()
                
                if let jsonObject = jsonResponse as? [String: Any] {
                    topLevelDictionary = jsonObject
                } else {
                    return
                }
                
                var arrayOfMealsJsonObjects = Array<Any>()
                
                if let jsonArray = topLevelDictionary["meals"] as? [Any] {
                    arrayOfMealsJsonObjects = jsonArray
                } else {
                    return
                }
                
                //iterate over the meals array from api call
                for index in 0..<arrayOfMealsJsonObjects.count {
                    var dessertDictionary = Dictionary<String, Any>()
                    if let jsonDictionary = arrayOfMealsJsonObjects[index] as? [String: Any] {
                        dessertDictionary = jsonDictionary
                    } else {
                        return
                    }
                    
                    var name = ""
                    if let strMeal = dessertDictionary["strMeal"] as? String {
                        name = strMeal
                    }
                    
                    var origin = ""
                    if let strArea = dessertDictionary["strArea"] as? String {
                        origin = strArea
                    }
                    
                    var instructions = ""
                    if let strInstructions = dessertDictionary["strInstructions"] as? String {
                        instructions = strInstructions
                    }
                    
                    var imageUrl = ""
                    if let strMealThumb = dessertDictionary["strMealThumb"] as? String {
                        imageUrl = strMealThumb
                    }
                    
                    var tags = ""
                    if let strTags = dessertDictionary["strTags"] as? String {
                        tags = strTags
                    }
                    var tagsArr = [String]()
                    if tags != "" {
                        tagsArr = tags.components(separatedBy: ",")
                    }
                    
                    var videoUrl = ""
                    if let strYoutube = dessertDictionary["strYoutube"] as? String {
                        videoUrl = strYoutube
                    }
                    
                    var ingredientsArr = [String]()
                    for i in 1...20 {
                        var ingredient = ""
                        if let strIngredient = dessertDictionary["strIngredient" + String(i)] as? String {
                            ingredient = strIngredient
                        }
                        if ingredient != "" && ingredient != " " {
                            ingredientsArr.append(ingredient.capitalized)
                        }
                    }
                    
                    var measuresArr = [String]()
                    for i in 1...20 {
                        var measure = ""
                        if let strMeasure = dessertDictionary["strMeasure" + String(i)] as? String {
                            measure = strMeasure
                        }
                        if measure != "" && measure != " "{
                            measuresArr.append(measure)
                        }
                    }
                    
                    var sourceUrl = ""
                    if let strSource = dessertDictionary["strSource"] as? String {
                        sourceUrl = strSource
                    }
                    
                    let foundDessert = Dessert(id: UUID(), dbId: food, name: name, origin: origin, instructions: instructions, imageUrl: imageUrl, tags: tagsArr, videoUrl: videoUrl, ingredients: ingredientsArr, measures: measuresArr, sourceUrl: sourceUrl)
                
                    desserts.append(foundDessert)
                }
                
            } catch {
                semaphore.signal()
                return
            }
            
            semaphore.signal()
        }).resume()
        _ = semaphore.wait(timeout: .now() + 10)
        
    }
}
