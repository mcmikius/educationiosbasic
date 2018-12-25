//
//  DataBaseConnector.swift
//  Planner
//
//  Created by Michail Bondarenko on 12/24/18.
//  Copyright © 2018 Michail Bondarenko. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DataBaseConnector {
    
    var context:NSManagedObjectContext! // контекст для связи объектов с БД
    
    init() {
        // используем AppDelegate для получения доступа к контексту
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                fatalError("appdelegate error")
        }
        // получаем контекст из persistentContainer
        context = appDelegate.persistentContainer.viewContext
    }
    // получает все задачи из таблицы
    func getAllTasks() -> [Task] {
        
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest() // подготовка контейнера для выборки данных
        
        let list:[Task]
        
        do {
            list = try context.fetch(fetchRequest) // выборка данных
        } catch {
            fatalError("Fetching Failed")
        }
        
        return list
        
    }
    
    func addCategory(name:String) -> Category{
        
        let category = Category(context: context) // указываем контекст для объекта
        
        category.name = name
        
        do {
            try context.save() // сохраняем каждый новый объект
        } catch let error as NSError {
            print("Could not save. \(error)")
        }
        
        return category // возвращаем созданную категорию
    }
    
    func addPriority(name:String, index: Int32) -> Priority{
        
        let priority = Priority(context: context) // указываем контекст для объекта
        
        priority.name = name
        priority.index = index
        
        do {
            try context.save() // сохраняем каждый новый объект
        } catch let error as NSError {
            print("Could not save. \(error)")
        }
        
        return priority // возвращаем созданный приоритет
    }
    
    
    func addTask(name:String, completed:Bool, deadline:Date?, info:String?, category:Category?, priority:Priority?) -> Task{ // опциональные типы необязательно передавать
        
        let task = Task(context: context) // указываем контекст для объекта
        
        task.name = name
        task.completed = completed
        task.deadline = deadline
        task.info = info
        task.category = category
        task.priority = priority
        
        do {
            try context.save() // сохраняем каждый новый объект
        } catch let error as NSError {
            print("Could not save. \(error)")
        }
        
        return task // возвращаем созданную задачу
    }
    
    func deleteTask(task: Task) {
        context.delete(task)
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error)")
        }
    }
    
    // нужно запускать только 1 раз
    func initData() {
        // добавляем категорию
        let cat1 = addCategory(name: "Sport")
        let cat2 = addCategory(name: "Family")
        let cat3 = addCategory(name: "Rest")
        
        // добавляем категорию
        let priority1 = addPriority(name: "Low", index:1)
        let priority2 = addPriority(name: "Medium", index:2)
        let priority3 = addPriority(name: "High", index:3)
        
        
        // добавляем задачу с категорием (и пустым приоритетом)
        let task1 = addTask(name: "Go to poll", completed: false, deadline: Date().rewindDays(10), info: "add. info", category: cat1, priority: priority1)
        let task2 = addTask(name: "Go to natural", completed: false, deadline: Date().rewindDays(-5), info: "", category: cat3, priority: priority3)
        let task3 = addTask(name: "Move trash", completed: false, deadline: Date().rewindDays(25), info: "", category: cat1, priority: priority3)
        let task4 = addTask(name: "Buy products", completed: false, deadline: Date().rewindDays(5), info: "add. info", category: cat2, priority: priority1)
        let task5 = addTask(name: "Wish auto", completed: false, deadline: Date().today, info: "", category: cat2, priority: priority1)
        
    }
    
}
