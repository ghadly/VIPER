//
//  AuthenticationModuleAuthenticationModulePresenterTests.swift
//  ViperArchitecture
//
//  Created by Georgehadly on 05/04/2019.
//  Copyright © 2019 George. All rights reserved.
//

@testable import NetworkLayer
@testable import RecipesModule
import XCTest

class RecipesModulePresenterTests: XCTestCase {

    var presenter: MockPresenter = MockPresenter()
    var interactor: MockInteractor = MockInteractor()
    var router: MockRouter = MockRouter()
    var view: MockView = MockView()

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

    func testFetchingRecipes() {
        presenter.viewIsReady()
        XCTAssertTrue(interactor.fetchingRecipes)
    }

    func testErrorMessage() {
        presenter.failedToFetchRecipes(error: NSError(domain: "Error", code: 500, userInfo: nil))
        XCTAssertTrue(self.view.failedToLoad)
    }

    func testLoadRecipes() {
        presenter.recipesFetched(recipes: Recipes(data: []))
        XCTAssertFalse(self.view.failedToLoad)
    }

    func testOpenDetailsView() {
        presenter.showDetailsScreen(for: Recipe())
        XCTAssertTrue(self.router.didOpenDetails)
    }

    class MockInteractor: RecipesModulePresenterToInteractor {
        var fetchingRecipes = false

        func fetchRecipes() {
            fetchingRecipes = true
        }
    }

    class MockRouter: RecipesModulePresenterToRouter {
        var didOpenDetails = false
        
        func openRecipeDetailsScreen(with recipe: Recipe) {
            didOpenDetails = true
        }
    }

    class MockPresenter: RecipesModulePresenter {
    }

    class MockView: RecipesModulePresenterToView {
        var failedToLoad = false

        func showRecipes(recipes: Recipes) {
            failedToLoad = false
        }

        func showErrorMessage() {
            failedToLoad = true
        }
    }
}
