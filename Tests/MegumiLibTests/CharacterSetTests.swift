import XCTest
@testable import MegumiLib

final class CharacterSetTests: XCTestCase {
    
    func test_urlAllowed() throws {
        
        XCTContext.runActivity(named: "Make sure CharacterSet.urlAllowed is equal to CharacterSet.urlQueryAllowed + `#` + `%`") { _ in
            XCTAssertNotEqual(CharacterSet.urlAllowed, CharacterSet.urlQueryAllowed)
            XCTAssertEqual(CharacterSet.urlAllowed, CharacterSet.urlQueryAllowed.union(.init(charactersIn: "#%")))
        }
        
        XCTContext.runActivity(named: "Make sure CharacterSet.urlAllowed contains all characters needed to represent a url") { _ in
            let givenURLString = "https://ja.wikipedia.org/wiki/%E3%82%A6%E3%82%A3%E3%82%AD%E3%83%9A%E3%83%87%E3%82%A3%E3%82%A2#%E6%A6%82%E8%A6%81"
            for scalar in givenURLString.unicodeScalars {
                XCTAssert(CharacterSet.urlAllowed.contains(scalar))
            }
        }
        
    }
    
}
