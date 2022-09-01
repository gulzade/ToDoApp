//
//  ToDoDetailInteractor.swift
//  ToDoListApp
//
//  Created by Gülzade Karataş on 1.09.2022.
//

import Foundation


class ToDoDetailInteractor: PresenterToInteractorToDoDetailProtocol {
   

    
    let db: FMDatabase?
   
    init (){
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let pathToCopy = URL(fileURLWithPath: targetPath).appendingPathComponent("ToDoListDatabase.sqlite")
        db = FMDatabase(path: pathToCopy.path)
    }
    
    
    func toDoUpdate(toDo_id: Int, toDo_name: String, toDo_info: String) {
        db?.open()
        do{
            try db!.executeUpdate("UPDATE toDo SET toDo_name = ? , toDo_info = ? WHERE toDo_id = ?", values: [toDo_name,toDo_info,toDo_id])
           
        }catch{
           
            print(error.localizedDescription)
        }
        db?.close()
    }
    
}
