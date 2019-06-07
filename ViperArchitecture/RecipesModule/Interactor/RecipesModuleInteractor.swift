//
//  AuthenticationModuleAuthenticationModuleInteractor.swift
//  ViperArchitecture
//
//  Created by Georgehadly on 05/04/2019.
//  Copyright © 2019 George. All rights reserved.
//
import Foundation

class RecipesModuleInteractor {

    weak var interactorToPresenterProtocol: RecipesModuleInteractorOutput!
}

extension RecipesModuleInteractor: RecipesModuleInteractorInput {
    func fetchRecipes() {
        NetworkRequester.getRecipes { (data, response, error) in
            if let responseData = data {
                let decoder = JSONDecoder()
                do {
                    let recipes = try decoder.decode(Recipes.self, from: responseData)
                    self.interactorToPresenterProtocol.recipesFetched(recipes: recipes, error: nil)
                } catch {
                    print("error trying to convert data to JSON")
                    self.interactorToPresenterProtocol.recipesFetched(recipes: nil, error: nil)
                }
            } else {
                self.interactorToPresenterProtocol.recipesFetched(recipes: nil, error: error)
            }
        }
    }
}
