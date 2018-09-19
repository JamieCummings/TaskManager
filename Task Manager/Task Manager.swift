//
//  Task Manager.swift
//  Task Manager
//
//  Created by Jamie Cummings on 9/12/18.
//  Copyright © 2018 Jamie Cummings. All rights reserved.
//

import Foundation
// the taskManager handles all the functions for the task
class taskManager {
    
    var taskArray: [Task] = [Task(title: "Laundry", description: "Wash whites, colors and bedding", priority: .One), Task(title: "Dishes",description: "Empty dish washer.", priority: .Two), Task(title: "Feed Dog",description: "Only one cup of food and water.", priority: .Three)]
    
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
        
        if taskPriority == .One {
            print ("you have 2 days to complete the task.")
        }
        if taskPriority == .Two {
            print ("you have 5 days to complete the task.")
        }
        if taskPriority == .Three{
            print ("you have 7 days to complete the task.")
        }
        
        taskArray.append(Task(title: taskName, description: taskDescription, priority: taskPriority))
        
        print("\n")
        let SortPriority = sortPriority(tasks: taskArray)
        for task in SortPriority {
            print("\(task.title) : \(task.description) : \(task.priority)")
        }
        print("Thank you for adding a task!")
        print("\n")
        sleep(3)
        menu.help()
    }
    
// func to remove a task
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
        let SortPriority = sortPriority(tasks: taskArray)
        for (i, index) in SortPriority.enumerated() {
            print("\(i + 1) \(index.title)")
        }
        print("Thank you for removing a task!")
        print("\n")
        sleep(3)
        menu.help()
        
    }
    
    
    
// func to list all complete task
    func listCompleteTask() -> [Task] {
        var availableTask: [Task] = []
        
        print("Task that are complete:")
        let SortPriority = sortPriority(tasks: taskArray)
        for (i,index) in SortPriority.enumerated() {
            if index.completionStatus == true {
                availableTask.append(index)
                print("\(i + 1). \(index.title)")
            }
        }
        print("\n")
        return availableTask
    }
    
    
    
// func to list all task
    func listAllTask() {
        print("All tasks:")
        let SortPriority = sortPriority(tasks: taskArray)
        for (i, index) in SortPriority.enumerated() {
            
            print("\(i + 1) \(index.title)")
        }
        print("")
        print("\n")
        sleep(3)
        menu.help()
    }
    
    
// func to list incomplete task
    func listIncompleteTask() {
        
        var unavailableTask: [Task] = []
        
        print("Following task are incomplete:")
        let SortPriority = sortPriority(tasks: taskArray)
        for (i,index) in SortPriority.enumerated() {
            if index.completionStatus == false {
                unavailableTask.append(index)
                print("\(i + 1). \(index.title)")
            }
        }
        print("\n")
        
    }
    
    
    
// func to mark task complete
    func markTaskComplete(){
        
        print("The following tasks are incomplete: ")
        
        let SortPriority = sortPriority(tasks: taskArray)
        for (i, index) in SortPriority.enumerated() {
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
    
    
    
// func to mark task incomplete
    func markTaskIncomplete(){
        
        let SortPriority = sortPriority(tasks: taskArray)
        for (i, index) in SortPriority.enumerated() {
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
    
    
    
}




