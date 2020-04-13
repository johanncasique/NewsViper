//
//  TopHealineUseCase.swift
//  NewsApp
//
//  Created by johann casique on 11/04/2020.
//  Copyright © 2020 johann casique. All rights reserved.
//
import Foundation

struct TopHeadlinesParameters: NewsApiParameters {
    var categoryTypes: [NewsCategoryTypes]?
    var querySearch: NewsQuerySearch?
    var country: String?
    var everything: NewsEverythingParameters?
}

struct GetTopHeadlines {
    
    func execute(with topParameters: TopHeadlinesParameters, completion: @escaping ([TopHeadlineModel]) -> Void) {
        
        APIRestClient().getHeadLines(with: topParameters) { result in
            
            switch result {
            case .failure(let error):
                print(error)
            case .success(let topData):
                
                do {
                    let articles = try JSONDecoder().decode(ArticlesEntity.self, from: topData)
                    completion(articles.articles.map { self.parse(article: $0) })
                } catch let error {
                    print("\(error) 🔴 Articles is empty")
                }
            }
        }
    }
    
    private func parse(article: Article) -> TopHeadlineModel {
        return TopHeadlineModel(sourceName: article.source?.name ?? "",
                                sourceID: "",
                                author: article.author ?? "",
                                title: article.title ?? "",
                                description: article.description ?? "",
                                sourceURL: URL(string: article.url ?? "")!,
                                urlToImage: URL(string: article.urlToImage ?? "")!,
                                publishedAt: article.publishedAt ?? "",
                                content: article.content ?? "")
        
    }
}
