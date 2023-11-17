//
//  LoginConfigurator.swift
//  R&M
//
//  Created by k on 06.11.2023.
//

import Foundation

//MARK: связываем слои модуля воедино

class LoginConfigurator {
    
    func configure(viewController: LoginViewController) {
        let presenter = LoginPresenter()
        let interactor = LoginInteractor()
        let router = LoginRouter()
        
        viewController.output = presenter
        presenter.viewInput = viewController
        presenter.interactorInput = interactor
        presenter.routerInput = router
    }
}
