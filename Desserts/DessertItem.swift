//
//  DessertItem.swift
//  Desserts
//
//  Created by Bryce Cullen on 6/20/23.
//
//  Dessert shown in list

import SwiftUI

struct DessertItem: View {
    
    let dessert: Dessert
    
    var body: some View {
        Text(dessert.name)
    }
}
