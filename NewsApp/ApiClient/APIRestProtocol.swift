//
//  APIRestProtocol.swift
//  NewsApp
//
//  Created by johann casique on 31/03/2020.
//  Copyright © 2020 johann casique. All rights reserved.
//

import Foundation

typealias HTTPRequestHeader = [String: String]
typealias NewsQuerySearch = String

protocol ApiRest {
    func getHeadLines(with parameters: NewsApiParameters, completion: @escaping (Result<Data, Error>) -> Void)
}
