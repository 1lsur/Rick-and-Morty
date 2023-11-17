//
//  CharactersListViewController.swift
//  R&M
//
//  Created by k on 28.10.2023.
//

import UIKit

class CharactersListViewController: UIViewController {

    var output: CharactersListViewOutput?
        
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
        tableView.frame = UIScreen.main.bounds
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CharacterCell.self, forCellReuseIdentifier: "CharacterCell")
        
    }
}

extension CharactersListViewController: CharactersListViewInput {
    func update() {
        tableView.reloadData()
    }
}

extension CharactersListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output?.characterCellDidTap(indexPath: indexPath)
    }
}

extension CharactersListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output?.characters?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let character = output?.characters?.results[indexPath.row] else {
            return UITableViewCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as? CharacterCell
        cell?.configureCell(character: character)
        return cell ?? UITableViewCell()
    }
    
    
}
