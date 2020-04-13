//
//  ApiConfiguration.swift
//  NewsApp
//
//  Created by johann casique on 11/04/2020.
//  Copyright © 2020 johann casique. All rights reserved.
//
import Foundation

enum ApiConfiguration {
    static let apiKey = "7eddcf1982f74ee791b8b54f77f1ec98"
    static let apiKeyHeader = ["x-api-key" : ApiConfiguration.apiKey]
    
    enum Scheme {
        static let https = "https"
        static let http = "http"
        case custom(String)
    }
    enum Version {
        static let v2 = "/v2"
        case version(String)
    }
}

enum APIComponent {
    static func buildComponent() -> URLComponents {
        var urlComponent = URLComponents()
        urlComponent.scheme = ApiConfiguration.Scheme.https
        urlComponent.host = NewsQuery.host
        return urlComponent
    }
}
