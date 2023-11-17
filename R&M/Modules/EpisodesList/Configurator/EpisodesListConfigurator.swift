//
//  EpisodesListConfigurator.swift
//  R&M
//
//  Created by k on 05.11.2023.
//

import Foundation

//MARK: связываем слои модуля воедино

class EpisodesListConfigurator {
    
    func configure(viewController: EpisodesListViewController, character: Character) {
        let presenter = EpisodesListPresenter(name: character.name, episodes: character.episode)
        let interactor = EpisodesListInteractor()
        let router = EpisodesListRouter()
        
        viewController.output = presenter
        presenter.viewInput = viewController
        presenter.interactorInput = interactor
        presenter.routerInput = router
        interactor.output = presenter
    }
}
