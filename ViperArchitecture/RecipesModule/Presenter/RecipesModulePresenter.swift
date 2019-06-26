//
//  AuthenticationModuleAuthenticationModulePresenter.swift
//  ViperArchitecture
//
//  Created by Georgehadly on 05/04/2019.
//  Copyright © 2019 George. All rights reserved.
//
import Foundation

class RecipesModulePresenter {

    weak var view: RecipesModulePresenterToView!
    var interactor: RecipesModulePresenterToInteractor!
    var router: RecipesModulePresenterToRouter!
}


extension RecipesModulePresenter: RecipesModuleViewToPresenter {
    func viewIsReady() {
        interactor.fetchRecipes()
    }
    
    func showDetailsScreen(for recipe: Recipe) {
        router.openRecipeDetailsScreen(with: recipe)
    }
}

extension RecipesModulePresenter: RecipesModuleInteractorToPresenter {
    func recipesFetched(recipes: Recipes) {
        view.showRecipes(recipes: recipes)
    }
    
    func failedToFetchRecipes(error: Error) {
        view.showErrorMessage()
    }
}
