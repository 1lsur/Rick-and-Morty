//
//  CharacterModel.swift
//  R&M
//
//  Created by k on 01.11.2023.
//

import Foundation

//MARK: структуры для работы с api

struct Characters: Decodable {
    let results: [Character] //  resuts название как на сервере
}

struct Character: Decodable {
    let name: String
    let gender: Gender
    let image: URL
    let status: Status
    let episode: [URL]
}

enum Gender: String, Decodable {
    case female = "Female"
    case male = "Male"
    case genderless = "Genderless"
    case unknown
}

enum Status: String, Decodable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown
}
