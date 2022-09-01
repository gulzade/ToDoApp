//
//  ToDoDetailRouter.swift
//  ToDoListApp
//
//  Created by Gülzade Karataş on 1.09.2022.
//

import Foundation

class ToDoDetailRouter: PresenterToRouterToDoDetailProtocol {
    static func createModule(ref: UpdateToDoVC) {
        ref.toDoDetailPresenterObject = ToDoDetailPresenter()
        ref.toDoDetailPresenterObject?.toDoDetailInteractor = ToDoDetailInteractor()
    }
}
