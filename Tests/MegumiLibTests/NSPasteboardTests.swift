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
        
        // According to Apple official document, it's required to clear exist pasteboard contents,
        // so `pasteboardItems?.count` should only be `0` if nothing exists, or `1` if any item exists.
        // https://developer.apple.com/documentation/appkit/nspasteboard/1533599-clearcontents#discussion
        pasteboard.addString("def")
        XCTAssertEqual(pasteboard.pasteboardItems?.count, 1)
        XCTAssertEqual(pasteboard.pasteboardItems?.first?.string(forType: .string), "def")
        
        pasteboard.releaseGlobally()
        
    }
    
}
