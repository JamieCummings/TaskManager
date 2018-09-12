//
//  Task Manager.swift
//  Task Manager
//
//  Created by Jamie Cummings on 9/12/18.
//  Copyright © 2018 Jamie Cummings. All rights reserved.
//

import Foundation

class taskManager {
    
    fileprivate var taskArray: [Task] = [Task(title: "Laundry", priority: 1), Task(title: "Dishes", priority: 2), Task(title: "Feed Dog", priority: 3)]
    
func addTask(){
    print ("Add a new task:")
   let taskName = getString()
    print("add discription")
    print(" ")
    let taskDescription = getString()
    print("Set priority level. Choose One,Two or Three (One being highest level.)")
    print(" ")
    var taskPriority: Task.priorityLevel!
    let priorityInput = getPriority()
    if priorityInput == "One" {
        taskPriority = .One
    } else if priorityInput == "Two" {
        taskPriority = .Two
    } else if priorityInput == "Three" {
        taskPriority = .Three
    }
    
    
    
    
    
    taskArray.append(Task(title: taskName, description: taskDescription, priority: taskPriority))
        
    print("\n")
    
    for task in taskArray {
        print("\(task.title) : \(task.description) : \(task.priority)")
    }
    print("\n")
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
        for task in taskArray {
            print(task.title)
        }
        print("")
}
func listCompleteTask() -> [Task] {
    var availableTask: [Task] = []
    print("Task that are avaible:")
    for task in taskArray {
        if task.completionStatus == true {
            availableTask.append(task)
            print(task.title)
            
        }
    }
    print("\n")
    return availableTask
}

func listUncompleteTask() -> [Task] {
    
    var unavailableTask: [Task] = []
    
    print("Following task are unavaiable:")
    for task in taskArray {
        if task.completionStatus == false {
            unavailableTask.append(task)
            print(task.title)
            if let completeByDate = task.completeByDate{
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MM/dd/yyyy"
                print(dateFormatter.string(from: completeByDate))
            }
        }
        
    }
    print("\n")
    return unavailableTask
}

    func markTaskComplete(){
        
        let availableTask = listCompleteTask()
        var priority = [Task]()
        
        
    
        print("What task would you like to mark complete?")
        
        var checkList = false
        for task in taskArray {
            if Task.completedTask == true {
                checkList = true
            }
        }
        if !checkList {
            return print("There are no completed task.")
        }
        
        for (i, index) in taskArray.enumerated() {
            if index.completedTask == true {
                
                print("\(i + 1) \(index.title)")
            }
        }
        
        print("\n")
        
        print("Please enter in a number corresponding to the task you want to complete:")
        
        if let input = Int(readLine()!) {
            
            if input > 0 && input < taskArray.count {
                if !taskArray[input - 1].markTaskComplete{
                    return print("This task is complete.")
                } else {
                    
                    taskArray[input - 1].markTaskComplete = false
                    let currentCalendar = Calendar.current
                    let dueDate = currentCalendar.date(byAdding: .day, value: 14, to: Date())
                    taskArray[input - 1].dueDate = dueDate
                    if let dueDate = dueDate{
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "MM/dd/yyyy"
                        print("\(taskArray[input - 1].title) is due on \(dateFormatter.string(from: dueDate))")
                    }
                }
                
            } else {
                print("Invalid Input! Please enter in a number between 1 and \(gameArray.count)")
            }
        } else {
            print("Invalid Input! Please enter in a number between 1 and \(taskArray.count)")
            markTaskComplete()
        }
        
    }
    func checkGameIn(){
        
        print("What game would you like to check in?")
        
        var checkList = false
        for game in gameArray {
            if game.checkedIn == false {
                checkList = true
            }
        }
        if !checkList {
            return print("There are no games available to check in.")
        }
        
        for (i, index) in gameArray.enumerated() {
            if index.checkedIn == false{
                
                print("\(i + 1) \(index.title)")
            }
        }
        
        print("\n")
        
        print("Please enter in a number corresponding to the game you want to check in:")
        
        if let input = Int(readLine()!) {
            
            if input > 0 && input < gameArray.count {
                if gameArray[input - 1].checkedIn {
                    return print("This game is already found in the library.")
                } else {
                    gameArray[input - 1].checkedIn = true
                    gameArray[input - 1].dueDate = nil
                    print("These are available for check out:")
                    print("")
                    for game in gameArray{
                        if game.checkedIn == true {
                            print(game.title)
                        }
                    }
                }
            } else {
                print("Invalid Input! Please enter in a number between 1 and \(gameArray.count) \n")
                checkGameIn()
            }
        } else {
            print("Invalid Input! Please enter in a number between 1 and \(gameArray.count) \n")
            checkGameIn()
        }
    }
}
