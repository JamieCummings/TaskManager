//
//  Task Manager.swift
//  Task Manager
//
//  Created by Jamie Cummings on 9/12/18.
//  Copyright © 2018 Jamie Cummings. All rights reserved.
//

import Foundation

class taskManager {
    
    fileprivate var taskArray: [Task] = [Task(title: "Laundry", description: "Wash whites, colors and bedding", priority: .One), Task(title: "Dishes",description: "Empty dish washer.", priority: .Two), Task(title: "Feed Dog",description: "Only one cup of food and water.", priority: .Three)]
    
    func addTask(){
        print ("Add a new task:")
        let taskName = getString()
        print("add description")
        print(" ")
        let taskDescription = getString()
        print("Set priority level. Choose One,Two or Three (One being highest level.)")
        print(" ")
        var taskPriority: Task.priorityLevel!
        let priorityInput = getPriority().lowercased()
        if priorityInput == "one" {
            taskPriority = .One
        } else if priorityInput == "two" {
            taskPriority = .Two
        } else if priorityInput == "three" {
            taskPriority = .Three
        }
        
        taskArray.append(Task(title: taskName, description: taskDescription, priority: taskPriority))
        
        print("\n")
        
        for task in taskArray {
            print("\(task.title) : \(task.description) : \(task.priority)")
        }
        print("Thank you for adding a task!")
        print("\n")
        sleep(3)
        menu.help()
    }
    
    
    
    
    func removeTask(){
        
        if let removeTask = Int(readLine()!){
            if removeTask > 0 && removeTask < taskArray.count{
                taskArray.remove(at: removeTask - 1)
            } else {
                print("please choose a correct number!")
            }
        } else {
            print("please choose a correct number!")
        }
        print("")
        print("Current Task: \n")
        for (i, index) in taskArray.enumerated() {
            print("\(i + 1) \(index.title)")
        }
        print("Thank you for removing a task!")
        print("\n")
        sleep(3)
        menu.help()
        
    }
    
    
    
    
    func listCompleteTask() -> [Task] {
        var availableTask: [Task] = []
        
        print("Task that are complete:")
        for (i,index) in taskArray.enumerated() {
            if index.completionStatus == true {
                availableTask.append(index)
                print("\(i + 1). \(index.title)")
            }
        }
        print("\n")
        return availableTask
    }
    
    
    
    
    func listAllTask() {
        print("All tasks:")
        for (i, index) in taskArray.enumerated() {
            
            print("\(i + 1) \(index.title)")
        }
        print("")
        print("\n")
        sleep(3)
        menu.help()
    }
    
    
    
    func listIncompleteTask() -> [Task] {
        
        var unavailableTask: [Task] = []
        
        print("Following task are incomplete:")
        for (i,index) in taskArray.enumerated() {
            if index.completionStatus == false {
                unavailableTask.append(index)
                print("\(i + 1). \(index.title)")
            }
        }
        print("\n")
        return unavailableTask
    }
    
    
    
    
    func markTaskComplete(){
        
        print("The following tasks are incomplete: ")
        
        for (i, index) in taskArray.enumerated() {
            if index.completionStatus == false {
                
                print("\(i + 1) \(index.title)")
            }
        }
        print("What task would you like to mark complete?")
        
        if let markTaskComplete = Int(readLine()!){
            if markTaskComplete > 0 && markTaskComplete < taskArray.count{
                taskArray[markTaskComplete - 1].completionStatus = true
            } else {
                print("please choose a correct number!")
            }
        } else {
            print("please choose a correct number!")
        }
        
        var checkList = false
        for task in taskArray {
            if task.completionStatus == false {
                checkList = true
            }
        }
        if !checkList {
            return print("There are no incomplete task.")
        }
        
        print("You completed a task!")
        print("\n")
        sleep(3)
        menu.help()
    }
    
    
    
    
    func markTaskIncomplete(){
        
        for (i, index) in taskArray.enumerated() {
            if index.completionStatus == true {
                
                print("\(i + 1) \(index.title)")
            }
        }
        
        print("What task would you like to mark incomplete?")
        
        var checkList = true
        if let markTaskIncomplete = Int(readLine()!){
            if markTaskIncomplete > 0 && markTaskIncomplete < taskArray.count{
                taskArray[markTaskIncomplete - 1 ].completionStatus = false
            } else {
                print("please choose a correct number!")
            }
        } else {
            print("please choose a correct number!")
        }
        for task in taskArray {
            if task.completionStatus == false{
                checkList = false
            }
        }
        print("Maybe you should complete a task!")
        print("\n")
        sleep(3)
        menu.help()
    }
    
    
    
    // completion date was here
    
    
    
    
    
    
    
}




