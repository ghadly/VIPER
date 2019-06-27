//
//  AuthenticationModuleAuthenticationModuleInteractor.swift
//  ViperArchitecture
//
//  Created by Georgehadly on 05/04/2019.
//  Copyright © 2019 George. All rights reserved.
//
import Foundation
import NetworkLayer

class RecipesModuleInteractor {

    var interactorToPresenterProtocol: RecipesModuleInteractorToPresenter!
    var networkLayer: NetworkRequester = NetworkRequester()
}

extension RecipesModuleInteractor: RecipesModulePresenterToInteractor {
    func fetchRecipes() {
        networkLayer.getRecipes { (data, response, error) in
            if let responseData = data {
                let decoder = JSONDecoder()
                do {
                    let recipes = try decoder.decode(Recipes.self, from: responseData)
                    self.interactorToPresenterProtocol.recipesFetched(recipes: recipes)
                } catch {
                    print("error trying to convert data to JSON")
                    self.interactorToPresenterProtocol.failedToFetchRecipes(error: error)
                }
            } else {
                self.interactorToPresenterProtocol.failedToFetchRecipes(error: error!)
            }
        }
    }
}
