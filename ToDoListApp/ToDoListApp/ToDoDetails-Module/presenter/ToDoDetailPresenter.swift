//
//  ToDoDetailPresenter.swift
//  ToDoListApp
//
//  Created by Gülzade Karataş on 1.09.2022.
//

import Foundation

class ToDoDetailPresenter : ViewToPresenterToDoDetailProtocol{
    var toDoDetailInteractor: PresenterToInteractorToDoDetailProtocol?
    
    func update(toDo_id: Int, toDo_name: String, toDo_info: String) {
        toDoDetailInteractor?.toDoUpdate(toDo_id: toDo_id, toDo_name: toDo_name, toDo_info: toDo_info)
    }
    
}
