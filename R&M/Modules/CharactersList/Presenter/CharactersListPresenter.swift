//
//  CharactersListPresenter.swift
//  R&M
//
//  Created by k on 28.10.2023.
//

import Foundation

class CharactersListPresenter {
    weak var viewInput: CharactersListViewInput?
    var interactorInput: CharactersListInteractorInput?
    var routerInput: CharactersListRouterInput?
    var characters: Characters?
    
}

    
extension CharactersListPresenter: CharactersListViewOutput {
    func viewDidLoad() {
        interactorInput?.getCharacters()
    }
    
    func characterCellDidTap(indexPath: IndexPath) {
        if let character = characters?.results[indexPath.row] {
            routerInput?.characterCellDidTap(character: character)
        }
    }
}

extension CharactersListPresenter: CharactersListInteractorOutput {
    func gotCharacters(characters: Characters) {
        self.characters = characters
        viewInput?.update()
    }
    
    func gotCharactersError(error: Error) {
        
    }
    
    
}
