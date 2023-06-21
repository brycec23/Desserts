//
//  DessertDetails.swift
//  Desserts
//
//  Created by Bryce Cullen on 6/20/23.
//

import SwiftUI

struct DessertDetails: View {
    let dessert: Dessert
    var body: some View {
        Form {
            Section(header: Text("Name")) {
                Text(dessert.name)
            }
            Section(header: Text("Place of Origin")) {
                Text(dessert.origin)
            }
            Section(header: Text("Dessert Image")) {
                getImageFromUrl(url: dessert.imageUrl)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Section(header: Text("Instructions")) {
                Text(dessert.instructions)
            }
        }
    }
}

