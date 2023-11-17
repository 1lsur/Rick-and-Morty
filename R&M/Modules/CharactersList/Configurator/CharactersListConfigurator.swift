//
//  CharactersListConfigurator.swift
//  R&M
//
//  Created by k on 28.10.2023.
//

import Foundation

//MARK: связываем слои модуля воедино

class CharactersListConfigurator {
    
    func configure(viewController: CharactersListViewController) {
        let presenter = CharactersListPresenter()
        let interactor = CharctersListInteractor()
        let router = CharactersListRouter()
        
        viewController.output = presenter
        presenter.viewInput = viewController
        presenter.interactorInput = interactor
        presenter.routerInput = router
        interactor.output = presenter
        router.navigationController = viewController.navigationController
    }
}
