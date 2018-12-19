//
//  Task.swift
//  Planner
//
//  Created by Michail Bondarenko on 12/18/18.
//  Copyright © 2018 Michail Bondarenko. All rights reserved.
//

import Foundation



class Task{
    
    var name:String = "Task"
    var category:String?
    var deadline:Date?
    var priority:String?
    
    init(name:String, priority:String){
        self.name = name
        self.priority = priority
    }
    init(name:String, category:String, deadline:Date){
        self.name = name
        self.category = category
        self.deadline = deadline
    }
    init(name:String, category:String, priority:String, deadline:Date){
        self.name = name
        self.category = category
        self.priority = priority
        self.deadline = deadline
    }
    init(name:String, category:String){
        self.name = name
        self.category = category
    }
    
    init(name:String){
        self.name = name
    }
    
}
