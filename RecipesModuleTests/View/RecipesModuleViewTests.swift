//
//  AuthenticationModuleAuthenticationModuleViewTests.swift
//  ViperArchitecture
//
//  Created by Georgehadly on 05/04/2019.
//  Copyright © 2019 George. All rights reserved.
//

import XCTest
@testable import RecipesModule

class RecipesModuleViewTests: XCTestCase {

    var viewController:RecipesModuleViewController!
    
    override func setUp() {
        super.setUp()
        viewController = UIStoryboard(name: "Main", bundle: Bundle(for: RecipesModuleViewController.self)).instantiateInitialViewController() as? RecipesModuleViewController
        viewController.loadViewIfNeeded()
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

}
