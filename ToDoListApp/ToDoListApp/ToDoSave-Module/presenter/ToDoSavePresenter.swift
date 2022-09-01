//
//  ToDoSavePresenter.swift
//  ToDoListApp
//
//  Created by Gülzade Karataş on 1.09.2022.
//

import Foundation

class ToDoSavePresenter : ViewToPresenterToDoSaveProtocol{
    var toDoSaveInteractor: PresenterToInteractorToDoSaveProtocol?
    
    func add(toDo_name: String, toDo_info: String) {
        toDoSaveInteractor?.addToDo(toDo_name: toDo_name, toDo_info: toDo_info)
    }
}
