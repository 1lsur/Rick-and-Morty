//
//  CharactersListInteractorOutput.swift
//  R&M
//
//  Created by k on 01.11.2023.
//

import Foundation

protocol CharactersListInteractorOutput: AnyObject {
    
    func gotCharacters(characters: Characters)
    
    func gotCharactersError(error: Error)
}
