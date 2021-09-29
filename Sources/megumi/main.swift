//
//  main.swift
//  megumi
//
//  Created by 史　翔新 on 2016/12/02.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Cocoa
import MegumiLib
import ArgumentParser

struct Megumi: ParsableCommand {
    
    @Argument(help: "The URL String to encode.")
    var urlString: String
    
    @Flag(help: "Don't copy the result to pasteboard")
    var noCopy: Bool = false
    
    private var shouldCopyToPasteboard: Bool {
        !noCopy
    }
    
    mutating func run() throws {
        
        let encoded = try urlString.encodedURLString()
        print(encoded)
        
        if shouldCopyToPasteboard {
            NSPasteboard.general.addString(encoded)
            print("Result has been copied to your clipboard. You can use cmd + v to paste it.")
        }
        
    }
    
}

Megumi.main()
