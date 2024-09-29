//
//  SceneDelegate.swift
//  GHFollowers
//
//  Created by Yasin AKÇA (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 22.09.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = createTabbarController(
            viewControllers: [
                createNavigationController(title: "Search", vc: SearchVC(), item: .search, tag: 0),
                createNavigationController(title: "Favorites", vc: FavoritesListVC(), item: .favorites, tag: 1)
            ]
        )
        window?.makeKeyAndVisible()
    }
    
    func createNavigationController(title: String, vc: UIViewController, item: UITabBarItem.SystemItem, tag: Int) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.title = title
        navigationController.navigationBar.tintColor = .systemGreen
        navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: item, tag: tag)
        navigationController.navigationBar.standardAppearance = createNavigationBarAppeareance()
        navigationController.navigationBar.scrollEdgeAppearance = createNavigationBarAppeareance()
        return navigationController
    }
    
    func createTabbarController(viewControllers: [UIViewController]) -> UITabBarController {
        let tabbarController = UITabBarController()
        tabbarController.viewControllers = viewControllers
        tabbarController.tabBar.standardAppearance = createTabbarAppearance()
        tabbarController.tabBar.scrollEdgeAppearance = createTabbarAppearance()
        return tabbarController
    }
    
    func createNavigationBarAppeareance() -> UINavigationBarAppearance {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBackground
        appearance.backButtonAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemGreen]
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemGreen]
        return appearance
    }
    
    func createTabbarAppearance() -> UITabBarAppearance {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBackground
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor.systemGreen
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemBackground]
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor.lightGray
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.gray]
        return appearance
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

