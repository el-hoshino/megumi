//
//  File.swift
//  
//
//  Created by 史 翔新 on 2021/09/29.
//

import Cocoa

extension NSPasteboard {
    
    public func addString(_ string: String) {
        
        // Ref: https://developer.apple.com/documentation/appkit/nspasteboard/1533599-clearcontents#discussion
        clearContents()
        
        guard setString(string, forType: .string) else {
            print("Failed to copy item to pasteboard.")
            exit(EXIT_FAILURE)
        }
        
    }
    
}
