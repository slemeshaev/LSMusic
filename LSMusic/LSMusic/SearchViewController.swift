//
//  SearchViewController.swift
//  LSMusic
//
//  Created by Станислав Лемешаев on 15.07.2020.
//  Copyright © 2020 Станислав Лемешаев. All rights reserved.
//

import UIKit

struct TrackModel {
    var trackName: String
    var artistName: String
}

class SearchViewController: UITableViewController {
    
    // контроллер поиска
    let searchController = UISearchController(searchResultsController: nil)
    
    // список треков
    let listOfTracks = [
        TrackModel(trackName: "Zwitter", artistName: "Rammstein"),
        TrackModel(trackName: "Ночь перед рождеством", artistName: "Сектор газа"),
        TrackModel(trackName: "Сапоги мертвеца", artistName: "Король и Шут")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // цвет фона
        view.backgroundColor = .white
        // установка поиска
        setupSearchBar()
        // регистрация ячейки
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
    }
    
    private func setupSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfTracks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        let track = listOfTracks[indexPath.row]
        cell.imageView?.image = #imageLiteral(resourceName: "trackImage")
        cell.textLabel?.text = "\(track.trackName)\n\(track.artistName)"
        cell.textLabel?.numberOfLines = 2
        return cell
    }
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
    
}
