//
//  PagseguroTestTests.swift
//  PagseguroTestTests
//
//  Created by Diogo Costa on 01/02/19.
//  Copyright © 2019 Diogo Costa. All rights reserved.
//

import XCTest
@testable import PagseguroTest

class BeerTests : XCTestCase {
    var beerArrayMockData: Data {
        let beerJson = ["id":192,"name":"Punk IPA 2007 - 2010","tagline":"Post Modern Classic. Spiky. Tropical. Hoppy.","first_brewed":"04/2007","description":"Our flagship beer that kick started the craft beer revolution. This is James and Martin's original take on an American IPA, subverted with punchy New Zealand hops. Layered with new world hops to create an all-out riot of grapefruit, pineapple and lychee before a spiky, mouth-puckering bitter finish.","image_url":"https://images.punkapi.com/v2/192.png","abv":6.0,"ibu":60.0,"target_fg":1010.0,"target_og":1056.0,"ebc":17.0,"srm":8.5,"ph":4.4,"attenuation_level":82.14,"volume":["value":20,"unit":"liters"],"boil_volume":["value":25,"unit":"liters"],"method":["mash_temp":[["temp":["value":65,"unit":"celsius"],"duration":75]],"fermentation":["temp":["value":19.0,"unit":"celsius"]],"twist":nil],"ingredients":["malt":[["name":"Extra Pale","amount":["value":5.3,"unit":"kilograms"]]],"hops":[["name":"Ahtanum","amount":["value":17.5,"unit":"grams"],"add":"start","attribute":"bitter"],["name":"Chinook","amount":["value":15,"unit":"grams"],"add":"start","attribute":"bitter"]],"yeast":"Wyeast 1056 - American Ale™"],"food_pairing":["Spicy carne asada with a pico de gallo sauce","Shredded chicken tacos with a mango chilli lime salsa","Cheesecake with a passion fruit swirl sauce"],"brewers_tips":"While it may surprise you, this version of Punk IPA isn't dry hopped but still packs a punch! To make the best of the aroma hops make sure they are fully submerged and add them just before knock out for an intense hop hit.","contributed_by":"Sam Mason <samjbmason>"] as [String: Any]
        let array = [beerJson]
        let data = try! JSONSerialization.data(withJSONObject: array, options: .prettyPrinted)
        return data
    }
    
    func testParseBeers() {
        let service = BeerServices()
        let beerData = beerArrayMockData
        let beers = service.parseBeerResponse(beerData)
        XCTAssertNotNil(beers)
        XCTAssertEqual(beers?.count, 1)
        dump(beers)
        let beer = beers?.first
        XCTAssertEqual(beer?.name, "Punk IPA 2007 - 2010")
    }
    
    func testBeerViewModel() {
        let beerMock = Beer(name: "Awesome beer", imageUrl: "http://someUrl", description: "description", tagline: "tagline", abv: 10, ibu: 20)
        XCTAssertNotNil(beerMock)
        let beerViewModel = BeerViewModel(beer: beerMock)
        XCTAssertNotNil(beerViewModel)
        XCTAssertEqual(beerViewModel.nameText, "Awesome beer")
        XCTAssertEqual(beerViewModel.pictureUrl, URL(string: "http://someUrl"))
        XCTAssertEqual(beerViewModel.descriptionText, "description")
    }
        
    func testGetBeers() {
        let testExpectation = expectation(description: "Test getting Beers")
        
        let beerServices = BeerServices()
        beerServices.getBeers { (error, beerList) in
            dump(beerList)
            XCTAssert(error == nil)
            XCTAssert(beerList.count > 0)
            testExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 20.0, handler: nil)
    }
}
