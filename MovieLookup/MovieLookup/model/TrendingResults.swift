//
//  TrendingResults.swift
//  MovieLookup
//
//  Created by Beau Nouvelle on 20/2/2023.
//

import Foundation

struct TrendingResults: Decodable {
    let page: Int
    let results: [Movie]
    let total_pages: Int
    let total_results: Int
}
