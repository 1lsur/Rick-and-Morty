//
//  LoginPresenter.swift
//  R&M
//
//  Created by k on 06.11.2023.
//

import Foundation

//MARK: слой обрабатывает данные перед показом во вью

class LoginPresenter {
    weak var viewInput: LoginViewInput?
    var interactorInput: LoginInteractorInput?
    var routerInput: LoginRouterInput?
}

extension LoginPresenter: LoginViewOutput {
    
    func loginButtonDidTap(login: String?, password: String?) { //защита от короткого логина/пароля
        guard let login = login, login.count >= 3, let password = password, password.count >= 3  else {
            viewInput?.showCreditsErrorAlert()
            return
        }
        interactorInput?.saveCredits(login: login, password: password)
    }
    
    func viewDidLoad() {
        
    }
}
