//
//  MainTabBarController.swift
//  LSMusic
//
//  Created by Станислав Лемешаев on 15.07.2020.
//  Copyright © 2020 Станислав Лемешаев. All rights reserved.
//

import UIKit

protocol MainTabBarControllerDelegate: class {
    func minimizeTrackDetailController()
}

class MainTabBarController: UITabBarController {
    
    private var minimazedTopAnchorConstraint: NSLayoutConstraint!
    private var maximazedTopAnchorConstraint: NSLayoutConstraint!
    private var bottomAnchorConstraint: NSLayoutConstraint!
    
    let searchViewController: SearchViewController = SearchViewController.loadFromStoryboard()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // цвет фона
        view.backgroundColor = .white
        
        tabBar.tintColor = #colorLiteral(red: 0, green: 0.2784313725, blue: 0.4078431373, alpha: 1)
        
        setupTrackDetailView()
        
        viewControllers = [
            generateViewController(rootViewController: searchViewController, image: #imageLiteral(resourceName: "searchIcon"), title: "Поиск"),
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
    
    private func setupTrackDetailView() {
        print("Тут мы будем настраивать TrackDetailView")
        
        let trackDetailView: TrackDetailView = TrackDetailView.loadFromNib()
        trackDetailView.backgroundColor = .green
        trackDetailView.tabBarDelegate = self
        trackDetailView.delegate = searchViewController
        view.insertSubview(trackDetailView, belowSubview: tabBar)
        
        // use auto layout
        trackDetailView.translatesAutoresizingMaskIntoConstraints = false
        
        maximazedTopAnchorConstraint = trackDetailView.topAnchor.constraint(equalTo: view.topAnchor)
        minimazedTopAnchorConstraint = trackDetailView.topAnchor.constraint(equalTo: tabBar.topAnchor, constant: -64)
        bottomAnchorConstraint = trackDetailView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: view.frame.height)
        bottomAnchorConstraint.isActive = true
        
        maximazedTopAnchorConstraint.isActive = true
        
        NSLayoutConstraint.activate([
            trackDetailView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            trackDetailView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])

    }
}

extension MainTabBarController: MainTabBarControllerDelegate {
    
    func minimizeTrackDetailController() {
        
        maximazedTopAnchorConstraint.isActive = false
        minimazedTopAnchorConstraint.isActive = true
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 1,
                       options: .curveEaseOut,
                       animations: {
                        self.view.layoutIfNeeded()
        },
                       completion: nil)
    }
    
}
