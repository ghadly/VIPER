//
//  AuthenticationModuleAuthenticationModuleViewTests.swift
//  ViperArchitecture
//
//  Created by Georgehadly on 05/04/2019.
//  Copyright © 2019 George. All rights reserved.
//

import XCTest
@testable import RecipesModule
@testable import NetworkLayer

class RecipesModuleViewTests: XCTestCase {

    var viewController:RecipesModuleViewController!
    var mockViewToPresenter: MockViewToPresenter = MockViewToPresenter()
    
    override func setUp() {
        super.setUp()
        viewController = UIStoryboard(name: "Recipes", bundle: Bundle(for: RecipesModuleViewController.self)).instantiateInitialViewController() as? RecipesModuleViewController
        viewController.viewToPresenterProtocol = mockViewToPresenter
        viewController.loadViewIfNeeded()
        viewController.viewToPresenterProtocol = mockViewToPresenter
        XCTAssertTrue(mockViewToPresenter.viewDidLoaded)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRecipesTable() {
        XCTAssertNotNil(viewController.recipesList)
        XCTAssertNotNil(viewController.recipesList.conforms(to: UITableViewDelegate.self))
        XCTAssertNotNil(viewController.recipesList.conforms(to: UITableViewDataSource.self))
    }
    
    func testTableViewDidShowCells() {
        viewController.showRecipes(recipes: getRecipes()!)
        XCTAssertTrue(viewController.recipesList.numberOfRows(inSection: 0) == 3)
    }
    
    func testDidSelectCell() {
        viewController.showRecipes(recipes: getRecipes()!)
        viewController.tableView(viewController.recipesList, didSelectRowAt: IndexPath(row: 0, section: 0))
        XCTAssertTrue(mockViewToPresenter.cellDidSelected)
    }
    
    private func getRecipes() -> Recipes? {
        if let path = Bundle(for: self.classForCoder).path(forResource: "recipes", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let recipes = try decoder.decode(Recipes.self, from: data)
                return recipes
            } catch {
            }
        }
        return nil
    }
    
    class MockViewToPresenter: RecipesModuleViewToPresenter {
        var viewDidLoaded: Bool = false
        var cellDidSelected: Bool = false
        
        func showDetailsScreen(for recipe: Recipe) {
            cellDidSelected = true
        }
        
        func viewIsReady() {
            viewDidLoaded = true
        }
    }
}
