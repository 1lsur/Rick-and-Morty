//
//  EpisodesListPresenter.swift
//  R&M
//
//  Created by k on 05.11.2023.
//

import Foundation

class EpisodesListPresenter {
    weak var viewInput: EpisodesListViewInput?
    var interactorInput: EpisodesListInteractorInput?
    var routerInput: EpisodesListRouterInput?
    let name: String
    let episodes: [URL]
    init(name: String, episodes: [URL]) {
        self.name = name
        self.episodes = episodes
    }
}

extension EpisodesListPresenter: EpisodesListViewOutput {
    func viewDidLoad() {
        
    }
}

extension EpisodesListPresenter: EpisodesListInteractorOutput {
    
}
