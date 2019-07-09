//
//  AuthenticationModuleAuthenticationModuleInitializer.swift
//  ViperArchitecture
//
//  Created by Georgehadly on 05/04/2019.
//  Copyright © 2019 George. All rights reserved.
//

import UIKit

class RecipesModuleInitializer: NSObject {

    @IBOutlet weak var recipesModuleViewController: RecipesModuleViewController!

    override func awakeFromNib() {
        super.awakeFromNib()
        let configurator = RecipesModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: recipesModuleViewController)
    }
}
