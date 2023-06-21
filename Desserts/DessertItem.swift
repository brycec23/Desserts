//
//  DessertItem.swift
//  Desserts
//
//  Created by Bryce Cullen on 6/20/23.
//

import SwiftUI

struct DessertItem: View {
    
    let dessert: Dessert
    
    var body: some View {
        Text(dessert.name)
    }
}
