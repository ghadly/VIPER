//
//  AuthenticationModuleAuthenticationModuleInitializer.swift
//  ViperArchitecture
//
//  Created by Georgehadly on 05/04/2019.
//  Copyright © 2019 George. All rights reserved.
//

import UIKit

class RecipesModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var authenticationmoduleViewController: RecipesModuleViewController!

    override func awakeFromNib() {

        let configurator = RecipesModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: authenticationmoduleViewController)
    }

}
