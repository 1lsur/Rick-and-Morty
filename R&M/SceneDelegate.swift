//
//  SceneDelegate.swift
//  R&M
//
//  Created by Akmetshin Ilsur on 16.10.2023.
//

import UIKit
import KeychainSwift

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var authorisiationWindow: UIWindow?
    var isAuthorized: Bool {
        KeychainSwift().get("credits") != nil // computed property 
    }
    
    var windowScene: UIWindowScene?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        NotificationCenter.default.addObserver(self, selector: #selector(loginOrLogout), name: Notification.Name("loginOrLogout"), object: nil) // назначаем self (scene delegate) наблюдателем за уведомлениями из центра уведомлений. если центр уведомлений отправляет сообщение по имени loginOrLogout то вызывается метод loginOrLogout в этом классе
        windowScene = (scene as? UIWindowScene)
        configureWindows()
    }
    
    func configureWindows() {
        guard let windowScene = windowScene else { return }
        if !isAuthorized {
            authorisiationWindow = UIWindow(frame: windowScene.coordinateSpace.bounds)
            authorisiationWindow?.windowScene = windowScene
            let loginConfigurator = LoginConfigurator()
            let loginViewController = LoginViewController()
            loginConfigurator.configure(viewController: loginViewController)
            authorisiationWindow?.rootViewController = loginViewController
            authorisiationWindow?.makeKeyAndVisible()
            authorisiationWindow?.windowLevel = UIWindow.Level(rawValue: 1)
            window?.windowLevel = UIWindow.Level(rawValue: 0)
        } else {
            window = UIWindow(frame: windowScene.coordinateSpace.bounds)
            window?.windowScene = windowScene
            window?.rootViewController = MainScreen()
            window?.makeKeyAndVisible()
            authorisiationWindow?.windowLevel = UIWindow.Level(rawValue: 0)
            window?.windowLevel = UIWindow.Level(rawValue: 1)
        }
    }

    @objc func loginOrLogout() {
        configureWindows()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

