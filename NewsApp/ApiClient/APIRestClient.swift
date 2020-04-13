//
//  NetworkApiRest.swift
//  NewsApp
//
//  Created by johann casique on 31/03/2020.
//  Copyright © 2020 johann casique. All rights reserved.
//

import Foundation


struct ArticlesEntity: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let source: SourceEntity?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

struct SourceEntity: Decodable {
    let name: String?
}

struct APIRestClient: ApiRest {
    
    func getHeadLines(with parameters: NewsApiParameters, completion: @escaping (Result<Data, Error>) -> Void) {
       
        //let params = NewsApiParameters(categoryTypes: [.business, .health], querySearch: "trump", country: "us")
        
        request(with: NewsQuery.urlForTop(with: parameters)) { topData in
            completion(topData)
        }
    }
    
    private func request(with url: URL?, completion: @escaping (Result<Data, Error>) -> Void) {
        
        var request = URLRequest(url: url!)
        request.allHTTPHeaderFields = ApiConfiguration.apiKeyHeader
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(data ?? Data()))
            }
        }.resume()
    }
    
    
}
