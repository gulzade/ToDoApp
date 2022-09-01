//
//  ToDoHomePageRouter.swift
//  ToDoListApp
//
//  Created by Gülzade Karataş on 1.09.2022.
//

import Foundation

class ToDoHomePageRouter: PresenterToRouterToDoHomePageProtocol {
    static func createModule(ref: ToDoViewController) {
        let presenter = ToDoHomePagePresenter()
        
        //view
        ref.homePagePresenterObject = presenter
        
        //presenter
        ref.homePagePresenterObject?.toDoHomePageInteractor = ToDoHomePageInteractor()
        ref.homePagePresenterObject?.toDoHomePageView = ref
        
        //interactor
        ref.homePagePresenterObject?.toDoHomePageInteractor?.toDoHomePagePresenter = presenter
    }
}
