//
//  NewsModel.swift
//  News
//
//  Created by Apple on 18.09.2023.
//

import Foundation

struct NewsModel: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
}
