//
//  ToDoHomePageInteractor.swift
//  ToDoListApp
//
//  Created by Gülzade Karataş on 1.09.2022.
//

import Foundation


class ToDoHomePageInteractor : PresenterToInteractorToDoHomePageProtocol{
    
    var toDoHomePagePresenter: InteractorToPresenterToDoHomePageProtocol?
    
    let db: FMDatabase?
    
    init (){
        
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let pathToCopy = URL(fileURLWithPath: targetPath).appendingPathComponent("ToDoListDatabase.sqlite")
        db = FMDatabase(path: pathToCopy.path)
    }
    func getAllToDo() {
        var list = [ToDo]()
        db?.open()
        do{
            let q = try db!.executeQuery("SELECT * FROM toDo", values: nil)
            while q.next() {
                let toDo = ToDo(toDo_id: Int(q.string(forColumn: "toDo_id"))!, toDo_name: q.string(forColumn: "toDo_name")!,toDo_info: q.string(forColumn: "toDo_info")!)
                list.append(toDo)
            }
            toDoHomePagePresenter?.presentertoSendData(toDoList: list)
            
        }catch{
            
            print(error.localizedDescription)
        }
        
        db?.close()
        
    }
    func toDoSeacrh(searhWord: String) {
        var list = [ToDo]()
        db?.open()
        do{
            let q = try db!.executeQuery("SELECT * FROM toDo WHERE toDo_name like '%\(searhWord)%'", values: nil)
            while q.next() {
                let toDo = ToDo(toDo_id: Int(q.string(forColumn: "toDo_id"))!, toDo_name: q.string(forColumn: "toDo_name")!,toDo_info: q.string(forColumn: "toDo_info")!)
                list.append(toDo)
            }
            toDoHomePagePresenter?.presentertoSendData(toDoList: list)
            
        }catch{
            
            print(error.localizedDescription)
        }
        
        db?.close()
        
    }
    func toDoDelete(toDo_id: Int) {
        
        db?.open()
        do{
            try db!.executeUpdate("DELETE FROM toDo WHERE toDo_id = ?", values: [toDo_id])
            getAllToDo()
        }catch{
            
            print(error.localizedDescription)
        }
        
        db?.close()
        
    }
    
    
}
