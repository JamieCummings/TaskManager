//
//  Menu.swift
//  Task Manager
//
//  Created by Jamie Cummings on 9/12/18.
//  Copyright © 2018 Jamie Cummings. All rights reserved.
//

import Foundation
// this class holds the menu
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
    func help() {
        print("""
            Menu
            1. Add Task
            2. Remove Task
            3. List All Task
            4. List Comleted Task
            5. List Incompleted Tasks
            6. Mark Task Complete
            7. Mark Task Incomplete
            8. Help
            9. Quit
            
            """)
        print("Please enter a number from the Menu:\n")
    }
    
// this func hadles the input for the menu
    func handleInput(_ input: String) {
        switch input {
        case "1":
            
            TaskManager.addTask()
            
        case "2":
            TaskManager.removeTask()
            
        case "3":
            TaskManager.listAllTask()
            
        case "4":
            TaskManager.listCompleteTask()
           
        case "5":
            TaskManager.listIncompleteTask()
            
        case "6":
            TaskManager.markTaskComplete()
            
        case "7":
            TaskManager.markTaskIncomplete()
        case "8":
            help()
        case "9":
            quit()
    
            
    
        default:
            break
        }
    }
// this func will quit the app
    func quit() {
        shouldQuit = true
        print("Thanks for using the video game library")
    }
// func validate input for the menu
    func validateInput (_ input: String) -> Bool {
        let menuOptions = Array(1...8)
        
        guard let number = Int(input) else { return false }
        
        return menuOptions.contains(number)
    }
// func get input for the menu
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
