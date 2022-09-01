//
//  ToDoHomePageProtocols.swift
//  ToDoListApp
//
//  Created by Gülzade Karataş on 1.09.2022.
//

import Foundation


protocol ViewToPresenterToDoHomePageProtocol {
    var toDoHomePageInteractor:PresenterToInteractorToDoHomePageProtocol? {get set}
    var toDoHomePageView:PresenterToViewToDoHomePageProtocol?{get set}
    
    func toDoUplaod()
    func search(searhWord:String)
    func delete(toDo_id:Int)
}

protocol PresenterToInteractorToDoHomePageProtocol {
    
    var toDoHomePagePresenter:InteractorToPresenterToDoHomePageProtocol? { get set}
    func getAllToDo()
    func toDoSeacrh(searhWord:String)
    func toDoDelete(toDo_id:Int)
}


//taşıyıcı protocoller

protocol InteractorToPresenterToDoHomePageProtocol {
    func presentertoSendData(toDoList:Array<ToDo>)
}
protocol PresenterToViewToDoHomePageProtocol {
    func viewToSendData(toDoList:Array<ToDo>)
}
protocol PresenterToRouterToDoHomePageProtocol {
    static func createModule(ref:ToDoViewController)
}
