//
//  AuthenticationModuleAuthenticationModuleViewInput.swift
//  ViperArchitecture
//
//  Created by Georgehadly on 05/04/2019.
//  Copyright © 2019 George. All rights reserved.
//

// PresenterToViewProtocol
import NetworkLayer
protocol RecipesModulePresenterToView: class {

    /**
        @author Georgehadly
        Setup initial state of the view
    */
    func showRecipes(recipes: Recipes)
    func showErrorMessage()
}
