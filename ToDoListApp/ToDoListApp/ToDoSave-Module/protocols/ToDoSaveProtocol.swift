//
//  ToDoSaveProtocol.swift
//  ToDoListApp
//
//  Created by Gülzade Karataş on 1.09.2022.
//

import Foundation
protocol ViewToPresenterToDoSaveProtocol{
    var toDoSaveInteractor:PresenterToInteractorToDoSaveProtocol?{get set}
    func add(toDo_name: String, toDo_info:String)
}

protocol PresenterToInteractorToDoSaveProtocol{
    func addToDo(toDo_name: String, toDo_info:String)
}
protocol PresenterToRouterToDoSaveProtocol{
    static func createModule(ref:AddToDoVC) // viewıni yazıyoruz buraya
}
