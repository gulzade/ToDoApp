//
//  UpdateToDoViewController.swift
//  ToDoListApp
//
//  Created by Gülzade Karataş on 1.09.2022.
//

import UIKit

class UpdateToDoVC: UIViewController {

    @IBOutlet weak var toDoNameTextField: UITextField!
    @IBOutlet weak var toDoInfoTextField: UITextField!
    
    var toDoDetailPresenterObject : ViewToPresenterToDoDetailProtocol?
    var toDo:ToDo?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ToDoDetailRouter.createModule(ref: self)
       
        if let t = toDo {
            toDoNameTextField.text = t.toDo_name
            toDoInfoTextField.text = t.toDo_info
        }
    }
    
    @IBAction func updateButton(_ sender: Any) {
        if let todoName =  toDoNameTextField.text, let todoInfo =  toDoInfoTextField.text, let t = toDo  {
            toDoDetailPresenterObject?.update(toDo_id: t.toDo_id!, toDo_name: todoName, toDo_info: todoInfo)
        }
        toDoNameTextField.text = ""
        toDoInfoTextField.text = ""
    }
    
  

}
