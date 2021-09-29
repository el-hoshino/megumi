//
//  NSPasteboardTests.swift
//  
//
//  Created by 史 翔新 on 2021/09/29.
//

import XCTest
@testable import MegumiLib

final class NSPasteboardTests: XCTestCase {
    
    func test_addString() {
        
        let pasteboard = NSPasteboard.withUniqueName()
        XCTAssert(pasteboard.pasteboardItems?.isEmpty ?? true)
        
        pasteboard.addString("abc")
        XCTAssertEqual(pasteboard.pasteboardItems?.count, 1)
        XCTAssertEqual(pasteboard.pasteboardItems?.first?.string(forType: .string), "abc")
        
        pasteboard.releaseGlobally()
        
    }
    
}
