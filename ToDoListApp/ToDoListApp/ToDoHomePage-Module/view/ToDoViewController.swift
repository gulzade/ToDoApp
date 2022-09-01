//
//  ToDoViewController.swift
//  ToDoListApp
//
//  Created by Gülzade Karataş on 1.09.2022.
//

import UIKit

class ToDoViewController: UIViewController {
    @IBOutlet weak var searcBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var toDoList = [ToDo]()
    var homePagePresenterObject: ViewToPresenterToDoHomePageProtocol?
    var colorArray = [UIColor]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searcBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
               self.colorArray = [
                   UIColor(red: 205/255, green: 145/255, blue: 158/255, alpha: 1.0),
                   UIColor(red: 255/255, green: 187/255, blue: 255/255, alpha: 1.0),
                   UIColor(red: 219/255, green: 112/255, blue: 147/255, alpha: 1.0),
                   UIColor(red: 255/255, green: 181/255, blue: 197/255, alpha: 1.0),
                   UIColor(red: 205/255, green: 105/255, blue:201/255, alpha: 1.0),
                   UIColor(red: 238/255, green: 169/255, blue: 184/255, alpha: 1.0),
                 
               ]
        copyDatabase()
        
        ToDoHomePageRouter.createModule(ref: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        homePagePresenterObject?.toDoUplaod()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let toDo = sender as? ToDo {
                let targetVC = segue.destination as! UpdateToDoVC
                targetVC.toDo = toDo
            }
        }
    }
    
    func copyDatabase(){
        let bundlePath = Bundle.main.path(forResource: "ToDoListDatabase", ofType: ".sqlite")
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let pathToCopy = URL(fileURLWithPath: targetPath).appendingPathComponent("ToDoListDatabase.sqlite")
        let fm = FileManager.default
        if fm.fileExists(atPath: pathToCopy.path){
            print("Database already exists")
        }else{
            do{
                try fm.copyItem(atPath: bundlePath!, toPath: pathToCopy.path)
                
            }catch{
                printContent(error.localizedDescription)
                
            }
        }
    }
}
extension ToDoViewController: PresenterToViewToDoHomePageProtocol{
    func viewToSendData(toDoList:Array<ToDo>){
        self.toDoList = toDoList
        self.tableView.reloadData()
    }
}

extension ToDoViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange  searchText:String ){
        homePagePresenterObject?.search(searhWord: searchText)
    }
}
extension ToDoViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let toDo = toDoList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath) as! ToDoListTableViewCell
        cell.toDoName.text = " \(toDo.toDo_name!)"
      
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 10
        cell.layer.cornerRadius = cell.frame.height/2
        cell.backgroundColor = self.colorArray[indexPath.row % 6]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDo = toDoList[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: toDo)
        tableView.deselectRow(at: indexPath, animated: true)
      
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction, view, bool) in
            let toDo = self.toDoList[indexPath.row]
            
            let alert = UIAlertController(title: "Delete", message: "Do you delete \(toDo.toDo_name!)?", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancelAction)
            
            let evetAction = UIAlertAction(title: "Yes", style: .destructive){action in
                self.homePagePresenterObject?.delete(toDo_id: toDo.toDo_id!)
                print("\(toDo.toDo_name!) deleted")
            }
            alert.addAction(evetAction)
            self.present(alert, animated: true)
        }
                                
      
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }

}
