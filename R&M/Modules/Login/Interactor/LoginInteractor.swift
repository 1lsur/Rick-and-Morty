//
//  LoginInteractor.swift
//  R&M
//
//  Created by k on 06.11.2023.
//

import Foundation
import KeychainSwift

class LoginInteractor {
    
    let keyChain = KeychainSwift()
    
}

extension LoginInteractor: LoginInteractorInput {
    func saveCredits(login: String, password: String) {
        keyChain.set(login+password, forKey: "credits")
        let notification = Notification(name: Notification.Name("loginOrLogout"))
        NotificationCenter.default.post(notification)
    }
}
