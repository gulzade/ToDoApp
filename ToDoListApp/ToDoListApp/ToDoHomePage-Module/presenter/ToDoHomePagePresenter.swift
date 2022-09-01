//
//  ToDoHomePagePresenter.swift
//  ToDoListApp
//
//  Created by Gülzade Karataş on 1.09.2022.
//

import Foundation

class ToDoHomePagePresenter: ViewToPresenterToDoHomePageProtocol {
   
    var toDoHomePageInteractor: PresenterToInteractorToDoHomePageProtocol?
    var toDoHomePageView: PresenterToViewToDoHomePageProtocol?
    
    func toDoUplaod() {
        toDoHomePageInteractor?.getAllToDo()
    }
    func search(searhWord: String) {
        toDoHomePageInteractor?.toDoSeacrh(searhWord: searhWord)
    }
    func delete(toDo_id: Int) {
        toDoHomePageInteractor?.toDoDelete(toDo_id: toDo_id)
    }
}
extension ToDoHomePagePresenter: InteractorToPresenterToDoHomePageProtocol{
    func presentertoSendData(toDoList: Array<ToDo>) {
        toDoHomePageView?.viewToSendData(toDoList: toDoList)
    }
}

