//
//  ToDo.swift
//  ToDoListApp
//
//  Created by Gülzade Karataş on 1.09.2022.
//

import Foundation
class ToDo {
    var toDo_id:Int?
    var toDo_name:String?
    var toDo_info:String?
    
    init(toDo_id:Int, toDo_name:String, toDo_info:String) {
        
        self.toDo_id = toDo_id
        self.toDo_name = toDo_name
        self.toDo_info = toDo_info
    }
}
