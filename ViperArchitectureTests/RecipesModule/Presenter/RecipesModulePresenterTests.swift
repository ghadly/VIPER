//
//  AuthenticationModuleAuthenticationModulePresenterTests.swift
//  ViperArchitecture
//
//  Created by Georgehadly on 05/04/2019.
//  Copyright © 2019 George. All rights reserved.
//

import XCTest
@testable import ViperArchitecture

class AuthenticationModulePresenterTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockInteractor: RecipesModuleInteractorInput {
        func fetchRecipes() {
            
        }
    }

    class MockRouter: RecipesModuleRouterInput {
        func openRecipeDetailsScreen(with recipe: Recipe) {
            
        }
        

    }

    class MockViewController: RecipesModuleViewInput {
        func showRecipes(recipes: Recipes) {
            
        }
        
        func showErrorMessage() {
        }

        func setupInitialState() {

        }
    }
}
