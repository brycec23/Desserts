//
//  AppDelegate.swift
//  Desserts
//
//  Created by Bryce Cullen on 6/20/23.
//

import SwiftUI
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions
                     launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        getFoodIds()
        getFoodsFromApi()
        print(desserts)
        return true
    }
}
