//
//  SceneDelegate.swift
//  DoSomeThings
//
//  Created by Thiện Tùng on 1/15/20.
//  Copyright © 2020 tung. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = setupTabBarController()
        window?.makeKeyAndVisible()
        
    }
    
    func setupTabBarController() -> UITabBarController {
        let tabBC = UITabBarController()
        let screen1 = Messenger()
        let navigation1 = UINavigationController(rootViewController: screen1)
        navigation1.tabBarItem = UITabBarItem(title: "Tin nhắn", image: UIImage(named: "chat-gray"), tag: 0)
        navigation1.tabBarItem.badgeValue = "7"
        
        let screen2 = ContactView()
        let navigation2 = UINavigationController(rootViewController: screen2)
        navigation2.tabBarItem = UITabBarItem(title: "Danh bạ", image: UIImage(named: "contacts-gray"), tag: 1)
        navigation2.tabBarItem.badgeValue = "2"
        
        let screen3 = PeopleView()
        let navigation3 = UINavigationController(rootViewController: screen3)
        navigation3.tabBarItem = UITabBarItem(title: "Nhóm", image: UIImage(named: "people-gray"), tag: 2)
        navigation3.tabBarItem.badgeValue = "4"

        let screen4 = WatchView()
        let navigation4 = UINavigationController(rootViewController: screen4)
        navigation4.tabBarItem = UITabBarItem(title: "Tin tức", image: UIImage(named: "watch-gray"), tag: 3)
        navigation4.tabBarItem.badgeValue = "New"

        let screen5 = GridView()
        let navigation5 = UINavigationController(rootViewController: screen5)
        navigation5.tabBarItem = UITabBarItem(title: "Thêm", image: UIImage(named: "grid-gray"), tag: 4)
        navigation5.tabBarItem.badgeValue = "1"
        
        tabBC.setViewControllers([navigation1, navigation2, navigation3, navigation4, navigation5], animated: true)
        
        return tabBC
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
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

