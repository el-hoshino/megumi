//
//  main.swift
//  megumi
//
//  Created by 史　翔新 on 2016/12/02.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Cocoa

private func printHelp() {
	
	let help =
		"megumi is a URL string encoder.\n" +
			"\n" +
			"Usage:\n" +
	"\t$ megumi URL\n"
	
	print(help)
	
}

private func printError() {
	
	let errorMessage = "Invalid arguments. Please enter -h to get help.\n"
	print(errorMessage)
	
}

private func printResult(_ result: String) {
	
	print(result)
	
}

private func getEncodedURLString(from string: String) throws -> String {
	
	enum Error: Swift.Error {
		case UnableToGetEncodedString(originalString: String)
	}
	
	guard let encodedString = string.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
		throw Error.UnableToGetEncodedString(originalString: string)
	}
	
	return encodedString
	
}

private func copyStringToPasteboard(string: String) {
	
	let board = NSPasteboard.general()
	board.clearContents()
	
	let item = NSPasteboardItem()
	item.setString(string, forType: NSPasteboardTypeString)
	board.writeObjects([item])
	
}

func parseCommand() {
	
	let arguments = Array(CommandLine.arguments.dropFirst())
	guard arguments.count == 1 else {
		printError()
		return
	}
	
	let originalURLString = arguments[0]
	let encodedURLString = (try? getEncodedURLString(from: originalURLString)) ?? originalURLString
	
	printResult(encodedURLString)
	
	copyStringToPasteboard(string: encodedURLString)
	
}

parseCommand()
