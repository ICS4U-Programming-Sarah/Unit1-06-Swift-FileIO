// This program reads information from line, 
// it then calculates sum & displays any errors.

//
//  Created by Sarah Andrew

//  Created on 2023-03-04

//  Version 1.0

//  Copyright (c) 2023 Sarah. All rights reserved.
import Foundation

// Define input & output paths.
let inputFile = "input.txt"
let outputFile = "output.txt"

// Usage of file handle method to locate files,
// as well as opening input for file reading.
// Usage of file handle method to locate files,
// as well as opening input for file reading.
do {
    // Open input file for reading.
    guard let input = FileHandle(forReadingAtPath: inputFile) else {
        print("Error: cannot access input file for opening.")
        exit(1)
    }

    // Open output file for writing.
    guard let output = FileHandle(forWritingAtPath: outputFile) else {
        print("Error: cannot access output file for opening.")
        exit(1)
    }
    // Read context for file.
    let inputData = input.readDataToEndOfFile()

    // Convert data to a string.
    guard let inputString = String(data: inputData, encoding: .utf8) else {
        print("Error: Cannot convert input data to string.")
        exit(1)
    }

    // Split string into lines, ensuring reading empty line.
    let inputLines = inputString.components(separatedBy: .newlines)

    // Loop through each line in the input file.
    for inputLine in inputLines {
        // In the case of an empty line,
        // display sum is 0.
        if inputLine.isEmpty {
            let data = Data("Integers not detected.\n".utf8)
            output.write(data)
            continue
        }

        // Split line into an array of strings.
        let arrayOfStrings = inputLine.split(separator: " ")

        // Initialize variables.
        var sum = 0

        // Loop through each string in the array.
        for elementStr in arrayOfStrings {
            // Convert from string to int.
            if let elementInt = Int(elementStr) {
                // Calculate sum.
                sum = sum + elementInt
            } else {
                // Display possible errors.
                let data = Data("Please enter a valid input.\n".utf8)
                output.write(data)
            }
        }

        // Display sum to user.
        let data = Data("The sum of numbers is: \(sum)\n".utf8)
        output.write(data)
    }

    // Close input & output file.
    input.closeFile()
    output.closeFile()

}
