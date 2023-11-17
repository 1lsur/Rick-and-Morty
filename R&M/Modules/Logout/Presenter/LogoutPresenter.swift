//
//  LogoutPresenter.swift
//  R&M
//
//  Created by k on 01.11.2023.
//

import Foundation

class LogoutPresenter {
    weak var viewInput: LogoutViewInput?
    var interactorInput: LogoutInteractorInput?
    var routerInput: LogoutRouterInput?

}

extension LogoutPresenter: LogoutViewOutput {
    func logoutButtonDidTap() {
        interactorInput?.logout()
    }
    
    func viewDidLoad() {
        
    }
}

