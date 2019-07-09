//
//  AuthenticationModuleAuthenticationModuleConfigurator.swift
//  ViperArchitecture
//
//  Created by Georgehadly on 05/04/2019.
//  Copyright © 2019 George. All rights reserved.
//

import UIKit
class RecipesModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? RecipesModuleViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: RecipesModuleViewController) {

        let router = RecipesModuleRouter()

        let presenter = RecipesModulePresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = RecipesModuleInteractor()
        interactor.interactorToPresenterProtocol = presenter

        presenter.interactor = interactor
        viewController.viewToPresenterProtocol = presenter
    }
}
