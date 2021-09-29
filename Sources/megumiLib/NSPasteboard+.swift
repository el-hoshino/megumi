//
//  File.swift
//  
//
//  Created by 史 翔新 on 2021/09/29.
//

import Cocoa

extension NSPasteboard {
    
    public func addString(_ string: String) {
        
        let item = NSPasteboardItem()
        item.setString(string, forType: .string)
        writeObjects([item])
        
    }
    
}
