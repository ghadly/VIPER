//
//  AuthenticationModuleAuthenticationModuleInitializer.swift
//  ViperArchitecture
//
//  Created by Georgehadly on 05/04/2019.
//  Copyright © 2019 George. All rights reserved.
//

import UIKit

class AuthenticationModuleModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var authenticationmoduleViewController: AuthenticationModuleViewController!

    override func awakeFromNib() {

        let configurator = AuthenticationModuleModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: authenticationmoduleViewController)
    }

}
