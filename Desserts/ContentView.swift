//
//  ContentView.swift
//  Desserts
//
//  Created by Bryce Cullen on 6/20/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            NavigationView {
                List {
                    ForEach(desserts) { aDessert in
                        NavigationLink(destination:
                            DessertDetails(dessert: aDessert)) {
                            DessertItem(dessert: aDessert)
                        }
                        
                    }
                }.navigationTitle(Text("Desserts"))
            }
    }
}
