//
//  SceneDelegate.swift
//  BurgerRecipe
//
//  Created by Arman Abkar on 5/14/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        guard let tabBarController = window?.rootViewController as? UITabBarController,
              let splitViewController = tabBarController.viewControllers?.first as? UISplitViewController,
              let recipesNavController = splitViewController.viewControllers.first as? UINavigationController,
              let recipesListViewController = recipesNavController.viewControllers.first as? RecipesListViewController,
              let detailViewController = splitViewController.viewControllers.last as? RecipeDetailViewController else { return }
        
        recipesListViewController.delegate = detailViewController
        detailViewController.burger = recipesListViewController.model.burgers.first
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.automaticallyMergesChangesFromParent = true
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
    
    
}

