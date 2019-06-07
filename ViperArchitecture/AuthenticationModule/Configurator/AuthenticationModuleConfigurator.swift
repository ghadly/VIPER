//
//  AuthenticationModuleAuthenticationModuleConfigurator.swift
//  ViperArchitecture
//
//  Created by Georgehadly on 05/04/2019.
//  Copyright © 2019 George. All rights reserved.
//

import UIKit

class AuthenticationModuleModuleConfigurator {
    
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? AuthenticationModuleViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: AuthenticationModuleViewController) {

        let router = AuthenticationModuleRouter()

        let presenter = AuthenticationModulePresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = AuthenticationModuleInteractor()
        interactor.interactorToPresenterProtocol = presenter

        presenter.interactor = interactor
        viewController.viewToPresenterProtocol = presenter
    }
}
