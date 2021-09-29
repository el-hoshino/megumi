//
//  CharacterSet+.swift
//  
//
//  Created by 史 翔新 on 2021/09/29.
//

import Foundation

extension CharacterSet {
    
    static var urlAllowed: CharacterSet {
        
        // `CharacterSet.urlQueryAllowed` doesn't contain `"#"` character, which is often used in URLs as scrolling ID
        return .urlQueryAllowed.union(.init(charactersIn: "#"))
        
    }
    
}
