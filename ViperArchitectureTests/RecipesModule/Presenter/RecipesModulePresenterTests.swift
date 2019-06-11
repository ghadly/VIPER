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

    var presenter: MockPresenter = MockPresenter()
    var interactor: MockInteractor = MockInteractor()
    var router: MockRouter = MockRouter()
    var view: RecipesModuleViewInput = MockView()
    
    override func setUp() {
        super.setUp()
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDidOpenDetailsScreen() {
        presenter.showDetailsScreen(for: Recipe())
        XCTAssertTrue(router.didOpenDetails)
    }
    
    func testFetchingRecipes(){
        presenter.viewIsReady()
        XCTAssertTrue(interactor.fetchingRecipes)
    }

    class MockInteractor: RecipesModuleInteractorInput {
        var fetchingRecipes = false
        func fetchRecipes() {
            fetchingRecipes = true
        }
    }

    class MockRouter: RecipesModuleRouterInput {
        var didOpenDetails = false
        func openRecipeDetailsScreen(with recipe: Recipe) {
            didOpenDetails = true
        }
    }

    class MockPresenter: RecipesModulePresenter {
    }
    
    class MockView: RecipesModuleViewInput {
        var failedToLoad = false
        
        func showRecipes(recipes: Recipes) {
            failedToLoad = false
        }
        
        func showErrorMessage() {
            failedToLoad = true
        }
    }
}
