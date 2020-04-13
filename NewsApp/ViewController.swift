//
//  ViewController.swift
//  NewsApp
//
//  Created by johann casique on 30/03/2020.
//  Copyright © 2020 johann casique. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let params = TopHeadlinesParameters(categoryTypes: [.general], querySearch: nil, country: "us")
        
        GetTopHeadlines().execute(with: params) { print($0) }
    }


}

