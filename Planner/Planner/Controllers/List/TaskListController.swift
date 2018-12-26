
import UIKit
import CoreData

class TaskListController: UITableViewController {
    
    let dateFormatter = DateFormatter()
    
    let dataBaseConnector = DataBaseConnector()
    
    var taskList:[Task]! // коллекция, которая будет заполняться из БД
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        //
        //        // симулятор загрузки формы (чтобы успеть посмотреть launchscreen) - в рабочем проекте естественно нужно будет удалить
        //        for i in 0...200000 {
        //            print(i)
        //        }

        //dataBaseConnector.initData()// запускаем только 1 раз для заполнения таблиц
        
        taskList = dataBaseConnector.getAllTasks()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: tableView
    
    // методы вызываются автоматически компонентом tableView
    
    // сколько секций нужно отображать в таблице
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // сколько будет записей в каждой секции
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }
    
    
    
    // отображение данных в строке
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellTask", for: indexPath) as? TaskListCell else{
            fatalError("cell type")
        }
        
        let task = taskList[indexPath.row]
        
        cell.labelTaskName.text = task.name
        cell.labelTaskCategory.text = (task.category?.name ?? "")
        
        if let priority = task.priority{
            
            switch priority.index{
            case 1:
                cell.labelPriority.backgroundColor = UIColor(named: "low")
            case 2:
                cell.labelPriority.backgroundColor = UIColor(named: "medium")
            case 3:
                cell.labelPriority.backgroundColor = UIColor(named: "high")
            default:
                cell.labelPriority.backgroundColor = UIColor.white
            }
        } else {
                cell.labelPriority.backgroundColor = UIColor.white
            }
        
        cell.labelDeadline.textColor = .lightGray
        
        // view note icon
        if task.info == nil || (task.info?.isEmpty)!{
            cell.buttonTaskinfo.isHidden = true
        }else{
            cell.buttonTaskinfo.isHidden = false
        }
        
        if let diff = task.daysLeft(){
            
            switch diff {
            case 0:
                cell.labelDeadline.text = "Today"
            case 1:
                cell.labelDeadline.text = "Tomorrow"
            case 0...:
                cell.labelDeadline.text = "\(diff) days"
            case ..<0:
                cell.labelDeadline.textColor = .red
                cell.labelDeadline.text = "\(diff) days"
            default:
                cell.labelDeadline.text = ""
            }
            
        }else{
            cell.labelDeadline.text = ""
        }
        return cell
    }
        
        
        // проверяем дату на пустоту
        /*
 if let deadline = task.deadline{
            cell.labelDeadline?.text = dateFormatter.string(from: deadline)
        }else {
            cell.labelDeadline?.text =  ""
        }
        
        return cell
    }
    */
        
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            dataBaseConnector.deleteTask(task: taskList[indexPath.row])
            taskList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .top)
        } else if editingStyle == .insert {
            
        }
        
    }
    
    
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
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
