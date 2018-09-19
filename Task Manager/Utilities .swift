//
//  Utilities .swift
//  Task Manager
//
//  Created by Jamie Cummings on 9/12/18.
//  Copyright © 2018 Jamie Cummings. All rights reserved.
//

import Foundation

// the utilities file holds some funcs that will be called upon in the task manager.
// the func get string is being used in task manager, by having it in this file this code wont have to type this out each time its needed.
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

// the func gets the priority is being used in task manager, by having it in this file this code wont have to type this out each time its needed.
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
// this func sorts priority 
func sortPriority(tasks: [Task]) -> [Task] {
    return tasks.sorted(by: { (task1, task2) -> Bool in
        
        return task1.priority.rawValue < task2.priority.rawValue
    })
} 


