//
//  AuthenticationModuleAuthenticationModuleInteractorOutput.swift
//  ViperArchitecture
//
//  Created by Georgehadly on 05/04/2019.
//  Copyright © 2019 George. All rights reserved.
//

import Foundation

protocol RecipesModuleInteractorToPresenter: class {
    func recipesFetched(recipes: Recipes)
    func failedToFetchRecipes(error: Error)
}

