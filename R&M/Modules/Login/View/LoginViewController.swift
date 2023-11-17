//
//  LoginViewController.swift
//  R&M
//
//  Created by k on 06.11.2023.
//

import UIKit
import SnapKit

//MARK: настройка экрана авторизации

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    
    var output: LoginViewOutput?
    let loginTextField = UITextField()
    let passwordTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        loginTextField.placeholder = "Введите логин"
        loginTextField.font = UIFont.systemFont(ofSize: 15)
        loginTextField.borderStyle = UITextField.BorderStyle.roundedRect
        loginTextField.autocorrectionType = UITextAutocorrectionType.no
        loginTextField.keyboardType = UIKeyboardType.default
        loginTextField.returnKeyType = UIReturnKeyType.done
        loginTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        loginTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        loginTextField.delegate = self
        self.view.addSubview(loginTextField)
        
        loginTextField.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
        
        
        passwordTextField.placeholder = "Введите пароль"
        passwordTextField.font = UIFont.systemFont(ofSize: 15)
        passwordTextField.borderStyle = UITextField.BorderStyle.roundedRect
        passwordTextField.autocorrectionType = UITextAutocorrectionType.no
        passwordTextField.keyboardType = UIKeyboardType.default
        passwordTextField.returnKeyType = UIReturnKeyType.done
        passwordTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        passwordTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        passwordTextField.isSecureTextEntry = true
        passwordTextField.delegate = self
        self.view.addSubview(passwordTextField)
        
        passwordTextField.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.top.equalTo(loginTextField.snp.bottom).offset(8)
        }
        
        let loginButton = UIButton()
        view.addSubview(loginButton)
        
        loginButton.configuration = .filled()
        loginButton.configuration?.baseBackgroundColor = .systemOrange
        loginButton.configuration?.title = "Войти"
        loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        
        loginButton.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(44)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(32)
        }
        
        
    }
    
    
    @objc func loginButtonDidTap() {
        
        output?.loginButtonDidTap(login: loginTextField.text, password: passwordTextField.text)
    }
    
}


extension LoginViewController: LoginViewInput {
    
    func showCreditsErrorAlert() {
        let alert = UIAlertController(title: "неправильные данные", message: "убедитесь что логин и пароль содержат как минимум 3 символа", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default)
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
    
} 

