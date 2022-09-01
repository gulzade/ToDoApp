//
//  ToDoDetailProtocols.swift
//  ToDoListApp
//
//  Created by Gülzade Karataş on 1.09.2022.
//

import Foundation

protocol ViewToPresenterToDoDetailProtocol{
    var toDoDetailInteractor:PresenterToInteractorToDoDetailProtocol?{get set}
    func update(toDo_id:Int ,toDo_name: String, toDo_info:String)
}

protocol PresenterToInteractorToDoDetailProtocol{
    func toDoUpdate(toDo_id:Int ,toDo_name: String, toDo_info:String)
}
protocol PresenterToRouterToDoDetailProtocol{
    static func createModule(ref:UpdateToDoVC) // viewıni yazıyoruz buraya
}
