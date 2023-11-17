//
//  EpisodesListViewController.swift
//  R&M
//
//  Created by k on 04.11.2023.
//

import Foundation
import UIKit

class EpisodesListViewController: UIViewController {
    var output: EpisodesListViewOutput?
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
        title = output?.name
        tableView.frame = UIScreen.main.bounds
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(EpisodeCell.self, forCellReuseIdentifier: "EpisodeCell")
    }
    
}

extension EpisodesListViewController: EpisodesListViewInput {
    
}

extension EpisodesListViewController: UITableViewDelegate {
    
}

extension EpisodesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output?.episodes.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let episode = output?.episodes[indexPath.row] else {
            return UITableViewCell()
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeCell") as? EpisodeCell else {
            return UITableViewCell()
        }
        cell.configureCell(episode: episode)
        return cell
    }
}
