//
//  NewsApiParameters.swift
//  NewsApp
//
//  Created by johann casique on 11/04/2020.
//  Copyright © 2020 johann casique. All rights reserved.
//

import Foundation

protocol NewsApiParameters {
    var categoryTypes: [NewsCategoryTypes]? { get }
    var querySearch: NewsQuerySearch? { get }
    var country: String? { get }
    var everything: NewsEverythingParameters? { get }
}

protocol NewsEverythingParameters {
    var qInTitle: NewsAdvanceTitleSearch? { get }
    var domains: String { get }
    var excludeDomains: String { get }
    var from: Date { get }
    var to: Date { get }
    var language: NewsSearchLanguage { get }
}

protocol NewsAdvanceTitleSearch {
    var exactMatch: String { get }
    var mustAppear: String { get }
    var mustNotAppear: String { get }
    var statementSearch: NewsStatementSearch { get }
}

enum NewsStatementSearch: String {
    case AND
    case OR
    case NOT
}

enum NewsSearchLanguage: String {
    case ar
    case de
    case en
    case es
    case fr
    case he
    case it
    case nl
    case no
    case pt
    case ru
    case se
    case ud
    case zh
}

enum NewsCategoryTypes: String {
    case entertainment, general, health, science, sports, business, technology
}
