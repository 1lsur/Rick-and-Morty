//
//  EpisodesListViewOutput.swift
//  R&M
//
//  Created by k on 04.11.2023.
//

import Foundation

protocol EpisodesListViewOutput {
    var name: String { get }
    var episodes: [URL] { get }
    func viewDidLoad()
}

