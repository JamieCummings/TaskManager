//
//  Menu.swift
//  Task Manager
//
//  Created by Jamie Cummings on 9/12/18.
//  Copyright © 2018 Jamie Cummings. All rights reserved.
//

import Foundation

class Menu {
    
    var shouldQuit = false
    
    let TaskManager = taskManager()
    
    func go() {
        help()
        
        repeat{
            var input = getInput()
            
            while validateInput(input) == false {
                print("Invalid input")
                input = getInput()
            }
            handleInput(input)
            
        } while !shouldQuit
    }
    func help () {
        print("""
            Menu
            1. Add Task
            2. Remove Task
            3. List All Task
            4. List Comleted Task
            5. List Incompleted Tasks
            6. Mark Task Complete
            7. Mark Task Incomplete
            8. Give Completion Date
            9. Help
            10. Quit
            
            """)
        print("Please enter a number from the Menu:\n")
    }
    
    
    func handleInput(_ input: String) {
        switch input {
        case "1":
            
            TaskManager.addTask()
            help()
        case "2":
            TaskManager.removeTask()
            help()
        case "3":
            TaskManager.listAllTask()
            help()
        case "4":
            TaskManager.listCompleteTask()
            help()
        case "5":
            TaskManager.listIncompleteTask()
            help()
        case "6":
            TaskManager.markTaskComplete()
            help()
        case "7":
            TaskManager.markTaskIncomplete()
            help()
        //case "8":
            //TaskManager.completionDate()
            //quit()
        default:
            break
        }
    }
    
    func quit() {
        shouldQuit = true
        print("Thanks for using the video game library")
    }
    
    func validateInput (_ input: String) -> Bool {
        let menuOptions = Array(1...8)
        
        guard let number = Int(input) else { return false }
        
        return menuOptions.contains(number)
    }
    
    func getInput () -> String {
        var input: String? = nil
        repeat {
            let line = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            if line != "" {
                input = line
            } else {
                print("Invalid input")
            }
        } while input == nil
        
        return input!
    }
}
