//
//  LogoutInteractor.swift
//  R&M
//
//  Created by k on 01.11.2023.
//

import Foundation
import KeychainSwift

class LogoutInteractor {
    
}

extension LogoutInteractor: LogoutInteractorInput {
    func logout() {
        KeychainSwift().clear()
        let notification = Notification(name: Notification.Name("loginOrLogout"))
        NotificationCenter.default.post(notification)
    }
}
