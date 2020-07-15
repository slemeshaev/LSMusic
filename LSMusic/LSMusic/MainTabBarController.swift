//
//  MainTabBarController.swift
//  LSMusic
//
//  Created by Станислав Лемешаев on 15.07.2020.
//  Copyright © 2020 Станислав Лемешаев. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // цвет фона
        view.backgroundColor = .white
        
        tabBar.tintColor = #colorLiteral(red: 0, green: 0.2784313725, blue: 0.4078431373, alpha: 1)
        
        viewControllers = [
            generateViewController(rootViewController: SearchViewController(), image: #imageLiteral(resourceName: "searchIcon"), title: "Поиск"),
            generateViewController(rootViewController: ViewController(), image: #imageLiteral(resourceName: "libraryIcon"), title: "Библиотека")
        ]
    }
    
    // функция генерации viewController'a
    private func generateViewController(rootViewController: UIViewController, image: UIImage, title: String) -> UIViewController {
        let navigationViewController = UINavigationController(rootViewController: rootViewController)
        navigationViewController.tabBarItem.image = image
        navigationViewController.tabBarItem.title = title
        rootViewController.navigationItem.title = title
        navigationViewController.navigationBar.prefersLargeTitles = true
        return navigationViewController
    }
}
