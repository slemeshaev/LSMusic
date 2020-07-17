//
//  SearchInteractor.swift
//  LSMusic
//
//  Created by Станислав Лемешаев on 17.07.2020.
//  Copyright (c) 2020 Станислав Лемешаев. All rights reserved.
//

import UIKit

protocol SearchBusinessLogic {
    func makeRequest(request: Search.Model.Request.RequestType)
}

class SearchInteractor: SearchBusinessLogic {
    
    var networkService = NetworkService()
    var presenter: SearchPresentationLogic?
    var service: SearchService?
    
    func makeRequest(request: Search.Model.Request.RequestType) {
        if service == nil {
            service = SearchService()
        }
        
        switch request {
        case .some:
            print("interactor .some")
            presenter?.presentData(response: Search.Model.Response.ResponseType.some)
        case .getTracks(let searchTerm):
            print("interactor .getTracks")
            networkService.fetchTracks(searchText: searchTerm) { [weak self] (searchResponse) in
                self?.presenter?.presentData(response: Search.Model.Response.ResponseType.presentTracks(searchResponse: searchResponse))
            }
        }
        
    }
    
    
    
}
