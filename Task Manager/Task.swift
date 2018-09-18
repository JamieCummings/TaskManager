//
//  Task.swift
//  Task Manager
//
//  Created by Jamie Cummings on 9/12/18.
//  Copyright © 2018 Jamie Cummings. All rights reserved.
//

import Foundation




class Task{
    // this is the data modle that represents our Games that will be stored in the library.

        var title: String
        let description: String
    var completionStatus: Bool
        var priority: priorityLevel
    enum priorityLevel: Int {
        case One = 1
        case Two
        case Three
    }
        var completeByDate: Date?
    
        
    init(title:String, description: String, priority: priorityLevel) {
            self.title = title
            self.priority = priority
            self.description = description
            self.completionStatus = false
            
            
        }
}
    



