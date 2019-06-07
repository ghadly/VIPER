//
//  AuthenticationModuleAuthenticationModuleConfiguratorTests.swift
//  ViperArchitecture
//
//  Created by Georgehadly on 05/04/2019.
//  Copyright © 2019 George. All rights reserved.
//

import XCTest

class AuthenticationModuleModuleConfiguratorTests: XCTestCase {

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
        let viewController = AuthenticationModuleViewControllerMock()
        let configurator = AuthenticationModuleModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "AuthenticationModuleViewController is nil after configuration")
        XCTAssertTrue(viewController.output is AuthenticationModulePresenter, "output is not AuthenticationModulePresenter")

        let presenter: AuthenticationModulePresenter = viewController.output as! AuthenticationModulePresenter
        XCTAssertNotNil(presenter.view, "view in AuthenticationModulePresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in AuthenticationModulePresenter is nil after configuration")
        XCTAssertTrue(presenter.router is AuthenticationModuleRouter, "router is not AuthenticationModuleRouter")

        let interactor: AuthenticationModuleInteractor = presenter.interactor as! AuthenticationModuleInteractor
        XCTAssertNotNil(interactor.output, "output in AuthenticationModuleInteractor is nil after configuration")
    }

    class AuthenticationModuleViewControllerMock: AuthenticationModuleViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
