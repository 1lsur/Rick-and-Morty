//
//  LogoutViewController.swift
//  R&M
//
//  Created by k on 01.11.2023.
//

import UIKit

class LogoutViewController: UIViewController {
    
    var output: LogoutViewOutput?
    
    let logoutButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
        view.backgroundColor = .white
        configureButton()
    }
    
    func configureButton() {
        view.addSubview(logoutButton)
        
        logoutButton.configuration = .filled()
        logoutButton.configuration?.baseBackgroundColor = .systemOrange
        logoutButton.configuration?.title = "Выйти из учетной записи"
        
        logoutButton.addTarget(self, action: #selector(logoutButtonDidTap), for: .touchUpInside)
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoutButton.widthAnchor.constraint(equalToConstant: 320),
            logoutButton.heightAnchor.constraint(equalToConstant: 50)

        ])
    }
    @objc func logoutButtonDidTap() {
        output?.logoutButtonDidTap()
    }

}

extension LogoutViewController: LogoutViewInput {
    
}

