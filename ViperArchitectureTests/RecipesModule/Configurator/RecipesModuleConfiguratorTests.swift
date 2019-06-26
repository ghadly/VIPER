//
//  AuthenticationModuleAuthenticationModuleConfiguratorTests.swift
//  ViperArchitecture
//
//  Created by Georgehadly on 05/04/2019.
//  Copyright © 2019 George. All rights reserved.
//

import XCTest
@testable import ViperArchitecture

class RecipesModuleConfiguratorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testConfigureModuleForViewController() {

        //given
        let viewController = RecipesModuleViewControllerMock()
        let configurator = RecipesModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.viewToPresenterProtocol, "AuthenticationModuleViewController is nil after configuration")
        XCTAssertTrue(viewController.viewToPresenterProtocol is RecipesModulePresenter, "output is not AuthenticationModulePresenter")

        let presenter: RecipesModulePresenter = viewController.viewToPresenterProtocol as! RecipesModulePresenter
        XCTAssertNotNil(presenter.view, "view in AuthenticationModulePresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in AuthenticationModulePresenter is nil after configuration")
        XCTAssertTrue(presenter.router is RecipesModuleRouter, "router is not AuthenticationModuleRouter")

        let interactor: RecipesModuleInteractor = presenter.interactor as! RecipesModuleInteractor
        XCTAssertNotNil(interactor.interactorToPresenterProtocol, "output in AuthenticationModuleInteractor is nil after configuration")
    }

    
    class RecipesModuleViewControllerMock: RecipesModuleViewController {

        var setupInitialStateDidCall = false

        override func viewDidLoad() {
            setupInitialStateDidCall = true
        }
    }
}
