//
//  CharactersListViewOutput.swift
//  R&M
//
//  Created by k on 28.10.2023.
//

import Foundation

protocol CharactersListViewOutput {
    var characters: Characters? { get }
    func viewDidLoad()
    func characterCellDidTap(indexPath: IndexPath)
}
