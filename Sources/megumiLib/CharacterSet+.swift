//
//  CharacterSet+.swift
//  
//
//  Created by 史 翔新 on 2021/09/29.
//

import Foundation

extension CharacterSet {
    
    static var urlAllowed: CharacterSet {
        
        // `CharacterSet.urlQueryAllowed` doesn't contain `"#"` and `"%"` character,
        // which the former is often used in URLs as scrolling ID,
        // and the latter is often used for escaping non-ascii characters.
        return .urlQueryAllowed.union(.init(charactersIn: "#%"))
        
    }
    
}
