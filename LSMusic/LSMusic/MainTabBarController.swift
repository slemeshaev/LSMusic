//
//  MainTabBarController.swift
//  LSMusic
//
//  Created by Станислав Лемешаев on 15.07.2020.
//  Copyright © 2020 Станислав Лемешаев. All rights reserved.
//

import UIKit
import SwiftUI

protocol MainTabBarControllerDelegate: class {
    func minimizeTrackDetailController()
    func maximizeTrackDetailController(viewModel: SearchViewModel.Cell?)
}

class MainTabBarController: UITabBarController {
    
    private var minimazedTopAnchorConstraint: NSLayoutConstraint!
    private var maximazedTopAnchorConstraint: NSLayoutConstraint!
    private var bottomAnchorConstraint: NSLayoutConstraint!
    
    let searchViewController: SearchViewController = SearchViewController.loadFromStoryboard()
    let trackDetailView: TrackDetailView = TrackDetailView.loadFromNib()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // цвет фона
        view.backgroundColor = .white
        
        tabBar.tintColor = #colorLiteral(red: 0, green: 0.2784313725, blue: 0.4078431373, alpha: 1)
        
        setupTrackDetailView()
        
        searchViewController.tabBarDelegate = self
        
        var library = Library()
        library.tabBarDelegate = self
        let hostVC = UIHostingController(rootView: library)
        hostVC.tabBarItem.image = #imageLiteral(resourceName: "libraryIcon")
        hostVC.tabBarItem.title = "Моя музыка"
        
        viewControllers = [
            hostVC,
            generateViewController(rootViewController: searchViewController, image: #imageLiteral(resourceName: "searchIcon"), title: "Поиск")
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

        trackDetailView.tabBarDelegate = self
        trackDetailView.delegate = searchViewController
        view.insertSubview(trackDetailView, belowSubview: tabBar)
        
        // use auto layout
        trackDetailView.translatesAutoresizingMaskIntoConstraints = false
        
        maximazedTopAnchorConstraint = trackDetailView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height)
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
    
    
    func maximizeTrackDetailController(viewModel: SearchViewModel.Cell?) {
        
        minimazedTopAnchorConstraint.isActive = false
        maximazedTopAnchorConstraint.isActive = true
        maximazedTopAnchorConstraint.constant = 0
        bottomAnchorConstraint.constant = 0
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 1,
                       options: .curveEaseOut,
                       animations: {
                        self.view.layoutIfNeeded()
                        self.tabBar.alpha = 0
                        self.trackDetailView.miniTrackView.alpha = 0
                        self.trackDetailView.maximazedStackView.alpha = 1
        },
                       completion: nil)
        
        guard let viewModel = viewModel else { return }
        self.trackDetailView.set(viewModel: viewModel)
    }
    
    
    func minimizeTrackDetailController() {
        
        maximazedTopAnchorConstraint.isActive = false
        bottomAnchorConstraint.constant = view.frame.height
        minimazedTopAnchorConstraint.isActive = true
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 1,
                       options: .curveEaseOut,
                       animations: {
                        self.view.layoutIfNeeded()
                        self.tabBar.alpha = 1
                        self.trackDetailView.miniTrackView.alpha = 1
                        self.trackDetailView.maximazedStackView.alpha = 0
        },
                       completion: nil)
    }
    
}
