//
//  main.swift
//  megumi
//
//  Created by 史　翔新 on 2016/12/02.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Cocoa
import MegumiLib

private let version = "0.1.1"

private func printVersion() {
	
	let versionMessage = version
	print(versionMessage)
	
}

private func printHelp() {
	
	let help = """
		megumi is a URL string encoder.
		Usage:
		$ megumi URL
			encode URL with percentage encoding
		
		$ megumi option
			available options:
			-h / --help: print help
			-v / --version: print version
		"""
	
	print(help)
	
}

private func printError() {
	
	let errorMessage = "Invalid arguments. Please enter -h to get help.\n"
	print(errorMessage)
	
}

private func printResult(_ result: String) {
	
	print(result)
	
}

func parseCommand() {
	
	let arguments = Array(CommandLine.arguments.dropFirst())
	guard arguments.count == 1 else {
		printError()
		return
	}
	
	let argument = arguments[0]
	
	switch argument {
	case "-h", "--help":
		printHelp()
		
	case "-v", "--version":
		printVersion()
		
	default:
		do {
            let encodedURLString = try argument.encodedURLString()
			printResult(encodedURLString)
            NSPasteboard.general.addString(encodedURLString)
			
		} catch {
			printError()
		}
		
	}
	
}

parseCommand()
