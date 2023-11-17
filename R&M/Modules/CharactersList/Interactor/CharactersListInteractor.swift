//
//  CharactersListInteractor.swift
//  R&M
//
//  Created by k on 28.10.2023.
//

import Foundation

class CharctersListInteractor {
    let charactersListApi = CharactersListApi()
    
    weak var output: CharactersListInteractorOutput?
}



extension CharctersListInteractor: CharactersListInteractorInput {
    func getCharacters() {
        charactersListApi.getCharacters { [weak self] result in
            switch result {
            case .success(let characters):
                DispatchQueue.main.async { [weak self] in
                    self?.output?.gotCharacters(characters: characters)
                }
            case .failure(let error):
                self?.output?.gotCharactersError(error: error)
            }
        }
    }
    
    
}
