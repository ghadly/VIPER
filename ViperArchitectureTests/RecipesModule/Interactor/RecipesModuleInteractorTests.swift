//
//  AuthenticationModuleAuthenticationModuleInteractorTests.swift
//  ViperArchitecture
//
//  Created by Georgehadly on 05/04/2019.
//  Copyright © 2019 George. All rights reserved.
//

import XCTest
@testable import ViperArchitecture

class RecipesModuleInteractorTests: XCTestCase {

    var interactorInterface = MockPresenter()
    var mockInteractor = MockInteractor()
    
    override func setUp() {
        super.setUp()
        mockInteractor.interactorToPresenterProtocol = interactorInterface
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testFetchRecipesFailed() {
        mockInteractor.failedToload()
        XCTAssertTrue(interactorInterface.didFailedLoading)
    }
    
    func testFetchRecipes() {
        mockInteractor.success()
        XCTAssertFalse(interactorInterface.didFailedLoading)
    }
    
    class MockPresenter: RecipesModuleInteractorToPresenter {
        var didFailedLoading = false
        
        func failedToFetchRecipes(error: Error) {
            didFailedLoading = true
        }
        
        func recipesFetched(recipes: Recipes) {
            didFailedLoading = false
        }
    }
    
    class MockInteractor: RecipesModuleInteractor {
        func failedToload() {
            interactorToPresenterProtocol.failedToFetchRecipes(error: NSError(domain: "something", code: 400, userInfo: nil))
        }
        
        func success() {
            interactorToPresenterProtocol.recipesFetched(recipes: Recipes.init(data: []))
        }
    }
}
