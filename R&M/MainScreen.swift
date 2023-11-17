//
//  MainScreen.swift
//  R&M
//
//  Created by k on 16.10.2023.
//

import UIKit

class MainScreen: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let charactersListVC = CharactersListViewController()
        let charactersListNavigationController = UINavigationController(rootViewController: charactersListVC)
        let charactersListConfigurator = CharactersListConfigurator()
        charactersListConfigurator.configure(viewController: charactersListVC)
        
        
        let logoutVC = LogoutViewController()
        let logoutConfigurator = LogoutConfigurator()
        logoutConfigurator.configure(viewController: logoutVC)
        
        charactersListVC.title = "Персонажи"
        logoutVC.title = "Выход"
        self.setViewControllers([charactersListNavigationController, logoutVC], animated: false)
        
        guard let items = self.tabBar.items else { return }
        
        let images = ["person.3.fill","xmark.circle.fill"]
        
        for x in 0...1 {
            items[x].image = UIImage(systemName: images[x])
        }
        
        self.tabBar.tintColor = .black
        
    }

    
}
