//
//  AuthenticationModuleAuthenticationModulePresenter.swift
//  ViperArchitecture
//
//  Created by Georgehadly on 05/04/2019.
//  Copyright © 2019 George. All rights reserved.
//
import Foundation

class AuthenticationModulePresenter {

    weak var view: AuthenticationModuleViewInput!
    var interactor: AuthenticationModuleInteractorInput!
    var router: AuthenticationModuleRouterInput!
}


extension AuthenticationModulePresenter: AuthenticationModuleViewOutput {
    func viewIsReady() {
        interactor.fetchRecipes()
    }
    
    func showDetailsScreen(for recipe: Recipe) {
        router.openRecipeDetailsScreen(with: recipe)
    }
}

extension AuthenticationModulePresenter: AuthenticationModuleInteractorOutput {
    func recipesFetched(recipes: Recipes?, error: Error?) {
        if let recipesObject = recipes {
            view.showRecipes(recipes: recipesObject)
        } else {
            view.showErrorMessage()
        }
    }
}
