//
//  AuthenticationModuleAuthenticationModulePresenter.swift
//  ViperArchitecture
//
//  Created by Georgehadly on 05/04/2019.
//  Copyright © 2019 George. All rights reserved.
//
import Foundation

class RecipesModulePresenter {

    weak var view: RecipesModuleViewInput!
    var interactor: RecipesModuleInteractorInput!
    var router: RecipesModuleRouterInput!
}


extension RecipesModulePresenter: RecipesModuleViewOutput {
    func viewIsReady() {
        interactor.fetchRecipes()
    }
    
    func showDetailsScreen(for recipe: Recipe) {
        router.openRecipeDetailsScreen(with: recipe)
    }
}

extension RecipesModulePresenter: RecipesModuleInteractorOutput {
    func recipesFetched(recipes: Recipes?, error: Error?) {
        if let recipesObject = recipes {
            view.showRecipes(recipes: recipesObject)
        } else {
            view.showErrorMessage()
        }
    }
}
