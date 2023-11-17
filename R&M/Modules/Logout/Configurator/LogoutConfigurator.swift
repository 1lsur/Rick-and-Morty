//
//  LogoutConfigurator.swift
//  R&M
//
//  Created by k on 01.11.2023.
//

import Foundation

class LogoutConfigurator {
    
    func configure(viewController: LogoutViewController) {
        let presenter = LogoutPresenter()
        let interactor = LogoutInteractor()
        let router = LogoutRouter()
        
        viewController.output = presenter
        presenter.viewInput = viewController
        presenter.interactorInput = interactor
        presenter.routerInput = router
    }
}
