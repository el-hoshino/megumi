//
//  main.swift
//  megumi
//
//  Created by 史　翔新 on 2016/12/02.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Cocoa

private extension CharacterSet {
	static func + (lhs: CharacterSet, rhs: CharacterSet) -> CharacterSet {
		return lhs.union(rhs)
	}
}

private let urlAllowed: CharacterSet = {
	let urlQuery = CharacterSet.urlQueryAllowed
	let urlSymbols = CharacterSet.init(charactersIn: ":/?&#")
	return urlQuery + urlSymbols
}()

private func printHelp() {
	
	let help = """
		megumi is a URL string encoder.
		Usage:
		megumi URL
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

private func getEncodedURLString(from string: String) throws -> String {
	
	enum Error: Swift.Error {
		case UnableToGetEncodedString(originalString: String)
	}
	
	guard let encodedString = string.addingPercentEncoding(withAllowedCharacters: urlAllowed) else {
		throw Error.UnableToGetEncodedString(originalString: string)
	}
	
	return encodedString
	
}

private func copyStringToPasteboard(string: String) {
	
	let board = NSPasteboard.general
	board.clearContents()
	
	let item = NSPasteboardItem()
	item.setString(string, forType: .string)
	board.writeObjects([item])
	
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
		
	default:
		do {
			let encodedURLString = try getEncodedURLString(from: argument)
			printResult(encodedURLString)
			copyStringToPasteboard(string: encodedURLString)
			
		} catch {
			printError()
		}
		
	}
	
}

parseCommand()
