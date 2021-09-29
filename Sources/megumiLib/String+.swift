//
//  String+.swift
//  
//
//  Created by 史 翔新 on 2021/09/29.
//

import Foundation

extension String {
    
    public func encodedURLString() throws -> String {
        
        enum Error: Swift.Error {
            case unableToGetEncodedString(originalString: String)
        }
        
        guard let encodedString = addingPercentEncoding(withAllowedCharacters: .urlAllowed) else {
            throw Error.unableToGetEncodedString(originalString: self)
        }
        
        return encodedString
        
    }
    
}
