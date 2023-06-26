//
//  ApiTests.swift
//  DessertsTests
//
//  Created by Bryce Cullen on 6/26/23.
//

import XCTest

final class ApiTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let dessert1 = Dessert(id: UUID(), dbId: "52897", name: "Carrot Cake", origin: "British", instructions: "For the carrot cake, preheat the oven to 160C/325F/Gas 3. Grease and line a 26cm/10in springform cake tin. Mix all of the ingredients for the carrot cake, except the carrots and walnuts, together in a bowl until well combined. Stir in the carrots and walnuts.Spoon the mixture into the cake tin and bake for 1 hour 15 minutes, or until a skewer inserted into the middle comes out clean. Remove the cake from the oven and set aside to cool for 10 minutes, then carefully remove the cake from the tin and set aside to cool completely on a cooling rack.Meanwhile, for the icing, beat the cream cheese, caster sugar and butter together in a bowl until fluffy. Spread the icing over the top of the cake with a palette knife.", imageUrl: "https://www.themealdb.com/images/media/meals/vrspxv1511722107.jpg", tags: ["Cake","Treat","Sweet"], videoUrl: "https://www.youtube.com/watch?v=asjZ7iTrGKA", ingredients: ["Vegetable Oil","Plain Flour","Bicarbonate Of Soda","Sugar","Eggs","Salt","Cinnamon","Carrots","Walnuts","Cream Cheese","Caster Sugar","Butter"], measures: ["450ml","400g","2 tsp","550ml","5","00bd tsp","2 tsp","500g grated","150g","200g","150g","100g "], sourceUrl: "https://www.bbc.co.uk/food/recipes/classic_carrot_cake_08513")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
