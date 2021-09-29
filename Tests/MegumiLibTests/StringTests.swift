//
//  StringTests.swift
//  
//
//  Created by 史 翔新 on 2021/09/29.
//

import XCTest
@testable import MegumiLib

final class StringTests: XCTestCase {
    
    func test_encodedURLString() throws {
        
        let givenURLString = "https://ja.wikipedia.org/wiki/ウィキペディア#概要"
        let expectedEncodedURLString = "https://ja.wikipedia.org/wiki/%E3%82%A6%E3%82%A3%E3%82%AD%E3%83%9A%E3%83%87%E3%82%A3%E3%82%A2#%E6%A6%82%E8%A6%81"
        
        XCTAssertEqual(try givenURLString.encodedURLString(), expectedEncodedURLString)
        
    }
    
}
