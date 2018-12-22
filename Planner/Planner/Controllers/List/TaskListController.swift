//
//  TaskListController.swift
//  Planner
//
//  Created by Michail Bondarenko on 12/18/18.
//  Copyright © 2018 Michail Bondarenko. All rights reserved.
//

import UIKit
import CoreData

class TaskListController: UITableViewController {
    
    let dateFormatter = DateFormatter()
    
    var context:NSManagedObjectContext! // for conect with DB
    
    //the temporary array for test data
    
    /*
    private var taskList:[Task] = [
        Task(name:"Task 1", category:"Category1"),
        Task(name:"Task 2", category:"Category2"),
        Task(name:"Task 3", category:"Category3", priority:"High", deadline: Date()),
        Task(name:"Task 4", category:"Category4", deadline: Date()),
        Task(name:"Task 5", category:"Category5"),
        Task(name:"Task 6", category:"Category6")
    ]
 */

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        // for conect with context
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("appDelegate error")
            
        }
        // get context from persistent container
        context = appDelegate.persistentContainer.viewContext
        
        //add category
        let cat1 = addCategory(name: "Sport")
        let cat2 = addCategory(name: "Family")
        let cat3 = addCategory(name: "Rest")
        
        //add priority
        let priority1 = addPriority(name: "Low", index: 1)
        let priority2 = addPriority(name: "Medium", index: 2)
        let priority3 = addPriority(name: "High", index: 3)
        
        //add task with category and empty priority
        let task1 = addTask(name: "Go to poll", completed: false, deadline: Date(), info: "add info", category: cat1, priority: priority1)
        let task2 = addTask(name: "Go to natural", completed: false, deadline: Date(), info: "add info", category: cat2, priority: nil)
        let task3 = addTask(name: "Wish auto", completed: false, deadline: Date(), info: "add info", category: cat1, priority: priority2)
        let task4 = addTask(name: "Move to trash", completed: false, deadline: Date(), info: "add info", category: cat3, priority: priority1)
        let task5 = addTask(name: "Go to football", completed: false, deadline: Date(), info: "add info", category: cat1, priority: priority3)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func addCategory(name: String) -> Category {
        let category = Category(context: context)
        category.name = name
        
        do {
            try context.save() // save each new object
        } catch let error as NSError {
            print("Could not save. \(error)")
        }
        return category //return saved category
    }
    
    func addPriority(name: String, index: Int32) -> Priority {
        let priority = Priority(context: context)
        priority.name = name
        priority.index = index
        
        do {
            try context.save() // save each new object
        } catch let error as NSError {
            print("Could not save. \(error)")
        }
        return priority //return saved category
    }
    
    func addTask(name: String, completed: Bool, deadline: Date?, info: String?, category: Category?, priority: Priority?) -> Task {
        
        let task = Task(context: context)
        
        task.name = name
        task.completed = completed
        task.deadline = deadline
        task.info = info
        task.category = category
        task.priority = priority
        
        do {
            try context.save() // save each new object
        } catch let error as NSError {
            print("Could not save. \(error)")
        }
        return task
    }

    // MARK: - Table view data source
    
    //auto methods of TableView

    //numbers of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //numbers of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    //show data in a row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "testCell", for: indexPath) as? TaskListCell else {
            fatalError("cell type")
        }
        /*
        let task = taskList[indexPath.row]
        
        cell.labelTaskName.text = task.name   // + " " + (task.priority ?? "") // from array get value by index and view 'name'
        cell.labelTaskCategory.text = (task.category ?? "")
        
        if let deadline = task.deadline{
            cell.labelDeadline?.text = dateFormatter.string(from: deadline) // from array get value by index and view 'category'
        } else {
            cell.labelDeadline?.text = ""
        }
        */
        /*
        // check the date on the void
        if let deadline = task.deadline{
            cell.detailTextLabel?.text = (task.category ?? "") + " " + dateFormatter.string(from: deadline) // from array get value by index and view 'category'
        } else {
            cell.detailTextLabel?.text = task.category
        }
       */

        return cell
    }
    /*
    //name for each section
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section" + String(section + 1)
    }
    
    
    //height each section
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
 */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
