//
//  UtilityFunctions.swift
//  Desserts
//
//  Created by Bryce Cullen on 6/20/23.
//

import Foundation
import SwiftUI

//Utility function to get an Image from URL
public func getImageFromUrl(url: String) -> Image {
    
    //use my default food image if url is invalid
    var imageObtainedFromUrl = Image("defaultfood")
 
    let headers = [
        "accept": "image/jpg, image/jpeg, image/png",
        "cache-control": "cache",
        "connection": "keep-alive",
    ]
 
    guard let imageUrl = URL(string: url) else {
        return Image("defaultfood")
    }
 
    let request = NSMutableURLRequest(url: imageUrl,
                                      cachePolicy: .useProtocolCachePolicy,
                                      timeoutInterval: 30.0)
 
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers

    let semaphore = DispatchSemaphore(value: 0)
 
    URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in

        guard error == nil else {
            semaphore.signal()
            return
        }
 
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            semaphore.signal()
            return
        }
 
        guard let imageDataFromUrl = data else {
            semaphore.signal()
            return
        }
 
        let uiImage = UIImage(data: imageDataFromUrl)
 
        if let imageObtained = uiImage {
            imageObtainedFromUrl = Image(uiImage: imageObtained)
        }
 
        semaphore.signal()
    }).resume()
 
    _ = semaphore.wait(timeout: .now() + 30)
 
    return imageObtainedFromUrl
}


