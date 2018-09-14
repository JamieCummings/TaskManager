//
//  Utilities .swift
//  Task Manager
//
//  Created by Jamie Cummings on 9/12/18.
//  Copyright © 2018 Jamie Cummings. All rights reserved.
//

import Foundation



func getString() -> String {
    var input: String? = nil
    repeat {
        let line = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if line != " " {
            input = line
        } else {
            print("Invalid input")
        }
    } while input == nil
    
    return input!
}

func getPriority() -> String {
    var input: String? = nil
    repeat {
        let line = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if line.lowercased() == "one" || line.lowercased() == "two" || line.lowercased() == "three"  {
            input = line
        } else {
            print("Invalid input")
        }
    } while input == nil
    
    return input!
    
}

