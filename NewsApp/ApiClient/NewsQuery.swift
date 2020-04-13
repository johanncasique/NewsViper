//
//  NewsQuery.swift
//  NewsApp
//
//  Created by johann casique on 11/04/2020.
//  Copyright © 2020 johann casique. All rights reserved.
//

import Foundation

enum NewsQuery: String {
    
    //Master
    static let host = "newsapi.org"
    
    //Endpoints
    case topHeadLines = "/top-headlines"
    case everything = "/everything"
    case sourcesEndpoint = "/sources"
    
    //Query
    private static let q = "?q="
    
    //Parameters
    case country
    case category
    case sources
    case pageSize
    case page
    
    enum EverythingParameters: String {
        case qInTitle
        case domains
        case excludeDomains
        case from
        case to
        case language
        case sortBy
    }
    
    static func urlForTop(with params: NewsApiParameters) -> URL? {
        var components = APIComponent.buildComponent()
        components.path = ApiConfiguration.Version.v2 + NewsQuery.topHeadLines.rawValue
        var queryItems = [URLQueryItem]()
        if let categories = params.categoryTypes {
            queryItems = categories.map { URLQueryItem(name: NewsQuery.category.rawValue, value: $0.rawValue)}
        }
        if let query = params.querySearch {
            queryItems.append(URLQueryItem(name: NewsQuery.q, value: query))
        }
        if let country = params.country {
            queryItems.append(URLQueryItem(name: NewsQuery.country.rawValue, value: country))
        }
        components.queryItems = queryItems
        return components.url
    }
    
//    static func urlForEverything(with params: NewsApiParameters) -> URL {
//        var components = APIComponent.buildComponent()
//        components.path = ApiConfiguration.Version.v2 + NewsQuery.everything.rawValue
//        var quetyItems = [URLQueryItem]()
//        
//    }
}
