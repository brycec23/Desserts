//
//  AppDelegate.swift
//  Desserts
//
//  Created by Bryce Cullen on 6/20/23.
//
//  Run API queries on app launch.

import SwiftUI
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions
                     launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        getFoodIds()
        getFoodsFromApi()
        return true
    }
}
