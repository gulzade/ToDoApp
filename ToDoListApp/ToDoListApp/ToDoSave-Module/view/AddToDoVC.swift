//
//  SaveToDoViewController.swift
//  ToDoListApp
//
//  Created by Gülzade Karataş on 1.09.2022.
//

import UIKit

class AddToDoVC: UIViewController {

    @IBOutlet weak var toDoNameTextField: UITextField!
    @IBOutlet weak var toDoInfoTextField: UITextField!
    
    var toDoSavePresenterObject  : ViewToPresenterToDoSaveProtocol?
    var toDo: ToDo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ToDoSaveRouter.createModule(ref: self)
       
        if let t = toDo {
            toDoNameTextField.text = t.toDo_name
            toDoInfoTextField.text = t.toDo_info
        }
    }
    
    @IBAction func saveButton(_ sender: Any) {
        if let todoName =  toDoNameTextField.text, let todoInfo = toDoInfoTextField.text {
            toDoSavePresenterObject?.add(toDo_name: todoName, toDo_info: todoInfo)
        }
        toDoNameTextField.text = ""
        toDoInfoTextField.text = ""
    }
    
   

}
