//
//  Tests.swift
//  Tests
//
//  Created by Bryce Cullen on 6/26/23.
//
// Contains tests for API query.

import XCTest
@testable import Desserts

final class Tests: XCTestCase {

    override func setUpWithError() throws {
        desserts = []
        foodIds = []
    }
    
    //test that calling getFoodIds returns an array of the food ids from api
    func testApiIds() throws {
        getFoodIds() //Should query API and create an array of IDs
        XCTAssertTrue(!foodIds.isEmpty) //assert foodIds is filled
        XCTAssertEqual("53049", foodIds[0])//assert first spot is first dessert from api
        XCTAssertTrue(foodIds.count == 64, "Count should be 64, count is: \(foodIds.count)")

    }
    
    //test that calling id api endpoint creates a valid Dessert struct
    func testApiStruct() throws {
        foodIds = ["53049"] //run just one API query
        getFoodsFromApi() //getFoodsFromApi will loop through foodIds and make a Dessert struct for each one.
        XCTAssertTrue(desserts.count == 1, "Count should be one, count is: \(desserts.count)")
        XCTAssertEqual(desserts[0].name, "Apam balik", "Verify name is as expected. Expected: Apam balik, Got: \(desserts[0].name)") //Verify fields set correctly in struct
        XCTAssertTrue(desserts[0].ingredients.count == 9, "Ingredient Count Should be 9. Is: \(desserts[0].ingredients.count)") //Verify ingredients array correct length
        XCTAssertEqual(desserts[0].ingredients.count, desserts[0].measures.count) //Verify ingredients and measures arrays equal length
    }
        

}
