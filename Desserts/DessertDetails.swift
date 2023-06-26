//
//  DessertDetails.swift
//  Desserts
//
//  Created by Bryce Cullen on 6/20/23.
//
//  Dessert Details page shown for each dessert. All relevant info is shown with options to watch video or visit web page.

import SwiftUI

struct DessertDetails: View {
    let dessert: Dessert
    var body: some View {
        ScrollView {
            //header
            VStack {
                Text(dessert.name).font(.title)
                Text(dessert.origin).font(.subheadline).foregroundColor(Color.gray)
                getImageFromUrl(url: dessert.imageUrl)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding([.leading, .trailing],30)
            }.padding([.top, .bottom], 20)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            
            //recipe section
            VStack {
                Text("Recipe").font(.title2).padding([.top, .bottom], 5)
                Text("Ingredients").font(.title3)
                ForEach(0...dessert.ingredients.count-1, id: \.self) { i in
                    HStack{
                        Text(dessert.ingredients[i] + " (" + dessert.measures[i] + ")").padding(.leading, 20)
                        Spacer()
                    }
                }
                Text("Instructions").font(.title2).padding(.top,5)
                Text(dessert.instructions).padding([.leading, .trailing], 20)
            }.padding([.top, .bottom], 20)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            
            //video & source
            VStack {
                Text("Links")
                    NavigationLink(destination:
                                    WebView(url: "https://www.youtube.com/embed/\(dessert.videoUrl.components(separatedBy: "=")[1])")
                        .navigationBarTitle(Text("Recipe Video"), displayMode: .inline)
                    ){
                        HStack {
                            Image(systemName: "play.rectangle.fill")
                                .foregroundColor(.red)
                                .font(Font.title.weight(.regular))
                            Text("Watch Recipe Video")
                            Spacer()
                        }
                    }.padding(.bottom, 5)
                    .padding(.leading, 20)
                
                
                NavigationLink(destination:
                                WebView(url: dessert.sourceUrl)
                    .navigationBarTitle(Text("Recipe Soruce"), displayMode: .inline)
                ){
                    HStack {
                        Image(systemName: "globe")
                            .foregroundColor(.blue)
                            .font(Font.title.weight(.regular))
                        Text("Source Website")
                        Spacer()
                    }
                }.padding(.leading, 20)
            }.frame(maxWidth:.infinity)
            .padding([.top, .bottom], 20)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            
        }.navigationBarTitle("", displayMode: .inline)
            .padding([.leading, .trailing],20)
    }
}

//struct Prev: PreviewProvider {
//    static var previews: some View {
//        DessertDetails(dessert: Dessert(id: UUID(), dbId: "52897", name: "Carrot Cake", origin: "British", instructions: "For the carrot cake, preheat the oven to 160C/325F/Gas 3. Grease and line a 26cm/10in springform cake tin. Mix all of the ingredients for the carrot cake, except the carrots and walnuts, together in a bowl until well combined. Stir in the carrots and walnuts.Spoon the mixture into the cake tin and bake for 1 hour 15 minutes, or until a skewer inserted into the middle comes out clean. Remove the cake from the oven and set aside to cool for 10 minutes, then carefully remove the cake from the tin and set aside to cool completely on a cooling rack.Meanwhile, for the icing, beat the cream cheese, caster sugar and butter together in a bowl until fluffy. Spread the icing over the top of the cake with a palette knife.", imageUrl: "https://www.themealdb.com/images/media/meals/vrspxv1511722107.jpg", tags: ["Cake","Treat","Sweet"], videoUrl: "https://www.youtube.com/watch?v=asjZ7iTrGKA", ingredients: ["Vegetable Oil","Plain Flour","Bicarbonate Of Soda","Sugar","Eggs","Salt","Cinnamon","Carrots","Walnuts","Cream Cheese","Caster Sugar","Butter"], measures: ["450ml","400g","2 tsp","550ml","5","00bd tsp","2 tsp","500g grated","150g","200g","150g","100g "], sourceUrl: "https://www.bbc.co.uk/food/recipes/classic_carrot_cake_08513"))
//    }
//}
