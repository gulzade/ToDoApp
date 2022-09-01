//
//  ToDoSaveRouter.swift
//  ToDoListApp
//
//  Created by Gülzade Karataş on 1.09.2022.
//

import Foundation

class ToDoSaveRouter: PresenterToRouterToDoSaveProtocol {
    static func createModule(ref: AddToDoVC) {
        ref.toDoSavePresenterObject = ToDoSavePresenter()
        ref.toDoSavePresenterObject?.toDoSaveInteractor = ToDoSaveInteractor()
    }
}
