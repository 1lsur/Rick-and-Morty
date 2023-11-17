//
//  LoginViewOutput.swift
//  R&M
//
//  Created by k on 06.11.2023.
//

import Foundation

protocol LoginViewOutput {
    func viewDidLoad()
    func loginButtonDidTap(login: String?, password: String?)
}
