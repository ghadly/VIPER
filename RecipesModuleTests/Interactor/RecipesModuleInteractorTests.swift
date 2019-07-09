//
//  AuthenticationModuleAuthenticationModuleInteractorTests.swift
//  ViperArchitecture
//
//  Created by Georgehadly on 05/04/2019.
//  Copyright © 2019 George. All rights reserved.
//

@testable import NetworkLayer
@testable import RecipesModule
import XCTest

class RecipesModuleInteractorTests: XCTestCase {

    var interactorInterface = MockPresenter()
    var mockInteractor = RecipesModuleInteractor()

    override func setUp() {
        super.setUp()
        mockInteractor.interactorToPresenterProtocol = interactorInterface
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testFetchRecipesSuccess() {
        let mockNetworkLayer = SuccessMockNetworkLayer()
        mockInteractor.networkLayer = mockNetworkLayer
        mockInteractor.fetchRecipes()
        XCTAssertFalse(interactorInterface.didFailedLoading)
    }

    func testFetchRecipesFailure() {
        let mockNetworkLayer = FailureMockNetworkLayer()
        mockInteractor.networkLayer = mockNetworkLayer
        mockInteractor.fetchRecipes()
        XCTAssertTrue(interactorInterface.didFailedLoading)
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

    class SuccessMockNetworkLayer: NetworkRequester {
        override func getRecipes(completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
            if let path = Bundle(for: self.classForCoder).path(forResource: "recipes", ofType: "json") {
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    completion(data, nil, nil)
                } catch {
                }
            }

        }
    }

    class FailureMockNetworkLayer: NetworkRequester {
        override func getRecipes(completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
            completion(nil, nil, NSError(domain: "something went wrong", code: 400, userInfo: nil))
        }
    }
}
