//
//  CharactersListRouter.swift
//  R&M
//
//  Created by k on 28.10.2023.
//

import Foundation
import UIKit

class CharactersListRouter {
    var navigationController: UINavigationController?
}

extension CharactersListRouter: CharactersListRouterInput {
    func characterCellDidTap(character: Character) {
        let episodeListViewController = EpisodesListViewController()
        let episodesListConfigurator = EpisodesListConfigurator()
        episodesListConfigurator.configure(viewController: episodeListViewController, character: character)
        navigationController?.pushViewController(episodeListViewController, animated: true)
    }
}
