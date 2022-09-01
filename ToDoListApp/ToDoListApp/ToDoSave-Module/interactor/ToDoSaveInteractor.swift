//
//  ToDoSaveInteractor.swift
//  ToDoListApp
//
//  Created by Gülzade Karataş on 1.09.2022.
//

import Foundation
class ToDoSaveInteractor: PresenterToInteractorToDoSaveProtocol {
    
    
    let db: FMDatabase?
   
    init (){
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let pathToCopy = URL(fileURLWithPath: targetPath).appendingPathComponent("ToDoListDatabase.sqlite")
        db = FMDatabase(path: pathToCopy.path)
        
    }
    
    func addToDo(toDo_name: String, toDo_info: String) {
        
         db?.open()
         do{
             try db!.executeUpdate("INSERT INTO toDo (toDo_name,toDo_info)VALUES (?,?)", values: [toDo_name,toDo_info])
            
         }catch{
            
             print(error.localizedDescription)
         }
         db?.close()
    }
        
}
