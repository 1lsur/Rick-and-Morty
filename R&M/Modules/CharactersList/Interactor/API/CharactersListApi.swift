//
//  CharactersListApi.swift
//  R&M
//
//  Created by k on 28.10.2023.
//

import Foundation

class CharactersListApi {
    func getCharacters(completion: @escaping (Result<Characters, Error>) -> Void) {
        Networking.sendRequest(responseType: Characters.self, urlString: "https://rickandmortyapi.com/api/character", method: .GET, completion: completion)
        
    }
}
