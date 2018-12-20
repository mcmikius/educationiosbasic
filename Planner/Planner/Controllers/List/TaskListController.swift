//
//  TaskListController.swift
//  Planner
//
//  Created by Michail Bondarenko on 12/18/18.
//  Copyright © 2018 Michail Bondarenko. All rights reserved.
//

import UIKit

class TaskListController: UITableViewController {
    
    let dateFormatter = DateFormatter()
    
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
